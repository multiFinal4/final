/* functions */
'use strict';
String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g,""); }
function isMobileEnv() {
  var check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
};

if(!isMobileEnv()) {
	$('meta[name="viewport"]').attr('content', 'width=1551');
}

function isIE(){ 
	return window.navigator.userAgent.indexOf("MSIE ") > 0;
}

function writeWindSpeedUnit() {
	var config = store.get("W_AC");
	if(!config) {
		config = { unit: { ws: 'm/s' } }
	}
	if(config.unit.ws == 'km/h') {
		document.write('km/h');	
	} else {
		document.write('m/s');
	}
}
function writeWindSpeed(msValue, showUnit, prefix, suffix, roundCount) {
	var config = store.get("W_AC");
	if(!config) {
		config = { unit: { ws: 'm/s' } }
	}
	if(!msValue || isNaN(msValue)) return "";
	if(prefix == null) prefix = "";
	if(suffix == null) suffix = "";
	if(roundCount != null && roundCount > 0) {
		var multi = 10;
		for(var i = 1 ; i < roundCount ; i++) {
			multi *= 10;
		}
		if(config.unit.ws == 'km/h') {
			if(showUnit) {
				document.write(prefix + Math.round(parseFloat(msValue) * multi * 3.6)/multi + 'km/h' + suffix);
			} else {
				document.write(prefix + Math.round(parseFloat(msValue) * multi * 3.6)/multi + suffix);
			}
		} else {
			if(showUnit) {
				document.write(prefix + Math.round(parseFloat(msValue) * multi)/multi + 'm/s' + suffix);
			} else {
				document.write(prefix + Math.round(parseFloat(msValue) * multi)/multi + suffix);
			}
		}
	} else {
		if(config.unit.ws == 'km/h') {
			if(showUnit) {
				document.write(prefix + Math.round(parseFloat(msValue) * 3.6) + 'km/h' + suffix);
			} else {
				document.write(prefix + Math.round(parseFloat(msValue) * 3.6) + suffix);
			}
		} else {
			if(showUnit) {
				document.write(prefix + Math.round(parseFloat(msValue)) + 'm/s' + suffix);
			} else {
				document.write(prefix + Math.round(parseFloat(msValue)) + suffix);
			}
		}
	}
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
	// LCC DFS ��ǥ��ȯ�� ���� ���� �ڷ�
	//
	var RE = 6371.00877; // ���� �ݰ�(km)
	var GRID = 5.0;      // ���� ����(km)
	var SLAT1 = 30.0;    // ���� ����1(degree)
	var SLAT2 = 60.0;    // ���� ����2(degree)
	var OLON = 126.0;    // ������ �浵(degree)
	var OLAT = 38.0;     // ������ ����(degree)
	var XO = 43;         // ������ X��ǥ(GRID)
	var YO = 136;        // ��1���� Y��ǥ(GRID)

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
function getWgisBaseUrl() {
	if(window.wgisBaseUrl) {
		if(window.wgisBaseUrl.substring(0,1) == "/") {
			return window.appBase + window.wgisBaseUrl;
		} else {
			return window.wgisBaseUrl;
		}				
	} else {
		return "";
	}
}

function getLocation(callback) {
	var defaultLat = 37.493546, 
		defaultLon = 126.921654;
	var errorCallback = function(error) {
		if(console) console.log(error);
		switch(error.code) {
			case 1: // error.PERMISSION_DENIED:
			case 2: // error.POSITION_UNAVAILABLE:
			case 3: // error.TIMEOUT:
			case 4: // error.UNKNOWN_ERROR:
				break;
		}
		callback(defaultLat, defaultLon);
	}
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			if(position.coords.latitude && position.coords.longitude) {
				callback(position.coords.latitude, position.coords.longitude);
			} else {
				callback(defaultLat, defaultLon);
			}
		}, errorCallback);
	} else {
		alert("��ġ�� �������� �ʴ� �������Դϴ�.");
		callback(defaultLat, defaultLon);
	}
}