/**
 * 내 포인트 관심지역 슬라이더 ( 모바일만 노출 )
 */
'use strict';
(function($, window, document){
	var VER="2020-12",
		KEY = 'W_DC',
		PREFIX = window.appBase ? window.appBase : '/',
	MyPointSlider = function(wrapperId) {
		if(typeof jQuery === 'undefined') {
			alert('jQuery required!');
			return;
		}
		if(typeof store === 'undefined') {
			alert('store.js required!');
			return;
		}
		if(typeof Mustache === 'undefined') {
			alert('mustache.js required!');
			return;
		}
		var self = this;
		self.id = wrapperId;
		self.$wrapper = $('#' + self.id);
		self.config = {
			bookmarks: [],
			recent: []
		};
		self.selectedIndex = -1;
		self.slider = null;
		self.isActive = $(window).width() <= 1100;
		
		self.init();
	};
	MyPointSlider.prototype = {
		readConfig: function() {
			var self = this;
			var loadedConfig = store.get(KEY);
			if(loadedConfig) {
				this.config = loadedConfig;
			}
		},
		saveConfig: function() {
			var self = this;
			if(self.config) {
				store.set(KEY, self.config);	
			}
		},
		refresh: function(bookmark) {
			var self = this;
			self.readConfig();
			if(bookmark) {
				self.config.selectedBookmark = Object.assign({}, bookmark);
			}
			self.updateBookmarks(bookmark);
		},
		updateBookmarks: function(bookmark) {
			var self = this;
			if(bookmark) {
				$.each(self.$wrapper.find('a[data-role="view-bookmark"]'), function(i, ele) {
					var fullName = $(ele).attr('data-full-name');
					$(ele).removeClass('on');
					if(bookmark.fullName == fullName) {
						$(ele).addClass('on');
						if(history.pushState) {
							history.pushState(null,null,"#dong/" + $(ele).attr('data-dong-code'));
						} else {
							location.hash = "#dong/" + $(ele).attr('data-dong-code');
						}
					} 
				});
			} else {
				self.createSlider();
			}
		},
		refreshSelected: function(bookmark) {
			var self = this;
			if(bookmark) {
				self.config.selectedBookmark = Object.assign({}, bookmark);
				self.updateBookmarks(bookmark);
			}
		},
		addEventHandler: function() {
			var self = this;
			self.$wrapper.on('click', 'a[data-role="view-bookmark"]', function(e) {
				e.preventDefault();
				var index = $(this).attr('data-index');
				var bookmark = self.config.bookmarks[index];
				if(bookmark) {
					self.config.selectedBookmark = bookmark;
					self.config.selectedBookmark.index = index;
					self.updateBookmarks(bookmark);
					self.saveConfig();
					self.onAreaBookmarkSelected(index, bookmark);
				}
			});
			$(window).resize(function(e) {
				if(!self.isActive) {
					self.isActive = $(window).width() <= 1100;
					if(self.isActive) {
						self.createSlider();
					}
				}
			});
		},
		init: function() {
			var self = this;
			self.readConfig();
			self.createSlider();
			self.addEventHandler();
		},
		createSlider: function() {
			var self = this;
			var $view = self.$wrapper.find('div[data-role="my-area-holder"]');
			var template = '{{#data}}<div class="my-item">';
			template += '<a class="dong {{#on}}on{{/on}}" title="보기" href="#view-bookmark" data-role="view-bookmark" data-index="{{index}}" data-full-name="{{fullName}}"';
			template += '{{#wide}}data-wide-code="{{code}}" data-wide-name="{{name}}"{{/wide}} ';
			template += '{{#city}}data-city-code="{{code}}" data-city-name="{{name}}"{{/city}} ';
			template += '{{#dong}}data-dong-code="{{code}}" data-dong-name="{{name}}" data-x="{{x}}" data-y="{{y}}" data-lat="{{lat}}" data-lon="{{lon}}">{{/dong}}';
			template += '{{shortName}}</a></div>{{/data}}';
			var data = (self.config && self.config.bookmarks) ? self.config.bookmarks : [];
			for(var i = 0 ; i < data.length ; i++) {
				data[i].index = i;
				data[i].on = self.config.selectedBookmark && (data[i].fullName == self.config.selectedBookmark.fullName);
				var shortName = "-";
				if(data[i].dong && data[i].dong.name) {
					shortName = data[i].dong.name;	
				} else if(data[i].city && data[i].city.name) {
					shortName = data[i].city.name;	
				} else if(data[i].wide && data[i].wide.name) {
					shortName = data[i].wide.name;	
				}
				data[i].shortName = shortName;
			}
			
			var html =  Mustache.render(template, {data: data});
			
			if(data.length == 0) {
				html = '<div class="no-area">지역을 검색하여 관심지역 등록 가능합니다.</div>';
			}
			
			$view.html(html);
			
			var slideCount = data.length;
			if(slideCount > 0) {
				var $slideWrap = self.$wrapper.find('.slide-wrap').first();
				var scrollWidth = 40;
				$.each($slideWrap.find('.my-item'), function(i, ele) {
					scrollWidth += Math.ceil($(ele).width()) + 11;	
				});
				$slideWrap.find('div[data-role="my-area-holder"]').css('width', scrollWidth + 'px');
				self.slider = new IScroll('#' + self.id + ' > .slide-wrap', { snap: 'div', eventPassthrough:true, scrollX: true, scrollY: false, mouseWheel: true, scrollbars: false, resizePolling : 40, probeType : 3, interactiveScrollbars: true});
			}
		},
		onAreaBookmarkSelected: function(bookmarkIndex, bookmark) {
			var self = this;
			GlobalEvent.trigger($.Event("onAreaBookmarkSelected"), [bookmarkIndex, bookmark, self]);
		},
		onAreaBookmarkUpdated: function(bookmarkIndex, bookmark) {
			var self = this;
			self.readConfig();
			self.createSlider();
			self.isActive = $(window).width() <= 1100;
		}
	};
	
	if (typeof exports !== 'undefined') exports.MyPointSlider = MyPointSlider;
	else window.MyPointSlider = MyPointSlider;
})(jQuery, window, document);