/**
 * DongConfig
 *
 * 행정동 검색 즐겨찾기 저장
 */
'use strict';
(function($, window, document){
	var TYPE = {
		WIDE: "WIDE",
		CITY: "CITY",
		DONG: "DONG"
	},
	SEARCH_TYPE = {
		DONG: "DONG",
		LOAD: "LOAD"
	},
	MAX_SHOW_HISTORY = 6,
	DongConfig = function(wrapperId, searchType) {
		if(typeof jQuery === 'undefined') {
			alert('jQuery required!');
		}
		if(typeof store === 'undefined') {
			alert('store.js required!');
		}
		if(typeof Mustache === 'undefined') {
			alert('mustache.js required!');
		}
		var base = this;
		base.searchType = SEARCH_TYPE.LOAD === searchType?SEARCH_TYPE.LOAD:SEARCH_TYPE.DONG;
		base.id = wrapperId;
		base.key = "W_DC";
		base.state = {
			level: TYPE.WIDE,
			selected: {
				wide: {code: "", name: ""},
				city: {code: "", name: ""},
				dong: {code: "", name: ""},
			},
			selectedBookmark: null,
			isFullySelected: function() {
				return this.selected.wide && this.selected.wide.code
						&& this.selected.city && this.selected.city.code
						&& this.selected.dong && this.selected.dong.code;
			}
		};
		base.config = {
			selectedBookmark: null,
			selectedRecent: null,
			bookmarks: [],
			recent: []
		};
		base.readConfig();
		base.updateBookmarks();
		base.updateRecent();
		base.requestRemote(TYPE.WIDE).then(function(data) {base.updateView(TYPE.WIDE, data)},base.error());
		base.addEventHandler();
	};
	function createFullName(bookmark) {
		if(bookmark.wide) {
			if(bookmark.wide.code && bookmark.city.code && bookmark.dong.code) {
				bookmark.fullName = bookmark.wide.name + " " + bookmark.city.name + " " + bookmark.dong.name;	
			} else if(bookmark.wide.code && bookmark.city.code) {
				bookmark.fullName = bookmark.wide.name + " " + bookmark.city.name;
			} else if(bookmark.wide.code) {
				bookmark.fullName = bookmark.wide.name + "";
			} else {
				bookmark.fullName = "-";
			}	
		} else {
			bookmark.fullName = "-";
		}
	}
	function setBookmarkAttribute($item, bookmark, defaultTitle) {
		if(bookmark) {
			$item.attr('data-wide-code', bookmark.wide.code);
			$item.attr('data-wide-name', bookmark.wide.name);
			$item.attr('data-city-code', bookmark.city.code);
			$item.attr('data-city-name', bookmark.city.name);
			$item.attr('data-dong-code', bookmark.dong.code);
			$item.attr('data-dong-name', bookmark.dong.name);
			$item.attr('data-x', bookmark.dong.x);
			$item.attr('data-y', bookmark.dong.y);
			$item.attr('data-lat', bookmark.dong.lat);
			$item.attr('data-lon', bookmark.dong.lon);
			$item.html(defaultTitle?defaultTitle:bookmark.fullName);	
		} else {
			$item.attr('data-wide-code', "");
			$item.attr('data-wide-name', "");
			$item.attr('data-city-code', "");
			$item.attr('data-city-name', "");
			$item.attr('data-dong-code', "");
			$item.attr('data-dong-name', "");
			$item.attr('data-x', "");
			$item.attr('data-y', "");
			$item.attr('data-lat', "");
			$item.attr('data-lon', "");
			$item.html(defaultTitle?defaultTitle:"관심지역을 추가해 주세요.");
		}
		
	}
	function readBookmarkAttribute(o) {
		var bookmark = {};
		var $item = $(o);
		bookmark.wide = { code: $item.attr('data-wide-code'), name: $item.attr('data-wide-name') };
		bookmark.city = { code: $item.attr('data-city-code'), name: $item.attr('data-city-name') };
		bookmark.dong = { 
				code: $item.attr('data-dong-code'), name: $item.attr('data-dong-name')
				, x: $item.attr('data-x'), y: $item.attr('data-y')
				, lat: $item.attr('data-lat'), lon: $item.attr('data-lon')
			};
		createFullName(bookmark);
		return bookmark;
	}
	DongConfig.prototype = {
		readConfig: function() {
			var loadedConfig = store.get(this.key);
			if(loadedConfig) {
				this.config = loadedConfig;
			}
		},
		writeConfig: function() {
			if(this.config) {
				store.set(this.key, this.config);
			}
		},
		onAddAreaBookmark: function(bookmark) {
			GlobalEvent.trigger($.Event("onAddAreaBookmark"), [bookmark, this]);
		},
		onAddAreaBookmarkOnlyMemory: function(bookmark) {
			GlobalEvent.trigger($.Event("onAddAreaBookmarkOnlyMemory"), [bookmark, this]);
		},
		onAddAreaRecent: function(recent) {
			GlobalEvent.trigger($.Event("onAreaShow"), [recent, this]);
		},
		onAreaBookmarkShow: function() {
			var base = this;
			GlobalEvent.trigger($.Event("onAreaBookmarkShow"), [base.config.selectedBookmark, this]);
		},
		onAreaRecentShow: function() {
			var base = this;
			GlobalEvent.trigger($.Event("onAreaRecentShow"), [base.config.selectedRecent, this]);
		},
		reloadMyAreas: function() {
			var base = this;
			base.readConfig();
			base.updateBookmarks();
		},
		addBookmark: function() {
			var base = this;
			var wide = base.state.selected.wide,
				city = base.state.selected.city,
				dong = base.state.selected.dong;
			if(!base.state.isFullySelected()) {
				if(base.searchType == SEARCH_TYPE.LOAD) {
					alert("도로명까지 선택해 주세요.");
				} else {
					alert("읍/면/동까지 선택해 주세요.");	
				}
				return null;
			}
			if(base.config instanceof Array || !base.config instanceof Object) {
				base.config = {};
				base.config.bookmarks = new Array();
			} 
			if(!base.config.bookmarks || !base.config.bookmarks instanceof Array) {
				base.config.bookmarks = new Array();
			}
			if(base.config.bookmarks.length >= 15) {
				alert("최대 15개까지 등록 가능합니다.");
				return null;
			}
			
			var conflict = false;
			
			for(var i = 0 ; i < base.config.bookmarks.length ; i++) {
				var area = base.config.bookmarks[i];
				if(wide && area.wide.code == wide.code 
						&& city && area.city.code == city.code 
						&& dong && area.dong.code == dong.code) {
					conflict = true;
					break;
				}
			}
			if(!conflict) {
				var newBookmark = {wide: wide, city: city, dong: dong};
				base.config.bookmarks.unshift(newBookmark);
				return newBookmark;
			} else {
				alert("이미 등록되어있는 지역입니다.");
				return null;
			}
		},
		addRecent: function() {
			var base = this;
			var wide = base.state.selected.wide,
				city = base.state.selected.city,
				dong = base.state.selected.dong;
			if(!base.state.isFullySelected()) {
				if(base.searchType == SEARCH_TYPE.LOAD) {
					alert("도로명까지 선택해 주세요.");	
				} else {
					alert("읍/면/동까지 선택해 주세요.");	
				}
				return null;
			}
			if(base.config instanceof Array || !base.config instanceof Object) {
				base.config = {};
				base.config.recent = new Array();
			} 
			if(!base.config.recent || !base.config.recent instanceof Array) {
				base.config.recent = new Array();
			}
			
			var conflict = false;
			
			for(var i = 0 ; i < base.config.recent.length ; i++) {
				var area = base.config.recent[i];
				if(wide && area.wide.code == wide.code 
						&& city && area.city.code == city.code 
						&& dong && area.dong.code == dong.code) {
					conflict = true;
					break;
				}
			}
			var newRecent = {wide: wide, city: city, dong: dong};
			if(!conflict) {
				base.config.recent.unshift(newRecent);
				if(base.config.recent.length > MAX_SHOW_HISTORY) {
					base.config.recent.pop();
				}
			}
			
			return newRecent;
		},
		closeConfig: function() {
			$('.pop-close').trigger("click");
		},
		getZones: function(type, wideCode, cityCode, keyword, keywordStart, keywordEnd) {
			var base = this;
			var baseUrl = this.getBase();
			var data = {
					type: type,
					wideCode: wideCode?wideCode:"",
					cityCode: cityCode?cityCode:"",
					keyword: keyword?keyword:"",
					keywordStart: keywordStart?keywordStart:"",
					keywordEnd: keywordEnd?keywordEnd:""
			};
			if(base.searchType == SEARCH_TYPE.DONG) {
				return $.ajax({
					url: baseUrl + "rest/zone/dong.do",
					data: data,
					dataType: "json"
				});
			} else {
				return $.ajax({
					url: baseUrl + "rest/zone/load.do",
					data: data,
					dataType: "json"
				});	
			}
			
		},
		getBase: function() {
			if(window.appBase) {
				return window.appBase;
			} else {
				return "/";
			}
		},
		requestRemote: function(type, keyword, keywordStart, keywordEnd) {
			var base = this;
			return base.getZones(
				type
				, base.state.selected.wide.code
				, base.state.selected.city.code
				, keyword
				, keywordStart
				, keywordEnd
			);	
		},
		updateView: function(type, data, noFocus) {
			var base = this;
			var typeKey = type.toLowerCase();
			var $wrapper = $('#' + base.id);
			var $view = $wrapper.find('ul[data-role="result-holder"]').first();
			var template = '{{#data}}<li><div class="radio-wrap"><a href="#" title="{{title}}" class="addr-chk-btn" data-code="{{code}}" data-name="{{name}}" data-x="{{x}}" data-y="{{y}}" data-lat="{{lat}}" data-lon="{{lon}}" data-level="{{level}}">{{name}}</a></div></li>{{/data}}';
			for(var i = 0 ; i < data.length ; i++) {
				data[i].index = i;
				data[i].checked = i==0;
				if(data[i].level == "1") {
					data[i].title = data[i].name + " 하위 구/군 목록 보기";
				} else if(data[i].level == "2") {
					data[i].title = data[i].name + " 하위 읍/면/동 목록 보기";
				} else if(data[i].level == "3") {
					data[i].title = data[i].name + " 지역 선택";
				}
			}
			
			var html =  Mustache.render(template, {type: typeKey, data: data});
			var upTitle = "";
			if(type == TYPE.CITY) {
				upTitle = "시/도 목록 보기";
			} else if(type == TYPE.DONG) {
				upTitle = "구/군 목록 보기";
			}
			var upButton = '<li><div class="radio-wrap"><a href="#" title="' + upTitle + '" class="addr-chk-btn" data-goto="' + (type==TYPE.CITY?TYPE.WIDE:(type==TYPE.DONG?TYPE.CITY:""))+ '">↑ 상위</a></li>';
			if(type == TYPE.WIDE) {
				$view.html(html);
			} else {
				$view.html(upButton + html);	
			}
			if(base.searchType == SEARCH_TYPE.LOAD && type == TYPE.DONG) {
				base.toggleLoadSearchView(true);
				var $h3 = $view.parent().find('h3');
				if($h3.length == 0) {
					$view.parent().prepend('<h3 class="hid">검색된 도로명 주소 ' + data.length + '개</h3>');
				} else {
					$h3.html('검색된 도로명 주소 ' + data.length + '개');
				}
			} else {
				base.toggleLoadSearchView(false);
			}
			
			base.updateSelectedView();
			if(!noFocus) $view.find('a.addr-chk-btn').first().trigger('focus');
		},
		toggleLoadSearchView: function(show) {
			var base = this;
			var $wrapper = $('#' + base.id);
			if(show) {
				var ganada = "";
				if(base.state.keywordStart && base.state.keywordEnd) {
					ganada = base.state.keywordStart + base.state.keywordEnd + ""; 
				} else {
					base.state.keywordStart = "";
					base.state.keywordEnd = "";
				}
				$.each($wrapper.find('div[data-role="load-ganada-search"] input[type="radio"]'), function(index, item) {
					if(item.value == ganada) {
						item.checked = true;
					}
				})
				$wrapper.find('div[data-role="search-box"]').slideDown("fast");
			} else {
				$wrapper.find('div[data-role="search-box"]').hide();
			}
		},
		resetLoadSearchView: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			$wrapper.find('div[data-role="search-box"] input[type="text"]').val('');
			$.each($wrapper.find('div[data-role="load-ganada-search"] input[type="radio"]'), function(item) {
				this.checked = false;
			});
			base.state.keyword = "";
			base.state.keywordStart = "";
			base.state.keywordEnd = "";
		},
		updateSelectedView: function() {
			var base = this;
			var selected = base.state.selected;
			if(!selected) return;
			var $wrapper = $('#' + base.id);
			if(selected.wide && selected.wide.code) {
				$wrapper.find('a[data-role="selected-wide"]').html(selected.wide.name);	
			} else {
				$wrapper.find('a[data-role="selected-wide"]').html("시/도");
			}
			
			if(selected.city && selected.city.code) {
				$wrapper.find('a[data-role="selected-city"]').html(selected.city.name);	
			} else {
				$wrapper.find('a[data-role="selected-city"]').html("구/군");
			}
			
			if(selected.dong && selected.dong.code) {
				$wrapper.find('a[data-role="selected-dong"]').html(selected.dong.name);	
			} else {
				if(base.searchType == SEARCH_TYPE.LOAD) {
					$wrapper.find('a[data-role="selected-dong"]').html("도로명");	
				} else {
					$wrapper.find('a[data-role="selected-dong"]').html("읍/면/동");	
				}
			}
		},
		updateBookmarks: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			var $view = $wrapper.find('div[data-role="bookmark-holder"]');
			for(var i = 0 ; i < base.config.bookmarks.length ; i++) {
				var bookmark = base.config.bookmarks[i];
				createFullName(bookmark);
			}
			
			var template = '{{#data}}';
			template += '<button type="button" class="co-btn" ';
			template += '{{#wide}}data-wide-code="{{code}}" data-wide-name="{{name}}"{{/wide}} ';
			template += '{{#city}}data-city-code="{{code}}" data-city-name="{{name}}"{{/city}} ';
			template += '{{#dong}}data-dong-code="{{code}}" data-dong-name="{{name}}" data-x="{{x}}" data-y="{{y}}" data-lat="{{lat}}" data-lon="{{lon}}"{{/dong}} ';
			template += '>{{fullName}}</button>';
			template += '{{/data}}';
			var html =  Mustache.render(template, {data: base.config.bookmarks});
			$view.html(html);
			var $title = $wrapper.find('button[data-role="bookmark-selected"]');
			if(base.config.bookmarks && base.config.bookmarks.length> 0) {
				var selectedBookmark = base.config.selectedBookmark;
				if(!selectedBookmark) {
					selectedBookmark = base.config.bookmarks[0];
					base.config.selectedBookmark = Object.assign({}, selectedBookmark);
				}
				setBookmarkAttribute($title, selectedBookmark);
			} else {
				setBookmarkAttribute($title);
			}
		},
		updateRecent: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			var $view = $wrapper.find('div[data-role="recent-holder"]');
			for(var i = 0 ; i < base.config.recent ; i++) {
				var recentItem = base.config.recent[i];
				createFullName(recentItem);
			}
			var template = '{{#data}}';
			template += '<button type="button" class="co-btn" ';
			template += '{{#wide}}data-wide-code="{{code}}" data-wide-name="{{name}}"{{/wide}} ';
			template += '{{#city}}data-city-code="{{code}}" data-city-name="{{name}}"{{/city}} ';
			template += '{{#dong}}data-dong-code="{{code}}" data-dong-name="{{name}}" data-x="{{x}}" data-y="{{y}}" data-lat="{{lat}}" data-lon="{{lon}}"{{/dong}} ';
			template += '>{{fullName}}</button>';
			template += '{{/data}}';
			var html =  Mustache.render(template, {data: base.config.recent});
			$view.html(html);
			var $title = $wrapper.find('button[data-role="recent-selected"]');
			if(base.config.recent && base.config.recent.length> 0) {
				var selectedRecent = base.config.selectedRecent;
				createFullName(selectedRecent);
				if(!selectedRecent) {
					selectedRecent = base.config.recent[0];
					base.config.selectedRecent = Object.assign({}, selectedRecent);
				}
				setBookmarkAttribute($title, selectedRecent);
			} else {
				setBookmarkAttribute($title, null,"최근 조회 내역이 없습니다.");
			}
		},
		clearSelected: function() {
			var base = this;
			base.state.level = TYPE.WIDE;
			delete base.state.selected;
			base.state.selected = {
				wide: {code: "", name: ""},
				city: {code: "", name: ""},
				dong: {code: "", name: ""},
			};
		},
		error: function() {
			var base = this;
			return function(request, status) {
				if(console) console.log(request, status);
			};
		},
		addEventHandler: function() {
			var base = this;
			// save, cancel
			var $wrapper = $('#' + base.id);
			$wrapper.find('a[data-role="save-dong"]').on('click', function(e) {
				e.preventDefault();
				var onlyMemory = $(this).attr('data-only-memory');
				var newBookmark = base.addBookmark();
				if(!newBookmark) return;
				if(onlyMemory == "yes") {
					base.updateBookmarks();
					base.clearSelected();
					base.updateSelectedView();
					base.resetLoadSearchView();
					base.requestRemote(TYPE.WIDE).then(function(data) {base.updateView(TYPE.WIDE, data, true)},base.error());
					base.onAddAreaBookmarkOnlyMemory(newBookmark);
					$('#my-area-list a[data-role="delete-bookmark"]').first().trigger('focus');
				} else {
					createFullName(newBookmark);
					base.config.selectedBookmark = newBookmark;
					base.writeConfig();
					base.updateBookmarks();
					base.clearSelected();
					base.updateSelectedView();
					base.resetLoadSearchView();
					base.requestRemote(TYPE.WIDE).then(function(data) {base.updateView(TYPE.WIDE, data)},base.error());
					
					base.onAddAreaBookmark(newBookmark);
				}
			});
			$wrapper.find('button[data-role="view-dong"]').on('click', function(e) {
				e.preventDefault();
				var newRecent = base.addRecent();
				if(!newRecent) return;
				createFullName(newRecent);
				base.config.selectedRecent = newRecent;
				base.writeConfig();
				base.updateRecent();
				base.clearSelected();
				base.updateSelectedView();
				base.resetLoadSearchView();
				base.requestRemote(TYPE.WIDE).then(function(data) {base.updateView(TYPE.WIDE, data)},base.error());
				
				base.onAddAreaRecent(newRecent);
				base.closeConfig();
			});
			$wrapper.on('click', 'div[data-role="bookmark-holder"] button', function(e) {
				var bookmark = readBookmarkAttribute(this);
				base.config.selectedBookmark = Object.assign({}, bookmark);
				base.updateBookmarks();
			});
			$wrapper.on('click', 'div[data-role="recent-holder"] button', function(e) {
				var bookmark = readBookmarkAttribute(this);
				base.config.selectedRecent = Object.assign({}, bookmark);
				base.updateRecent();
			});
			$wrapper.find('button[data-role="show-favorite"]').on('click', function(e) {
				e.preventDefault();
				base.onAreaBookmarkShow();
				base.closeConfig();
			});
			$wrapper.find('button[data-role="show-recent"]').on('click', function(e) {
				e.preventDefault();
				base.onAreaRecentShow();
				base.closeConfig();
			});
			$wrapper.on('click', 'ul[data-role="result-holder"] a', function(e) {
				e.preventDefault();
				var $item = $(this);
				var goto = $item.attr('data-goto');
				var level = $item.attr('data-level');
				var code = $item.attr('data-code');
				var name = $item.attr('data-name');
				var x = $item.attr('data-x');
				var y = $item.attr('data-y');
				var lat = $item.attr('data-lat');
				var lon = $item.attr('data-lon');
				if(goto) {
					if(goto == TYPE.WIDE) {
						base.state.selected.wide = { code: "", name: ""}
						base.state.selected.city = { code: "", name: ""}
						base.state.selected.dong = { code: "", name: ""}
						base.updateSelectedView();
						base.requestRemote(TYPE.WIDE).then(function(data) {base.updateView(TYPE.WIDE, data)},base.error());	
					} else if(goto == TYPE.CITY) {
						base.state.selected.city = { code: "", name: ""}
						base.state.selected.dong = { code: "", name: ""}
						base.updateSelectedView();
						base.requestRemote(TYPE.CITY).then(function(data) {base.updateView(TYPE.CITY, data)},base.error());	
					}
					$item.parents('.addr-wrap').find('h3').first().remove();
					return;
				}
				if(level == "1") {
					// call city list
					base.state.level = level;
					base.state.selected.wide = { code: code, name: name, x: x, y: y, lat: lat, lon: lon};
					base.requestRemote(TYPE.CITY)
					.then(function(data) {base.updateView(TYPE.CITY, data)},base.error());
				} else if(level == "2") {
					// call dong list
					base.state.level = level;
					base.state.selected.city = { code: code, name: name, x: x, y: y, lat: lat, lon: lon};
					base.requestRemote(TYPE.DONG).then(function(data) {base.updateView(TYPE.DONG, data)},base.error());
				} else if(level == "3") {
					base.state.level = level;
					base.state.selected.dong = { code: code, name: name, x: x, y: y, lat: lat, lon: lon};
					base.updateSelectedView();
					$wrapper.find('button[data-role="view-dong"]').first().trigger('focus');
				} else {
					;;
				}
			});
			
			$wrapper.find('div[data-role="load-search"] button').on('click', function(e) {
				var keyword = $(this).parent().find('input[type="text"]').val();
				base.state.keyword = keyword;
				var keywordStart = base.state.keywordStart;
				var keywordEnd = base.state.keywordEnd;
				base.requestRemote(TYPE.DONG, keyword, keywordStart, keywordEnd).then(function(data) {base.updateView(TYPE.DONG, data)},base.error());
				e.preventDefault();
			});
			$wrapper.find('div[data-role="load-search"] input[type="text"]').keyup(function (key) {
				var keyword = $(this).val();
				base.state.keyword = keyword;
		        if(key.keyCode == 13){
					var keywordStart = base.state.keywordStart;
					var keywordEnd = base.state.keywordEnd;
					base.requestRemote(TYPE.DONG, keyword, keywordStart, keywordEnd).then(function(data) {base.updateView(TYPE.DONG, data)},base.error());
		        }
		    });
			$wrapper.find('div[data-role="load-ganada-search"] button[name="sch-rdo"]').on('click', function(e) {
				$(this).parent().find('button').removeClass('on');
				$(this).addClass('on');
				
				var keyword = base.state.keyword;
				var ganada = this.value.split(",");
				
				var keywordStart = "";
				var keywordEnd = "";
				if(ganada.length == 2) {
					keywordStart = ganada[0];
					keywordEnd = ganada[1];
				}
				base.state.keywordStart = keywordStart;
				base.state.keywordEnd = keywordEnd;
				base.requestRemote(TYPE.DONG, keyword, keywordStart, keywordEnd).then(function(data) {base.updateView(TYPE.DONG, data, true)},base.error());
				
			});
		}
	};
	
	if (typeof exports !== 'undefined') exports.DongConfig = DongConfig;
	else window.DongConfig = DongConfig;
})(jQuery, window, document);


