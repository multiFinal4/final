'use strict';
if (!Array.prototype.find) {
   Array.prototype.find = function(predicate) {
      if (this == null) {
         throw new TypeError('Array.prototype.find called on null or undefined');
      }
      if (typeof predicate !== 'function') {
         throw new TypeError('predicate must be a function');
      }
      var list = Object(this);
      var length = list.length >>> 0;
      var thisArg = arguments[1];
      var value;

      for (var i = 0; i < length; i++) {
         value = list[i];
         if (predicate.call(thisArg, value, i, list)) {
            return value;
         }
      }
      return undefined;
   };
}
moment.locale('ko',{
		weekdays: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		weekdaysShort: ["일","월","화","수","목","금","토"]
});
var KMAP_defaultOpts = {
		lat: 37.493546, 
		lon: 126.921654, 
		onLoad: null ,
		zoom: 7,
		minZoom: 3,
		maxZoom: 16,
		whitemap: false,
		fullscreen: false,
		scaleLine: true,
	};
var wsUnit = "m/s";
if(appConfig.config && appConfig.config.unit && appConfig.config.unit.ws) {
	wsUnit = appConfig.config.unit.ws;
}
function KMAP_getLegend(vmap) {
	return legends[vmap.id];
}
function KMAP_showMessage(vmap, message) {
	var $message = $('<div class="kmap-message"/>')
			.append($('<div/>').html(message))
			.append('<a href="#" class="kmap-message-close">닫기</a>')
			.appendTo($('#' + vmap.id).parent())
			.on('click', '.kmap-message-close', function(e) {
				e.preventDefault();
				$message.fadeOut(function() { $message.remove(); });
			});
}
function KMAP_createTimeline(vmap, items) {
	if(!vmap || !items) return;
	var $kmapApp = $('#' + vmap.id).parent();
	var $timebar = $kmapApp.find('>.timebar');
	if($timebar.length > 0){
		$timebar.fadeIn(100);
		return;
	}
	$timebar = $('<div class="timebar">');
	var html = '<div><span class="date">--.--.(-) --:--</span></div>';
	html += '<div><button type="button" title="재생" class="time play">재생</button><button type="button" title="일시정지" class="time pause" style="display: none;">정지</button></div>'; 
	html += '<div><input type="range" min="0" max="1" step="1" value="0" class="range"> </div>';
	html += '<div><select class="play-speed"><option value="500" selected="selected">X1</option><option value="250">X2</option> <option value="125">X4</option></select></div>';
	$timebar.html(html).appendTo($kmapApp);
	
	var $itemsSlider = $timebar.find('input[type="range"]').first();
	$itemsSlider.attr('max', items.length-1);
	var $itemDate = $timebar.find('span.date').first();
	showItemDate(0);
	var play = false;
	var playInterval = 500;
	var itemCount = items.length;
	function togglePlay(e) {
		e.preventDefault();
		if(!play) {
			play = !play;
			$(this).removeClass('play').addClass('pause');
			start();
		} else {
			play = !play;
			if(vmap.playTimer) window.clearTimeout(vmap.playTimer);
			$(this).removeClass('pause').addClass('play');
		}
	}
	function start() {
		showNextImage();
	}
	function showNextImage() {
		if(!vmap.playTimer) window.clearTimeout(vmap.playTimer);
		if(!play) return;
		vmap.playTimer = window.setTimeout(function() {
			var nextIndex = parseInt($itemsSlider.val())+1;
			if(nextIndex >= itemCount) nextIndex = 0;
			$itemsSlider.val(nextIndex); 
			vmap.setIndex(nextIndex);
			showItemDate(nextIndex);
			showNextImage(); 
		}, playInterval);
	}
	function showItemDate(itemIndex) { 
		$itemDate.html(moment(items[itemIndex].ftm,'YYYYMMDDHHmm').format('D[일](dd) HH[:]mm'));
	}
	$timebar.on('click', 'button.play', togglePlay)
		.on('click', 'button.pause', togglePlay)
		.on('change', 'select', function(e) {
			playInterval = parseInt(this.value);
		})
		.on('change', 'input.range', function(e) {
			vmap.setIndex(parseInt(this.value));
			showItemDate(parseInt(this.value));
		});
}
function KMAP_removeTimeline(vmap) {
	var $kmapApp = $('#' + vmap.id).parent();
	$kmapApp.find('>.timebar').remove();
	if(vmap.playTimer) window.clearTimeout(vmap.playTimer);
}
function KMAP_createMap(target, opts) {
	var options = Object.assign({},KMAP_defaultOpts);
	if(opts) options = Object.assign(options, opts);
	try {
		var vmap = new kmap({
			target: target,
			scaleLine: options.scaleLine,
			fullScreen: options.fullScreen,
			zoom: options.zoom,
			minZoom: options.minZoom,
			maxZoom: options.maxZoom,
			wsUnit: wsUnit,
			center: [options.lon, options.lat],
			myLocation: [options.lon, options.lat],
			mapLayers: [
				{title: "거리지도", layer: "New_baroemap", visible: !options.whitemap},
				{title: "백지도", layer: "WhiteMap", visible: options.whitemap}
			],
			workspace: "kma_2022"
		});
		$('#' + target)[0].addEventListener('touchmove', function (event) {
			if(event.touches.length > 1) { 
				event.preventDefault(); 
			}
		}, { passive: false });
		vmap.id = target;
		vmap.once('postrender', function(e) {
			if(opts.onPostrender) {
				opts.onPostrender();
			}
		});
		if(isIE()) {
			var message = "날씨지도는 엣지, 크롬, 사파리, 파이어폭스에 최적화되어 있습니다.";
			KMAP_showMessage(vmap, message);
		}
		
		if(typeof options.onLoad == "function") options.onLoad(vmap);
		return vmap;
	} catch(e) {
		console.log('KMAP_createMap', e);
	}
	return null;
}
var satList = [
	// GK2A EA
	{ title: "적외", id: "GK2A_EA_IR105", matrixSet: "GK2A-3" },
	{ title: "가시", id: "GK2A_EA_VI006", matrixSet: "GK2A-1" },
	{ title: "수증기", id: "GK2A_EA_WV069", matrixSet: "GK2A-3" },
	// { title: "RGB천연", id: "GK2A_EA_RGBTRUE", matrixSet: "GK2A-2" },
	{ title: "RGB천연(AI)", id: "GK2A_EA_S_RGBTRUE", matrixSet: "GK2A-2" },
	{ title: "RGB주야간합성(AI)", id: "GK2A_EA_S_DAYNIGHT", matrixSet: "GK2A-3" },
	{ title: "안개분석",  id: "GK2A_EA_FOG", matrixSet: "GK2A-3", legend: "FOG" },
	{ title: "황사분석", id: "GK2A_EA_ADPS", matrixSet: "GK2A-3", legend: "ADPS" },
	// GK2A KO
	{ title: "적외", id: "GK2A_KO_IR105", matrixSet: "GK2A-3" },
	{ title: "가시", id: "GK2A_KO_VI006", matrixSet: "GK2A-1" },
	{ title: "수증기", id: "GK2A_KO_WV069", matrixSet: "GK2A-3" },
	//{ title: "RGB천연", id: "GK2A_KO_RGBTRUE", matrixSet: "GK2A-2" },
	//{ title: "주야간합성", id: "GK2A_KO_DAYNIGHT", matrixSet: "GK2A-3" },
	{ title: "RGB천연(AI)", id: "GK2A_KO_S_RGBTRUE", matrixSet: "GK2A-2" },
	{ title: "주야간합성(AI)", id: "GK2A_KO_S_DAYNIGHT", matrixSet: "GK2A-3" },
	{ title: "안개분석", id: "GK2A_KO_FOG", matrixSet: "GK2A-3" },
	{ title: "황사분석", id: "GK2A_KO_ADPS", matrixSet: "GK2A-3" },
	{ title: "산불", id: "GK2A_KO_FF", matrixSet: "GK2A-3" },
	// HIMA EA
	{ title: "(EA)주야간합성",  id: "HIMA_EA_DAYNIGHT", matrixSet: "GK2A-3" },
	{ title: "(EA)CH9", id: "HIMA_EA_CH9", matrixSet: "GK2A-3" },
	{ title: "(EA)CH13", id: "HIMA_EA_CH13", matrixSet: "GK2A-3" },
	// HIMA KO
	{ title: "(KO)주야간합성", id: "HIMA_KO_DAYNIGHT", matrixSet: "GK2A-3" },
	{ title: "(KO)CH9", id: "HIMA_KO_CH9", matrixSet: "GK2A-3" },
	{ title: "(KO)CH13", id: "HIMA_KO_CH13", matrixSet: "GK2A-3" }
];

