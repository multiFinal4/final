/**
 * 동 검색 UI
 */
'use strict';
(function($, window, document){
	var VER="2020-1",
		LOG_KEY = 'cmpLocalSearchLog',
		RENEW_PREFIX = (window.appBase ? window.appBase : '/') + 'renew2021/',
	DongSearchbox = function(wrapperId) {
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
		self.placeResults = null,
		self.currentPage = 1,
		self.lastQuery = '',
		self.searchTimer = null,
		self.waiting = false;
		self.init();
	};
	DongSearchbox.prototype = {
		addEventHandler: function() {
			var self = this;
			
			self.$wrapper.on('focus', '.cmp-local-search-input input', function(e) {
				self.$wrapper.find('.cmp-local-search-items').removeClass('places');
				self.createLogs();
				self.showSearchBoxDropdown();
			});
			self.$wrapper.on('keyup', '.cmp-local-search-input input', function(e) {
				if(e.keyCode == 13){
					self.startQuery();
				} else {
					self.startQueryDelayed(500);
				}
			});
			self.$wrapper.on('click', '.sym-btn.sch[data-role=search]', function(e) {
				self.startQuery();
			});
			self.$wrapper.on('click','.cmp-local-search-items > ul > li > a', function(e) {
				e.preventDefault();
				var role = $(this).attr('data-role');
				if(role == "log") {
					var query = $(this).attr('data-query');
					self.startQuery(query, 1, $(this).parent());
				} else if(role == "log-delete") {
					var query = $(this).attr('data-query');
					self.deleteLog(query, this);
				} else if(role == "more") {
					self.currentPage++;
					self.startQuery(self.lastQuery, self.currentPage, $(this).parent());
				} else if(role == "place") {
					// 해당 지역 컨텐츠 로드 ( 지도, 북마크, 현재날씨, 동네예보 )
					var code = $(this).attr('data-dong-code');
					var address = $(this).attr('data-address');
					var addressTokens = address.split(' ');
					var wideName = addressTokens[0];
					var cityName = addressTokens[1];
					var dongName = addressTokens.slice(2, 3).join(' ');
					var fullName = addressTokens.slice(0, 3).join(' ');
					if(addressTokens[1].substring(addressTokens[1].length-1) == '시' 
							&& addressTokens[2].substring(addressTokens[2].length-1) == '구'
							&& addressTokens.length >= 4 ) {
						cityName = addressTokens[1] + addressTokens[2];
						dongName = addressTokens[3];
						fullName = addressTokens.slice(0, 2).join(' ') + addressTokens.slice(2, 4).join(' ');
					}
					var bookmark = {
						wide: {code: code.substring(0,2) + '00000000', name: wideName},
						city: {code: code.substring(0,5) + '00000', name: cityName},
						dong: {code: code, name: dongName, x: $(this).attr('data-x'), y: $(this).attr('data-y'), lat: $(this).attr('data-latitude'), lon: $(this).attr('data-longitude')},
						x: $(this).attr('data-x'), 
						y: $(this).attr('data-y'),
						lat: $(this).attr('data-latitude'),
						lon: $(this).attr('data-longitude'),
						fullName: fullName
					};
					GlobalEvent.trigger($.Event("onAreaShow"), [bookmark, self]);
					self.$wrapper.find('.cmp-local-search-items').removeClass('places').removeClass('on');
					self.$wrapper.find('.cmp-local-search-input input').val('');
				}
			});
		},
		init: function() {
			var self = this;
			self.createLogs();
			self.addEventHandler();
		},
		startQueryDelayed: function(delay) {
			var self = this;
			if(self.searchTimer != null) {
				window.clearTimeout(self.searchTimer);
				self.searchTimer = null;
			}
			self.searchTimer = window.setTimeout(function() {
				var query = self.$wrapper.find('.cmp-local-search-input input').val();
				var page = 1;
				var source = null;
				self.currentPage = page;
				if(self.searchPlaces(query, page, source)) {
					self.showSearchBoxDropdown();
				}
				self.searchTimer = null;
			},delay);
		},
		startQuery: function(query, page, source) {
			var self = this;
			if(self.waiting) return;
			if(self.searchTimer != null) {
				window.clearTimeout(self.searchTimer);
				self.searchTimer = null;
			}
			self.searchTimer = window.setTimeout(function() {
				if(!query) {
					query = self.$wrapper.find('.cmp-local-search-input input').val();
				}
				self.currentPage = page ? page : 1;
				if(self.searchPlaces(query, page, source)) {
					self.showSearchBoxDropdown();
				}
				self.searchTimer = null;
			}, 0);
		},
		showWaiting: function(show, parent) {
			var self = this;
			self.waiting = show;
			if(show) {
				var $holder = parent ? $(parent) : self.$wrapper.find('.cmp-local-search-items ul');
				if($holder.find('.loading').length > 0) {
					$holder.find('.loading').remove();
				}
				$holder.append('<div class="loading"><div class="lds-dual-ring sm"></div></div>');	
			} else {
				self.$wrapper.find('.loading').remove();
			}
		},
		searchPlaces: function(query, page, source) {
			var self = this;
			if(!self.$wrapper.find('.cmp-local-search-items').hasClass('places')) {
				self.$wrapper.find('.cmp-local-search-items').addClass('places');
			}
			if(!query) return false;
			page = page ? page : self.currentPage;
			var parent = source ? source : self.$wrapper.find('.cmp-local-search-items ul');
			self.showWaiting(true, parent);
			self.places(query, page).then(function(data) {
					self.showWaiting(false);
					var results = [];
					for(var i in data) {
						if(data[i].address) {
							results.push(data[i]);
						}
					}
					self.placeResults = results;
					self.createPlaces();
					self.saveLog(query);
				},function(err) {
					self.showWaiting(false);
					self.$wrapper.find('.cmp-local-search-items').removeClass('places');
					self.$wrapper.find('.cmp-local-search-items > ul').html('<li class="err">오류가 발생하였습니다.</li>');
				});
			self.lastQuery = query;
			return true;
		},
		showSearchBoxDropdown: function() {
			var self = this;
			if(!self.$wrapper.find('.cmp-local-search-items').hasClass('on')) {
				self.$wrapper.find('.cmp-local-search-items').addClass('on')
					.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){
						if($(this).hasClass('on')) $(this).addClass('opened'); 
					});
			}
		},
		saveLog: function(query) {
			var logs = store.get(LOG_KEY);
			if(logs == null) logs = [];
			var found = -1;
			for(var i in logs) {
				if(logs[i].query == query) {
					found = i;
					break;
				}
			}
			if(found > -1) {
				logs.splice(found, 1);
			}
			logs.unshift({query: query, date: new Date()});
			if(logs.length > 20) {
				logs.pop();
			}
			store.set(LOG_KEY, logs);
		},
		createPlaces: function() {
			var self = this;
			var data = self.placeResults;
			var $placesHolder = self.$wrapper.find('.cmp-local-search-items > ul');
			if(data && data.length > 0) {
				var template = '{{#data}}<li class="place"><a href="#" data-role="place" data-address="{{address}}" data-road-address="{{roadAddress}}" data-longitude="{{longitude}}" data-latitude="{{latitude}}" data-x="{{x}}" data-y="{{y}}" data-dong-code="{{dongCode}}"><strong>{{title}}{{#category}}<small>({{category}})</small>{{/category}}</strong><span>{{address}}</span></a></li>{{/data}}';
				var html =  Mustache.render(template, {data: data});
				if(self.currentPage == 1) {
					if(data.length == 10) html += '<li class="more"><a href="#" data-role="more">+더보기</a></li>';
					$placesHolder.html(html);
				} else {
					$placesHolder.find('li.more').remove();
					if(data.length == 10) html += '<li class="more"><a href="#" data-role="more">+더보기</a></li>';
					$placesHolder.append(html);
				}
			} else {
				if(self.currentPage == 1) {
					$placesHolder.html('<li class="info">검색된 지역이 없습니다.</li>');
				} else {
					$placesHolder.find('li.more').remove();
				}
			}
		},
		createLogs: function() {
			var self = this;
			var logs = store.get(LOG_KEY);
			if(logs && logs.length > 0) {
				var template = '{{#data}}<li class="log"><a href="#" data-role="log" data-query="{{query}}">{{query}}</a><a href="#" data-role="log-delete" data-query="{{query}}">x</a></li>{{/data}}';
				var html =  Mustache.render(template, {data: logs});
				self.$wrapper.find('.cmp-local-search-items > ul').html(html);
			} else {
				self.$wrapper.find('.cmp-local-search-items > ul').empty();
			}
		},
		deleteLog: function(query, sender) {
			var self = this;
			var logs = store.get(LOG_KEY);
			var found = -1;
			for(var i in logs) {
				if(logs[i].query == query) {
					found = i;
					break;
				}
			}
			if(found) {
				logs.splice(found, 1);
				store.set(LOG_KEY,logs);
				if(sender != null) {
					$(sender).parent().remove();
				}
			}
		},
		places: function(query, page) {
			return $.ajax({
				url: RENEW_PREFIX + "rest/main/place-search.do",
				data: {query: query, start: page, src: 'A2'},
				dataType: "json"
			});
		}
	};
	
	if (typeof exports !== 'undefined') exports.DongSearchbox = DongSearchbox;
	else window.DongSearchbox = DongSearchbox;
})(jQuery, window, document);