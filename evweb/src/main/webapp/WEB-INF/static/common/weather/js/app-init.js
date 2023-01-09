'use strict';
if(typeof jQuery === 'undefined') {
	alert('jQuery required!');
}
// common

function showLoading(id, show, clazz) {
	var $wrapper = $('#' + id);
	if(!clazz) clazz = "light";
	var loading = '<div class="loading_wrap"><div class="lds-spinner ' + clazz + '"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>';
	if(show) {
		if($wrapper.has('.loading_wrap').length > 0) {
			$wrapper.find('.loading_wrap').show();
		} else {
			$wrapper.append(loading);
		}	
	} else {
		if($wrapper.has('.loading_wrap').length) {
			$wrapper.find('.loading_wrap').hide();
		}
	}
}

(function($, window, document){
	var GlobalEvent = $({});
	
	if (typeof exports !== 'undefined') exports.GlobalEvent = GlobalEvent;
	else window.GlobalEvent = GlobalEvent;
})(jQuery, window, document);

// cmp-common-tabs
$('.cmp-common-tabs').on('click', ' > li > a ', function(e) {
	e.preventDefault();
	var $tabs = $(this).parents('.cmp-common-tabs');
	$tabs.find(' > li').removeClass('on');
	$tabs.find(' > li > a').attr('title','');
	$(this).attr('title','선택됨').parent().addClass('on');
});
// link via button event
$('button[data-role="link-to"]').on('click', function(e) {
	var url = $(this).attr('data-link');
	if(!url) return;
	var target = $(this).attr('data-target');
	if(!target) {
		window.location.href = url;
	} else {
		window.open(url, target).focus();	
	}
});
$('button[data-role="popup-to"]').on('click', function(e) {
	var url = $(this).attr('data-link');
	if(!url) return;
	var target = $(this).attr('data-target');
	var width = $(this).attr('data-width');
	var height = $(this).attr('data-height');
	window.open(url,target+"",'width=' + width + 'px, height=' + height + 'px, scrollbars=no').focus();
});

//main left tab
$('header .tab[data-role="global-left-tab"] > div > h1 > a').on('click', function(e) {
	if($(this).attr('data-tab') != '3') {
		var $tab = $(this).parents(".tab");
		e.preventDefault();
		$tab.find('.tab-item > h1').attr('title','');
		$tab.find('.tab-item').removeClass('on');
		var $selectedTabItem = $(this).parents(".tab-item");
		$selectedTabItem.addClass("on");
		$selectedTabItem.find('> h1').attr('title','선택됨');
	}
});

var UNIT = { K: "km/h", M: "m/s" }, 
	DISPLAY_MODE_DEFAULT = "default",
	DISPLAY_MODE_MAP = "map",
	LOCATION_MODE_POSITION = "position",
	LOCATION_MODE_FAVORITE = "favorite",
	TAB_MODE_WEATHER = "weather",
	TAB_MODE_WHOLE = "whole",
	LANG = {
		ko: { code: "ko", name: { en: "Korean", ko: "한국어"}},
		en: { code: "en", name: { en: "English", ko: "영어"}},
		ja: { code: "ja", name: { en: "Japanese", ko: "일본어"}},
		cn: { code: "cn", name: { en: "Chinese", ko: "중국어"}},
	};

var dongConfigInSearch = new DongConfig('dong-config-in-search',"DONG");
var loadConfigInSearch = new DongConfig('load-config-in-search',"LOAD");
var appConfig = new AppConfig('weather-config')
appConfig.updateView();
GlobalEvent.on('onStateChanged', function(e, sender, group, stateName, stateValue) {
	console.log(sender, group, stateName, stateValue);
	var config = appConfig.config;
	if(!config) return;
	if(!config.state) config.state = {};
	if(!config.state[group]) config.state[group] = {}
	var changed = {};
	changed[stateName] = stateValue;
	Object.assign(config.state[group], changed);
	appConfig.writeConfig();
	console.log(appConfig.config);
});
function initNavigationStatus() {
	var $desktopMenu = $("#wnuri-menu");
	var path = $('body').attr('data-menu-search');
	if(!path) path = window.location.pathname;
	var isMain = path == (window.appBase ? window.appBase : "") + "/index.do";
	var $selectedMenu = $desktopMenu.find('a[href*="' + path + '"]').first();
	
	$selectedMenu.addClass('on');
	var $selectedParents = $selectedMenu.parents('.accordionsecond-wrap');
	$.each($selectedParents, function(idx, ele) {
		$(ele).find('> a.accordionsecond-tit').addClass('on');
		$(ele).find('> .accordionsecond-con').slideDown(100);
	});
}
$(document).ready(function(){	
	weatherUI.resizeWin();
	weatherUI.headerFix();
	swipeInit();
	$('#page-print-button').on('click', function() {
		window.print();
	});
	if($(window).width() < 1100) {
		$('.recom-cont-btn').trigger('click');
	}
	initNavigationStatus();
});
(function() {
	
	weatherUI.popOpen('.pop-open');
	weatherUI.popClose('.pop-close');
	weatherUI.popCloseBanner('.pop-close-banner');
	weatherUI.menuOpen('.mobile-menu' , 'header .close');
	weatherUI.accordionSecond('.accordionsecond-wrap');
	weatherUI.accordion('.accordion-tit');
	weatherUI.recomSlide('.recom-cont-wrap');
	weatherUI.mainChkToggle('.main-toggle');
	weatherUI.movieChkToggle('.movi-toggle');
	weatherUI.groupChkToggle('.group-toggle');
	weatherUI.tab('.tab-wrap01', '.tab-cont-wrap01');
	weatherUI.tab('.tab-wrap02', '.tab-cont-wrap02');
	weatherUI.tab('.tab-wrap03', '.tab-cont-wrap03');
	weatherUI.tab('.tab-wrap04', '.tab-cont-wrap04');
	weatherUI.tab('.tab-wrap05', '.tab-cont-wrap05');
	weatherUI.tab('.tab-wrap06', '.tab-cont-wrap06');
	weatherUI.tab('.tab-wrap07', '.tab-cont-wrap07');
	weatherUI.mapTab('.map-tab-js');
	
	weatherUI.selectOption('.selectoption')
	
	// 모바일 메뉴 뒤로가기 처리
	//<button class="util-item3 mobile-menu " data-pop-name="open-menu-pop" aria-label="메뉴"></button>
	
	function hideMobileMenu(){
		if(!$('body').hasClass("hidd")) return;
		$('.pw-dimmed').fadeOut(300)
		$('body').removeClass("hidd");
		setTimeout(function(){
			weatherUI.dimdOff();
		},300)
		$('header').stop().animate({'right':-100 + "%"}).fadeOut(100).removeClass('on');
	}

	if (window.history && window.history.pushState) {
		$('button.mobile-menu').on('click', function (e) {
		window.history.pushState('forward', null, '#menu');
		});

		$(window).on('popstate', function () {
			if("#menu" == window.location.hash) {
				hideMobileMenu();
			}
		});
	}	
	
})();