var dfsList = [
	{ title: "기온", id: "TMP", element: "TMP", legend: "TMP" },
	{ title: "체감온도", id: "WCT", element: "WCT", legend: "WCT" },
	{ title: "상대습도", id: "REH", element: "REH", legend: "REH" },
	{ title: "풍향", id: "UVVEC", element: "UVVEC", legend: ""},
	{ title: "풍향/풍속", id: "UVWSD", element: "UVVEC", legend: "WSD" },
	{ title: "강수확률", id: "POP", element: "POP", legend: "POP" },
	{ title: "강수량", id: "PCP", element: "PCP", legend: "PCP" },
	{ title: "적설", id: "SNO", element: "SNO", legend: "SNO" },
	{ title: "하늘상태", id: "SKY", element: "SKY", legend: "SKY" },
	{ title: "강수형태", id: "PTY", element: "PTY", legend: "PTY" },
	{ title: "유의파고", id: "WAV", element: "WAV", legend: "WAV" }
];

var KMAP_layers = {
	wrn: {
		name: "특보",
		create: function(vmap, opts) {
			// fe=e : effect 발효된 특보
			// fe=f : 예비특보
			var options = {
				fe: 'e'
			}
			if(opts) options = Object.assign(options, opts);
			$.ajax({ url: getWgisBaseUrl() + '/wrn?fe=' + options.fe + '&date=', dataType: 'json'}).then(function(data) {
				vmap.setWrn(data);
				// 범례 생성
				var l = _.reduce(data, function(l, v) {
					if(l.indexOf(v.wrn) < 0) l.push(v.wrn);
					return l;
				}, []);
				KMAP_getLegend(vmap).setLegend("wrn", true, l);
				if(opts && typeof opts.onLayerLoad === "function") {
					opts.onLayerLoad(data)
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.setWrn(null);
			KMAP_getLegend(vmap).setLegend("wrn", false);	
		}
	},
	wrn_sea: {
		name: "해상특보",
		create: function(vmap) {
			$.ajax({ url: getWgisBaseUrl() + '/wrn/sea?date=', dataType: 'json'}).then(function(data) {
				vmap.setWrnSea(data);
				// 범례 생성
				var l = _.reduce(data, function(l, v) {
					if(l.indexOf(v.wrn) < 0) l.push(v.wrn);
					return l;
				}, []);
				KMAP_getLegend(vmap).setLegend("wrn", true, l);
				if(opts && typeof opts.onLayerLoad === "function") {
					opts.onLayerLoad(data)
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.setWrnSea(null);
			KMAP_getLegend(vmap).setLegend("wrn", false);	
		}
	},
	buoy: {
		name: "해상부이",
		create: function(vmap, opts) {
			$.ajax({ url: getWgisBaseUrl() + '/aws/buoy?date=', dataType: 'json'}).then(function(data) {
				vmap.setObs(data, {
					type: 'buoy', 
					visible: true,
					callback: function(info) {
						if(opts && opts.onKmapBuoyClick) {
							opts.onKmapBuoyClick(info);
						}
					}
				});
				if(opts && typeof opts.onLayerLoad === "function") {
					opts.onLayerLoad(data)
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.removeObs('buoy');
		}
	},
	lhaws: {
		name: "등표",
		create: function(vmap, opts) {
			$.ajax({ url: getWgisBaseUrl() + '/aws/lhaws?date=', dataType: 'json'}).then(function(data) {
				vmap.setObs(data, {
					type: 'lhaws',
					visible: true, 
					callback: function(info) {
						if(opts && opts.onKmapLhawsClick) {
							opts.onKmapLhawsClick(info);
						}
					}
				});
				if(opts && typeof opts.onLayerLoad === "function") {
					opts.onLayerLoad(data)
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.removeObs('lhaws');
		}
	},
	seaBuoy: {
		name: "파고부이",
		create: function(vmap, opts) {
			$.ajax({ url: getWgisBaseUrl() + '/aws/seaBuoy?date=', dataType: 'json'}).then(function(data) {
				vmap.setObs(data, {
					type: 'seaBuoy',
					visible: true, 
					callback: function(info) {
						if(opts && opts.onKmapSeaBuoyClick) {
							opts.onKmapSeaBuoyClick(info);
						}
					}
				});
				if(opts && typeof opts.onLayerLoad === "function") {
					opts.onLayerLoad(data)
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.removeObs('seaBuoy');
		}
	},
	sfc: {
		name: "지상관측지점(유인관측+자동관측)",
		create: function(vmap) {
			var awsUrl = [getWgisBaseUrl() + "/aws/sfc?date=", getWgisBaseUrl() + "/aws/aws?date="];
			var result = null;
			var count = 0;
			var visible = true;
			awsUrl.forEach(function(url) {
				$.ajax({ url: url, dataType: 'json'}).then(function(data) {
					if(result != null) {
						result = result.concat(data);
					} else {
						result = data;
					}
					count++;
					if(count === awsUrl.length) {
						//if (self.isVisible(type)) {
							vmap.setObs(result, {
								type: 'sfc', 
								visible: visible,  
								callback: function(info) {
									
								}
							});
							if(opts && typeof opts.onLayerLoad === "function") {
								opts.onLayerLoad(result)
							}
						//}
					}
				});
			});
		},
		remove: function(vmap, opts) {
			vmap.removeObs('sfc');
		}
	},
	radar: {
		name: "레이더",
		create: function(vmap, opts) {
			var type = "pop"; // 기본은 강수
			var options = {
				type: "pop",
				interval: 5,
			}
			if(opts) options = Object.assign(options, opts);

			var url = (window.appBase ? window.appBase : '') + '/wnuri-img/rest/radar/cmp/images.do';
			if(options.type == "pop") {
				url += '?data=SFC-HSR';
			} else {
				url += '?data=SFC';
			}
			url += '&tm=' + options.tm;
			url += '&timeTerm=' + options.interval;
			url += '&leaflet=1&unit=' + wsUnit + '&ver=' + (new Date().getTime());
			
			$.ajax({ url: url, dataType: 'json'}).then(function(data) {
				// 강수: pop, 눈: pty
				var urls = _.map(data, function(d) { return d.url; });
				var dates = _.map(data, function(d) { return moment.tz(moment(d.tm,'YYYYMMDDHHmm').format('YYYY-MM-DDTHH:mm:ss'),'').tz('Asia/Seoul').format('YYYYMMDDHHmm'); });
				var radarOptions = { type: options.type, urls: urls, dates: dates, opacity: 0.6 };
				vmap.setRadar(radarOptions);
				KMAP_getLegend(vmap).setLegend(options.type, true);
				
				var items = _.map(data, function(d){
					return {
						name: d.name,
						url: [d.url],
						tm: data[data.length-1].tm,
						ftm: d.tm 
					};
				});
				if(options.onLoad) {
					options.onLoad('레이더', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.setRadar(null);
			KMAP_getLegend(vmap).setLegend(opts.type, false);
		}
	},
	rww: {
		name: "해구별예보",
		create: function(vmap, opts) {
			// parameter
			//		1) (string) type
			// 		1) (array) data
			// 		2) (int) index
			// 		3) (function) mouse move event
			// 		4) (function) click event
			// type
			// 		유의파고: b
			// 		파향: c
			// 		파주기: d
			// 		풍속: e
			// 		풍향: f
			// 		풍향/풍속: ef
			var type = "b";
			var options = { type:"b", index:0};
			if(opts) options = Object.assign(options, opts);
			vmap.setRww(options.type, options.zoneRww, options.index, 
				function(e, feature, coord, pixel) {
				   	var prop = feature.getProperties();
				}, 
				function(e, feature) {
					var prop = feature.getProperties();
				   	if(options.onMarineZoneClick) {
				   		options.onMarineZoneClick(e, prop);
				   	}
				}
			);
			var legendType = "";
			if(options.type == "b") legendType = "b";
			else if(options.type == "c") legendType = "";
			else if(options.type == "d") legendType = "d";
			else if(options.type == "e") legendType = "ef";
			else if(options.type == "f") legendType = "ef";
			else legendType = "";
			
			if(legendType) {
				console.log(KMAP_getLegend(vmap));
				KMAP_getLegend(vmap).setLegend("rww-" + legendType, true);	
			}
		},
		remove: function(vmap, opts) {
			vmap.setRww(opts.type, null);
			var legendType = "";
			if(opts.type == "b") legendType = "b";
			else if(opts.type == "c") legendType = "";
			else if(opts.type == "d") legendType = "d";
			else if(opts.type == "e") legendType = "ef";
			else if(opts.type == "f") legendType = "ef";
			else legendType = "";
			if(!legendType) {
				KMAP_getLegend(vmap).setLegend("rww-" + legendType, true);	
			}
		}
	},
	vshrt_rain: {
		name: "초단기예측 강수",
		create: function(vmap, opts) {
			// default option
			if(opts && opts.tm) {
				opts.tm = moment(opts.tm, 'YYYY[.]MM[.]DD[.]HH[:]mm').toDate().toISOString().replace(/[^0-9]/g, "").substring(0, 12)
			}
			var options = {
				tm: new Date().toISOString().replace(/[^0-9]/g, "").substring(0, 12),
				opacity: .5,
			}
			if(opts) options = Object.assign(options, opts);
			/******************** 초단기예측  ********************/
			vshrtRainFetch(vmap, options, function(items) {
				KMAP_getLegend(vmap).setLegend("pop", true);
				if(options.timelineEnabled) {
					KMAP_createTimeline(vmap, items);
				}
				if(options.onLoad) {
					options.onLoad('초단기예측 강수', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.setRadar(null);
			KMAP_getLegend(vmap).setLegend("pop", false);
			if(opts.timelineEnabled) {
				KMAP_removeTimeline(vmap);
			}
		}
	},
	vshrt_wind: {
		name: "초단기예측 바람",
		create: function(vmap, opts) {
			var options = {};
			if(opts) options = Object.assign(options, opts);
			$.ajax({ url: getWgisBaseUrl() + "/klfs/list/UVVEC", dataType: 'json'}).then(function(result) {
				var klfs = { urls: [], opacity: 0.3 };
				var stream = { urls: [], opacity: 1 };
				for(var i in result) {
					var pan = result[i];
					klfs.urls.push(getWgisBaseUrl() + '/klfs/' + pan.fctDate + '/WSD/' + pan.panIndex);
					stream.urls.push(getWgisBaseUrl() + '/klfs/' + pan.fctDate + '/UVVEC/' + pan.panIndex);
				}
				vmap.setKlfs(klfs);
				vmap.setKlfsStream(stream);
				var legendId = KMAP_getLegend(vmap).getPaletteId('WSD');
				var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
				KMAP_getLegend(vmap).setLegend('WSD', true, legendData);
				var items = _.map(result,function(pan, i) { return { 
						name: '초단기예측 바람', 
						url:[ klfs.urls[i], stream.urls[i] ],
						tm: moment.tz(pan.fctDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
						ftm: moment.tz(pan.efcDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
					}
				}); 
				
				if(options.onLoad) {
					options.onLoad('초단기예측 바람', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
			});
		},
		remove: function(vmap, opts) {
			vmap.setKlfs(null);
			vmap.setKlfsStream(null);
			var legendId = KMAP_getLegend(vmap).getPaletteId('WSD');
			var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
			KMAP_getLegend(vmap).setLegend('WSD', false, legendData);
		}
	},
	seafct_wave: {
		name: "초단기예측 유의파고, 해상풍(속), 해상풍(향)",
		create: function(vmap, opts) {
			//var seaFct = ["WAV", "WSD", "VEC"];
			//var seaElement = "WSD";
			var options = {
				type: 'WAV',
				windEnabled: true,
			};
			if(opts) options = Object.assign(options, opts);
			$.ajax({ url: getWgisBaseUrl() + '/seafct/list/' + options.type, dataType: 'json'}).then(function(result) {
				var sea = { urls: [], opacity: 0.7 };
				var vec = { urls: [], opacity: 0.7 };
				for(var i in result) {
					var pan = result[i];
					sea.urls.push(getWgisBaseUrl() + '/seafct/' + pan.fctDate + '/' + options.type +'/' + pan.panIndex);
					if(options.windEnabled) vec.urls.push(getWgisBaseUrl() + '/seafct/' + pan.fctDate + '/VEC/' + pan.panIndex);
				}
				vmap.setSeaFct(sea);
				if(options.windEnabled) vmap.setSeaVec(vec);
				var legendId = KMAP_getLegend(vmap).getPaletteId(options.type);
				var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
				KMAP_getLegend(vmap).setLegend(options.type, true, legendData);
				var items = _.map(result, function(pan,i) { return { 
						name: '초단기예측(' + options.type + ')' , 
						url:[sea.urls[i]],
						tm: moment.tz(pan.fctDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
						ftm: moment.tz(pan.efcDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
					}
				});
				if(options.onLoad) {
					options.onLoad('초단기예측 바람', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
			});
		},
		remove: function(vmap, opts) {
			var options = {
				type: 'WAV',
				windEnabled: true,
			};
			if(opts) options = Object.assign(options, opts);
			vmap.setSeaFct(null);
			if(options.windEnabled) vmap.setSeaVec(null);
			var legendId = KMAP_getLegend(vmap).getPaletteId(options.type);
			var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
			KMAP_getLegend(vmap).setLegend(options.type, false, legendData);
		}
	},
	seafct_vis: {
		name: "초단기예측 시정",
		create: function(vmap, opts) {
			var options = {
				type: "VIS"
			};
			if(opts) options = Object.assign(options, opts);
			$.ajax({ url:getWgisBaseUrl() + '/visibility/list/' + options.type , dataType: 'json'}).then(function(result) {
				var vis = { urls: [], opacity: 0.7 };
				for(var i in result) {
					var pan = result[i];
					vis.urls.push(getWgisBaseUrl() + '/visibility/' + pan.fctDate +'/' + pan.element + '/' + pan.panIndex);
				}
				vmap.setVisibility(vis);
				var legendId = KMAP_getLegend(vmap).getPaletteId(options.type);
				var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
				KMAP_getLegend(vmap).setLegend(options.type, true, legendData);
				var items = _.map(result, function(pan,i) { return { 
						name: '초단기예측(' + options.type + ')' , 
						url:[vis.urls[i]],
						tm: moment.tz(pan.fctDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
						ftm: moment.tz(pan.efcDate,'Etc/GMT').tz('Asia/Seoul').format('YYYYMMDDHHmm'),
					}
				});
				
				if(options.onLoad) {
					options.onLoad('초단기예측 시정', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
			});
		},
		remove: function(vmap, options) {
			vmap.setVisibility(null);
			var legendId = KMAP_getLegend(vmap).getPaletteId(options.type);
			var legendData = KMAP_getLegend(vmap).getPaletteById(legendId);
			KMAP_getLegend(vmap).setLegend(options.type, true, legendData);
		}
	},
	sat: {
		name:"위성(GK2A)",
		create: function(vmap, opts) {
			var sat = Object.assign({}, satList[0]);
			if(opts && opts.satIndex) sat = Object.assign({}, satList[opts.satIndex]);
			sat = Object.assign(sat, opts);
			var requestDate = (opts && opts.tm) ? moment(opts.tm, 'YYYY[.]MM[.]DD[.]HH[:]mm').utc().format('YYYY-MM-DD[T]HH:mm:ss') : '';
			var url = getWgisBaseUrl() + '/wmts/sat?date=' + requestDate  + '&type=' + sat.id;
			$.ajax({ url:url , dataType: 'json'}).then(function(result) {
				var status = _.map(result, function(d) { return d.status} );
				var dateList = _.map(result, function(d) { return d.date} );
				var currentIndex = dateList.length-1;
				var options = { 
			   		type: sat.id, 
			   		matrixSet: sat.matrixSet, 
			   		dates: dateList, 
			   		index: currentIndex, 
			   		status: status, 
			   		opacity: sat.opacity ? parseFloat(sat.opacity) : 0.7
				};
				var loadCount = 0;
				vmap.setSat(options, function(result) {
					loadCount += result;
					if (loadCount === 0) {
						vmap.loadingSat();
						vmap.setIndex(currentIndex);
					}
				});
				var fctDate = moment.tz(dateList[dateList.length - 1], 'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm");
				var items = _.map(dateList, function(item, i) { 
					return {
						name:'위성', 
						url:[], 
						tm: fctDate, 
						ftm: moment.tz(item, 'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm")
					}; 
				});
				if(opts && opts.onLoad) {
					opts.onLoad('위성', items);
				}
				if(opts && opts.onPostLoad) {
					opts.onPostLoad(vmap, items, opts);
				}
				if(sat.legend) KMAP_getLegend(vmap).setLegend(sat.legend, true);
			});
		},
		remove: function(vmap, opts) {
			var sat = Object.assign({}, satList[0]);
			if(opts && opts.satIndex) sat = Object.assign({}, satList[opts.satIndex]);
			if(sat.legend) KMAP_getLegend(vmap).setLegend(sat.legend, false);
			vmap.setSat(null);
		}
	},
	dfs: {
		name:"동네예보 분포도",
		create: function(vmap, opts) {
			var dfs = Object.assign({}, dfsList[0]);
			if(opts && opts.dfsIndex) dfs = Object.assign({}, dfsList[opts.dfsIndex]);
			var url = getWgisBaseUrl() + '/dfs/list/' + dfs.element;
			var dfsElement = dfs.id;
			$.ajax({ url: url, dataType: 'json'}).then(function(result) {
				var dateList = [];
				var options = { urls: [], opacity: 0.3 };
				var streams = { urls: [], opacity: 1 };
				
				for(var i=0; i < result.dfsList.length; i++) {
					var _dfs = result.dfsList[i];
					var mapElement = dfs.legend;
					if(_dfs.panIndex >= 0) {
						dateList.push(new Date(_dfs.efcDate));
						options.urls.push(getWgisBaseUrl() + '/dfs/' + _dfs.type + '/' + mapElement + '/' + _dfs.fctDate + '/' + _dfs.panIndex);
						streams.urls.push(getWgisBaseUrl() + '/dfs/' + _dfs.type + '/' + _dfs.element + '/' + _dfs.fctDate + '/' + _dfs.panIndex);
					 }
				}
				if(dfsElement === "UVVEC") {
					vmap.setDfsStream(streams);
				} else if(dfsElement === "UVWSD") {
					vmap.setDfs(options);
					vmap.setDfsStream(streams);
				} else {
					vmap.setDfs(options);
				}
				
				var fctDate = moment.tz(moment(dateList[0]).format('YYYY-MM-DDTHH:mm:ss'), 'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm");
				var items = _.map(dateList, function(item, i) { 
					return {
						name:'동네예보 ' + dfs.title, 
						url:[], 
						tm: fctDate, 
						ftm: moment.tz(moment(item).format('YYYY-MM-DDTHH:mm:ss'), 'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm")
					}; 
				});
				if(opts && opts.onLoad) {
					opts.onLoad('동네예보 ' + dfs.title, items);
				}
				if(opts && opts.onPostLoad) {
					opts.onPostLoad(vmap, items, opts);
				}
				// legend
				if(dfs.legend) {
					var legendId = KMAP_getLegend(vmap).getPaletteId(dfs.legend, dateList[0]);
					var data = KMAP_getLegend(vmap).getPaletteById(legendId);
					KMAP_getLegend(vmap).setLegend('dfs' + dfs.legend, true, data);
				}
			});
		},
		remove: function(vmap, opts) {
			var dfs = Object.assign({}, dfsList[0]);
			if(opts && opts.dfsIndex) dfs = Object.assign({}, dfsList[opts.dfsIndex]);
			var dfsElement = dfs.id;
			KMAP_getLegend(vmap).setLegend('dfs' + dfs.legend, false);
			if(dfsElement === "UVVEC") {
				vmap.setDfsStream(null);
			} else if(dfsElement === "UVWSD") {
				vmap.setDfs(null);
				vmap.setDfsStream(null);
			} else {
				vmap.setDfs(null);
			}
		}
	},
	lgt: {
		name: "낙뢰",
		create: function(vmap, opts) {
			var options = { dateNum: 12, interval: 10 };
			if(opts) options = Object.assign(options, opts);
			var url = getWgisBaseUrl() + '/lgt?date=' + ( options.tm ? moment(options.tm,'YYYY[.]MM[.]DD[.]HH[:]mm').utc().format('YYYY-MM-DDTHH:mm:ss') : '' ) + '&dateNum=' + options.dateNum + '&interval=' + options.interval;

			$.ajax({ url: url, dataType: 'json'}).then(function(data) {
				var lgtList = data.lgtList;
				var dateList = data.baseDateList;
				vmap.setLgt(lgtList, dateList);
				dateList = _.reverse(dateList);
				var fctDate = moment.tz(dateList[dateList.length-1],'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm");
				var items = _.map(dateList, function(r,i) { return {
						name:'낙뢰', 
						url:[], 
						tm: fctDate, 
						ftm: moment.tz(r,'Etc/GMT').tz('Asia/Seoul').format("YYYYMMDDHHmm")
					}; 
				});
				var dates = _.map(dateList, function(r,i) { return moment.tz(r,'Etc/GMT').tz('Asia/Seoul').toDate(); } );
				
				if(options.onLoad) {
					options.onLoad('낙뢰', items);
				}
				if(options.onPostLoad) {
					options.onPostLoad(vmap, items, opts);
				}
				if(dates && dates.length > 0) 
					KMAP_getLegend(vmap).setLegend('lgt', true, dates[dates.length-1], options);
			});
		},
		remove: function(vmap, opts) {
			vmap.setLgt(null);
			KMAP_getLegend(vmap).setLegend('lgt', false);
		}
	}
};
function KMAP_removeLayer(vmap , layers) {
	for(var i in layers) {
		var layer = layers[i];
		var layerName = null;
		var layerOpt = null;
		if(typeof layer === "string") {
			layerName = layer;
		} else if(typeof layer === "object") {
			layerName = layer.name;
			layerOpt = layer.options;
		}
		if(layerName) KMAP_layers[layerName].remove(vmap, layerOpt);
	}
}
function KMAP_addLayer(vmap, layers) {
	for(var i in layers) {
		var layer = layers[i];
		var layerName = null;
		var layerOpt = null;
		if(typeof layer === "string") {
			layerName = layer;
		} else if(typeof layer === "object") {
			layerName = layer.name;
			layerOpt = layer.options;
		}
		if(layerName) KMAP_layers[layerName].create(vmap, layerOpt);
	}
}