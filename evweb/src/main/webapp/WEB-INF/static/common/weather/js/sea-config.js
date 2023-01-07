/**
 * SeaConfig
 *
 * 바다날씨 예보구역 선택
 */
'use strict';
(function($, window, document){
	var AREA = {
		TOP: "TOP",
		MID: "MID",
		BTM: "BTM"
	},
	MAX_SHOW_HISTORY = 6,
	SeaConfig = function(wrapperId) {
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
		base.id = wrapperId;
		base.key = "W_SC";
		base.state = {
			selected: {
				top: {code: "", name: ""},
				mid: {code: "", name: ""},
				btm: {code: "", name: ""}
			},
			isNotSelected: function() {
				return !this.selected.top.code && !this.selected.mid.code && !this.selected.btm.code;
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
		base.requestRemote(AREA.TOP)
			.then(
				function(data) {
					if(data) base.updateView(AREA.TOP, data)
					else base.updateBookmarkButtonStatus();
					return base.requestRemote(AREA.MID)
				},
				base.error()
			)
			.then(
				function(data) {
					if(data) base.updateView(AREA.MID, data)
					else base.updateBookmarkButtonStatus();
					return base.requestRemote(AREA.BTM)
				},
				base.error()
			)
			.then(
				function(data) {
					base.updateView(AREA.BTM, data)
					base.updateBookmarkButtonStatus();
				},
				base.error()
			);
		base.addEventHandler();
	};
	function createFullName(bookmark) {
		if(bookmark.top) {
			if(bookmark.top.code && bookmark.mid.code && bookmark.btm.code) {
				bookmark.fullName = bookmark.top.name + " > " + bookmark.mid.name + " > " + bookmark.btm.name;	
			} else if(bookmark.top.code && bookmark.mid.code ) {
				bookmark.fullName = bookmark.top.name + " > " + bookmark.mid.name;
			} else if(bookmark.top.code) {
				bookmark.fullName = bookmark.top.name;
			} else {
				bookmark.fullName = "-";
			}	
		} else {
			bookmark.fullName = "-";
		}
	}
	function setBookmarkAttribute($obj, bookmark, defaultTitle) {
		if(bookmark) {
			$obj.attr('data-top-code', bookmark.top.code);
			$obj.attr('data-top-name', bookmark.top.name);
			$obj.attr('data-mid-code', bookmark.mid.code);
			$obj.attr('data-mid-name', bookmark.mid.name);
			$obj.attr('data-btm-code', bookmark.btm.code);
			$obj.attr('data-btm-name', bookmark.btm.name);
			$obj.html(defaultTitle?defaultTitle:bookmark.fullName);
		} else {
			$obj.attr('data-top-code', "");
			$obj.attr('data-top-name', "");
			$obj.attr('data-mid-code', "");
			$obj.attr('data-mid-name', "");
			$obj.attr('data-btm-code', "");
			$obj.attr('data-btm-name', "");
			$obj.html(defaultTitle?defaultTitle:"관심지역을 추가해 주세요.");
		}
	}
	function readBookmarkAttribute(o) {
		var bookmark = {};
		var $item = $(o);
		bookmark.top = { code: $item.attr('data-top-code'), name: $item.attr('data-top-name') };
		bookmark.mid = { code: $item.attr('data-mid-code'), name: $item.attr('data-mid-name') };
		bookmark.btm = { code: $item.attr('data-btm-code'), name: $item.attr('data-btm-name') };
		createFullName(bookmark);
		return bookmark;
	}
	SeaConfig.prototype = {
		readConfig: function() {
			var loadedConfig = store.get(this.key);
			if(loadedConfig) {
				this.config = loadedConfig;
			}
		},
		writeConfig: function() {
			store.set(this.key, this.config);
		},
		onAddSeaBookmark: function(bookmark) {
			GlobalEvent.trigger($.Event("onAddSeaBookmark"), [bookmark, this]);
		},
		onAddSeaRecent: function(recent) {
			GlobalEvent.trigger($.Event("onAddSeaRecent"), [recent, this]);
		},
		onSeaBookmarkShow: function() {
			var base = this;
			GlobalEvent.trigger($.Event("onSeaBookmarkShow"), [base.config.selectedBookmark, this]);
		},
		onSeaRecentShow: function() {
			var base = this;
			GlobalEvent.trigger($.Event("onSeaRecentShow"), [base.config.selectedRecent, this]);
		},
		deleteBookmark: function(bookmark) {
			var base = this;
			var deleted = false;
			if(base.config && base.config.bookmarks) {
				for(var i in base.config.bookmarks) {
					var item = base.config.bookmarks[i];
					if(bookmark.top.code == item.top.code 
							&& bookmark.mid.code == item.mid.code 
							&& bookmark.btm.code == item.btm.code) {
						base.config.bookmarks.splice(i, 1);
						base.writeConfig();
						
						if(base.config.selectedBookmark) {
							if(bookmark.top.code == base.config.selectedBookmark.top.code 
									&& bookmark.mid.code == base.config.selectedBookmark.mid.code 
									&& bookmark.btm.code == base.config.selectedBookmark.btm.code) {
								if(base.config.bookmarks && base.config.bookmarks.length > 0) {
									base.config.selectedBookmark = Object.assign({},base.config.bookmarks[0]);
								} else {
									base.config.selectedBookmark = null;
								}
							}
						}
						
						deleted = true;
						break;
					}
				}
			}
			return deleted;
		},
		isMyBookmark: function() {
			var base = this;
			var topArea = base.state.selected.top,
				midArea = base.state.selected.mid,
				btmArea = base.state.selected.btm;
			if(base.state.isNotSelected()) {
				return false;
			}
			if(base.config instanceof Array || !base.config instanceof Object) {
				base.config = {};
				base.config.bookmarks = new Array();
			} 
			if(!base.config.bookmarks || !base.config.bookmarks instanceof Array) {
				base.config.bookmarks = new Array();
			}
			
			var isMy = false;
			
			for(var i in base.config.bookmarks) {
				var area = base.config.bookmarks[i];
				if(topArea && area.top.code == topArea.code 
						&& midArea && area.mid.code == midArea.code 
						&& btmArea && area.btm.code == btmArea.code) {
					isMy = true;
					break;
				}
			}
			return isMy;
		},
		addBookmark: function() {
			var base = this;
			var topArea = base.state.selected.top,
				midArea = base.state.selected.mid,
				btmArea = base.state.selected.btm;
			if(base.state.isNotSelected()) {
				alert("바다예보 구역을 선택해 주세요.");
				return false;
			}
			if(base.config instanceof Array || !base.config instanceof Object) {
				base.config = {};
				base.config.bookmarks = new Array();
			} 
			if(!base.config.bookmarks || !base.config.bookmarks instanceof Array) {
				base.config.bookmarks = new Array();
			}
			
			var conflict = false;
			
			for(var i in base.config.bookmarks) {
				var area = base.config.bookmarks[i];
				if(topArea && area.top.code == topArea.code 
						&& midArea && area.mid.code == midArea.code 
						&& btmArea && area.btm.code == btmArea.code) {
					conflict = true;
					break;
				}
			}
			var newBookmark = null;
			if(!conflict) {
				newBookmark = {top: topArea, mid: midArea, btm: btmArea};
				createFullName(newBookmark);
				base.config.bookmarks.unshift(newBookmark);
			} else {
				alert("이미 등록되어있는 바다예보 구역입니다.");
			}
			return newBookmark;
		},
		addRecent: function() {
			var base = this;
			var topArea = base.state.selected.top,
				midArea = base.state.selected.mid,
				btmArea = base.state.selected.btm;
			if(base.state.isNotSelected()) {
				alert("바다예보 구역을 선택해 주세요.");
				return false;
			}
			if(base.config instanceof Array || !base.config instanceof Object) {
				base.config = {};
				base.config.recent = new Array();
			} 
			if(!base.config.recent || !base.config.recent instanceof Array) {
				base.config.recent = new Array();
			}
			
			var conflict = false;
			
			for(var i in base.config.recent) {
				var area = base.config.recent[i];
				if(topArea && area.top.code == topArea.code 
						&& midArea && area.mid.code == midArea.code 
						&& btmArea && area.btm.code == btmArea.code) {
					conflict = true;
					break;
				}
			}
			var newRecent = {top: topArea, mid: midArea, btm: btmArea};
			createFullName(newRecent);
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
		getZones: function(type, topArea, midArea, btmArea) {
			var baseUrl = this.getBase();
			var data = {
				type: type,
				topArea: topArea?topArea:"",
				midArea: midArea?midArea:"",
				btmArea: btmArea?btmArea:""
			};
			
			return $.ajax({
				url: baseUrl + "rest/zone/sea.do",
				data: data,
				dataType: "json"
			});
		},
		getBase: function() {
			if(window.appBase) {
				return window.appBase;
			} else {
				return "/";
			}
		},
		requestRemote: function(type) {
			var base = this;
			return base.getZones(
				type
				, base.state.selected.top.code
				, base.state.selected.mid.code
				, base.state.selected.btm.code
			);	
		},
		updateView: function(type, data) {
			var base = this;
			var typeKey = type.toLowerCase();
			var $wrapper = $('#' + base.id);
			var $view = $wrapper.find('ul[data-role="sea-' + typeKey + '-area"]');
			var template = '{{#data}}<li><div class="radio-wrap"><a href="#" id="rdo_sea_config_{{type}}{{index}}" class="addr-chk-btn rdo-g {{#checked}}on{{/checked}}" data-level="{{type}}Area" data-value="{{code}}" data-name="{{name}}">{{name}}</a></div></li>{{/data}}';
			for(var i = 0 ; i < data.length ; i++) {
				data[i].index = i;
				data[i].checked = i==0;
			}
			if(data.length > 0) {
				base.state.selected[typeKey] = data[0];
			} else {
				base.state.selected[typeKey] = { code: "", name: ""}	
			}
			
			var html =  Mustache.render(template, {type: typeKey, data: data});
			$view.html(html);
		},
		updateBookmarks: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			var $view = $wrapper.find('div[data-role="bookmark-holder"]');
			//<button type="button" class="co-btn">서해중부   >   서해중부앞바다</button>
			for(var i in base.config.bookmarks) {
				var bookmark = base.config.bookmarks[i];
				createFullName(bookmark);
			}
			var template = '{{#data}}';
			template += '<div class="accordion-dropdown-wrap"><a href="#" class="co-btn" ';
			template += '{{#top}}data-top-code="{{code}}" data-top-name="{{name}}"{{/top}}';
			template += '{{#mid}}data-mid-code="{{code}}" data-mid-name="{{name}}"{{/mid}}';
			template += '{{#btm}}data-btm-code="{{code}}" data-btm-name="{{name}}"{{/btm}}';
			template += '>{{fullName}}</a><a href="#delete-bookmark" class="item-hide-btn delete-bookmark"><span class="hid">{{fullName}} 삭제</span></a></div>';
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
			for(var i in base.config.recent) {
				var recentItem = base.config.recent[i];
				createFullName(recentItem);
			}
			
			var template = '{{#data}}';
			template += '<a href="#" class="co-btn" ';
			template += '{{#top}}data-top-code="{{code}}" data-top-name="{{name}}"{{/top}}';
			template += '{{#mid}}data-mid-code="{{code}}" data-mid-name="{{name}}"{{/mid}}';
			template += '{{#btm}}data-btm-code="{{code}}" data-btm-name="{{name}}"{{/btm}}';
			template += '>{{fullName}}</a>';
			template += '{{/data}}';
			var html =  Mustache.render(template, {data: base.config.recent});
			$view.html(html);
			var $title = $wrapper.find('button[data-role="recent-selected"]');
			if(base.config.recent && base.config.recent.length> 0) {
				var selectedRecent = base.config.selectedRecent;
				if(!selectedRecent) {
					selectedRecent = base.config.recent[0];
					base.config.selectedRecent = Object.assign({}, selectedRecent);
				}
				setBookmarkAttribute($title, selectedRecent);
			} else {
				setBookmarkAttribute($title, null, "최근 조회 내역이 없습니다.");
			}
		},
		updateBookmarkButtonStatus: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			var $btn = $wrapper.find('a[data-role="save-area"]');
			if(base.isMyBookmark()) {
				if(!$btn.hasClass('on')) $btn.addClass('on');
			} else {
				$btn.removeClass('on');
			}
		},
		error: function() {
			var base = this;
			return function(request, status) {
				if(console) console.log(request, status);
			};
		},
		addEventHandler: function() {
			var base = this;
			var $wrapper = $('#' + base.id);
			$wrapper.on('click', 'div[data-role="bookmark-holder"] a.co-btn', function(e) {
				var bookmark = readBookmarkAttribute(this);
				base.config.selectedBookmark = Object.assign({}, bookmark);
				base.updateBookmarks();
				$wrapper.find('.accordion-tit[data-role="bookmark-selected"]').trigger('click');
			});
			$wrapper.on('click', 'div[data-role="recent-holder"] a.co-btn', function(e) {
				var bookmark = readBookmarkAttribute(this);
				base.config.selectedRecent = Object.assign({}, bookmark);
				base.updateRecent();
				$wrapper.find('.accordion-tit[data-role="recent-selected"]').trigger('click');
			});
			$wrapper.on('click', 'div[data-role="bookmark-holder"] a.delete-bookmark', function(e) {
				var bookmark = readBookmarkAttribute($(this).prev()[0]);
				base.deleteBookmark(bookmark);
				base.updateBookmarks();
				e.preventDefault();
			});
			$wrapper.find('[data-role="save-area"]').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('on')) {
					var topArea = base.state.selected.top,
						midArea = base.state.selected.mid,
						btmArea = base.state.selected.btm;
					if(!base.state.isNotSelected()) {
						var bookmark = { top:topArea, mid:midArea, btm:btmArea};
						base.deleteBookmark(bookmark);
						base.updateBookmarks();	
						base.updateBookmarkButtonStatus();
					}
					
				} else {
					var newBookmark = base.addBookmark(); 
					if(newBookmark) {
						base.config.selectedBookmark = newBookmark;
						base.writeConfig();
						base.updateBookmarks();
						base.updateBookmarkButtonStatus();
						base.onAddSeaBookmark(newBookmark);
						$wrapper.find('button[data-role="show-favorite"]').trigger('click');
					}
				}
			});
			$wrapper.find('[data-role="view-area"]').on('click', function(e) {
				e.preventDefault();
				var newRecent = base.addRecent();
				if(newRecent) {
					base.config.selectedRecent = newRecent;
					base.writeConfig();
					base.updateRecent();
					base.onAddSeaRecent(newRecent);
					$wrapper.find('button[data-role="show-recent"]').trigger('click');
				}
			});
			
			$wrapper.find('[data-role="show-favorite"]').on('click', function(e) {
				e.preventDefault();
				base.onSeaBookmarkShow();
				base.closeConfig();
			});
			$wrapper.find('[data-role="show-recent"]').on('click', function(e) {
				e.preventDefault();
				base.onSeaRecentShow();
				base.closeConfig();
			});
			
			// 최상위 바다예보구역 클릭
			$wrapper.on('click', 'a[data-level="topArea"]', function(e) {
				$wrapper.find('a[data-level="topArea"]').removeClass('on');
				$(this).addClass('on');
				var code = $(this).attr('data-value');
				var name = $(this).attr('data-name');
				base.state.selected.top = { code: code, name: name, checked: true };
				base.state.selected.mid = { code: "", name: "" };
				base.state.selected.btm = { code: "", name: "" };
				base.requestRemote(AREA.MID)
				.then(
					function(data) {
						if(data) {
							base.updateView(AREA.MID, data);
						} else {
							base.updateBookmarkButtonStatus();
						}
						return base.requestRemote(AREA.BTM)
					},
					base.error()
				)
				.then(
					function(data) {
						if(data) {
							base.updateView(AREA.BTM, data)
						} else {
							base.updateBookmarkButtonStatus();
						}
					},
					base.error()
				);
			});
			
			// 중간 바다예보구역 클릭
			$wrapper.on('click', 'a[data-level="midArea"]', function(e) {
				$wrapper.find('a[data-level="midArea"]').removeClass('on');
				$(this).addClass('on');
				var code = $(this).attr('data-value');
				var name = $(this).attr('data-name');
				base.state.selected.mid = { code: code, name: name, checked: true };
				base.state.selected.btm = { code: "", name: "" };
				base.requestRemote(AREA.BTM)
				.then(
					function(data) {
						if(data) {
							base.updateView(AREA.BTM, data);
						} else {
							base.updateBookmarkButtonStatus();
						}
					},
					base.error()
				);
			});
			
			// 중간 바다예보구역 클릭
			$wrapper.on('click', 'a[data-level="btmArea"]', function(e) {
				$wrapper.find('a[data-level="btmArea"]').removeClass('on');
				$(this).addClass('on');
				var code = $(this).attr('data-value');
				var name = $(this).attr('data-name');
				base.state.selected.btm = { code: code, name: name, checked: true };
				base.updateBookmarkButtonStatus();
			});
		}
	};
	
	if (typeof exports !== 'undefined') exports.SeaConfig = SeaConfig;
	else window.SeaConfig = SeaConfig;
})(jQuery, window, document);


