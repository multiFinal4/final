
function initShare() {
	if(typeof ClipboardJS !== "function") return;
	$('.btn-box .sym-btn.share').on('click', function(e) {
		e.preventDefault();
		$('.btn-box .share_box').toggle();
	});
	var clipboard = new ClipboardJS('.lk.clipboard');
	clipboard.on('success', function(e) { alert('주소가 복사되었습니다.')});
	clipboard.on('error', function(e) {});
	if(window.location.href.indexOf("weather.go.kr") > -1 || window.location.href.indexOf("kma.go.kr") > -1) {
		Kakao.init('2e1186b8d91f899fa948ec951d8642ed');
	}
	function kakaoSendLink(title, url) {
		Kakao.Link.sendDefault({
	        objectType: 'feed',
	        content: {
				title: title,
				description: '기상청 날씨누리',
				imageUrl: 'https://www.weather.go.kr/w/iphone-shortcut.png',
				imageWidth:1200,
				imageHeight:675,
				link: {
					mobileWebUrl: url,
					webUrl: url
				}
	        },
	        buttons: [
	          {
	            title: '자세히 보기',
	            link: {
	              mobileWebUrl: url,
	              webUrl: url
	            }
	          }
	        ]
	      });
	}

	$('.btn-box > .share_box > .inbox > a').on('click', function(e) {
		e.preventDefault();
		shareTo($(this).attr('data-to'));
	});
	function shareTo(type) {
		var title = document.title;
		var linkAddress = window.location.href.replace(location.hash,"");
		linkAddress += (linkAddress.indexOf("?") > -1 ? "&" : "?") + "nolayout=Y";
		linkAddress += location.hash;
		if(type == "facebook") {
			window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURI(linkAddress));	
		} else if(type == "twitter") {
			
			window.open('https://twitter.com/intent/tweet?text=' + title + '&url=' + encodeURI(linkAddress));	
		} else if(type == "kakao") {
			kakaoSendLink(title, linkAddress);
		} else {
			$('.lk.clipboard').attr('data-clipboard-text', linkAddress);
			
		}
	}
}
initShare();

window.toastTimer = null;
function showToast(message) {
	var $toast = $('.cmp-toast');
	if($toast.length == 0) {
		$toast = $('<div class="cmp-toast"><div class="shadow-box"><div class="inner"><p>&nbsp;</p></div></div></div>').appendTo($('body'));
		$toast.click(function() {
			if(window.toastTimer != null) {
				window.clearTimeout(window.toastTimer);
				window.toastTimer = null;
			}
			$toast.removeClass('on');
		});
		window.toastTimer = window.setTimeout(function() {
			$toast.removeClass('on');
			$toast.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){ $(this).remove(); });
		},1999);
	}
	$toast.removeClass('on').find('p').html(message);
	window.setTimeout(function() {
		$toast.addClass('on');
		if(window.toastTimer != null) {
			window.clearTimeout(window.toastTimer);
			window.toastTimer = null;
		}
		window.toastTimer = window.setTimeout(function() {
			$toast.removeClass('on');
			$toast.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){ $(this).remove(); });
		},1999);
	},1);
}

function isIE() {
    var ua = window.navigator.userAgent; //Check the userAgent property of the window.navigator object
    var msie = ua.indexOf('MSIE '); // IE 10 or older
    var trident = ua.indexOf('Trident/'); //IE 11

    return (msie > 0 || trident > 0);
}

//공통 js import 방지
if($.isFunction("checkCommonJs")){
    checkCommonJs("com.ui.js");        
}
var mobilecheck = function() {
  var check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
};
window.mobilecheck = mobilecheck;

