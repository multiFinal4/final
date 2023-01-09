/**
 * 단기예보 (/weather/forecast/short-term)
 *
 * 날씨누리 홈페이지 (url: /)
 */
'use strict';
(function($, window, document){
    var    version = "1.0",
        bookmarkDropdown = null,
        bookmarkSelectedLat = 37.493546, 
        bookmarkSelectedLon = 126.921654,
        bookmarkSelectedDong = "서울특별시 동작구 신대방제2동",
        bookmarkSelectedDongCode = "1159068000",
        wsUnit = "m/s",
        appPrefix = (window.appBase ? window.appBase : '/'),
        indexLocalSearchbox = null,
        popLocalSearchbox = null,
        myPointSlider = null,
        vmap = null,
        hashParam = null,
        $contentBody = $('#content-body'),
        ptrEnabled = true;
        
    if(appConfig.config && appConfig.config.unit && appConfig.config.unit.ws) {
        wsUnit = appConfig.config.unit.ws;
    }
    /* 화면 모드 셋팅 */
    var displayMode = (appConfig && appConfig.config && appConfig.config.displayMode) ? appConfig.config.displayMode : DISPLAY_MODE_DEFAULT;
    if(displayMode != DISPLAY_MODE_MAP) {
        displayMode = DISPLAY_MODE_DEFAULT;
    }
    
    /*
        해시 파라미터 읽기.
        형식 : #tab=vmap/subtab=1/lat=36.7/lon=126.2/zoom=7
    */
    if(window.location.hash) {
        try {
            var route = window.location.hash.substr(1);
            var routes = route.split('/');
            hashParam = {};
            for(var i in routes) {
                var kv = routes[i].split('=');
                if(kv[1]) hashParam[kv[0]] = kv[1];
            }
        }catch(e) {
            if(window.console) console.log(e);
            hashParam = null;
        }
    }
    initDefaultMode();
    
    function initDefaultMode() {
        createMyPointSlider();
        createSearchBox();
        createCurrentWarning();
        createBookmarks();
        createDefaultModeEvent();
        createGlobalEvent();
    }

    function createPTR(){
        var ptr = PullToRefresh.init({
            mainElement: '.cont-wrap',
            triggerElement: '.container',
            distThreshold: 80,
            distMax: 100,
            distReload: 70,
            distIgnore: 20,
            instructionsPullToRefresh: '당겨서 날씨를 새로고칩니다.',
            instructionsReleaseToRefresh: '놓으면 새로고칩니다.',
            instructionsRefreshing: '새로고칩니다.',
            refreshTimeout: 300,
            shouldPullToRefresh: function() {
                return !this.triggerElement.scrollTop // !window.scrollY 
                        && ptrEnabled 
                        && !$('#today-warning').hasClass('on')
                        && $('.cmp-main-tabs .tab-item').eq(0).hasClass('on');
            },
            onRefresh: function() {
                window.setTimeout(function() {
                    if(bookmarkDropdown) {
                        var bookmark = bookmarkDropdown.config.selectedBookmark;
                        if(bookmark) {
                            updateCurrentWeather(bookmark);
                            updateDigitalForecast(bookmark);
                        }
                    }
                },10);
            }
        });
    }
    
    function createMyPointSlider() {
        myPointSlider = new MyPointSlider('my-point-slider');
    }
    
    
    function createSearchBox() {
        indexLocalSearchbox = new DongSearchbox('index-local-search');
        var $popLocalSearch = $('.modal-layer.pop-local-search');
        $popLocalSearch.find('.modal-layer-close').on('click', function(e) {
            e.preventDefault();
            $popLocalSearch.removeClass('on');
        });
        $('a[data-role="pop-local-search"]').on('click', function(e) {
            e.preventDefault();
            if(!$popLocalSearch.hasClass('on')) $popLocalSearch.addClass('on');
            window.setTimeout( function() {
                $popLocalSearch.find('input').first().trigger('focus');
            },0);
        });
        $popLocalSearch.on('click', '.cmp-local-search-input > .pop-open', function(e) {
        	e.preventDefault();
        	$popLocalSearch.removeClass('on');
        });
        popLocalSearchbox = new DongSearchbox('pop-local-search');
    }
    function createCurrentWarning() {
        var todayWarning = new TodayWarning('today-warning');
    }
    function createBookmarks() {
        bookmarkDropdown = new BookmarkDropdown('index-bookmarks');
    }
    
    function createPopMyPointsEvent() {
        $('.cmp-pop-my-points .sym-close').click(function(e) {
            e.preventDefault();
            var $comp = $(this).parents('.cmp-pop-my-points');
            $comp.css({ marginTop: -$comp.height() + 'px' })
                .bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){ $(this).addClass('closed'); });
        });
    }
    
    function createDefaultModeEvent() {
        $contentBody.on('click', 'a[target="_blank"]', function(e) {
            e.preventDefault();
            openExternalPop(this.href);
        });
        $contentBody.on('click','a.pop10-toggle-btn', function(e) {
            e.preventDefault();
            var $vf = $contentBody.find('.vshort-forecast');
            if(bookmarkDropdown) {
                var bookmark = bookmarkDropdown.config.selectedBookmark;
                if(bookmark && bookmark.dong && bookmark.dong.code) {
                    var dongCode = bookmark.dong.code;  
                    if(!$vf.hasClass('on')) {
                        $vf.addClass('on');
                    }
                    updateVshortForecast(bookmark);
                }
            };
        });
        $contentBody.on('click','a.cmp-vshort-forecast-close', function(e) {
            e.preventDefault();
            var $vf = $contentBody.find('.vshort-forecast');
            $vf.removeClass('on');
        });
    }
    
    function updateDigitalForecast(bookmark) {
        showLoading('digital-forecast', true);
        requestDigitalForecast(bookmark.dong.code, wsUnit).then(
            function(html) {
                showLoading('digital-forecast', false);
                var isModeChart = $('.cmp-dfs-slider').hasClass('mode-chart');
                var isModeTable = $('.cmp-dfs-slider').hasClass('mode-table');
                var $dfWrapper = $('#digital-forecast');
                $dfWrapper.html(html);
                if(isModeChart) {
                    $dfWrapper.find('> .cmp-dfs-slider').addClass('mode-chart');
                    $.each($dfWrapper.find('.view-options a'), function(i,ele) {
                        var $opt = $(this);
                        if($opt.attr('data-value') == 'mode-chart') {
                            if(!$opt.hasClass('on')) $opt.addClass('on');
                        } else {
                            $opt.removeClass('on');
                        }
                    });        
                    $('.cmp-dfs-slider a.sym-btn[data-view]').removeClass('on');
                    $('.cmp-dfs-slider a.sym-btn[data-view="mode-chart"]').addClass('on');
                } else if(isModeTable) {
                    $dfWrapper.find('> .cmp-dfs-slider').addClass('mode-table');
                    $.each($dfWrapper.find('.view-options a'), function(i,ele) {
                        var $opt = $(this);
                        if($opt.attr('data-value') == 'mode-table') {
                            if(!$opt.hasClass('on')) $opt.addClass('on');
                        } else {
                            $opt.removeClass('on');
                        }
                    });
                    $('.cmp-dfs-slider a.sym-btn[data-view]').removeClass('on');
                    $('.cmp-dfs-slider a.sym-btn[data-view="mode-table"]').addClass('on');
                }
                window.setTimeout(function () {
                    createDfsSlider();
                }, 0);
            },
            function(err) {
                console.log(err);
                showLoading('digital-forecast', false);
            }
        );    
        showLoading('ifs-holder', true);
        var $ifsWrapper = $('#ifs-holder');
        var ifsFlag = $ifsWrapper.find('input[name="ifsFlag"]').val();
        // 2022-08-12 단기예보 내 영향예보 삭제
        //requestIfs(bookmark.dong.code, wsUnit, ifsFlag).then(
        //    function(html) {
        //        $('#ifs-holder').html(html);
        //    },
        //    function(err) {
        //        console.log(err);
        //        showLoading('ifs-holder', false);
        //    }
        //);
    }
    function updateVshortForecast(bookmark) {
        showLoading('vshort-forecast', true, 'light under-pos');
        $.ajax({
            url: appPrefix + 'wnuri-fct2021/main/vshort-forecast.do',
            data: { code: bookmark.dong.code, unit: wsUnit },
            type: 'get',
            dataType: 'html'
        }).then(
            function(html) {
                $('#vshort-forecast').html(html);
                buildRain10Chart(bookmark);
            },
            function(err) {
                console.log(err);
                showLoading('vshort-forecast', false);
            }
        );
    }
    function buildRain10Chart(bookmark) {
        function buildChart(data) {
            var vshortDates = [];
            var $vf = $('#vshort-forecast');
            $.each($vf.find('.vsitem'), function(i, ele) {
                var date = $(this).attr('data-date');
                var time = $(this).attr('data-time');
                if(!date) return;
                vshortDates.push(moment(date + ' ' + time, 'YYYY-MM-DD HH:mm').add(-1,'hour'));
            });
            var rangeStart = vshortDates[0].clone();
            rangeStart.set('minute', 0);
            rangeStart.set('second', 0);
            var rangeEnd = vshortDates[vshortDates.length - 1].clone();
            rangeEnd.add(1, 'hour');
            rangeEnd.set('minute', 0);
            rangeEnd.set('second', 0);
            console.log(rangeStart.format('YYYY-MM-DD HH:mm:ss'));
            console.log(rangeEnd.format('YYYY-MM-DD HH:mm:ss'));
            var hourlyMax = {};
            var values = _.filter(data, function(d) {
               var dt = moment(d[0], 'YYYY[.]MM[.]DD[.]HH[:]mm');
               return dt.isAfter(rangeStart, 'minute') && ( dt.isBefore(rangeEnd, 'minute') || dt.isSame(rangeEnd, 'minute'));
            });
            values = _.map(values, function(v) {
               var dt = moment(v[0], 'YYYY[.]MM[.]DD[.]HH[:]mm');
               dt.clone().add(-1,'minute');
               return { dt:dt.clone().add(-1,'minute').format('YYYY[-]MM[-]DD HH[:00:00]'), x:dt.toDate(), y:v[2] }
            });
            var yMax = 0.0;
            _.forEach(values, function(v,i) {
               var max = hourlyMax[v.dt];
               if(!max) {
                   max = { v: 0, i: i };
                   hourlyMax[v.dt] = max;
               }
               if(max.v < v.y) {
                   max = { v: v.y, i: i};
                   hourlyMax[v.dt] = max;
               }
            });
            _.forEach(values, function(v, i) {
               var max = hourlyMax[v.dt];
               if(max && max.i == i) {
                   v.max = true;
               }
            });
             
            var hourlySum = {};
            _.forEach(values, function(d) {
               var y = hourlySum[d.dt];
               if(!y) y = 0;
               y += d.y;
               hourlySum[d.dt] = y;
            });
            
            var hourlyValues = _.map(_.keys(hourlySum).sort(), function(k, i) {
                var v = hourlySum[k];
                if(v > yMax) yMax = v;
                return { x: moment(k).toDate(), dt: k,  y: v }; 
            });
            // build
            var rain10Series = [{
                    data: hourlyValues, 
                    name:'한시간 강수',
                    type: 'column',
                    showInLegend: false,
                    animation: false,
                    marker : { enabled: false},
                    yAxis: 0,
                    xAxis: 0,
                    groupPadding: 0,
                    pointPadding: 0,
                    tooltip: { enabled: true }
                },
                {
                    data: values, 
                    name:'10분 강수',
                    type: 'areaspline',
                    showInLegend: false,
                    animation: false,
                    marker : { enabled: true, radius:2 },
                    fillColor: {
                        linearGradient: {x1: 0, y1: 0, x2: 0, y2: 1},
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0.3).get('rgba')]
                        ]
                    },
                    yAxis: 0,
                    xAxis: 1,
                }
            ];
            var yTicks = new Array();
            if (yMax <= 4) {
                yTicks = [0, 2.5, 5];
            } else if (yMax <= 8) {
                yTicks = [0, 5, 10];
            } else if (yMax <= 16) {
                yTicks = [0, 10, 20];
            } else if (yMax <= 24) {
                yTicks = [0, 15, 30];
            } else if (yMax <= 40) {
                yTicks = [0, 25, 50];
            } else if (yMax <= 80) {
                yTicks = [0, 50, 100];
            } else if (yMax <= 160) {
                yTicks = [0, 100, 200];
            } else if (yMax <= 240) {
                yTicks = [0, 150, 300];
            } else {
                yTicks = [0, 250, 500];
            }
            var minPadding1 = 0; 
            var maxPadding1 = 0;
            var minPadding2 = 1.0 / (rain10Series[1].data.length * 2.0); 
            var maxPadding2 = minPadding2;
            console.log(rain10Series);
            var rain10Chart = creteRain10Chart(rain10Series, { 
                chart: { 
                    margin: [10, 0, 5, 43]
                },
                xAxis: [
                    { lineColor: '#39B1E8', lineWidth: 1, padding:10, tickColor: "rgba(0,0,0,0)", labels: { enabled: false }, title: { enabled: false }, minPadding: minPadding1, maxPadding: maxPadding1, margin: 0}, 
                    { lineColor: '#39B1E8', lineWidth: 1, padding:10, tickColor: "rgba(0,0,0,0)", labels: { enabled: false }, title: { enabled: false }, minPadding: minPadding2, maxPadding: maxPadding2, margin: 0},
                ],
                yAxis: [
                    { offset:0, max: yTicks[2], min:yTicks[0], tickPosition: yTicks, tickInterval: yTicks[1] - yTicks[0], tickWidth: 1, lineWidth: 1, labels:{ enabled: true }, title: { enabled: false }  }
                ]
            });
            
            function creteRain10Chart(series, options) {
                var id = 'my-rain10chart';
                var $rain10ChartWrap = $vf.find('.rain10-chart').first();
                $('<div>').attr('id', id).css({ width: '100%', height: '84px'}).appendTo($rain10ChartWrap.empty());
                
                var minPadding = 1.0 / (series[0].data.length * 2.0); 
                var maxPadding = minPadding;
                var minValue = 999;
                var maxValue = -999;
                for(var j = 0 ; j < series.length ; j++) {
                    var valList = series[j].data;
                    for(var i = 0 ; i < valList.length ; i++) {
                        var val = valList[i];
                        if(typeof val.y != 'undefined') {
                            if(val.y > maxValue) maxValue = val.y;
                            if(val.y < minValue) minValue = val.y;
                        } else {
                            if(val > maxValue) maxValue = val;
                            if(val < minValue) minValue = val;
                        }    
                    }
                }
                var lineColor = "#009AE0", fontColor = "#000000";
                var chartOptions = {
                    plotOptions: {
                        series: { 
                            pointStart: 1, 
                            fillColor:'#009AE1', 
                        },
                        column: {
                            color: 'rgba(0,0,0,0)',
                            enableMouseTracking: false
                        },
                        areaspline: {
                            color: lineColor,
                            dataLabels: {
                                enabled: true, 
                                style: { fontSize: '13px', fontWeight: 'normal', color: fontColor, textOutline: false },
                                formatter: function () {
                                   if(this.point.max) {
                                       return this.y > 0 ? this.y + '' : '';
                                   } else{
                                       return '';
                                   }
                                },
                                crop: false,
                                overflow: 'none',
                                y: 0
                            },
                            enableMouseTracking: false
                        }
                    },
                    series: series,
                    chart: { backgroundColor: "rgba(0,0,0,0)", style: { fontFamily: "'ns', sans-serif" } },
                    title: { text: null },
                    credits: { enabled:false},
                };
                if(options) _.merge(chartOptions, options);
                var chart = Highcharts.chart(id, chartOptions);
                return chart;
            }
        }
        var tm = moment().utc().add(-20, 'minute').format("YYYYMMDDHHmm");
        var data = {
            tm: tm,
            lat: "",
            lon: "",
            x: bookmark.dong.x,
            y: bookmark.dong.y,
            disp: "V",
            type: "BLND"
        };
        var url = "https://vapi.kma.go.kr/capi/url/vs_prcp_blnd_pt_txt1.php";
        showLoading('vshort-forecast', true, 'light under-pos');
        $.ajax({
            url: url,
            data: data,
            dataType: "json"
        }).then(function(result) {
            showLoading('vshort-forecast', false);
            if(result.resultCode == "0") {
                buildChart(result.data.resultList);
            } else {
                alert("초단기 10분강수 조회 중 오류가 발생하였습니다.");
            }
        }, function(err) {
            console.log(err);
            showLoading('vshort-forecast', false);
            alert("초단기 10분강수 조회 중 오류가 발생하였습니다.");
        });
    }
    function createDfsSlider() {
        var isHr1Fct = $('.cmp-dfs-slider').first().hasClass('hr1-fct');
        var dfsSlider = null;
        var isMovingToTab = false;
        var obj = '.dfs-tab-body .dfs-slider';
        var $slider = $(obj);
        var $slideWrap = $slider.find('.slide-wrap');
        var scrollWidth = 0;
        var slidePoints = null;
        var tchartWidth = 0;
        var midtchartWidth = 0;
        var midtchartLeft = 0;
        var tchartItemCount = 0;
        var isModeChart = false;
        var isModeTable = false;
        var $slides = $slider.find('.slide');
        var $dailyHeads = $slider.find('.slide:not(.day-ten) .daily-head');
        
        var slideLength = $slides.length;
        var lastTabIndex = 0;
        var sliderWidth = $slider.width();
        prepareSlider();
        
        dfsSlider = new IScroll('.dfs-tab-body .dfs-slider', { eventPassthrough:true, scrollX: true, scrollY: false, mouseWheel: false, scrollbars: 'custom', resizePolling : 40, probeType : 3, interactiveScrollbars: true});
        
        updateChart();
        $('.dfs-tab-body .dfs-slider').on("keydown", function(e) {
        	if(e.keyCode == 37) {
        		dfsSlider.scrollBy(sliderWidth/2,0,500,IScroll.utils.ease.quadratic);
        	} else if(e.keyCode == 39){
        		dfsSlider.scrollBy(-sliderWidth/2,0,500,IScroll.utils.ease.quadratic);
        	}
        });
        dfsSlider.on('scroll', function(){
            if(isMovingToTab) return;
            var scrollX = -this.x;
            var selectedTabIndex = 0;
            for(var i = 0 ; i < slidePoints.length ; i++) {
                var p1 = slidePoints[i] - (i > 0 ? (isHr1Fct ? 55 : 30) : 0);
                var p2 = (i+1 >= slidePoints.length) ? 99999999 : (slidePoints[i+1] - (isHr1Fct ? 55 : 30));
                if(p1 <= scrollX && scrollX < p2) {
                    selectedTabIndex = i;
                    break;
                }
            }
            if(isHr1Fct) {
                if(selectedTabIndex < $dailyHeads.length && scrollX >= 0) {
                    var selectedSlideLeft = slidePoints[selectedTabIndex];
                    var slideWidth = slidePoints[selectedTabIndex+1] - selectedSlideLeft;
                    var marginLeft = scrollX - selectedSlideLeft;
                    if(marginLeft < slideWidth - $dailyHeads.eq(selectedTabIndex).width() - 70) {
                        $dailyHeads.eq(selectedTabIndex).css({ 'margin-left': (selectedTabIndex == 0 ? marginLeft : marginLeft+55)+ 'px'});
                    }
                } else if(scrollX < 0) {
                    $dailyHeads.eq(0).css({ 'margin-left': 'auto'});
                }
            }
            if(lastTabIndex != selectedTabIndex) {
                if(isHr1Fct) {
                    if(lastTabIndex < $dailyHeads.length) {
                    	if(lastTabIndex == 0 || isModeTable) {
                    		$dailyHeads.eq(lastTabIndex).css({ 'margin-left': 'auto'});                    		
                    	} else {
                    		$dailyHeads.eq(lastTabIndex).css({ 'margin-left': '23px'});
                    	}
                    }
                }
                lastTabIndex = selectedTabIndex;
                if(sliderWidth + scrollX < scrollWidth) {
                	selectTab(lastTabIndex);
                }
                if(slidePoints.length - 1 == selectedTabIndex) {
                    if(!$('.cmp-dfs-slider .item-lbl').hasClass('off')) {
                        $('.cmp-dfs-slider .item-lbl').addClass('off');
                    }
                    if(!$('.cmp-dfs-slider .item-lbl-graph').hasClass('off')) {
                        $('.cmp-dfs-slider .item-lbl-graph').addClass('off');
                    }
                    if(!$('.cmp-dfs-slider .item-lbl-midterm').hasClass('on')) {
                        $('.cmp-dfs-slider .item-lbl-midterm').addClass('on');
                    }
                } else {
                    $('.cmp-dfs-slider .item-lbl').removeClass('off');
                    $('.cmp-dfs-slider .item-lbl-graph').removeClass('off'); 
                    $('.cmp-dfs-slider .item-lbl-midterm').removeClass('on');
                }
            }
        });
        /* 
            보기 옵션 열기 
        */
        $('.cmp-dfs-slider a[data-layer]').click(function(e) {
            e.preventDefault();
            var dataLayer = $(this).attr('data-layer');
            var $panel = $('.cmp-dfs-slider').find('div[data-layer=' + dataLayer +']');
            if(!$panel.hasClass('on')) $panel.addClass('on')
            $panel.find('.big-close').unbind('click').bind('click', function(e) {
                e.preventDefault();
                $panel.removeClass('on');
            });
        });
        /*
            예보 보기 옵션 레이어 이벤트.
        */
        $('.cmp-dfs-slider').on('click', '.view-options a.sym-btn[data-option]', function(e) {
            e.preventDefault();
            var dataLayer = 'view-options';
            $(this).parent().parent().find('a.sym-btn').removeClass('on');
            $(this).addClass('on');
            var optionType = $(this).attr('data-option');
            var optionValue = $(this).attr('data-value');
            if(optionType == 'series') {
                $('.cmp-dfs-slider').removeClass('mode-chart').removeClass('mode-table').removeClass('mode-default').addClass(optionValue);
                window.setTimeout(function() {
                    prepareSlider();
                    dfsSlider.refresh();
                    updateChart();
                    $('.dfs-tab-head > li > a').first().trigger('click');
                    }, 0);
                $('.cmp-dfs-slider a.sym-btn[data-view]').removeClass('on');
                $('.cmp-dfs-slider a.sym-btn[data-view="' + optionValue + '"]').addClass('on');
            }
            $('.cmp-dfs-slider').find('div[data-layer=' + dataLayer +']').removeClass('on');
        });
        $('.cmp-dfs-slider').on('click', 'a.sym-btn[data-view]', function(e) {
            e.preventDefault();
            $(this).parent().find('a.sym-btn[data-view]').removeClass('on').removeAttr('title');
            $(this).addClass('on').attr('title','선택됨');
            
            var mode = $(this).attr('data-view');
            $('.cmp-dfs-slider').removeClass('mode-chart').removeClass('mode-table').removeClass('mode-default').addClass(mode);
            window.setTimeout(function() {
                prepareSlider();
                dfsSlider.refresh();
                updateChart();
                $('.dfs-tab-head > li > a').first().trigger('click');
                }, 0);
            $('.cmp-dfs-slider [data-layer="view-options"] [data-option="series"]').removeClass('on');
            $('.cmp-dfs-slider [data-layer="view-options"] [data-option="series"][data-value="' + mode + '"]').addClass('on');
        });
        /*
            오늘 내일 모레 10일 이후 탭과 스크롤 연동.
        */
        $('.cmp-dfs-slider .dfs-tab .dfs-tab-head').on('click', 'a', function(e) {
            e.preventDefault();
            $(this).parents('.dfs-tab-head').find('a.on').removeClass('on').removeAttr('title');
            $(this).addClass('on').attr('title','선택됨');
            var date = $(this).attr('data-date');
            var $slider = $('.cmp-dfs-slider .dfs-slider').first();
            var scrollLeft = 0;
            var isExperimentalTab = $(this).parent().attr('data-experimental') == 'Y';
            $slider.find('.daily').each(function(idx, ele) {
            	if(isExperimentalTab) {
            		if(date == $(ele).attr('data-date') && $(this).attr('data-experimental') == 'Y') return false;
            	} else {
            		if(date == $(ele).attr('data-date') && $(this).attr('data-experimental') != 'Y') return false;
            	}
                
                scrollLeft +=  Math.ceil($(ele).width());
            });
            
            var isMidTerm = $(this).parent().index() == $(this).parent().parent().find('li').last().index(); 
            if(isMidTerm && !isModeTable) scrollLeft += 25; //78;
            if(isHr1Fct) scrollLeft -= 47;
            isMovingToTab = true;
            if(dfsSlider) dfsSlider.scrollTo( -scrollLeft, 0, 500, IScroll.utils.ease.quadratic);
            window.setTimeout(function() { isMovingToTab = false;}, 500);
            
            if(isMidTerm) {
                if(!$('.cmp-dfs-slider .item-lbl').hasClass('off')) {
                    $('.cmp-dfs-slider .item-lbl').addClass('off');
                }
                if(!$('.cmp-dfs-slider .item-lbl-graph').hasClass('off')) {
                    $('.cmp-dfs-slider .item-lbl-graph').addClass('off');
                }
                if(!$('.cmp-dfs-slider .item-lbl-midterm').hasClass('on')) {
                    $('.cmp-dfs-slider .item-lbl-midterm').addClass('on');
                }
            } else {
                $('.cmp-dfs-slider .item-lbl').removeClass('off');
                $('.cmp-dfs-slider .item-lbl-graph').removeClass('off');
                $('.cmp-dfs-slider .item-lbl-midterm').removeClass('on'); 
            }
        });
        $('.cmp-dfs-updated a').on('click', function(e) {
            e.preventDefault();
            if($(this).hasClass('open-box')) {
                $(this).addClass('on');
                $('.cmp-dfs-updated a.close-box').first().trigger('focus');
            } else if($(this).hasClass('close-box')) {
                $('.cmp-dfs-updated a.open-box').removeClass('on').trigger('focus')
            }
        });
        // 윈도우 사이즈 변경에 따라 슬라이더 갱신.
        var isMobileSize = $(window).width() <= 1100;
        $(window).resize(function(e) {
            var width = $(window).width();
            if(isMobileSize) {
                if(width > 1100) {
                    window.setTimeout(function() {
                        prepareSlider();
                        if(dfsSlider) dfsSlider.refresh();
                    },0);
                    isMobileSize = false;
                }
            } else {
                if(width <= 1100) {
                    window.setTimeout(function() {
                        prepareSlider();
                        if(dfsSlider) dfsSlider.refresh();
                    },0);
                    isMobileSize = true;
                }
            }
        });
        
        /*
            슬라이더 준비.
        */
        function prepareSlider() {
            isModeChart = $('.cmp-dfs-slider').hasClass('mode-chart');
            isModeTable = $('.cmp-dfs-slider').hasClass('mode-table');
            scrollWidth = 0;
            slidePoints = [];
            tchartItemCount = 0;
            
            if(!isModeTable) {
                $slides.each(function(idx, ele) {
                    var slideWidth = 0;
                    $(ele).find('.item').each(function(idx2, ele2) {
                        var w = Math.ceil($(ele2).width());
                        slideWidth += w;
                        if(idx < slideLength-1) tchartItemCount++;
                    });
                    $(ele).css('width', slideWidth + 'px');
                    slidePoints.push(scrollWidth);
                    scrollWidth += slideWidth;
                });
                
                scrollWidth += 78;
                $slideWrap.css('width', scrollWidth + 'px');
            } else {
                $slides.each(function(idx, ele) {
                    var slideWidth = Math.ceil($(ele).width());
                    slidePoints.push(scrollWidth);
                    scrollWidth += slideWidth;
                });
                $slideWrap.css('width', scrollWidth + 'px');
            }
            sliderWidth = $slider.width();
//            console.log("isModeTable", isModeTable, "slidePoints", slidePoints, "scrollWidth", scrollWidth);
        }
        function getRandomInt(min, max) {
            min = Math.ceil(min);
            max = Math.floor(max);
            return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
        }
        function selectTab(tabIndex) {
            $('.cmp-dfs-slider > .dfs-tab > .dfs-tab-head-wrap > .dfs-tab-head > li > a.on').removeClass('on').trigger('blur').removeAttr('title');
            var $a = $('.cmp-dfs-slider .dfs-tab .dfs-tab-head li').eq(tabIndex).find('a').addClass('on').attr('title','선택됨');
            //window.setTimeout(function(){$a.trigger('focus');}, 0);
        }
        function updateChart() {
            /* 기온 차트 */
            tchartWidth = slidePoints[slidePoints.length - 1];
            
            var $tchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .tchart').css({ width: tchartWidth + 'px'});
            var tchartId = "my-tchart";
            var $tchart = $('<div>').attr('id', tchartId).css({ width: '100%', height: '100%'}).appendTo($tchartWrap);
            var tempList = JSON.parse($tchartWrap.attr('data-data'));
            var tchart = createTChart(tchartId, tempList[0]);
            /* 중기 최저/최고 기온 차트 */
            midtchartWidth = scrollWidth - ((isModeTable) ? 0 : 100) - slidePoints[slidePoints.length - 1];
            midtchartLeft = tchartWidth + ((isModeTable) ? 0 : (isHr1Fct ? 63 : 90) );
            var $midtchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .midtchart').css({ left: midtchartLeft + 'px',width: midtchartWidth + 'px'});
            var midtchartId = "my-midtchart";
            var $midtchart = $('<div>').attr('id', midtchartId).css({ width: '100%', height: '100%'}).appendTo($midtchartWrap);
            var midchartSeries = JSON.parse($midtchartWrap.attr('data-data'));
            var tmnList = midchartSeries[0], tmxList = midchartSeries[1];
            var midtchart = createChart2(midtchartId, tmnList, tmxList);
            /* 차트 모드 */
            if(isModeChart) {
                var chartWidth = tchartWidth;
                /* 강수확률 */
                var $ptychartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .ptychart').css({ width: chartWidth + 'px'});
                $('<div>').attr('id', 'my-ptychart').css({ width: '100%', height: '100%'}).appendTo($ptychartWrap);
                var ptychartSeries = JSON.parse($ptychartWrap.attr('data-data'));
                var ptyList = ptychartSeries[0];
                
                var ptyChart = createChart('my-ptychart', [{data: ptyList, name:'', dataLabel: {overflow:'allow', formatter: function () { return this.y >= 0 ? (this.y + '%') : '';}}}], { 
                    chart: { 
                        type: 'column',
                        paddingTop: 20, 
                        paddingBottom: 20, 
                    }, 
                    plotOptions: {
                        series: {
                            showInLegend:false,
                            animation: false,
                        }
                    }, 
                    xAxis: { lineColor: '#39B1E8', lineWidth: 2, minPadding: 0, maxPadding: 0,},
                    yAxis: { max: 130, min: 0 }
                });
                
                /* 강수량 */
                var $rainchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .rainchart').css({ width: chartWidth + 'px'});
                $('<div>').attr('id', 'my-rainchart').css({ width: '100%', height: '100%'}).appendTo($rainchartWrap);
                var rainchartSeries = JSON.parse($rainchartWrap.attr('data-data'));
                var rainList = rainchartSeries[0];
                var maxRain = 0;
                for(var i = 0 ; i < rainList.length ; i++) {
                    if(maxRain < rainList[i]) {
                        maxRain = rainList[i];
                    }
                }
                if(maxRain < 20) maxRain = 20;
                maxRain *= 1.3;
                var rainChartSeries = [{
                        data: rainList, 
                        name:'강수', 
                        dataLabels: {
                            overflow: 'allow',
                            useHTML: true,
                            formatter: function () {
                                var label = '<span class="chart-label">';
                                var f = this.y;
                                if(!isHr1Fct) {
                                    if(f < 0.1) label += "-";
                                    else if(f >= 0.1 && f < 1.0) label += "~1";
                                    else if(f >= 1.0 && f < 5.0) label += "1~4";
                                    else if(f >= 5.0 && f < 10.0) label += "5~9";
                                    else if(f >= 10.0 && f < 20.0) label += "10~19";
                                    else if(f >= 20.0 && f < 40.0) label += "20~39";
                                    else if(f >= 40.0 && f < 70.0) label += "40~69";
                                    else label += "70~";  
                                } else {
                                    if(f < 0.1) label += "-";
                                    else if(f >= 0.1 && f < 1.0) label += "~1";
                                    else if(f >= 1.0 && f < 30.0) label += Math.round(f) + "";
                                    else if(f >= 30.0 && f < 50.0) label += "30~50";
                                    else label += "50~";  
                                }
                                label += '</span>';
                                return label; 
                            }
                        }
                    }];
                var rainChart = createChart('my-rainchart', rainChartSeries, { 
                    chart: { 
                        type: 'column',
                        paddingTop: 20, 
                        paddingBottom: 20, 
                    }, 
                    plotOptions: {
                        series: {
                            showInLegend:false,
                            animation: false,
                        }
                    },
                    xAxis: { lineColor: '#39B1E8', lineWidth: 2, minPadding: 0, maxPadding: 0 },
                    yAxis: { max: maxRain, min: 0, tickInterval:0.1 }
                });
                
                /* 적설량 */
                var $snowchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .snowchart').css({ width: chartWidth + 'px'});
                $('<div>').attr('id', 'my-snowchart').css({ width: '100%', height: '100%'}).appendTo($snowchartWrap);
                var snowchartSeries = JSON.parse($snowchartWrap.attr('data-data'));
                var snowList = snowchartSeries[0];
                var maxSnow = 0;
                for(var i = 0 ; i < snowList.length ; i++) {
                    if(maxSnow < snowList[i]) {
                        maxSnow = snowList[i];
                    }
                }
                if(maxSnow < 10) maxSnow = 10;
                maxSnow *= 1.3;
                var snowChartSeries = [{
                        data: snowList, 
                        name:'적설', 
                        dataLabels: {
                            overflow: 'allow',
                            useHTML: true,
                            formatter: function () {
                                var label = '<span class="chart-label">';
                                var f = this.y;
                                if(!isHr1Fct) {
                                    if(f < 0.1) label += "-";
                                    else if(f >= 0.1 && f < 1.0) label += "~1";
                                    else if(f >= 1.0 && f < 5.0) label += "1~4";
                                    else if(f >= 5.0 && f < 10.0) label += "5~9";
                                    else if(f >= 10.0 && f < 20.0) label += "10~19";
                                    else label += "20~";
                                } else {
                                    if(f < 0.1) label += "-";
                                    else if(f >= 0.1 && f < 1.0) label += "~1";
                                    else if(f >= 1.0 && f < 5.0) label += f.toFixed(1) + "";
                                    else label += "5~";  
                                }
                                label += '</span>';
                                return label; 
                            }
                        }
                    }];
                var snowChart = createChart('my-snowchart', snowChartSeries, { 
                    chart: { 
                        type: 'column',
                        paddingTop: 20, 
                        paddingBottom: 20, 
                    }, 
                    plotOptions: {
                        series: {
                            showInLegend:false,
                            animation: false,
                        }
                    },
                    xAxis: { lineColor: '#39B1E8', lineWidth: 2, minPadding: 0, maxPadding: 0 },
                    yAxis: { max: maxSnow, min: 0, tickInterval:0.1 }
                });
                
                /* 풍향 풍속 */
                var $windchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .windchart').css({ width: chartWidth + 'px'});
                $('<div>').attr('id', 'my-windchart').css({ width: '100%', height: '100%'}).appendTo($windchartWrap);
                var windchartSeries = JSON.parse($windchartWrap.attr('data-data'));
                var windList = [];
                var wsList = windchartSeries[0];
                var wdList = windchartSeries[1];
                var maxWs = 0;
                var minWs = 99999999;
                for(var i = 0 ; i < wsList.length; i++) {
                	if(wsList[i] < 0) {
                		wsList[i] = null;
                		wdList[i] = "empty";
                	} else {
                		if(maxWs < wsList[i]) maxWs = wsList[i];
                        if(minWs > wsList[i]) minWs = wsList[i];
                	}
                    windList.push({x:i, y: wsList[i], arrow: wdList[i] + '_b'});
                }
                minWs -= (maxWs - minWs) * 0.4; 
                maxWs += (maxWs - minWs) * 0.4;
                var windChart = createChart('my-windchart', [
                            {data: windList, name:'1',
                                dataLabels: {
                                    formatter: function() {
                                    	return this.point.y < 0 ? '<span class="wdic empty_b sm" />' : '<span class="wdic ' + this.point.arrow + ' sm" />';
                                    },
                                    overflow: 'allow',
                                    enabled: true,
                                    useHTML: true,
                                    inside: true
                                }
                            },
                            {data: windList, name:'dummy',
                                dataLabels: {
                                    formatter: function () { return this.y; },
                                    overflow: 'allow',
                                    enabled: true,
                                    y: 24
                                },    
                            }
                        ], { 
                        chart: { 
                            type: 'spline',
                            paddingTop: 20, 
                            paddingBottom: 20, 
                        },
                        plotOptions: {
                            series: {
                                showInLegend:false,
                                animation: false,
                            }
                        },
                        xAxis: { lineColor: '#39B1E8', lineWidth: 2 },
                        yAxis: { min: minWs, max: maxWs, tickInterval:0.01}
                    });
                /* 습도 */
                var $hmchartWrap = $('.cmp-dfs-slider .dfs-tab-body .slide-wrap .hmchart').css({ width: chartWidth + 'px'});
                $('<div>').attr('id', 'my-hmchart').css({ width: '100%', height: '100%'}).appendTo($hmchartWrap);
                var hmchartSeries = JSON.parse($hmchartWrap.attr('data-data'));
                var hmList = hmchartSeries[0];
                var hmChart = createChart('my-hmchart', [{data: hmList, name:'', dataLabels: { overflow:'allow'}}], { 
                        chart: { 
                            type: 'areaspline',
                            paddingTop: 20, 
                            paddingBottom: 20, 
                            marginBottom: 2,
                        }, 
                        plotOptions: {
                            series: {
                                showInLegend:false,
                                animation: false,
                                marker : { enabled: true },
                                fillColor: {
                                    linearGradient: {x1: 0, y1: 0, x2: 0, y2: 1},
                                    stops: [
                                        [0, Highcharts.getOptions().colors[0]],
                                        [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                                    ]
                                },
                            }
                        },
                        xAxis: { lineColor: '#39B1E8', lineWidth: 1},
                        yAxis: { max: 130, min:0 }
                    });
            }
        }
        /**
            차트
            series : array of array or..
            options : chart options
        */
        function createChart(id, series, options) {
            if(!series || series.length < 1) return;
            
            var minPadding = 1.0 / (series[0].data.length * 2.0); 
            var maxPadding = minPadding;
            var minValue = 999;
            var maxValue = -999;
            for(var j = 0 ; j < series.length ; j++) {
                var valList = series[j].data;
                for(var i = 0 ; i < valList.length ; i++) {
                    var val = valList[i];
                    if(typeof val.y != 'undefined') {
                        if(val.y > maxValue) maxValue = val.y;
                        if(val.y < minValue) minValue = val.y;
                    } else {
                        if(val > maxValue) maxValue = val;
                        if(val < minValue) minValue = val;
                    }    
                }
            }
            var lineColor = "#009AE0", fontColor = "#000000";
            var chartOptions = {
                plotOptions: {
                    series: { 
                        pointStart: 1, 
                        fillColor:'#009AE1' 
                    },
                    line: { 
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '℃'; }
                        },    
                        enableMouseTracking: false,
                    },
                    spline: { 
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '℃'; }
                        },    
                        enableMouseTracking: false,
                    },
                    area: { 
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '%'; },
                            verticalAlign: 'bottom',
                        },    
                        enableMouseTracking: false,
                        marker: { enabled: false }
                    },
                    bar: {
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '%'; },
                            verticalAlign: 'bottom',
                        },    
                        enableMouseTracking: false
                    },
                    column: {
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y >= 0 ? this.y + '%' : ''; },
                            inside: false,
                        },    
                        enableMouseTracking: false
                    },
                    areaspline: {
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y >= 0 ? this.y + '%' : ''; },
                            inside: false,
                        },    
                        enableMouseTracking: false
                    }
                },
                series: series,
                yAxis: {
                    min: minValue-1, max: maxValue+1,
                    tickInterval: 0.1,
                    gridLineColor: "rgba(0,0,0,0)",
                    labels:{ enabled: false },
                    title: { enabled: false },
                },
                xAxis: {
                    lineColor: "rgba(0,0,0,0)",
                    tickColor: "rgba(0,0,0,0)",
                    labels: { enabled: false },
                    title: { enabled: false },
                    minPadding: minPadding,
                    maxPadding: maxPadding,
                    margin: 0, padding: 0,
                },
                chart: { backgroundColor: "rgba(0,0,0,0)", margin: 0, padding: 0, style: { fontFamily: "'ns', sans-serif" } },
                title: { text: null },
                credits: { enabled:false},
            };
            if(options) _.merge(chartOptions, options);
            //console.log(chartOptions, options);
            var chart = Highcharts.chart(id, chartOptions);    
            return chart;        
        }
        
        function createTChart(id, tempList) {
            var minPadding = 1.0 / (tempList.length * 2.0); 
            var maxPadding = minPadding;
            var minValue = 999;
            var maxValue = -999;
            for(var i = 0 ; i < tempList.length ; i++) {
            	if(tempList[i] < -50) {
            		tempList[i] = null;
                	continue;
                }
                var tempValue = tempList[i];
                if(tempValue > maxValue) maxValue = tempValue;
                if(tempValue < minValue) minValue = tempValue;
            }
            var lineColor = "#009AE0", fontColor = "#000000"; 
            var chart = Highcharts.chart(id, {
                plotOptions: {
                    series: {
                        pointStart: 1
                    },
                    spline: { 
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '℃'; }
                        },    
                        enableMouseTracking: false
                    }
                },
                series: [{ name: '', data: tempList, showInLegend: false, animation:false }],
                yAxis: {
                    min: minValue-1, max: maxValue+1,
                    tickInterval: 0.1,
                    gridLineColor: "rgba(0,0,0,0)",
                    labels:{ enabled: false },
                    title: { enabled: false },
                },
                xAxis: {
                    lineColor: "rgba(0,0,0,0)",
                    tickColor: "rgba(0,0,0,0)",
                    labels: { enabled: false },
                    title: { enabled: false },
                    minPadding: minPadding,
                    maxPadding: maxPadding,
                    margin: 0, padding: 0,
                },
                chart: { type:'spline', backgroundColor: "rgba(0,0,0,0)", margin: 0, padding: 0, style: { fontFamily: "'ns', sans-serif" } },
                title: { text: null },
                credits: { enabled:false },
            });    
            return chart;        
        }
        function createChart2(id, tmnList, tmxList) {
            var minPadding = 1.0 / (tmnList.length * 2.0); 
            var maxPadding = minPadding;
            var minValue = 999;
            var maxValue = -999;
            for(var i = 0 ; i < tmnList.length ; i++) {
                var tempValue = tmnList[i];
                if(tempValue > maxValue) maxValue = tempValue;
                if(tempValue < minValue) minValue = tempValue;
            }
            for(var i = 0 ; i < tmxList.length ; i++) {
                var tempValue = tmxList[i];
                if(tempValue > maxValue) maxValue = tempValue;
                if(tempValue < minValue) minValue = tempValue;
            }
            var delta = maxValue - minValue;
            if(delta != 0) {
                maxValue = maxValue + (delta * 0.7);
                minValue = minValue - (delta * 0.7);
            } else {
                maxValue = maxValue + (maxValue * 0.7);
                minValue = minValue - (minValue * 0.7);
            }
            var lineColor = "#009AE0", fontColor = "#000000"; 
            var chart = Highcharts.chart(id, {
                plotOptions: {
                    series: {
                        pointStart: 1
                    },
                    spline: { 
                        color: lineColor,
                        dataLabels: {
                            enabled: true, 
                            style: { fontSize: '14px', fontWeight: 'normal', color: fontColor, textOutline: false },
                            formatter: function () { return this.y + '℃'; }
                        },    
                        enableMouseTracking: false
                    }
                },
                series: [
                        { name: '', data: tmnList, marker: { symbol:'circle' }, showInLegend: false, animation:false, dataLabels: { overflow: 'allow', y: 25 } },
                        { name: '', data: tmxList, marker: { symbol:'circle' }, showInLegend: false, animation:false,}
                ],
                yAxis: {
                    min: minValue, max: maxValue,
                    tickInterval: 0.1,
                    gridLineColor: "rgba(0,0,0,0)",
                    labels:{ enabled: false },
                    title: { enabled: false },
                },
                xAxis: {
                    lineColor: "rgba(0,0,0,0)",
                    tickColor: "rgba(0,0,0,0)",
                    labels: { enabled: false },
                    title: { enabled: false },
                    minPadding: minPadding,
                    maxPadding: maxPadding,
                    margin: 0, padding: 0,
                },
                chart: { type:'spline', backgroundColor: "rgba(0,0,0,0)", margin: 0, padding: 0, style: { fontFamily: "'ns', sans-serif" } },
                title: { text: null },
                credits: { enabled:false },
            });    
            return chart;        
        }
    }
    function createGlobalEvent() {
        GlobalEvent.on('onAppConfigUpdated', function(e) {
            window.location.reload();
        });
        GlobalEvent.on('onAreaBookmarkDeleted', function(e, bookmarkIndex, bookmark, sender) {
            if(myPointSlider) myPointSlider.onAreaBookmarkUpdated(bookmarkIndex, bookmark);
        });
        GlobalEvent.on('onAreaBookmarkAdded', function(e, bookmarkIndex, bookmark, sender) {
            if(myPointSlider) myPointSlider.onAreaBookmarkUpdated(bookmarkIndex, bookmark);
        });
        GlobalEvent.on('onAddAreaBookmark', function(e, bookmark) {
            bookmarkDropdown.refresh(bookmark);
            updateDigitalForecast(bookmark);
        });
        GlobalEvent.on('onAddAreaRecent', function(e, bookmark) {
            bookmarkDropdown.refresh(bookmark);
            updateDigitalForecast(bookmark);
        });
        
        GlobalEvent.on('onSaveAreaBookmark', function(e) {
            bookmarkDropdown.refresh();
            if(myPointSlider) myPointSlider.onAreaBookmarkUpdated();
        });
        
        GlobalEvent.on('onAreaBookmarkSelected', function(e, bookmarkIndex, bookmark, sender) {
            if(!bookmark || !bookmark.dong) return;
            if(!bookmark.dong.lat || !bookmark.dong.lon){
                var latlon = convertDfsGrid('toLL', bookmark.dong.x, bookmark.dong.y)
                if(latlon['lat'] && latlon['lng']) {
                    bookmark.dong.lat = latlon['lat'];
                    bookmark.dong.lon = latlon['lng'];
                }
            }
                
            if(sender.id != bookmarkDropdown.id) {
                bookmarkDropdown.refreshSelected(bookmark);
            } 
            
            if(myPointSlider && sender.id != myPointSlider.id) {
                myPointSlider.refreshSelected(bookmark);
            }
            updateDigitalForecast(bookmark);
        });
        
        GlobalEvent.on('onAreaShow', function(e, bookmark, sender) {
            if(!bookmark.dong.lat || !bookmark.dong.lon){
                var latlon = convertDfsGrid('toLL', bookmark.dong.x, bookmark.dong.y)
                if(latlon['lat'] && latlon['lng']) {
                    bookmark.dong.lat = latlon['lat'];
                    bookmark.dong.lon = latlon['lng'];
                }
            }
            if(sender && sender.id == 'pop-local-search') {
                $('.pop-local-search').removeClass('on');
            }
            if(myPointSlider && sender.id != myPointSlider.id) {
                 myPointSlider.refreshSelected(bookmark);
            }
            if(bookmarkDropdown) bookmarkDropdown.refreshSelected(bookmark);
            updateDigitalForecast(bookmark);

        });
        
        $(document).click(function(e){
            var canCloseLocalSearchItems = $(e.target).parents('.cmp-local-search').length == 0
                && $(e.target).parents('.cmp-local-search-items').length == 0; 
            if(canCloseLocalSearchItems) {
                $('.cmp-local-search-items').removeClass('on').removeClass('opened');
            }
            
            var canCloseTodayWarning = $(e.target).parents('.cmp-main-wrn.accordion-wrap').length == 0;
            if(canCloseTodayWarning) {
                $('.cmp-main-wrn .box-con-on.accordion-tit.on').trigger('click');
            }
            
            var canCloseHelpTooltip = $(e.target).parents('.cmp-help-tooltip').length == 0 && $(e.target).attr('data-role')!="toggle-help";
            if(canCloseHelpTooltip) $('.cmp-help-tooltip').removeClass('on');
        });
    }    
    
    function readBookmarkSelectedInfo() {
        var lat = 37.493546;
        var lon = 126.921654;
        var favoriteFound = false;
        if(bookmarkDropdown.config 
                && ((bookmarkDropdown.config.bookmarks && bookmarkDropdown.config.bookmarks.length > 0) 
                        || bookmarkDropdown.config.selectedBookmark)) {
            if(bookmarkDropdown.config.selectedBookmark) {
                var bm = bookmarkDropdown.config.selectedBookmark;
                if(bm.dong && bm.dong.lat && bm.dong.lon && bm.dong.lat != "null" && bm.dong.lon != "null") {
                    lat = bm.dong.lat;
                    lon = bm.dong.lon;
                    bookmarkSelectedDong = bm.fullName;
                    bookmarkSelectedDongCode = bm.dong.code;
                    favoriteFound = true;
                } else {
                    if(bm.dong) {
                        var latlon = convertDfsGrid("toLL", bm.dong.x?bm.dong.x:bm.x,bm.dong.y?bm.dong.y:bm.y);
                        if(latlon['lat'] && latlon['lng']) {
                            lat = latlon['lat'];
                            lon = latlon['lng'];
                            bookmarkSelectedDong = bm.fullName;
                            favoriteFound = true;
                        }
                        bookmarkSelectedDongCode = bm.dong.code;
                    }
                }
                
            } else {
                var bm = bookmarkDropdown.config.bookmarks[0];
                if(bm.dong && bm.dong.lat && bm.dong.lon && bm.dong.lat != "null" && bm.dong.lon != "null") {
                    lat = bm.dong.lat;
                    lon = bm.dong.lon;
                    bookmarkSelectedDong = bm.fullName;
                    bookmarkSelectedDongCode = bm.dong.code;
                    favoriteFound = true;
                } else {
                    if(bm.dong) {
                        var latlon = convertDfsGrid("toLL", bm.dong.x?bm.dong.x:bm.x,bm.dong.y?bm.dong.y:bm.y);
                        if(latlon['lat'] && latlon['lng']) {
                            lat = latlon['lat'];
                            lon = latlon['lng'];
                            bookmarkSelectedDong = bm.fullName;
                            bookmarkSelectedDongCode = bm.dong.code;
                            favoriteFound = true;
                        }
                    }
                }
            }
        }
        bookmarkSelectedLat = lat;
        bookmarkSelectedLon = lon;
        return favoriteFound;
    }
    
    function requestDigitalForecast(code, wsUnit) {
        return $.ajax({
            url: (window.appBase?window.appBase:"/") + "wnuri-fct2021/main/digital-forecast.do",
            data: {code: code, unit: wsUnit, hr1: 'Y'},
            dataType: "html"
        });
    }
    
    function requestIfs(code, wsUnit, ifsFlag) {
        return $.ajax({
            url: (window.appBase?window.appBase:"/") + "wnuri-fct2021/weather/ifs.do",
            data: {code: code, unit: wsUnit, ifsFlag: ifsFlag},
            dataType: "html"
        });
    }
    
    function openExternalPop(url) {
        if(!url) return;
        
        if(url.substring(0,1) == "/") {
            url = window.location.origin + url;
        }
        
        window.open(url);
    }        
    /**
        code: "toXY"
            lat, lng to x, y
        code: "toLL" 
            x, y to lat, lng 
        return { lat, lng, x, y }
    */
    function convertDfsGrid(code,v1,v2) {
        //
        // LCC DFS 좌표변환을 위한 기초 자료
        //
        var RE = 6371.00877; // 지구 반경(km)
        var GRID = 5.0;      // 격자 간격(km)
        var SLAT1 = 30.0;    // 투영 위도1(degree)
        var SLAT2 = 60.0;    // 투영 위도2(degree)
        var OLON = 126.0;    // 기준점 경도(degree)
        var OLAT = 38.0;     // 기준점 위도(degree)
        var XO = 43;         // 기준점 X좌표(GRID)
        var YO = 136;        // 기1준점 Y좌표(GRID)
    
        var DEGRAD = Math.PI / 180.0;
        var RADDEG = 180.0 / Math.PI;
    
        var re = RE / GRID;
        var slat1 = SLAT1 * DEGRAD;
        var slat2 = SLAT2 * DEGRAD;
        var olon  = OLON  * DEGRAD;
        var olat  = OLAT  * DEGRAD;
    
        var sn = Math.tan( Math.PI*0.25 + slat2*0.5 ) / Math.tan( Math.PI*0.25 + slat1*0.5 );
        sn = Math.log( Math.cos(slat1) / Math.cos(slat2) ) / Math.log(sn);
        var sf = Math.tan( Math.PI*0.25 + slat1*0.5 );
        sf = Math.pow(sf,sn) * Math.cos(slat1) / sn;
        var ro = Math.tan( Math.PI*0.25 + olat*0.5 );
        ro = re * sf / Math.pow(ro,sn);
        var rs = {};
        if (code == "toXY") {
            rs['lat'] = v1;
            rs['lng'] = v2;
            var ra = Math.tan( Math.PI*0.25 + (v1)*DEGRAD*0.5 );
            ra = re * sf / Math.pow(ra,sn);
            var theta = v2 * DEGRAD - olon;
            if (theta >  Math.PI) theta -= 2.0 * Math.PI;
            if (theta < -Math.PI) theta += 2.0 * Math.PI;
            theta *= sn;
            rs['x'] = Math.floor( ra*Math.sin(theta) + XO + 0.5 );
            rs['y'] = Math.floor( ro - ra*Math.cos(theta) + YO + 0.5 );
        } else {
            rs['x'] = v1;
            rs['y'] = v2;
            var xn = v1 - XO;
            var yn = ro - v2 + YO;
            ra = Math.sqrt( xn*xn+yn*yn );
            if (sn < 0.0) -ra;
            var alat = Math.pow( (re*sf/ra),(1.0/sn) );
            alat = 2.0*Math.atan(alat) - Math.PI*0.5;
    
            if (Math.abs(xn) <= 0.0) {
                theta = 0.0;
            } else {
                if (Math.abs(yn) <= 0.0) {
                    theta = Math.PI*0.5;
                    if( xn < 0.0 ) -theta;
                } else theta = Math.atan2(xn,yn);
            }
            var alon = theta/sn + olon;
            rs['lat'] = alat*RADDEG;
            rs['lng'] = alon*RADDEG;
        }
        return rs;
    }
})(jQuery, window, document);