/* 스와이프 셋팅 */
function swipeInit(){
    weatherUI.slickChange('.slick-type-change');
    weatherUI.slickAroNonLoop('.map-cont-slick')
    weatherUI.slickBanner('.intro-slick' , '.intro-btn-wrap')
}
function addSwitchToggleEvent(obj, callback) {
    $(obj).on('click', function(e) {
        var targetId = $(this).attr('data-target');
        if(targetId == "movi-toggle") {
            if($(this).hasClass('off')) {
                $(this).parents('.cont-wrap').find('.move-wrap').removeClass('off').find('.move-control-area').removeAttr('aria-hidden');
                $(this).removeClass('off').html('<span class="hid">On</span>');
                $(this).parents('.cont-wrap').find('.move-control-area').find('select').attr('tabindex','0');
                $(this).parents('.cont-wrap').find('.move-control-area').find('button').attr('tabindex','0');
                $(this).parents('.cont-wrap').find('.move-control-area').find('input').attr('tabindex','0');
                $(this).parents('.cont-wrap').find('.move-control-area').find('a').attr('tabindex','0');
            } else {
                $(this).parents('.cont-wrap').find('.move-wrap').addClass('off').find('.move-control-area').attr('aria-hidden', true);
                $(this).addClass('off').html('<span class="hid">Off</span>');
                $(this).parents('.cont-wrap').find('.move-control-area').find('select').attr('tabindex','-1');
                $(this).parents('.cont-wrap').find('.move-control-area').find('button').attr('tabindex','-1');
                $(this).parents('.cont-wrap').find('.move-control-area').find('input').attr('tabindex','-1');
                $(this).parents('.cont-wrap').find('.move-control-area').find('a').attr('tabindex','-1');
            }
        } else {
            if($(this).hasClass('off')) {
                $('#' + targetId).removeClass('group-toggle-off').removeAttr('aria-hidden');
                $(this).removeClass('off').html('<span class="hid">On</span>');
                $('#' + targetId).find('select').attr('tabindex','0');
                $('#' + targetId).find('button').attr('tabindex','0');
                $('#' + targetId).find('input').attr('tabindex','0');
                $('#' + targetId).find('a').attr('tabindex','0');
            } else {
                $('#' + targetId).addClass('group-toggle-off').attr('aria-hidden', true);
                $(this).addClass('off').html('<span class="hid">Off</span>');
                $('#' + targetId).find('select').attr('tabindex','-1');
                $('#' + targetId).find('button').attr('tabindex','-1');
                $('#' + targetId).find('input').attr('tabindex','-1');
                $('#' + targetId).find('a').attr('tabindex','-1');
            }
        }
        
        if(typeof callback === "function")  callback();
    });
    
    var targetId = $(obj).attr('data-target');
    if(targetId == "movi-toggle") {
        if($(obj).hasClass('off')) {
            $(obj).parents('.cont-wrap').find('.move-control-area').find('select').attr('tabindex','-1');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('button').attr('tabindex','-1');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('input').attr('tabindex','-1');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('a').attr('tabindex','-1');
        } else {
            $(obj).parents('.cont-wrap').find('.move-control-area').find('select').attr('tabindex','0');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('button').attr('tabindex','0');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('input').attr('tabindex','0');
            $(obj).parents('.cont-wrap').find('.move-control-area').find('a').attr('tabindex','0');
        }
    } else {
        if($(obj).hasClass('off')) {
            $('#' + targetId).find('select').attr('tabindex','-1');
            $('#' + targetId).find('button').attr('tabindex','-1');
            $('#' + targetId).find('input').attr('tabindex','-1');
            $('#' + targetId).find('a').attr('tabindex','-1');
        } else {
            $('#' + targetId).find('select').attr('tabindex','0');
            $('#' + targetId).find('button').attr('tabindex','0');
            $('#' + targetId).find('input').attr('tabindex','0');
            $('#' + targetId).find('a').attr('tabindex','0');
        }
    }
}
function addUpdownToggleEvent(obj) {
    $(obj).on('click', function(e) {
        e.preventDefault();
        if($(this).hasClass('on')) {
            $(this).removeClass('on');
        } else {
            $(this).addClass('on');
        }
    });
}
var weatherUI = {
    
    checkObj : function(obj){
        return $(obj).length == 0 ? false : true;
    },    
    slickMainTab : function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        var width = $(window).width();
        var _obj = $(obj);
        _obj.slick({
            dots: false,
            arrows: false,
            infinite: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            speed: 0,
            swipe: false, //width < 1100
            adaptiveHeight: true,
            accessibility: false
        });

        _obj.on('beforeChange', function(event, slick, currentSlide, nextSlide) {
            if(!$(event.target).hasClass('maintab-wrap')) return;
            var slideCount = slick.slideCount;
            var tabIndex = 0;
            if(slideCount == 3) {
                // eqk
                switch(nextSlide) {
                    case 0:
                        tabIndex = 3;
                        break;
                    case 1:
                        tabIndex = 0;
                        break;
                    case 2:
                        tabIndex = 1;
                        break;
                }
            } else if (slideCount == 2) {
                // no eqk
                switch(nextSlide) {
                    case 0:
                        tabIndex = 0;
                        break;
                    case 1:
                        tabIndex = 1;
                        break;
                }
            } else {
                return;
            }
            
//            $('.maintab').find('button').removeClass('on');
//            $('.maintab').find('button').eq(nextSlide).addClass('on');
            //GlobalEvent.trigger($.Event("onMainTabSelected"), [tabIndex, this, nextSlide]);
        });
        return _obj;
    },
    // 
    resizeWin: function(){

        function event(){
            $(window).resize(function(){
                
                weatherUI.scrollCheck('[class*="scroll-js"]')
                weatherUI.scrollCheck('[class*="rolling-js"]')
                // location.reload();
                weatherUI.headerFix();
                selectT = 0;
                for (var i = 0; i < selectLength; i++) {
                    selectT += navCon.eq(i).width();
                };
                $('.sub-nav').css('width',selectT)
                // SlideScroll.refresh()
                // onInit(swiperScr , swiperTabScr);
            })
        };

        event();
    },

    headerFix: function(){
        var win_W = $(window).width()
        if(win_W > 1101){
            contH = $('.right-content').height()
            $(window).scroll(function(){
                if((contH - $(window).height()) > $(window).scrollTop()){
                    $('.subp header').css({'position':'fixed' , 'top' : 0});
                    $('.mainp header').css('top',0);
                    $('.new-main header').css('top',0);
                }else{
                    var fixHeight = contH - $(window).height();
                    if(fixHeight < 0) fixHeight = 0;
                    $('.subp header').css({'top': fixHeight , 'position' : 'absolute'});
                    $('.mainp header').css('top',0);
                    $('.new-main header').css('top',0);
                };
            })
        }else{
            var $header = $('header');
            $header.css('top', 0);
            // 모바일은 기상+가 없어서 날씨 메뉴로.
            //$header.find('.wplus-menu').hide();
            //$header.find('.left-menu').removeClass('wplus').find('.wnuri-menu').show();
        }
    },
    scrollCheck: function(obj){

        if(!weatherUI.checkObj(obj)){
            return;
        }
        
        var scroll = null;


        function init(obj){
            scroll = $(obj)
        }

        
        function event(){
            scroll.each(function(){
                if($(this).find(' .iScrollIndicator').css('display') == 'none'){
                    $(this).find(' .iScrollIndicator').parent().hide();
                }else{
                    $(this).find(' .iScrollIndicator').parent().show();
                };
            });
            
        };

        init(obj);
        event();
    },

    menuOpen: function(obj , com){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var menuOpenBtn = null;
        var menuOpenBtnClose = null;
        var win_w = 0;
        
        function init(obj){
            menuOpenBtn = $(obj);
            menuOpenBtnClose = $(com);
            win_w = $(window).width();
            $(window).resize(function(){
                win_w = $(window).width();
                if(win_w > 1080){
                    $('header').show();
                }else if(win_w <= 1080){
                    if(!$('header').hasClass('on')){
                        $('header').hide()
                    }
                    
                }
            })
        };

        function event(){
            menuOpenBtn.on('click',function(){
                weatherUI.dimdOn()
                $('.pw-dimmed').fadeIn(500)
                $('body').addClass("hidd");
                $('header').stop().fadeIn(100).animate({'right':0}).addClass('on');
                // $('header *').addClass('on-area');

                return false
            });


            function closeMenu(){
                $('.pw-dimmed').fadeOut(300)
                $('body').removeClass("hidd");
                setTimeout(function(){
                    weatherUI.dimdOff();
                },300)
                $('header').stop().animate({'right':-100 + "%"}).fadeOut(100).removeClass('on');
                
            }

            menuOpenBtnClose.off("click.close").on("click.close", closeMenu);

            
                $(document).click(function(e){
                    if($('.header').hasClass('on')){
                        if($(e.target).parents('header').length == 1 || win_w >= 1100){
                            if($(e.target.parentElement).hasClass('link') || $(e.target).hasClass('link')){
                            }else{return false;}
                        } ;
                        closeMenu();
                    }
                });
            
            
            
        };

        init(obj);
        event();
    },
    popOpen: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var popOpenBtn = null;
        
        
        function init(obj){
            popOpenBtn = $(obj);
        };

        function event(){
            popOpenBtn.on('click',function(e){
            	e.preventDefault();
                popData = $(this).attr("data-pop-name");
                var $pops = $('[class*="modal-pop"][data-pop=' + popData + ']');
                $pops.fadeIn().addClass('popcont-open').each(function(){
                    
                    if($(this).find('.roll-wrap').height() <= $(this).find('.buoy-table-con').height()){
                        $(this).find('.iScrollLoneScrollbar').hide();
                    };
                }).find('.slick-wrapper').slick('setPosition');
                $('body').addClass("hidd");
                weatherUI.dimdOn();
                $('.pw-dimmed').fadeIn(500);
                weatherUI.scrollY('.rolling-js4');
                weatherUI.scrollY('.rolling-js5');
                weatherUI.scrollY('.rolling-js6');
                var srcEle = this;
                $pops.each(function(){
                    if($(this).find('.roll-wrap').height() <= $(this).find('.buoy-table-con').height()){
                        $(this).find('.iScrollLoneScrollbar').hide();
                    };
                });
                $pops.find('button.pop-close').first().focus().on('click', function() {
                    srcEle.focus();
                });
                $('.pw-dimmed').on('click',function(){
                    $('.popcont-open').fadeOut(300).removeClass('.popcont-open');
                    $('.pw-dimmed').fadeOut(300);
                    $('body').removeClass("hidd");
                    setTimeout(function(){
                        weatherUI.dimdOff();
                    });
                })
            });
        };

        init(obj);
        event();
    },
    popClose: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var popCloseBtn = null;
        
        
        function init(obj){
            popCloseBtn = $(obj);
        };

        function event(){
            popCloseBtn.on('click',function(e){
            	e.preventDefault();
                $(this).parent().hide();
                $('body').removeClass("hidd");
                $('.pw-dimmed').fadeOut(300)
                setTimeout(function(){
                    weatherUI.dimdOff();
                });    
            })
            
        };

        init(obj);
        event();
    },
    popCloseBanner: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var popCloseBtn = null;
        
        
        function init(obj){
            popCloseBtn = $(obj);
        };

        function event(){
            popCloseBtn.on('click',function(e){
            	e.preventDefault();
                $(this).parents('.m-banner-wrap').hide();
            })
        };

        init(obj);
        event();
    },
    /* Accordion */
    accordion: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var accordionBtn = null;
        
        function init(obj){
            accordionBtn = $(obj);
            accordionBtn.each(function(){
                if($(this).hasClass('on')){
                    $(this).attr("title","펼쳐짐");
                }else{
                    $(this).attr("title","접힘");
                }
            });
        };

        function event(){
            accordionBtn.unbind('click');
            accordionBtn.on('click',function(e){
                _this = $(this);
                if(!$(this).hasClass('on')){
                    $(this).parents('.accordion-wrap').find('.accordion-tit').removeClass('on').next('.accordion-con').stop(true).slideUp(100);
                    $(this).addClass('on').next('.accordion-con').stop(true).slideDown(100);
                    $(this).attr("title","펼쳐짐").parent().addClass('on');
                    setTimeout(function(){
                        _this.next('.accordion-con').each(function(){
                            if($(this).find('.swiper-slide').height() <= $(this).find('.text-area').height()){
                                
                                $(this).find('.iScrollIndicator').parent().hide();
                            };
                        });
                        
                    },110)
                }else{
                    $(this).removeClass('on').next('.accordion-con').stop(true).slideUp(100);
                    $(this).attr("title","접힘").parent().removeClass('on');;
                };
                
            });
        };

        init(obj);
        event();
    },
    /* Accordion */
    accordionSecond: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var accordionwrap = null;
        var accordionBtn = null;
        var accordioncon = null;
        
        function init(obj){
            accordionwrap = $(obj);
            accordionBtn = accordionwrap.find('.accordionsecond-tit');
            accordioncon = accordionwrap.find('.accordionsecond-con');
            accordionBtn.each(function(){
                if($(this).hasClass('on')){
                    $(this).attr("title","펼쳐짐");
                }else{
                    $(this).attr("title","접힘");
                }
            });
        };
        

        function event(){
            function resetevent(){
                if(accordioncon.parents('#wnuri-menu').length > 0) return;
                accordioncon.slideUp(100)
                accordionBtn.removeClass('on').attr("title",'접힘');
            }
            $(document).click(function(e){ //문서 body를 클릭했을때
                if($(e.target).hasClass('accordionsecond-tit')){
                    if($(e.target).parents('.acco-on').length <= 1){
                        $(e.target).closest('.accordionsecond-wrap').find('.accordionsecond-tit.on').not(e.target).removeClass('on').attr("title",'접힘').parent().removeClass('acco-on').find(accordioncon).slideUp(100);
                    };
                    return false;
                } else if(!$(e.target).parents('.acco-on').length < 1){
                    if(!$(e.target.parentElement).hasClass('link') 
                            && !$(e.target).hasClass('link')
                            && !$(e.target.parentElement).hasClass('open-link') 
                            && !$(e.target).hasClass('open-link')) {
                        return false;
                    }
                } else {
                    resetevent();
                }
            });
            accordionBtn.on('click',function(e){
                e.preventDefault();
                if(!$(this).hasClass('on')){
                    $(this).addClass('on').attr("title","펼쳐짐");
                    $(this).parent().siblings().removeClass('acco-on').find(accordioncon).slideUp(100)
                    $(this).parent().siblings().find(accordionBtn).removeClass('on').attr("title",'접힘');
                    $(this).parent().addClass('acco-on');
                    $(this).next(accordioncon).stop().slideDown(100);
                }else{
                    $(this).removeClass('on').attr("title",'접힘');
                    $(this).parent().removeClass('acco-on');
                    $(this).parent().find(accordioncon).slideUp(100);
                }
            });
        };

        init(obj);
        event();
    },
    // selectOption
    selectOption: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var selectwrap = null;
        var selectBtn = null;
        var selectCon = null;
        var txtData = null;
        var selectT = 0;
        
        function init(obj){
            selectwrap = $(obj);
            selectBtn = selectwrap.find('.select-btn');
            selectCon = selectwrap.find('.select-con');
            navCon = $('.sub-nav li')
            selectLength =navCon.length
            
            for (var i = 0; i < selectLength; i++) {
                selectT += navCon.eq(i).width();
            };
            $('.sub-nav').css('width',selectT + 4)
        };
        

        function event(){
            selectBtn.on('click', function(e){
                var isJavascriptLink = this.href && this.href.length > 11 && this.href.substring(0,11) == 'javascript:';
                $(this).parents('.accordionsecond-con').slideUp(100);
                if(isJavascriptLink) {
                    $(this).parents(selectCon).siblings('.accordionsecond-tit').removeClass('on').parents('.acco-on').removeClass('.acco-on');
                    return;
                }
                
                txtData = $(this).html();
                $(this).parents(selectCon).siblings('.accordionsecond-tit').html(txtData).removeClass('on').parents('.acco-on').removeClass('.acco-on');
                
                if($(this).parents('.selectoption').hasClass('sub-nav')){
                    selectT = 0;
                    for (var i = 0; i < selectLength; i++) {
                        selectT += navCon.eq(i).width();
                    };
                    $('.sub-nav').css('width',selectT + 4)
                }
            });
        };

        init(obj);
        event();
    },
    /* 추천콘텐츠 */
    recomSlide : function(obj){

        if(!weatherUI.checkObj(obj)){
            return;
        }

        var recomBtn = null;
        var recomCloseBtn = null;
        
        function init(obj){
            recomBtn = $(obj).find('.recom-cont-btn');
            recomBtn.attr("title","접힘");
            recomCloseBtn = $(obj).find('.js-close');
        };

        function event(){
            recomBtn.on('click',function(){
                if(!$(this).parent().hasClass('on')){
                    $(this).attr("title","펼쳐짐").parent().addClass('on');
                    $('.slick-type-change').slick('setPosition');
                }else{
                    $(this).attr("title","접힘").parent().removeClass('on');
                    $('.slick-type-change').slick('init');
                }
            });
            recomCloseBtn.on('click',function(){
                $(this).parents('.recom-cont-wrap').removeClass('on').find('.recom-cont-btn').attr("title","접힘")
            });
        };

        init(obj);
        event();
    },
    /* Tab */
    tab: function(obj, con, scrolly_base){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        var tab = null
        var    tabContent = null;
        var    b_dClass = null;

        function init(obj, con){
            tab = $(obj).find('> div > button'); 
            tabContent = $(con + ' > [class*="tab-cont0"]');
        };

        function event(obj){
            tab.on('click', function(e){
                e.preventDefault();
                var i = $(this).parent().index();
                console.log(i);
                tabMenu(i);
            });
        };

        function tabMenu(index){
            
            tab.parent('div').children('button').removeClass('on').removeAttr('title');
            tab.eq(index).parent('div').children('button').addClass('on').attr('title',"선택됨");
            tabContent.removeClass('on');
            tabContent.eq(index).addClass('on')
            tabContent.eq(index).find('.slick-wrapper').slick('setPosition');
            tabContent.eq(index).find('.slick-wrapper').slick('slickGoTo', 0  , true);
            weatherUI.scrollY('.scroll-js');
            weatherUI.scrollY('.scroll-js2');
            weatherUI.scrollY('.scroll-js3');
            weatherUI.scrollY('.scroll-js4');
            weatherUI.scrollY('.rolling-js3');
            if(scrolly_base) {
                weatherUI.scrollY(scrolly_base + "_" + index);
            }
            tabContent.eq(index).each(function(){
                if($(this).find('.swiper-slide').height() <= $(this).find('.text-area').height()){
                    $(this).find('.iScrollIndicator').parent().hide();
                };
            });
            if(tabContent.eq(index).find('.weather-info-list').length >= 1){
                if(SlideScroll)SlideScroll.refresh();
            }
            
            //weatherUI.scrollSlide('.weather-info-list' , '.swiper-pagination');
            
        };

        init(obj, con);
        event();
    },
    /* Tab */
    tabA: function(obj, con, scrolly_base){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        var tab = null
        var    tabContent = null;
        var    b_dClass = null;

        function init(obj, con){
            tab = $(obj).find('> div > a'); 
            tabContent = $(con + ' > [class*="tab-cont0"]');
        };

        function event(obj){
            tab.on('click', function(e){
                e.preventDefault();
                var i = $(this).parent().index();
                console.log(i);
                tabMenu(i);
            });
        };

        function tabMenu(index){
            
            tab.parent('div').children('a').removeClass('on').removeAttr('title');
            tab.eq(index).parent('div').children('a').addClass('on').attr('title',"선택됨");
            tabContent.removeClass('on');
            tabContent.eq(index).addClass('on')
            tabContent.eq(index).find('.slick-wrapper').slick('setPosition');
            tabContent.eq(index).find('.slick-wrapper').slick('slickGoTo', 0  , true);
        
        };

        init(obj, con);
        event();
    },
    /* maptab */
    mapTab: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
 
        var tab = null;
        var close = null;

        function init(obj){
            tab = $(obj).find('.imgtab-btn')
            close = $('.prev-btn-js')
        };

        function event(){
            tab.on('mouseover focus', function(){
                var i = $(this).attr('data-imgtab')
                     $('.img-area1 img').attr('src', window.appBase + 'resources/image/level01_'+ i +'.png')
                })
                .mouseout(function(){
                    $('.img-area1 img').attr('src', window.appBase + 'resources/image/level01_'+ 1 +'.png')
                });

            tab.on('click', function(e){
                e.preventDefault();
                var i = $(this).attr('data-imgtab')
                tabMenu(i);
            });
            close.on('click', function(e){
                e.preventDefault();
                $('[class*="img-area"').hide()
                $('.img-area1').show()    
            });

        };

        function tabMenu(index){
            $('[class*="img-area"').hide()
            $('.img-area' + index).show()
        };

        init(obj);
        event();
    },
    /* mainTab */
    mainTab: function(obj, con){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
 
        var tab = null
        var    tabContent = null;
        var    b_dClass = null;

        function init(obj, con){
            tab = $(obj).find('> div > button');
            tabContent = $(con + ' > [class*="tab-cont0"]');
        };
        
        function event(obj){
            tab.unbind('click');
            tab.on('click', function(e){
                e.preventDefault();
                var mainPage = parseInt($(this).attr('data-main'));
                if(!$(this).hasClass("on")) {
                    var slideIndex = 0;
                    var tabSize = tab.length;
                    //console.log("tabSize", tabSize, "mainPage", mainPage);
                    var subTab = parseInt($(this).attr('data-sub-tab'));
                    var submenu = 0;
                    var isMobile = mobilecheck();
                    var isWinter = window.winterEnabled;
                    var extraButtons = window.forestfireEnabled?1:0;
                    
                    if(window.typhoonEnabled) extraButtons ++;
                    if(window.marineAccidentEnabled) extraButtons ++;
                    var defaultTabSize = (isWinter?(isMobile?4:5):3) + extraButtons;
                    var eqkEnabledTabSize = defaultTabSize+1;
                    var eqkDisabledTabSize = defaultTabSize;
                    if(tabSize == eqkEnabledTabSize) {
                        // eqk
                        switch(mainPage) {
                            case 1:
                                //지도
                                slideIndex = 1;
                                submenu = subTab - 1;
                                break;
                            case 2:
                                //날씨
                                slideIndex = 2;
                                break;
                            case 3:
                                //산불 버튼
                                slideIndex = -1;
                                break;
                            case 4:
                                // 지진
                                slideIndex = 0;
                                break;
                            case 5:
                                //해양사고 버튼
                                slideIndex = -1;
                                break;
                            case 6:
                                // 태풍
                                slideIndex = 5;
                                break;
                        }
                    } else if(tabSize == eqkDisabledTabSize) {
                        // no eqk
                        switch(mainPage) {
                            case 1:
                                //지도
                                slideIndex = 0;
                                submenu = subTab - 1;
                                break;
                            case 2:
                                //날씨
                                slideIndex = 1;
                                break;
                            case 3:
                                //산불 버튼
                                slideIndex = -1;
                                break;
                            case 5:
                                //해양사고 버튼
                                slideIndex = -1;
                                break;
                            case 6:
                                // 태풍
                                slideIndex = 4;
                                break;
                        }
                    } else {
                        return;
                    }
                    changeSlickSlide(slideIndex, mainPage, submenu);
                }
                // 기타 버튼 예외처리
                if(mainPage != 3 || mainPage != 5) {
                    tab.parent('div').children('button').removeClass('on').removeAttr('title');
                    $(this).addClass('on').attr('title',"선택됨");
                    $('.container').removeClass().addClass('container')
                    $('.container').addClass('on-bg0' + mainPage);
                }
            });
        };
        function changeSlickSlide(index, dataMain, submenu) {
            // 슬라이드가 없는 탭은  예외
            if(index != -1) {
                $('.maintab-wrap').slick('slickGoTo', index, false);
            }
            GlobalEvent.trigger($.Event("onMainTabSelected"), [parseInt(dataMain)-1, this, submenu]);
        };
        function tabMenu(num){
            tabContent.removeClass('on');
            $('.maintab-wrap > .tab-cont0' + num).addClass('on');
            try{ $('.maintab-wrap > .tab-cont0' + num).find('.slick-wrapper').slick('setPosition'); }catch(e) {}
            try{ $('.maintab-wrap > .tab-cont0' + num).find('.slick-wrapper').slick('slickGoTo', 0  , true); }catch(e) {}
            $('.maintab-wrap > .tab-cont01').find('.pagenum-wrap .now').html('1');
            GlobalEvent.trigger($.Event("onMainTabSelected"), [num-1, this]);
            
            if(num == 1) {
                
            } else if(num == 2) {
                
            } else if(num == 3) {
                
            } else {
                weatherUI.scrollY('.scroll-js');
                weatherUI.scrollY('.scroll-js2');
                weatherUI.scrollY('.scroll-js3');
                weatherUI.scrollY('.scroll-js4');
                weatherUI.scrollY('.rolling-js3');
            }
            
            $('.maintab-wrap > .tab-cont0' + num).each(function(){
                if($(this).find('.swiper-slide').height() <= $(this).find('.text-area').height()){
                    $(this).find('.iScrollIndicator').parent().hide();
                };
            });
            if($('body').find('.weather-info-list').length >= 1){
                if(typeof SlideScroll != "undefined") SlideScroll.refresh();
            }
            
            // weatherUI.scrollSlide('.weather-info-list' , '.swiper-pagination');
            
        };

        init(obj, con);
        event();
    },
    /* movieChkToggle */
    movieChkToggle: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
 
        var toggleChk = null;

        function init(obj){
            toggleChk = $(obj);
        };

        function event(){
            toggleChk.on('change', function(){
                if($(this).prop('checked')){
                    $(this).parents('.cont-wrap').find('.move-wrap').addClass('off').find('.move-control-area').attr('aria-hidden', true)
                }else{
                    $(this).parents('.cont-wrap').find('.move-wrap').removeClass('off').find('.move-control-area').removeAttr('aria-hidden')
                }
                
            });
        };

        init(obj);
        event();
    },
    /* 일반 토글 */
    groupChkToggle: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
 
        var toggleChk = null;

        function init(obj){
            toggleChk = $(obj);
        };

        function event(){
            toggleChk.on('change', function(e){
                var targetId = $(this).attr('data-target');
                if($(this).prop('checked')){
                    $('#' + targetId).addClass('group-toggle-off').attr('aria-hidden', true);
                }else{
                    $('#' + targetId).removeClass('group-toggle-off').removeAttr('aria-hidden');
                }
                
            });
        };

        init(obj);
        event();
    },
    /* mainChkToggle */
    mainChkToggle: function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
 
        var toggleChk = null;

        function init(obj){
            toggleChk = $(obj);
        };

        function event(){
            toggleChk.on('change', function(){
                
                if($(this).prop('checked')){
                    $(this).parents('.map-cont-wrap').addClass('on')
                }else{
                    $(this).parents('.map-cont-wrap').removeClass('on')
                }
                
            });
        };

        init(obj);
        event();
    },
    /* 스와이퍼 */
    slickChange : function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        $(obj).slick({
            dots: false,
            arrows: true,
            infinite: false,
            accessibility: false,
            speed: 300,
            slidesToShow: 11,
            slidesToScroll: 11,
            responsive: [ 
                { breakpoint: 1024, settings: { slidesToShow: 11, slidesToScroll: 11 } },
                { breakpoint: 770, settings: { slidesToShow: 6, slidesToScroll: 6 } }, 
                { breakpoint: 480, settings: { slidesToShow: 5, slidesToScroll: 5 } }
              // You can unslick at a given breakpoint now by adding:
              // settings: "unslick"
              // instead of a settings object
            ]
          });
    },
    slickChange2 : function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        var _obj = $(obj);
        if(_obj.hasClass("slicked")) {
            _obj.slick("reinit");
        } else {
            _obj.slick({
                dots: false,
                arrows: false,
                infinite: false,
                accessibility: false,
                centerPadding: '15px',
                 speed: 300,
                slidesToShow: 4,
                slidesToScroll: 4,
                responsive: [
                    { breakpoint: 1424, settings: { slidesToShow: 3, slidesToScroll: 3 } },
                    { breakpoint: 1024, settings: { slidesToShow: 3, arrows: true, slidesToScroll: 3 } },
                    { breakpoint: 770, settings: { slidesToShow: 2, arrows: true, slidesToScroll: 2 } }, 
                    { breakpoint: 480, settings: { slidesToShow: 1, arrows: true, slidesToScroll: 1 } }
                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                ]
              });
            _obj.addClass("slicked");
        }
        return _obj;
    },
    slickChange3 : function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        slideObj = $(obj + ' .weather-item').length;
        var isExt = $(obj).hasClass('vshort-ext');
        var breakpoints = [
            { breakpoint: 1500, settings: { slidesToShow: 7, slidesToScroll: 7, arrows: true } },
            { breakpoint: 1300, settings: { slidesToShow: 6, slidesToScroll: 6, arrows: true } },
            { breakpoint: 1115, settings: { slidesToShow: 5, slidesToScroll: 5, arrows: true } },
            { breakpoint: 630, settings: { slidesToShow: 4, slidesToScroll: 4 } }, 
            { breakpoint: 410, settings: { slidesToShow: 3, slidesToScroll: 3 } }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ];
        if(isExt) breakpoints.unshift({ breakpoint: 3000, settings: { slidesToShow: 9, slidesToScroll: 9, arrows: true } }); 
        var _obj = $(obj).slick({
            dots: false,
            arrows: true,
            infinite: false,
             speed: 300,
             accessibility: false,
            slidesToShow: slideObj,
            slidesToScroll: slideObj,
            responsive: breakpoints
        });
        return _obj;
    
    },
    
    slickChange4 : function(obj){
        
        if(!weatherUI.checkObj(obj)){
            return;
        }
        slideObj = $(obj + ' .weather-item').length;
        var isExt = $(obj).hasClass('vshort-ext');
        var breakpoints = [
                { breakpoint: 1500, settings: { slidesToShow: 6, slidesToScroll: 6, arrows: isExt } },
                { breakpoint: 1300, settings: { slidesToShow: 5, slidesToScroll: 5, arrows: isExt } },
                { breakpoint: 1115, settings: { slidesToShow: 4, slidesToScroll: 4, arrows: isExt } },
                { breakpoint: 530, settings: { slidesToShow: 3, slidesToScroll: 3, arrows: true } }, 
                { breakpoint: 410, settings: { slidesToShow: 2, slidesToScroll: 2, arrows: true } }
              // You can unslick at a given breakpoint now by adding:
              // settings: "unslick"
              // instead of a settings object
            ];
        var _obj = $(obj).slick({
            dots: false,
            arrows: isExt,
            infinite: false,
             speed: 300,
             accessibility: false,
            slidesToShow: slideObj,
            slidesToScroll: slideObj,
            slidesToShow: 4, 
            slidesToScroll: 4,
            responsive: breakpoints
        });
        return _obj;
    
    },
    slickNumTab : function(obj){
        if(!weatherUI.checkObj(obj)){
            return;
        }
        var _obj = $(obj);
        if(_obj.hasClass("slicked")) {
            _obj.slick("reinit");
        } else {
            _obj.slick({
                dots: true,
                arrows: false,
                accessibility: false,
                infinite: false,
                speed: 300
            });
            _obj.addClass("slicked");
        }
        return _obj;
    },
    slickAroNonLoop: function(obj){
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var currentId = 1,
        totalPage = $(obj + ' .slide-item').length,
        agreeBtn = $(obj).parents('.map-cont-left').find('.pagenum-wrap');
        
        $(obj).slick({
            arrows: true,
            dots: false,
            accessibility: false,
            infinite: false,
            speed: 300,
            slidesToShoe: 1
        })

        if(totalPage <= 1){
            agreeBtn.hide();
        };

        agreeBtn.find('.total').html(totalPage);
        agreeBtn.find('.now').html(currentId);
        
        function slickMove(){
            currentId = $(obj).slick('slickCurrentSlide');
            agreeBtn.find('.now').html(currentId + 1);
            // if(currentId + 1 == totalPage){
            //     setTimeout(function(){
            //         agreeBtn.attr('data-index','last');
            //     },500);
            // }else if(currentId + 1 < totalPage){
            //     agreeBtn.removeAttr('data-index','last');
            // }
        }

        $(obj).on('swipe', function(event, slick, direction) {
            slickMove();
        });
        $('.slick-arrow').on('click', function(event, slick, direction) {
            slickMove();
        });
    },
    slickBanner: function(obj , tab){
        if(!weatherUI.checkObj(obj)){
            return;
        }

        var $swipeTabs = $(tab).find('button'),
            currentIndex = 0,
            activeTabClassName = 'on';

        $(tab).on('init', function(event, slick) {
            currentIndex = slick.getCurrent();
            $swipeTabs.removeClass(activeTabClassName).attr('title', '');
            $('.intro-btn-wrap button[data-slick-index=' + currentIndex + ']').addClass(activeTabClassName).attr('title', '선택됨');
        });
        
        
        $(obj).slick({
            arrows: true,
            dots: false,
            accessibility: false,
            infinite: false,
            speed: 300,
            // adaptiveHeight: true
        })

        $swipeTabs.on('click', function(event){
            currentIndex = $(this).data('slick-index');
            $swipeTabs.removeClass(activeTabClassName).attr('title', '');
            $('.intro-btn-wrap button[data-slick-index=' + currentIndex +']').addClass(activeTabClassName).attr('title', '선택됨');
            // $swipeTabsContainer.slick('slickGoTo', currentIndex);
             $(obj).slick('slickGoTo', currentIndex);
             
        });
        $('.slick-arrow').on('click', function(event, slick, direction) {
            currentIndex = $(obj).slick('slickCurrentSlide');
            $swipeTabs.removeClass(activeTabClassName).attr('title', '');
            $('.intro-btn-wrap button[data-slick-index=' + currentIndex + ']').addClass(activeTabClassName).attr('title', '선택됨');
        })
        $(obj).on('swipe', function(event, slick, direction) {
            currentIndex = $(this).slick('slickCurrentSlide');
            $swipeTabs.removeClass(activeTabClassName).attr('title', '');
            $('.intro-btn-wrap button[data-slick-index=' + currentIndex + ']').addClass(activeTabClassName).attr('title', '선택됨');
        
        });
    },
    scrollX : function(obj){
        if(!weatherUI.checkObj(obj)){
            return;
        };
// scrollYscroll-js
    },
    scrollY : function(obj){
        if(!weatherUI.checkObj(obj)){
            return;
        };
        // iscroll 이 키보드 운용이 안됨.
        return;
        
        ScrollY = new IScroll(obj, { keyBindings:true, scrollX: false, scrollY: true, mouseWheel: true, preventDefault: window.mobilecheck(), scrollbars: 'custom', resizePolling : 40, interactiveScrollbars: true});

    },
    scrollSlide : function(obj, com){
        
        if(!weatherUI.checkObj(obj)){
            return;
        };
        
        var scrollWrap = null;
        var scrollArea = null;
        var scroll = null;
        var scrollBtn = null;
        var dataslide = [];
        var scrollT = 0;
        var slideWDate = [];
        var tempChart = null;
        
        function init(obj){
            scrollWrap = $(obj);
            scrollArea = scrollWrap.find('.swiper-wrapper');
            scroll = scrollArea.find('.swiper-slide');
            scrollLength = scroll.length;
        }

        function init(obj, com){
            scrollWrap = $(obj);
            scrollArea = scrollWrap.find('.swiper-wrapper');
            scroll = scrollArea.find('.swiper-slide');
            scrollLength = scroll.length;
            scrollBtn = $(com);
            tempChart = scrollArea.find('.dong-forecast-temp-chart');
            midTmxChart = scrollArea.find('.midterm-tmx-chart');
        };
        function change(){
            winW = $(window).width();
            scroll.each(function(idx){
                if(winW > 1100){
                    if(idx == 0){
                        slideWDate[idx] = ($(this).find('.ul-item05 > li').length * 66) + 30;
                        $(this).css('width', slideWDate[idx])
                        var tempCount = parseInt(scrollArea.attr('data-temp-count'));
                        if(tempChart.parent().hasClass("shrndate")) {
                            tempChart.css('width', (tempCount-1)*66 + 62);    
                        } else {
                            tempChart.css('width', (tempCount-1)*66 + 65);
                        }
                        
                        if(window.dongForecastTempChart) window.dongForecastTempChart.reflow();
                    }else if(idx == 1){
                        slideWDate[idx] = 1200
                        $(this).css('width', slideWDate[idx])
                        midTmxChart.css('width', 1080);
                        midTmxChart.css('height', 235);
                    }else{
                        slideWDate[idx] = $(this).find('.ul-item05 > li').length * 66;
                        $(this).css('width', slideWDate[idx])
                    }
                }else if(winW <= 1100){
                    if(idx == 0){
                        var itemLen = $(this).find('.ul-item05 > li').length;
                        slideWDate[idx] = (itemLen * 40) + 47;
                        $(this).css('width', slideWDate[idx])
                        var tempCount = parseInt(scrollArea.attr('data-temp-count'));
                        if(tempChart.parent().hasClass("shrndate")) {
                            tempChart.css('width', (tempCount)*40 - 3);    
                        } else {
                            tempChart.css('width', (tempCount)*40 - 3);
                        }
                        
                        if(window.dongForecastTempChart) window.dongForecastTempChart.reflow();
                    }else if(idx == 1){
                        slideWDate[idx] = winW;
                        $(this).css('width', slideWDate[idx])
                        midTmxChart.css('width', slideWDate[idx] - 85);
                        midTmxChart.css('height', 250);
                        if(window.midtermTmxChart) window.midtermTmxChart.reflow();
                    }else{
                        slideWDate[idx] = $(this).find('.ul-item05 > li').length * 55;
                        $(this).css('width', slideWDate[idx])
                    }
                }
                $(this).data('width',slideWDate[idx]);
            });
        

            for (var i = 0; i < scrollLength; i++) {
                scrollT += scroll.eq(i).data('width');
            };
            var slideIndex = 0;
            var tomMarks = scrollArea.find('.tom-mark');
            var tomMarksLength = 0;
            dataslide[slideIndex++] = 0;
            if(winW > 1100) {
                $.each(tomMarks, function(index, item) {
                    dataslide[slideIndex++] = scrollArea.offset().left - $(item).offset().left + 80;
                    tomMarksLength++;
                });    
            } else {
                $.each(tomMarks, function(index, item) {
                    dataslide[slideIndex++] = scrollArea.offset().left - $(item).offset().left + 64;
                    tomMarksLength++;
                });
            }
            
            
            if(winW  > 1100){
                scrollArea.css('width',scrollT + 70);
                dataslide[slideIndex] = dataslide[slideIndex-1] - 556;
            }else if(winW <= 1100){
                scrollArea.css('width',scrollT + 55);
                dataslide[slideIndex] = dataslide[slideIndex-1] - 400;
            };
            scrollT = 0;

        }

        function resize(){
            $(window).resize(function(){
                change();
            });
        }

        function event(){
            SlideScroll = new IScroll(obj, { scrollX: true, scrollY: false, mouseWheel: true, scrollbars: 'custom', resizePolling : 40, probeType : 3, interactiveScrollbars: true});
            winW = $(window).width();
            scrollBtn.find('.swiper-pagination-bullet').on('click keydown', function(e){
                if(e.keyCode && e.keyCode != 13){
                        return;
                    }
                dataInx = $(this).index();
                scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                $(this).addClass('swiper-pagination-bullet-active');
                if(winW > 1100) {
                    if(dataslide.length-1 == dataInx) {
                        SlideScroll.scrollTo(dataslide[dataInx]-172, 0, 500, IScroll.utils.ease.quadratic);    
                    } else if(dataInx == 0){
                        SlideScroll.scrollTo(dataslide[dataInx], 0, 500, IScroll.utils.ease.quadratic);    
                    } else {
                        SlideScroll.scrollTo(dataslide[dataInx]-66, 0, 500, IScroll.utils.ease.quadratic);    
                    }
                } else {
                    if(dataslide.length-1 == dataInx) {
                        SlideScroll.scrollTo(dataslide[dataInx]-89, 0, 500, IScroll.utils.ease.quadratic);    
                    } else if(dataInx == 0){
                        SlideScroll.scrollTo(dataslide[dataInx], 0, 500, IScroll.utils.ease.quadratic);    
                    } else {
                        SlideScroll.scrollTo(dataslide[dataInx]-62, 0, 500, IScroll.utils.ease.quadratic);
                    }
                }
                
            });
            var slideLength = dataslide.length;
            SlideScroll.on('scroll', function(){
                if(winW > 1100) {
                    if(slideLength > 1 && this.x > dataslide[1] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(0).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 2 && dataslide[2] && this.x > dataslide[2] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(1).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 3 && dataslide[3] && this.x > dataslide[3] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(2).addClass('swiper-pagination-bullet-active');
                    }else{
                        scrollWrap.parent().find('.title-label').hide();
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').last().addClass('swiper-pagination-bullet-active');
                    }
                } else {
                    if(slideLength > 1 && this.x > dataslide[1] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(0).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 2 && dataslide[2] && this.x > dataslide[2] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(1).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 3 && dataslide[3] && this.x > dataslide[3] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(2).addClass('swiper-pagination-bullet-active');
                    }else{
                        scrollWrap.parent().find('.title-label').hide()
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').last().addClass('swiper-pagination-bullet-active');
                    }    
                }
                
            });
            // SlideScroll.on('scrollEnd', updatePosition);
        };
        

        
        init(obj, com);
        resize();
        change();
        event();
        return scrollWrap;
    },
    scrollSlideExt : function(obj, com){
        
        if(!weatherUI.checkObj(obj)){
            return;
        };
        var scrollLength = 0;
        var scrollWrap = null;
        var scrollArea = null;
        var scroll = null;
        var scrollBtn = null;
        var dataslide = [];
        var scrollT = 0;
        var slideWDate = [];
        var tempChart = null;
        
        function init(obj){
            scrollWrap = $(obj);
            scrollArea = scrollWrap.find('.swiper-wrapper');
            scroll = scrollArea.find('.swiper-slide');
            scrollLength = scroll.length;
        }

        function init(obj, com){
            scrollWrap = $(obj);
            scrollArea = scrollWrap.find('.swiper-wrapper');
            scroll = scrollArea.find('.swiper-slide');
            scrollLength = scroll.length;
            scrollBtn = $(com);
            tempChart = scrollArea.find('.temp-chart-hr1');
            midTmxChart = scrollArea.find('.midterm-tmx-chart');
        };
        function change(){
            winW = $(window).width();
            var tempCount = parseInt(scrollArea.attr('data-temp-count'));
            scroll.each(function(idx){
                if(winW > 1100){
                    if(idx == 0){
                        slideWDate[idx] = ($(this).find('.ul-item05 > li').length * 67) + 30;
                        $(this).css('width', slideWDate[idx])
                        tempChart.css('width', (tempCount) * 67);
                        
                        if(window.dongForecastTempChart) window.dongForecastTempChart.reflow();
                    }else if(idx == 1){
                        slideWDate[idx] = ($(this).find('.chart-area > li.chart-item').length * 150);
                        $(this).css('width', slideWDate[idx]);
                        midTmxChart.css('width', slideWDate[idx] - 120);
                        midTmxChart.css('height', 235);
                    }else{
                        slideWDate[idx] = $(this).find('.ul-item05 > li').length * 67;
                        $(this).css('width', slideWDate[idx])
                    }
                }else if(winW <= 1100){
                    if(idx == 0){
                        var itemLen = $(this).find('.ul-item05 > li').length;
                        slideWDate[idx] = (itemLen * 40) + 47;
                        $(this).css('width', slideWDate[idx])
                        tempChart.css('width', (tempCount)*40);
                        
                        if(window.dongForecastTempChart) window.dongForecastTempChart.reflow();
                    }else if(idx == 1){
                        slideWDate[idx] = winW;
                        $(this).css('width', slideWDate[idx])
                        midTmxChart.css('width', slideWDate[idx] - 85);
                        midTmxChart.css('height', 250);
                        if(window.midtermTmxChart) window.midtermTmxChart.reflow();
                    }else{
                        slideWDate[idx] = $(this).find('.ul-item05 > li').length * 55;
                        $(this).css('width', slideWDate[idx])
                    }
                }
                $(this).data('width',slideWDate[idx]);
            });
        

            for (var i = 0; i < scrollLength; i++) {
                scrollT += scroll.eq(i).data('width');
            };
            var slideIndex = 0;
            var tomMarks = scrollArea.find('.tom-mark');
            var tomMarksLength = 0;
            dataslide[slideIndex++] = 0;
            if(winW > 1100) {
                $.each(tomMarks, function(index, item) {
                    dataslide[slideIndex++] = scrollArea.offset().left - $(item).offset().left + 80;
                    tomMarksLength++;
                });    
            } else {
                $.each(tomMarks, function(index, item) {
                    dataslide[slideIndex++] = scrollArea.offset().left - $(item).offset().left + 64;
                    tomMarksLength++;
                });
            }
            
            if(winW  > 1100){
                scrollArea.css('width',scrollT + 70);
                dataslide[slideIndex] = -scrollT + 1200;
            }else if(winW <= 1100){
                scrollArea.css('width',scrollT + 55);
                dataslide[slideIndex] = dataslide[slideIndex-1] - (24 * 40) - 56;
            };
            scrollT = 0;

        }

        function resize(){
            $(window).resize(function(){
                change();
            });
        }

        function event(){
            SlideScroll = new IScroll(obj, { scrollX: true, scrollY: false, mouseWheel: true, scrollbars: 'custom', resizePolling : 40, probeType : 3, interactiveScrollbars: true});
            winW = $(window).width();
            scrollBtn.find('.swiper-pagination-bullet').on('click keydown', function(e){
                if(e.keyCode && e.keyCode != 13){
                    return;
                }
                //dataInx = $(this).index();
                //if(dataslide.length == 5) dataInx++;
                dataInx = parseInt($(this).attr('data-day')) - 1;
                scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                $(this).addClass('swiper-pagination-bullet-active');
                if(winW > 1100) {
                    if(dataslide.length-1 == dataInx) {
                        SlideScroll.scrollTo(dataslide[dataInx]-172, 0, 500, IScroll.utils.ease.quadratic);    
                    } else if(dataInx == 0){
                        SlideScroll.scrollTo(dataslide[dataInx], 0, 500, IScroll.utils.ease.quadratic);    
                    } else {
                        SlideScroll.scrollTo(dataslide[dataInx]-66, 0, 500, IScroll.utils.ease.quadratic);    
                    }
                } else {
                    if(dataslide.length-1 == dataInx) {
                        SlideScroll.scrollTo(dataslide[dataInx]-89, 0, 500, IScroll.utils.ease.quadratic);    
                    } else if(dataInx == 0){
                        SlideScroll.scrollTo(dataslide[dataInx], 0, 500, IScroll.utils.ease.quadratic);    
                    } else {
                        SlideScroll.scrollTo(dataslide[dataInx]-62, 0, 500, IScroll.utils.ease.quadratic);
                    }
                }
                
            });
            var slideLength = dataslide.length;
            SlideScroll.on('scroll', function(){
                if(winW > 1100) {
                    if(slideLength > 1 && this.x > dataslide[1] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(0).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 2 && dataslide[2] && this.x > dataslide[2] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(1).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 3 && dataslide[3] && this.x > dataslide[3] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(2).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 4 && dataslide[4] && this.x > dataslide[4] - 65){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(3).addClass('swiper-pagination-bullet-active');
                    }else{
                        scrollWrap.parent().find('.title-label').hide();
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').last().addClass('swiper-pagination-bullet-active');
                    }
                } else {
                    if(slideLength > 1 && this.x > dataslide[1] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(0).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 2 && dataslide[2] && this.x > dataslide[2] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(1).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 3 && dataslide[3] && this.x > dataslide[3] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(2).addClass('swiper-pagination-bullet-active');
                    }else if(slideLength > 4 && dataslide[4] && this.x > dataslide[4] - 61){
                        scrollWrap.parent().find('.title-label').fadeIn(500);
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').eq(3).addClass('swiper-pagination-bullet-active');
                    }else{
                        scrollWrap.parent().find('.title-label').hide()
                        scrollBtn.find('.swiper-pagination-bullet').removeClass('swiper-pagination-bullet-active');
                        scrollBtn.find('.swiper-pagination-bullet').last().addClass('swiper-pagination-bullet-active');
                    }
                }
            });
            // SlideScroll.on('scrollEnd', updatePosition);
        };
        
        init(obj, com);
        resize();
        change();
        event();

        return scrollWrap;
    },
    /* Dimmed */
    dimdOn: function(){
        if($('.pw-dimmed').length == 0) {
            $('body').append("<div class='pw-dimmed' aria-hidden='true'></div>");    
        }
    },
    dimdOff: function(){
        $(".pw-dimmed").remove();
    }
    
};
















