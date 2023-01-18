<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<meta name='robots'
	content='index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1' />


<script data-cfasync="false" data-wpfc-render="false"
	type="text/javascript">
				var page = 2;
				var mi_version = '8.11.0';
				var mi_track_user = true;
				var mi_no_track_reason = '';
				
								var disableStrs = [
															'ga-disable-UA-216468562-1',
									];

				/* Function to detect opted out users */
				function __gtagTrackerIsOptedOut() {
					for (var index = 0; index < disableStrs.length; index++) {
						if (document.cookie.indexOf(disableStrs[index] + '=true') > -1) {
							return true;
						}
					}

					return false;
				}

				/* Disable tracking if the opt-out cookie exists. */
				if (__gtagTrackerIsOptedOut()) {
					for (var index = 0; index < disableStrs.length; index++) {
						window[disableStrs[index]] = true;
					}
				}

				/* Opt-out function */
				function __gtagTrackerOptout() {
					for (var index = 0; index < disableStrs.length; index++) {
						document.cookie = disableStrs[index] + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
						window[disableStrs[index]] = true;
					}
				}

				if ('undefined' === typeof gaOptout) {
					function gaOptout() {
						__gtagTrackerOptout();
					}
				}
								window.dataLayer = window.dataLayer || [];

				window.MonsterInsightsDualTracker = {
					helpers: {},
					trackers: {},
				};
				if (mi_track_user) {
					function __gtagDataLayer() {
						dataLayer.push(arguments);
					}

					function __gtagTracker(type, name, parameters) {
						if (!parameters) {
							parameters = {};
						}

						if (parameters.send_to) {
							__gtagDataLayer.apply(null, arguments);
							return;
						}

						if (type === 'event') {
							
														parameters.send_to = monsterinsights_frontend.ua;
							__gtagDataLayer(type, name, parameters);
													} else {
							__gtagDataLayer.apply(null, arguments);
						}
					}

					__gtagTracker('js', new Date());
					__gtagTracker('set', {
						'developer_id.dZGIzZG': true,
											});
															__gtagTracker('config', 'UA-216468562-1', {"forceSSL":"true","link_attribution":"true"} );
										window.gtag = __gtagTracker;										(function () {
						/* https://developers.google.com/analytics/devguides/collection/analyticsjs/ */
						/* ga and __gaTracker compatibility shim. */
						var noopfn = function () {
							return null;
						};
						var newtracker = function () {
							return new Tracker();
						};
						var Tracker = function () {
							return null;
						};
						var p = Tracker.prototype;
						p.get = noopfn;
						p.set = noopfn;
						p.send = function () {
							var args = Array.prototype.slice.call(arguments);
							args.unshift('send');
							__gaTracker.apply(null, args);
						};
						var __gaTracker = function () {
							var len = arguments.length;
							if (len === 0) {
								return;
							}
							var f = arguments[len - 1];
							if (typeof f !== 'object' || f === null || typeof f.hitCallback !== 'function') {
								if ('send' === arguments[0]) {
									var hitConverted, hitObject = false, action;
									if ('event' === arguments[1]) {
										if ('undefined' !== typeof arguments[3]) {
											hitObject = {
												'eventAction': arguments[3],
												'eventCategory': arguments[2],
												'eventLabel': arguments[4],
												'value': arguments[5] ? arguments[5] : 1,
											}
										}
									}
									if ('pageview' === arguments[1]) {
										if ('undefined' !== typeof arguments[2]) {
											hitObject = {
												'eventAction': 'page_view',
												'page_path': arguments[2],
											}
										}
									}
									if (typeof arguments[2] === 'object') {
										hitObject = arguments[2];
									}
									if (typeof arguments[5] === 'object') {
										Object.assign(hitObject, arguments[5]);
									}
									if ('undefined' !== typeof arguments[1].hitType) {
										hitObject = arguments[1];
										if ('pageview' === hitObject.hitType) {
											hitObject.eventAction = 'page_view';
										}
									}
									if (hitObject) {
										action = 'timing' === arguments[1].hitType ? 'timing_complete' : hitObject.eventAction;
										hitConverted = mapArgs(hitObject);
										__gtagTracker('event', action, hitConverted);
									}
								}
								return;
							}

							function mapArgs(args) {
								var arg, hit = {};
								var gaMap = {
									'eventCategory': 'event_category',
									'eventAction': 'event_action',
									'eventLabel': 'event_label',
									'eventValue': 'event_value',
									'nonInteraction': 'non_interaction',
									'timingCategory': 'event_category',
									'timingVar': 'name',
									'timingValue': 'value',
									'timingLabel': 'event_label',
									'page': 'page_path',
									'location': 'page_location',
									'title': 'page_title',
								};
								for (arg in args) {
																		if (!(!args.hasOwnProperty(arg) || !gaMap.hasOwnProperty(arg))) {
										hit[gaMap[arg]] = args[arg];
									} else {
										hit[arg] = args[arg];
									}
								}
								return hit;
							}

							try {
								f.hitCallback();
							} catch (ex) {
							}
						};
						__gaTracker.create = newtracker;
						__gaTracker.getByName = newtracker;
						__gaTracker.getAll = function () {
							return [];
						};
						__gaTracker.remove = noopfn;
						__gaTracker.loaded = true;
						window['__gaTracker'] = __gaTracker;
					})();
									} else {
										console.log("");
					(function () {
						function __gtagTracker() {
							return null;
						}

						window['__gtagTracker'] = __gtagTracker;
						window['gtag'] = __gtagTracker;
					})();
									}
			</script>
<!-- / Google Analytics by MonsterInsights -->
<script type="text/javascript">
window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/14.0.0\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/14.0.0\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/elecvery.com\/wp-includes\/js\/wp-emoji-release.min.js"}};
/*! This file is auto-generated */
!function(e,a,t){var n,r,o,i=a.createElement("canvas"),p=i.getContext&&i.getContext("2d");function s(e,t){var a=String.fromCharCode,e=(p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,e),0,0),i.toDataURL());return p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,t),0,0),e===i.toDataURL()}function c(e){var t=a.createElement("script");t.src=e,t.defer=t.type="text/javascript",a.getElementsByTagName("head")[0].appendChild(t)}for(o=Array("flag","emoji"),t.supports={everything:!0,everythingExceptFlag:!0},r=0;r<o.length;r++)t.supports[o[r]]=function(e){if(p&&p.fillText)switch(p.textBaseline="top",p.font="600 32px Arial",e){case"flag":return s([127987,65039,8205,9895,65039],[127987,65039,8203,9895,65039])?!1:!s([55356,56826,55356,56819],[55356,56826,8203,55356,56819])&&!s([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]);case"emoji":return!s([129777,127995,8205,129778,127999],[129777,127995,8203,129778,127999])}return!1}(o[r]),t.supports.everything=t.supports.everything&&t.supports[o[r]],"flag"!==o[r]&&(t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&t.supports[o[r]]);t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&!t.supports.flag,t.DOMReady=!1,t.readyCallback=function(){t.DOMReady=!0},t.supports.everything||(n=function(){t.readyCallback()},a.addEventListener?(a.addEventListener("DOMContentLoaded",n,!1),e.addEventListener("load",n,!1)):(e.attachEvent("onload",n),a.attachEvent("onreadystatechange",function(){"complete"===a.readyState&&t.readyCallback()})),(e=t.source||{}).concatemoji?c(e.concatemoji):e.wpemoji&&e.twemoji&&(c(e.twemoji),c(e.wpemoji)))}(window,document,window._wpemojiSettings);
</script>
<style type="text/css">

</style>
<link rel='stylesheet' id='wp-block-library-css'
	href='https://elecvery.com/wp-includes/css/dist/block-library/style.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='classic-theme-styles-css'
	href='https://elecvery.com/wp-includes/css/classic-themes.min.css'
	type='text/css' media='all' />
<style id='global-styles-inline-css' type='text/css'>
body { -
	-wp--preset--color--black: #000000; -
	-wp--preset--color--cyan-bluish-gray: #abb8c3; -
	-wp--preset--color--pale-pink: #f78da7; -
	-wp--preset--color--vivid-red: #cf2e2e; -
	-wp--preset--color--luminous-vivid-orange: #ff6900; -
	-wp--preset--color--luminous-vivid-amber: #fcb900; -
	-wp--preset--color--light-green-cyan: #7bdcb5; -
	-wp--preset--color--vivid-green-cyan: #00d084; -
	-wp--preset--color--pale-cyan-blue: #8ed1fc; -
	-wp--preset--color--vivid-cyan-blue: #0693e3; -
	-wp--preset--color--vivid-purple: #9b51e0; -
	-wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg, rgba(6, 147, 227, 1)
		0%, rgb(155, 81, 224) 100%); -
	-wp--preset--gradient--light-green-cyan-to-vivid-green-cyan:
		linear-gradient(135deg, rgb(122, 220, 180) 0%, rgb(0, 208, 130) 100%);
	-
	-wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange:
		linear-gradient(135deg, rgba(252, 185, 0, 1) 0%, rgba(255, 105, 0, 1)
		100%); -
	-wp--preset--gradient--luminous-vivid-orange-to-vivid-red:
		linear-gradient(135deg, rgba(255, 105, 0, 1) 0%, rgb(207, 46, 46) 100%);
	-
	-wp--preset--gradient--very-light-gray-to-cyan-bluish-gray:
		linear-gradient(135deg, rgb(238, 238, 238) 0%, rgb(169, 184, 195) 100%);
	-
	-wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg, rgb(74, 234, 220)
		0%, rgb(151, 120, 209) 20%, rgb(207, 42, 186) 40%, rgb(238, 44, 130)
		60%, rgb(251, 105, 98) 80%, rgb(254, 248, 76) 100%); -
	-wp--preset--gradient--blush-light-purple: linear-gradient(135deg, rgb(255, 206, 236)
		0%, rgb(152, 150, 240) 100%); -
	-wp--preset--gradient--blush-bordeaux: linear-gradient(135deg, rgb(254, 205, 165)
		0%, rgb(254, 45, 45) 50%, rgb(107, 0, 62) 100%); -
	-wp--preset--gradient--luminous-dusk: linear-gradient(135deg, rgb(255, 203, 112)
		0%, rgb(199, 81, 192) 50%, rgb(65, 88, 208) 100%); -
	-wp--preset--gradient--pale-ocean: linear-gradient(135deg, rgb(255, 245, 203)
		0%, rgb(182, 227, 212) 50%, rgb(51, 167, 181) 100%); -
	-wp--preset--gradient--electric-grass: linear-gradient(135deg, rgb(202, 248, 128)
		0%, rgb(113, 206, 126) 100%); -
	-wp--preset--gradient--midnight: linear-gradient(135deg, rgb(2, 3, 129)
		0%, rgb(40, 116, 252) 100%); -
	-wp--preset--duotone--dark-grayscale: url('#wp-duotone-dark-grayscale');
	-
	-wp--preset--duotone--grayscale: url('#wp-duotone-grayscale'); -
	-wp--preset--duotone--purple-yellow: url('#wp-duotone-purple-yellow');
	-
	-wp--preset--duotone--blue-red: url('#wp-duotone-blue-red'); -
	-wp--preset--duotone--midnight: url('#wp-duotone-midnight'); -
	-wp--preset--duotone--magenta-yellow: url('#wp-duotone-magenta-yellow');
	-
	-wp--preset--duotone--purple-green: url('#wp-duotone-purple-green'); -
	-wp--preset--duotone--blue-orange: url('#wp-duotone-blue-orange'); -
	-wp--preset--font-size--small: 13px; -
	-wp--preset--font-size--medium: 20px; -
	-wp--preset--font-size--large: 36px; -
	-wp--preset--font-size--x-large: 42px; -
	-wp--preset--spacing--20: 0.44rem; -
	-wp--preset--spacing--30: 0.67rem; -
	-wp--preset--spacing--40: 1rem; -
	-wp--preset--spacing--50: 1.5rem; -
	-wp--preset--spacing--60: 2.25rem; -
	-wp--preset--spacing--70: 3.38rem; -
	-wp--preset--spacing--80: 5.06rem;
	background-color: transparent;
}

:where(.is-layout-flex) {
	gap: 0.5em;
}

body .is-layout-flow>.alignleft {
	float: left;
	margin-inline-start: 0;
	margin-inline-end: 2em;
}

body .is-layout-flow>.alignright {
	float: right;
	margin-inline-start: 2em;
	margin-inline-end: 0;
}

body .is-layout-flow>.aligncenter {
	margin-left: auto !important;
	margin-right: auto !important;
}

body .is-layout-constrained>.alignleft {
	float: left;
	margin-inline-start: 0;
	margin-inline-end: 2em;
}

body .is-layout-constrained>.alignright {
	float: right;
	margin-inline-start: 2em;
	margin-inline-end: 0;
}

body .is-layout-constrained>.aligncenter {
	margin-left: auto !important;
	margin-right: auto !important;
}

body .is-layout-constrained>:where(:not(.alignleft):not(.alignright):not(.alignfull))
	{
	max-width: var(- -wp--style--global--content-size);
	margin-left: auto !important;
	margin-right: auto !important;
}

body .is-layout-constrained>.alignwide {
	max-width: var(- -wp--style--global--wide-size);
}

body .is-layout-flex {
	display: flex;
}

body .is-layout-flex {
	flex-wrap: wrap;
	align-items: center;
}

body .is-layout-flex>* {
	margin: 0;
}

:where(.wp-block-columns.is-layout-flex) {
	gap: 2em;
}

.wp-block-pullquote {
	font-size: 1.5em;
	line-height: 1.6;
}
</style>
<link rel='stylesheet' id='formcraft-common-css'
	href='https://elecvery.com/wp-content/plugins/formcraft3/dist/formcraft-common.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='formcraft-form-css'
	href='https://elecvery.com/wp-content/plugins/formcraft3/dist/form.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='wp-user-profile-avatar-frontend-css'
	href='https://elecvery.com/wp-content/plugins/wp-user-profile-avatar/assets/css/frontend.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='font-awesome-css'
	href='https://elecvery.com/wp-content/themes/salient/css/font-awesome-legacy.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='salient-grid-system-css'
	href='https://elecvery.com/wp-content/themes/salient/css/build/grid-system.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='main-styles-css'
	href='https://elecvery.com/wp-content/themes/salient/css/build/style.css'
	type='text/css' media='all' />
<style id='main-styles-inline-css' type='text/css'>
html body[data-header-resize="1"] .container-wrap, html body[data-header-format="left-header"][data-header-resize="0"] .container-wrap,
	html body[data-header-resize="0"] .container-wrap, body[data-header-format="left-header"][data-header-resize="0"] .container-wrap
	{
	padding-top: 0;
}

.main-content>.row>#breadcrumbs.yoast {
	padding: 20px 0;
}
</style>
<link rel='stylesheet' id='nectar-header-layout-centered-menu-css'
	href='https://elecvery.com/wp-content/themes/salient/css/build/header/header-layout-centered-menu.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='nectar_default_font_open_sans-css'
	href='https://fonts.googleapis.com/css?family=Open+Sans%3A300%2C400%2C600%2C700&#038;subset=latin%2Clatin-ext'
	type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css'
	href='https://elecvery.com/wp-content/themes/salient/css/build/responsive.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='skin-material-css'
	href='https://elecvery.com/wp-content/themes/salient/css/build/skin-material.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='salient-wp-menu-dynamic-css'
	href='https://elecvery.com/wp-content/uploads/salient/menu-dynamic.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='js_composer_front-css'
	href='https://elecvery.com/wp-content/plugins/js_composer_salient/assets/css/js_composer.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='dynamic-css-css'
	href='https://elecvery.com/wp-content/themes/salient/css/salient-dynamic-styles.css'
	type='text/css' media='all' />
<style id='dynamic-css-inline-css' type='text/css'>
.no-rgba #header-space {
	display: none;
}

@media only screen and (max-width:999px) {
	body #header-space[data-header-mobile-fixed="1"] {
		display: none;
	}
	#header-outer[data-mobile-fixed="false"] {
		position: absolute;
	}
}

@media only screen and (max-width:999px) {
	body:not(.nectar-no-flex-height) #header-space[data-secondary-header-display="full"]:not([data-header-mobile-fixed="false"])
		{
		display: block !important;
		margin-bottom: -68px;
	}
	#header-space[data-secondary-header-display="full"][data-header-mobile-fixed="false"]
		{
		display: none;
	}
}

@media only screen and (min-width:1000px) {
	#header-space {
		display: none;
	}
	.nectar-slider-wrap.first-section, .parallax_slider_outer.first-section,
		.full-width-content.first-section, .parallax_slider_outer.first-section .swiper-slide .content,
		.nectar-slider-wrap.first-section .swiper-slide .content,
		#page-header-bg, .nder-page-header, #page-header-wrap,
		.full-width-section.first-section {
		margin-top: 0 !important;
	}
	body #page-header-bg, body #page-header-wrap {
		height: 110px;
	}
	body #search-outer {
		z-index: 100000;
	}
}

@media only screen and (min-width:1000px) {
	#page-header-wrap.fullscreen-header, #page-header-wrap.fullscreen-header #page-header-bg,
		html:not(.nectar-box-roll-loaded) .nectar-box-roll>#page-header-bg.fullscreen-header,
		.nectar_fullscreen_zoom_recent_projects, #nectar_fullscreen_rows:not(.afterLoaded)>div
		{
		height: 100vh;
	}
	.wpb_row.vc_row-o-full-height.top-level, .wpb_row.vc_row-o-full-height.top-level>.col.span_12
		{
		min-height: 100vh;
	}
	#page-header-bg[data-alignment-v="middle"] .span_6 .inner-wrap,
		#page-header-bg[data-alignment-v="top"] .span_6 .inner-wrap {
		padding-top: 80px;
	}
	.nectar-slider-wrap[data-fullscreen="true"]:not(.loaded),
		.nectar-slider-wrap[data-fullscreen="true"]:not(.loaded) .swiper-container
		{
		height: calc(100vh + 2px) !important;
	}
	.admin-bar .nectar-slider-wrap[data-fullscreen="true"]:not(.loaded),
		.admin-bar .nectar-slider-wrap[data-fullscreen="true"]:not(.loaded) .swiper-container
		{
		height: calc(100vh - 30px) !important;
	}
}

@media only screen and (max-width:999px) {
	#page-header-bg[data-alignment-v="middle"]:not(.fullscreen-header) .span_6 .inner-wrap,
		#page-header-bg[data-alignment-v="top"] .span_6 .inner-wrap {
		padding-top: 52px;
	}
	.vc_row.top-level.full-width-section:not(.full-width-ns)>.span_12,
		#page-header-bg[data-alignment-v="bottom"] .span_6 .inner-wrap {
		padding-top: 42px;
	}
}

@media only screen and (max-width:690px) {
	.vc_row.top-level.full-width-section:not(.full-width-ns)>.span_12 {
		padding-top: 52px;
	}
	.vc_row.top-level.full-width-content .nectar-recent-posts-single_featured .recent-post-container>.inner-wrap
		{
		padding-top: 42px;
	}
}

@media only screen and (max-width:999px) {
	.full-width-ns .nectar-slider-wrap .swiper-slide[data-y-pos="middle"] .content,
		.full-width-ns .nectar-slider-wrap .swiper-slide[data-y-pos="top"] .content
		{
		padding-top: 30px;
	}
}

@media only screen and (max-width:999px) {
	.using-mobile-browser #nectar_fullscreen_rows:not(.afterLoaded):not([data-mobile-disable="on"])>div
		{
		height: calc(100vh - 76px);
	}
	.using-mobile-browser .wpb_row.vc_row-o-full-height.top-level,
		.using-mobile-browser .wpb_row.vc_row-o-full-height.top-level>.col.span_12,
		[data-permanent-transparent="1"].using-mobile-browser .wpb_row.vc_row-o-full-height.top-level,
		[data-permanent-transparent="1"].using-mobile-browser .wpb_row.vc_row-o-full-height.top-level>.col.span_12
		{
		min-height: calc(100vh - 76px);
	}
	html:not(.nectar-box-roll-loaded) .nectar-box-roll>#page-header-bg.fullscreen-header,
		.nectar_fullscreen_zoom_recent_projects, .nectar-slider-wrap[data-fullscreen="true"]:not(.loaded),
		.nectar-slider-wrap[data-fullscreen="true"]:not(.loaded) .swiper-container,
		#nectar_fullscreen_rows:not(.afterLoaded):not([data-mobile-disable="on"])>div
		{
		height: calc(100vh - 1px);
	}
	.wpb_row.vc_row-o-full-height.top-level, .wpb_row.vc_row-o-full-height.top-level>.col.span_12
		{
		min-height: calc(100vh - 1px);
	}
	body[data-transparent-header="false"] #ajax-content-wrap.no-scroll {
		min-height: calc(100vh - 1px);
		height: calc(100vh - 1px);
	}
}

#nectar_fullscreen_rows {
	background-color: transparent;
}

@media only screen and (max-width:999px) {
	.vc_row.top_padding_tablet_13pct {
		padding-top: 13% !important;
	}
}

@media only screen and (min-width:1000px) {
	.nectar-split-heading[data-custom-font-size="true"] h1,
		.nectar-split-heading[data-custom-font-size="true"] h2, .row .nectar-split-heading[data-custom-font-size="true"] h3,
		.row .nectar-split-heading[data-custom-font-size="true"] h4, .row .nectar-split-heading[data-custom-font-size="true"] h5,
		.row .nectar-split-heading[data-custom-font-size="true"] h6, .row .nectar-split-heading[data-custom-font-size="true"] i
		{
		font-size: inherit;
		line-height: inherit;
	}
}

@media only screen and (max-width:999px) {
	body .nectar-cta.font_size_tablet_16px, body .nectar-cta.font_size_tablet_16px *
		{
		font-size: 16px;
		line-height: 1.1;
	}
}

.nectar-cta.font_size_desktop_16px, .nectar-cta.font_size_desktop_16px *
	{
	font-size: 16px;
	line-height: 1.1;
}

@media only screen and (max-width:999px) {
	.nectar-cta.display_tablet_inherit {
		display: inherit;
	}
}

@media only screen and (max-width:999px) {
	.nectar-split-heading.font_size_tablet_21px {
		font-size: 21px !important;
		line-height: 25.2px !important;
	}
	.nectar-split-heading.font_size_tablet_21px * {
		font-size: inherit !important;
		line-height: inherit !important;
	}
}

@media only screen and (max-width:999px) {
	.nectar-split-heading.font_size_tablet_24px {
		font-size: 24px !important;
		line-height: 28.8px !important;
	}
	.nectar-split-heading.font_size_tablet_24px * {
		font-size: inherit !important;
		line-height: inherit !important;
	}
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-align="left"]
	{
	display: flex;
	justify-content: flex-start;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-align="center"]
	{
	display: flex;
	justify-content: center;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-align="right"]
	{
	display: flex;
	justify-content: flex-end;
}

@media only screen and (max-width:1000px) {
	.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-m-align="left"]
		{
		display: flex;
		justify-content: flex-start;
	}
	.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-m-align="center"]
		{
		display: flex;
		justify-content: center;
	}
	.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-m-align="right"]
		{
		display: flex;
		justify-content: flex-end;
	}
}

@media only screen and ( max-width:1000px ) {
	.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-m-rm-animation="true"] span .inner
		{
		-webkit-transform: none;
		transform: none !important;
		opacity: 1;
	}
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-text-effect="letter-reveal-bottom"]>*>span
	{
	padding: 0 .05em;
	margin: 0 -0.05em;
}

.centered-text .nectar-split-heading[data-animation-type="line-reveal-by-space"] h1,
	.centered-text .nectar-split-heading[data-animation-type="line-reveal-by-space"] h2,
	.centered-text .nectar-split-heading[data-animation-type="line-reveal-by-space"] h3,
	.centered-text .nectar-split-heading[data-animation-type="line-reveal-by-space"] h4
	{
	margin: 0 auto;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"]:not(.markup-generated)
	{
	opacity: 0;
}

@media only screen and (max-width:999px) {
	.nectar-split-heading[data-m-rm-animation="true"] {
		opacity: 1 !important;
	}
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"]>*>span
	{
	position: relative;
	display: inline-block;
	overflow: hidden;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"] span {
	vertical-align: bottom;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"] span,
	.nectar-split-heading[data-animation-type="line-reveal-by-space"]:not(.markup-generated)>*
	{
	line-height: 1.2;
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"][data-stagger="true"]:not([data-text-effect*="letter-reveal"]) span .inner
	{
	transition: transform 1.2s cubic-bezier(0.25, 1, 0.5, 1), opacity 1.2s
		cubic-bezier(0.25, 1, 0.5, 1);
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"] span .inner
	{
	position: relative;
	display: inline-block;
	-webkit-transform: translateY(1.3em);
	transform: translateY(1.3em);
}

.nectar-split-heading[data-animation-type="line-reveal-by-space"] span .inner.animated
	{
	-webkit-transform: none;
	transform: none;
	opacity: 1;
}

@media only screen and (max-width:999px) {
	.nectar-split-heading.font_size_tablet_28px {
		font-size: 28px !important;
		line-height: 33.6px !important;
	}
	.nectar-split-heading.font_size_tablet_28px * {
		font-size: inherit !important;
		line-height: inherit !important;
	}
}

.nectar-split-heading .heading-line {
	display: block;
	overflow: hidden;
	position: relative
}

.nectar-split-heading .heading-line>div {
	display: block;
	transform: translateY(200%);
	-webkit-transform: translateY(200%)
}

.nectar-split-heading h1 {
	margin-bottom: 0
}

.wpb_column[data-cfc="true"] h1, .wpb_column[data-cfc="true"] h2,
	.wpb_column[data-cfc="true"] h3, .wpb_column[data-cfc="true"] h4,
	.wpb_column[data-cfc="true"] h5, .wpb_column[data-cfc="true"] h6,
	.wpb_column[data-cfc="true"] p {
	color: inherit
}

.wpb_column.column_position_static, .wpb_column.column_position_static>.vc_column-inner
	{
	position: static;
}

body .container-wrap .wpb_row[data-column-margin="none"]:not(.full-width-section):not(.full-width-content)
	{
	margin-bottom: 0;
}

body .container-wrap .vc_row-fluid[data-column-margin="none"]>.span_12,
	body .container-wrap .vc_row-fluid[data-column-margin="none"] .full-page-inner>.container>.span_12,
	body .container-wrap .vc_row-fluid[data-column-margin="none"] .full-page-inner>.span_12
	{
	margin-left: 0;
	margin-right: 0;
}

body .container-wrap .vc_row-fluid[data-column-margin="none"] .wpb_column:not(.child_column),
	body .container-wrap .inner_row[data-column-margin="none"] .child_column
	{
	padding-left: 0;
	padding-right: 0;
}

@media only screen and (max-width:999px) {
	.wpb_row.reverse_columns_row_tablet .row_col_wrap_12, .wpb_row.inner_row.reverse_columns_row_tablet .row_col_wrap_12_inner
		{
		flex-direction: row-reverse;
	}
	.wpb_row.reverse_columns_column_tablet .row_col_wrap_12, .wpb_row.inner_row.reverse_columns_column_tablet .row_col_wrap_12_inner
		{
		flex-direction: column-reverse;
	}
	.wpb_row.reverse_columns_column_tablet:not([data-column-margin="none"]):not(.full-width-content)>.row_col_wrap_12>.wpb_column:last-of-type,
		.wpb_row:not(.full-width-content) .wpb_row.inner_row:not([data-column-margin="none"]).reverse_columns_column_tablet .row_col_wrap_12_inner>.wpb_column:last-of-type
		{
		margin-bottom: 25px;
	}
	.wpb_row.reverse_columns_column_tablet:not([data-column-margin="none"]):not(.full-width-content)>.row_col_wrap_12>.wpb_column:first-of-type,
		.wpb_row:not(.full-width-content) .wpb_row.inner_row:not([data-column-margin="none"]).reverse_columns_column_tablet .row_col_wrap_12_inner>.wpb_column:first-of-type
		{
		margin-bottom: 0;
	}
}

@media only screen and (max-width:999px) {
	.vc_row.bottom_padding_tablet_5pct {
		padding-bottom: 5% !important;
	}
}

@media only screen and (max-width:999px) {
	.vc_row.top_padding_tablet_5pct {
		padding-top: 5% !important;
	}
}

@media only screen and (max-width:690px) {
	body .nectar-cta.font_size_phone_15px, body .nectar-cta.font_size_phone_15px *
		{
		font-size: 15px;
		line-height: 1.1;
	}
}

@media only screen and (max-width:690px) {
	.nectar-cta.display_phone_inherit {
		display: inherit;
	}
}

@media only screen and (max-width:690px) {
	.vc_row.top_padding_phone_40px {
		padding-top: 40px !important;
	}
}

@media only screen and (max-width:690px) {
	.nectar-split-heading.font_size_phone_19px {
		font-size: 19px !important;
		line-height: 22.8px !important;
	}
	.nectar-split-heading.font_size_phone_19px * {
		font-size: inherit !important;
		line-height: inherit !important;
	}
}

@media only screen and (max-width:690px) {
	.vc_row.bottom_padding_phone_40px {
		padding-bottom: 40px !important;
	}
}

@media only screen and (max-width:690px) {
	.wpb_row.reverse_columns_row_phone .row_col_wrap_12, .wpb_row.inner_row.reverse_columns_row_phone .row_col_wrap_12_inner
		{
		flex-direction: row-reverse;
	}
	.wpb_row.reverse_columns_column_phone .row_col_wrap_12, .wpb_row.inner_row.reverse_columns_column_phone .row_col_wrap_12_inner
		{
		flex-direction: column-reverse;
	}
	.wpb_row.reverse_columns_column_phone:not([data-column-margin="none"]):not(.full-width-content)>.row_col_wrap_12>.wpb_column:last-of-type,
		.wpb_row:not(.full-width-content) .wpb_row.inner_row:not([data-column-margin="none"]).reverse_columns_column_phone .row_col_wrap_12_inner>.wpb_column:last-of-type
		{
		margin-bottom: 25px;
	}
	.wpb_row.reverse_columns_column_phone:not([data-column-margin="none"]):not(.full-width-content)>.row_col_wrap_12>.wpb_column:first-of-type,
		.wpb_row:not(.full-width-content) .wpb_row.inner_row:not([data-column-margin="none"]).reverse_columns_column_phone .row_col_wrap_12_inner>.wpb_column:first-of-type
		{
		margin-bottom: 0;
	}
}

@media only screen and (max-width:690px) {
	.nectar-split-heading.font_size_phone_22px {
		font-size: 22px !important;
		line-height: 26.4px !important;
	}
	.nectar-split-heading.font_size_phone_22px * {
		font-size: inherit !important;
		line-height: inherit !important;
	}
}

@media only screen and (max-width:690px) {
	.vc_row.top_padding_phone_50px {
		padding-top: 50px !important;
	}
}

.screen-reader-text, .nectar-skip-to-content:not(:focus) {
	border: 0;
	clip: rect(1px, 1px, 1px, 1px);
	clip-path: inset(50%);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute !important;
	width: 1px;
	word-wrap: normal !important;
}

.row .col img:not([srcset]) {
	width: auto;
}

.row .col img.img-with-animation.nectar-lazy:not([srcset]) {
	width: 100%;
}
/*
Theme Name: Salient Child Theme
Description: This is a custom child theme for Salient
Theme URI:   https://themeforest.net/item/salient-responsive-multipurpose-theme/4363266
Author: ThemeNectar
Author URI:  https://themeforest.net/user/themenectar
Template: salient
Version: 1.0
*/
/* body, h1, h2, h3, h4, h5, h6, p, a, div, th, td, label, textarea, input,
	table, table th, dt, li {
	font-family: 'Noto Sans KR', '맑은고딕', 'Open Sans', 'Arial', 'Dotum',
		sans-serif;
} */
ul li {
	list-style: none;
}

ul {
	-webkit-padding-start: 0;
	margin: 0
}

a:hover {
	text-decoration: none !important;
}

/*공통*/
.pd-top {
	padding-top: 70px;
}

.pd-bottom {
	padding-bottom: 70px;
}

.fw_300 {
	font-weight: 300
}

.fw_400 {
	font-weight: 400
}

.fw_600 {
	font-weight: 600
}

.fw_700 {
	font-weight: 700
}

.m_color {
	color: #444444 !important
}

.fs_14 {
	font-size: 14px;
}

.fs_15 {
	font-size: 15px;
}

.fs_16 {
	font-size: 16px
}

.fs_18 {
	font-size: 18px;
}

.fs_20 {
	font-size: 20px
}

.fs_22 {
	font-size: 22px
}

.tx_align {
	text-align: center
}

.fc_w {
	color: #fff
}

.cl_bk {
	color: #181818
}

.sf-menu>li ul {
	width: 15em !important
}

#header-outer.transparent #top nav>ul>li>a, #header-outer.transparent #top nav>.sf-menu>li>a
	{
	opacity: 1 !important
}

.sub_stit p {
	color: #444444 !important;
	font-size: 22px;
	font-weight: 600;
	letter-spacing: 1px;
	font-family: 'Poppins'
}

.sub_visual_wrap h1 {
	font-size: 38px;
	font-weight: 500;
	font-family: 'Noto Sans KR' !important;
	letter-spacing: -0.07em;
	line-height: 1.4em
}

.history_dl dt {
	font-size: 19px;
	width: 60px;
	float: left
}

.history_dl dd {
	font-size: 17px;
}

.nectar-next-section-wrap.minimal-arrow svg {
	width: 35px
}

#author-bio, .comments-section {
	display: none;
}

/*메인 슬라이드*/
.slide_mobile {
	display: none;
}

.article-content-wrap .excerpt {
	font-size: 16px;
	line-height: 26px;
	color: #555
}

.entry-title {
	font-size: 26px !important
}

.heading-title[data-header-style="default_minimal"] #single-below-header span
	{
	font-size: 15px !important
}

.basic_list li {
	padding-left: 12px;
	position: relative;
	margin-left: 5px;
	padding-bottom: 7px;
}

.basic_list li:before {
	position: absolute;
	left: 0;
	top: 13px;
	width: 4px;
	height: 4px;
	border-radius: 100px;
	background: #444444;
	content: ''
}

.jd_title {
	font-size: 20px !important;
	color: #444444;
	border-bottom: 2px solid #444444;
	padding-bottom: 15px;
	margin: 20px 0 !important
}

.service_left_menu .widget_nav_menu li {
	float: none;
}

.material .main-content .service_left_menu .widget li a {
	font-family: 'Noto Sans KR' !important;
	font-size: 17px !important;
	padding: 12px 20px 12px 15px !important;
	display: block;
	font-weight: 400;
	letter-spacing: -0.7px;
	border-left: 4px solid #c1c1c1;
	color: #555;
	margin-top: -1px
}

.service_left_menu .widget_nav_menu li.current-menu-item {
	border-bottom: none
}

.service_left_menu .widget_nav_menu li.current-menu-item a {
	color: #7a003b !important;
	font-weight: 700 !important;
	border-left: 4px solid #7a003b !important;
}

/* 테이블 색깔 */
table th {
	font-size: 16px;
	font-weight: 600 !important;
	text-align: center !important;
	border: 1px solid #F37321 !important;
	color: #F37321;
}

table td {
	font-size: 16px !important;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #bebebe !important
}

.nectar-hor-list-item .nectar-list-item {
	font-size: 16px;
}

body div[data-style*=minimal] .toggle h3 a, body div[data-style*=minimal] .toggle.open h3 a
	{
	font-family: 'Noto Sans KR';
	font-weight: 500;
	font-size: 20px
}

.gs_icon {
	background-position: center left;
	background-repeat: no-repeat;
	background-size: 30px;
	padding: 5px 0 5px 35px
}

.gs_icon.android {
	background-image: url('/wp-content/uploads/2022/07/icon1.png')
}

.gs_icon.ios {
	background-image: url('/wp-content/uploads/2022/07/icon2.png')
}



/*브랜드*/
.brand_reveal_wrap .row-bg {
	background-size: auto !important
}

.brand_reveal_wrap h2 {
	font-size: 30px;
	font-weight: 600 !important;
	line-height: 1.5em !important
}

.nectar_team_member_overlay {
	background: #fff
}

.team-member[data-style=bio_fullscreen_alt] .team-meta p {
	font-size: 16px;
	line-height: 1.4em
}

.team-member[data-style=bio_fullscreen_alt] h3 {
	letter-spacing: 0 !important
}

.single-post .container {
	width: 900px;
}

.single.single-post .section-title h1 {
	line-height: 1.5em
}

.down_btn {
	position: fixed;
	right: 30px;
	bottom: 30px;
	z-index: 9999
}

.down_btn li img {
	width: 55px
}

.down_btn li a:hover {
	opacity: 0.8
}

@media only screen and (max-width: 1400px) {
}

@media only screen and (max-width: 1200px) {
}

@media only screen and (max-width: 1025px) {
	.service_left_menu .widget_nav_menu {
		display: block
	}
	.material .main-content .service_left_menu .widget li a {
		font-size: 16px !important;
		padding: 12px 15px 12px 10px !important
	}
	.service_left_menu .widget_nav_menu li {
		float: left;
		width: 33.3%
	}
	.service_left_menu h3 {
		clear: both !important;
		padding-top: 30px !important
	}
	.widget_nav_menu li {
		border-bottom: 1px solid #f1f1f1 !important
	}
	.single-post .container {
		width: 100%;
	}
}

@media only screen and (max-width: 769px) {
	.slide_mobile {
		display: block;
	}
	.slide_desktop {
		display: none;
	}
	.material #header-outer[data-transparent-header=true][data-mobile-fixed="1"].transparent
		{
		padding: 20px 5px !important;
	}
	.logo_wrap {
		width: 100%
	}
	.footer_menu {
		width: 18%
	}
	.footer_menu ul li a {
		font-size: 14px;
	}
	.charging_img {
		width: 350px !important
	}
	.team-member[data-style=bio_fullscreen_alt] .team-member-image {
		display: none
	}
}

@media only screen and (max-width: 767px) {
	.m_only {
		display: block !important
	}
	.d_only {
		display: none !important
	}
	.br_none br {
		display: none;
	}
	.footer_menu {
		width: 48%;
		margin: 0 0.5%;
		min-height: 150px
	}
	.material #footer-outer #footer-widgets .col ul li {
		padding: 0 !important
	}
	#footer-outer .logo_wrap img {
		width: 90px
	}
	.sub_stit p {
		font-size: 14px !important;
		letter-spacing: 0
	}
	.sub_visual_wrap h1 {
		font-size: 25px;
	}
	.nectar-next-section-wrap.minimal-arrow svg {
		width: 25px
	}
	.charging_img {
		width: 190px !important
	}
	.history_dl dt {
		font-size: 16px;
		width: 30px
	}
	.history_dl dd {
		font-size: 15px;
		padding-left: 30px
	}
	.article-content-wrap h3 {
		font-size: 18px !important
	}
	.brand_reveal_wrap .row-bg {
		background-size: contain !important
	}
}

@media only screen and (max-width: 600px) {
	.service_left_menu .widget_nav_menu li {
		width: 50%
	}
	body .clients[class*=col].no-carousel>div {
		width: 32.6%
	}
	.fs_18 {
		font-size: 15px
	}
	table th, table td {
		font-size: 14px !important
	}
	body div[data-style*=minimal] .toggle h3 a, body div[data-style*=minimal] .toggle.open h3 a
		{
		font-size: 18px
	}
	.footer_desktop {
		display: none;
	}
	.footer_mobile {
		display: block;
	}
	.footer_mobile .footer_menu {
		min-height: 100px;
	}
	.footer_mobile .min {
		min-height: 160px;
	}
	body #footer-outer[data-cols="1"][data-disable-copyright="false"] .row {
		padding-top: 40px;
	}
	.down_btn {
		right: 15px;
		bottom: 30px;
	}
	.down_btn li img {
		width: 45px
	}
}
</style>
<link rel='stylesheet' id='salient-child-style-css'
	href='https://elecvery.com/wp-content/themes/salient-child/style.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='redux-google-fonts-salient_redux-css'
	href='https://fonts.googleapis.com/css?family=Montserrat%3A500%7CPoppins%3A400%7CNoto+Sans+KR%3A400&#038;subset=latin%2Ckorean'
	type='text/css' media='all' />
<script type='text/javascript'
	src='https://elecvery.com/wp-content/plugins/google-analytics-for-wordpress/assets/js/frontend-gtag.min.js'
	id='monsterinsights-frontend-script-js'></script>
<script data-cfasync="false" data-wpfc-render="false"
	type="text/javascript" id='monsterinsights-frontend-script-js-extra'>/* <![CDATA[ */
var monsterinsights_frontend = {"js_events_tracking":"true","download_extensions":"doc,pdf,ppt,zip,xls,docx,pptx,xlsx","inbound_paths":"[{\"path\":\"\\\/go\\\/\",\"label\":\"affiliate\"},{\"path\":\"\\\/recommend\\\/\",\"label\":\"affiliate\"}]","home_url":"https:\/\/elecvery.com","hash_tracking":"false","ua":"UA-216468562-1","v4_id":""};/* ]]> */
</script>
<script type='text/javascript'
	src='https://elecvery.com/wp-includes/js/jquery/jquery.min.js'
	id='jquery-core-js'></script>
<script type='text/javascript'
	src='https://elecvery.com/wp-includes/js/jquery/jquery-migrate.min.js'
	id='jquery-migrate-js'></script>

<!-- Google Analytics snippet added by Site Kit -->
<script type='text/javascript'
	src='https://www.googletagmanager.com/gtag/js?id=UA-201400971-1'
	id='google_gtagjs-js' async></script>
<script type='text/javascript' id='google_gtagjs-js-after'>
window.dataLayer = window.dataLayer || [];function gtag(){dataLayer.push(arguments);}
gtag('set', 'linker', {"domains":["elecvery.com"]} );
gtag("js", new Date());
gtag("set", "developer_id.dZTNiMT", true);
gtag("config", "UA-201400971-1", {"anonymize_ip":true});
</script>

<!-- End Google Analytics snippet added by Site Kit -->
<link rel="https://api.w.org/" href="https://elecvery.com/wp-json/" />
<link rel="alternate" type="application/json"
	href="https://elecvery.com/wp-json/wp/v2/pages/46" />
<link rel="EditURI" type="application/rsd+xml" title="RSD"
	href="https://elecvery.com/xmlrpc.php?rsd" />
<link rel='shortlink' href='https://elecvery.com/?p=46' />
<link rel="alternate" type="application/json+oembed"
	href="https://elecvery.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Felecvery.com%2Fcharge_cost%2F" />
<link rel="alternate" type="text/xml+oembed"
	href="https://elecvery.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Felecvery.com%2Fcharge_cost%2F&#038;format=xml" />
<meta name="generator" content="Site Kit by Google 1.85.0" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,500,700&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700&subset=korean"
	rel="stylesheet">

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-K7VTWV8');</script>
<!-- End Google Tag Manager -->

<title>전기차 충전</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-216468562-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-216468562-1');
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-6H308J2QHF"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-6H308J2QHF');
  gtag('config', 'AW-10782263914');
</script>

<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '660738975127471');
  fbq('track', 'PageView');
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=660738975127471&ev=PageView&noscript=1" />
</noscript>
<!-- End Facebook Pixel Code -->

<meta name="facebook-domain-verification"
	content="g2g4ciw5r2vbe0b9fu2r2bcjxz02g7" />

<script>
(function(a_,i_,r_,_b,_r,_i,_d,_g,_e){if(!a_[_b]){var d={queue:[]};_r.concat(_i).forEach(function(a){var i_=a.split("."),a_=i_.pop();i_.reduce(function(a,i_){return a[i_]=a[i_]||{}},d)[a_]=function(){d.queue.push([a,arguments])}});a_[_b]=d;a_=i_.getElementsByTagName(r_)[0];i_=i_.createElement(r_);i_.onerror=function(){d.queue.filter(function(a){return 0<=_i.indexOf(a[0])}).forEach(function(a){a=a[1];a=a[a.length-1];"function"===typeof a&&a("error occur when load airbridge")})};i_.async=1;i_.src="//static.airbridge.io/sdk/latest/airbridge.min.js";a_.parentNode.insertBefore(i_,a_)}})(window,document,"script","airbridge","init fetchResource setBanner setDownload setDownloads setDeeplinks sendWeb setUserAgent setUserAlias addUserAlias setMobileAppData setUserId setUserEmail setUserPhone setUserAttributes clearUser setDeviceIFV setDeviceIFA setDeviceGAID events.send events.signIn events.signUp events.signOut events.purchased events.addedToCart events.productDetailsViewEvent events.homeViewEvent events.productListViewEvent events.searchResultViewEvent".split(" "),["events.wait"]);

airbridge.init({
    app: 'elecvery',
    webToken: '5f17164c878948b69a41f1dce142a1d7',
    useProtectedAttributionWindow: true
});
</script>
<script type="text/javascript"> var root = document.getElementsByTagName( "html" )[0]; root.setAttribute( "class", "js" ); </script>
<meta name="generator"
	content="Powered by WPBakery Page Builder - drag and drop page builder for WordPress." />
<meta name="generator"
	content="Powered by Slider Revolution 6.5.31 - responsive, Mobile-Friendly Slider Plugin for WordPress with comfortable drag and drop interface." />
<link rel="icon"
	href="https://elecvery.com/wp-content/uploads/2021/06/cropped-LogoDesign-FileExport-Guide-RGB-DIGITALFILES_Logo-Mark-Only-Vertical-32x32.png"
	sizes="32x32" />
<link rel="icon"
	href="https://elecvery.com/wp-content/uploads/2021/06/cropped-LogoDesign-FileExport-Guide-RGB-DIGITALFILES_Logo-Mark-Only-Vertical-192x192.png"
	sizes="192x192" />
<link rel="apple-touch-icon"
	href="https://elecvery.com/wp-content/uploads/2021/06/cropped-LogoDesign-FileExport-Guide-RGB-DIGITALFILES_Logo-Mark-Only-Vertical-180x180.png" />
<meta name="msapplication-TileImage"
	content="https://elecvery.com/wp-content/uploads/2021/06/cropped-LogoDesign-FileExport-Guide-RGB-DIGITALFILES_Logo-Mark-Only-Vertical-270x270.png" />
<script>function setREVStartSize(e){
			//window.requestAnimationFrame(function() {
				window.RSIW = window.RSIW===undefined ? window.innerWidth : window.RSIW;
				window.RSIH = window.RSIH===undefined ? window.innerHeight : window.RSIH;
				try {
					var pw = document.getElementById(e.c).parentNode.offsetWidth,
						newh;
					pw = pw===0 || isNaN(pw) || (e.l=="fullwidth" || e.layout=="fullwidth") ? window.RSIW : pw;
					e.tabw = e.tabw===undefined ? 0 : parseInt(e.tabw);
					e.thumbw = e.thumbw===undefined ? 0 : parseInt(e.thumbw);
					e.tabh = e.tabh===undefined ? 0 : parseInt(e.tabh);
					e.thumbh = e.thumbh===undefined ? 0 : parseInt(e.thumbh);
					e.tabhide = e.tabhide===undefined ? 0 : parseInt(e.tabhide);
					e.thumbhide = e.thumbhide===undefined ? 0 : parseInt(e.thumbhide);
					e.mh = e.mh===undefined || e.mh=="" || e.mh==="auto" ? 0 : parseInt(e.mh,0);
					if(e.layout==="fullscreen" || e.l==="fullscreen")
						newh = Math.max(e.mh,window.RSIH);
					else{
						e.gw = Array.isArray(e.gw) ? e.gw : [e.gw];
						for (var i in e.rl) if (e.gw[i]===undefined || e.gw[i]===0) e.gw[i] = e.gw[i-1];
						e.gh = e.el===undefined || e.el==="" || (Array.isArray(e.el) && e.el.length==0)? e.gh : e.el;
						e.gh = Array.isArray(e.gh) ? e.gh : [e.gh];
						for (var i in e.rl) if (e.gh[i]===undefined || e.gh[i]===0) e.gh[i] = e.gh[i-1];
											
						var nl = new Array(e.rl.length),
							ix = 0,
							sl;
						e.tabw = e.tabhide>=pw ? 0 : e.tabw;
						e.thumbw = e.thumbhide>=pw ? 0 : e.thumbw;
						e.tabh = e.tabhide>=pw ? 0 : e.tabh;
						e.thumbh = e.thumbhide>=pw ? 0 : e.thumbh;
						for (var i in e.rl) nl[i] = e.rl[i]<window.RSIW ? 0 : e.rl[i];
						sl = nl[0];
						for (var i in nl) if (sl>nl[i] && nl[i]>0) { sl = nl[i]; ix=i;}
						var m = pw>(e.gw[ix]+e.tabw+e.thumbw) ? 1 : (pw-(e.tabw+e.thumbw)) / (e.gw[ix]);
						newh =  (e.gh[ix] * m) + (e.tabh + e.thumbh);
					}
					var el = document.getElementById(e.c);
					if (el!==null && el) el.style.height = newh+"px";
					el = document.getElementById(e.c+"_wrapper");
					if (el!==null && el) {
						el.style.height = newh+"px";
						el.style.display = "block";
					}
				} catch(e){
					console.log("Failure at Presize of Slider:" + e)
				}
			//});
		  };</script>
<style type="text/css" id="wp-custom-css">
/* company/news 작성일자 제거 */
.meta-date {
	display: none !important;
}
</style>
<style type="text/css" data-type="vc_shortcodes-custom-css">
.vc_custom_1666017873095 {
	margin-top: -15px !important;
}

.vc_custom_1657546673496 {
	margin-top: -7px !important;
}

.vc_custom_1657547084288 {
	margin-top: -7px !important;
}

.vc_custom_1657547390870 {
	margin-top: -7px !important;
}

.vc_custom_1663658361829 {
	margin-top: -7px !important;
}

.vc_custom_1663659195138 {
	margin-top: -7px !important;
}

.vc_custom_1663659328002 {
	margin-top: -7px !important;
}

.vc_custom_1663659826972 {
	margin-top: -7px !important;
}

.vc_custom_1663659910973 {
	margin-top: -7px !important;
}

.vc_custom_1663659994042 {
	margin-top: -7px !important;
}

.vc_custom_1663660130875 {
	margin-top: -7px !important;
}

.vc_custom_1663660130875 {
	margin-top: -7px !important;
}

.vc_custom_1663660368479 {
	margin-top: -7px !important;
}

.vc_custom_1663661171800 {
	margin-top: -7px !important;
}
</style>
<noscript>
	<style>
.wpb_animate_when_almost_visible {
	opacity: 1;
}
</style>
</noscript>


<style type="text/css">
.navbar a, .navbar a:focus {
	font-weight: 400;
}
</style>


</head>
<body data-rsssl=1
	class="page-template-default page page-id-46 material wpb-js-composer js-comp-ver-6.9.1 vc_responsive"
	data-footer-reveal="false" data-footer-reveal-shadow="none"
	data-header-format="centered-menu" data-body-border="off"
	data-boxed-style="" data-header-breakpoint="1000"
	data-dropdown-style="minimal" data-cae="easeOutCubic" data-cad="750"
	data-megamenu-width="contained" data-aie="none" data-ls="fancybox"
	data-apte="center_mask_reveal" data-hhun="0"
	data-fancy-form-rcs="default" data-form-style="default"
	data-form-submit="regular" data-is="minimal"
	data-button-style="slightly_rounded_shadow"
	data-user-account-button="false" data-flex-cols="true"
	data-col-gap="default" data-header-inherit-rc="false"
	data-header-search="false" data-animated-anchors="true"
	data-ajax-transitions="true" data-full-width-header="true"
	data-slide-out-widget-area="true"
	data-slide-out-widget-area-style="simple" data-user- set-ocm="off"
	data-loading-animation="none" data-bg-header="true" data-responsive="1"
	data-ext-responsive="true" data-ext-padding="70" data-header-resize="1"
	data-header-color="custom" data-cart="false" data-remove-m-parallax=""
	data-remove-m-video-bgs="" data-m-animate="0"
	data-force-header-trans-color="light" data-smooth-scrolling="0"
	data-permanent-transparent="false">

	<script type="text/javascript">
	 (function(window, document) {

		 if(navigator.userAgent.match(/(Android|iPod|iPhone|iPad|BlackBerry|IEMobile|Opera Mini)/)) {
			 document.body.className += " using-mobile-browser mobile ";
		 }

		 if( !("ontouchstart" in window) ) {

			 var body = document.querySelector("body");
			 var winW = window.innerWidth;
			 var bodyW = body.clientWidth;

			 if (winW > bodyW + 4) {
				 body.setAttribute("style", "--scroll-bar-w: " + (winW - bodyW - 4) + "px");
			 } else {
				 body.setAttribute("style", "--scroll-bar-w: 0px");
			 }
		 }

	 })(window, document);
   </script>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K7VTWV8"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_4373b18b9f7d";
if (!_nasa) var _nasa={};
if(window.wcs){
wcs.inflow();
wcs_do(_nasa);
}
</script>

	<!-- ==========================================컨텐츠 내용시작============================================ -->

	<div class="col-lg-10">
		<div class="ocm-effect-wrap-inner"
			style="height: 500px; overflow: auto;">
			<div id="ajax-loading-screen" data-disable-mobile="1"
				data-disable-fade-on-click="0" data-effect="center_mask_reveal"
				data-method="standard">
				<span class="mask-top"></span><span class="mask-right"></span><span
					class="mask-bottom"></span><span class="mask-left"></span>
			</div>
			<div id="header-space" data-header-mobile-fixed='1'></div>

			<div id="header-outer" data-has-menu="true" data-has-buttons="no"
				data-header-button_style="default" data-using-pr-menu="false"
				data-mobile-fixed="1" data-ptnm="false"
				data-lhe="animated_underline" data-user-set-bg=""
				data-format="centered-menu" data-permanent-transparent="false"
				data-megamenu-rt="0" data-remove-fixed="0" data-header-resize="1"
				data-cart="false" data-transparency-option="1"
				data-box-shadow="large" data-shrink-num="6" data-using-secondary="0"
				data-using-logo="1" data-logo-height="50" data-m-logo-height="42"
				data-padding="30" data-full-width="true" data-condense="false"
				data-transparent-header="true"
				data-transparent-shadow-helper="false" data-remove-border="true"
				class="transparent"></div>
			<div id="ajax-content-wrap">
				<div class="container-wrap">
					<div>
						<div>
							<div>
								<div class="row-bg-wrap" data-bg-animation="zoom-out"
									data-bg-animation-delay="" data-bg-overlay="true">
									<div class="inner-wrap row-bg-layer using-image">
										<div class="row-bg viewport-desktop using-image"
											data-parallax-speed="slow"
											style="background-image: url(https://elecvery.com/wp-content/uploads/2022/09/sub_visual11.jpg); background-position: center center; background-repeat: no-repeat;"></div>
									</div>
									<div class="row-bg-overlay row-bg-layer"
										style="background-color: #0a0a0a; opacity: 0.5;"></div>
								</div>
							</div>
							<div>
								<div class="row_col_wrap_12 col span_12 dark left">
									<div
										class="vc_col-sm-12 wpb_column column_container vc_column_container col no-extra-padding inherit_tablet inherit_phone "
										data-padding-pos="all" data-has-bg-color="false"
										data-bg-color="" data-bg-opacity="1" data-animation=""
										data-delay="0">
										<div class="vc_column-inner">
											<div class="wpb_wrapper">

												<div class="wpb_text_column wpb_content_element  sub_stit">
													<div class="wpb_wrapper">
														<div id="peeInfo" style="font-size: 30px;">
															<strong>충전 요금 정보</strong>
														</div>
														<hr>
													</div>
												</div>
												<br>
												<div>
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div style="margin-top: -15px;"
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column neg-marg no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="fws_63b91f227973d" data-column-margin="default"
								data-midnight="dark" data-top-percent="1%"
								data-bottom-percent="5%"
								class="wpb_row vc_row-fluid vc_row service_left_menu reverse_columns_column_tablet reverse_columns_column_phone top_padding_tablet_5pct top_padding_phone_40px bottom_padding_tablet_5pct bottom_padding_phone_40px"
								style="padding-top: calc(100vw * 0.01); padding-bottom: calc(100vw * 0.05);">
								<div class="row-bg-wrap" data-bg-animation="none"
									data-bg-animation-delay="" data-bg-overlay="false">
									<div class="inner-wrap row-bg-layer">
										<div class="row-bg viewport-desktop" style=""></div>
									</div>
								</div>
								<div class="row_col_wrap_12 col span_12 dark left">
									<div
										class="vc_col-sm-3 vc_hidden-sm vc_hidden-xs wpb_column column_container vc_column_container nectar-sticky-column no-extra-padding inherit_tablet inherit_phone "
										data-padding-pos="all" data-has-bg-color="false"
										data-bg-color="" data-bg-opacity="1" data-animation=""
										data-delay="0">
										<!-- 왼쪽 메뉴 배경 색깔 -->
										<div class="vc_column-inner">
											<div class="wpb_wrapper">
												<div
													class="vc_wp_custommenu wpb_content_element service_left_menu">
													<div class="widget widget_nav_menu">
														<div class="menu-sub_charging_charge-container">
															<ul id="menu-sub_charging_charge" class="menu">
																<li id="menu-item-7218"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7218"><a
																	href="#one">환경부 공공충전인프라</a></li>
																<li id="menu-item-7244"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7244"><a
																	href="#two">에버온 멤버십</a></li>
																<li id="menu-item-7245"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7245"><a
																	href="#three">차지비 멤버십</a></li>
																<li id="menu-item-7246"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7246"><a
																	href="#four">에스트래픽 에스에스차저멤버십</a></li>
																<li id="menu-item-7247"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7247"><a
																	href="#five">대영채비 채비인프라 멤버십</a></li>
																<li id="menu-item-7248"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7248"><a
																	href="#six">한국 전기차충전서비스 해피차저 멤버십</a></li>
																<li id="menu-item-7249"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7249"><a
																	href="#seven">파워큐브 ev-line 멤버십</a></li>
																<li id="menu-item-7250"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7250"><a
																	href="#eight">이카플러그 이비랑 멤버십</a></li>
																<li id="menu-item-7251"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7251"><a
																	href="#nine">지엔텔 G차저 멤버십</a></li>
																<li id="menu-item-7252"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7252"><a
																	href="#ten">현대자동차 E-pit 멤버십</a></li>
																<li id="menu-item-7253"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7253"><a
																	href="#eleven">스타코프</a></li>
																<li id="menu-item-7254"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7254"><a
																	href="#twelve">한국전기차 인프라기술 KEVIT 멤버십</a></li>
																<li id="menu-item-7255"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7255"><a
																	href="#thirteen">GS칼텍스</a></li>
																<li id="menu-item-7256"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7256"><a
																	href="#fourteen">SK에너지</a></li>
																<li id="menu-item-7257"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7257"><a
																	href="#fifteen">보타리에너지</a></li>
																<li id="menu-item-7258"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7258"><a
																	href="#sixteen">테슬라</a></li>
																<li id="menu-item-7259"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7259"><a
																	href="#seventeen">제주전기차자동차서비스 조이이브이 멤버십</a></li>
																<li id="menu-item-7260"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7260"><a
																	href="#eighteen">한국전력</a></li>
																<li id="menu-item-7261"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7261"><a
																	href="#nineteen">타디스테크놀로지 evPlug 멤버십</a></li>
																<li id="menu-item-7262"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7262"><a
																	href="#twenty">현대오일뱅크</a></li>
																<li id="menu-item-7263"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7263"><a
																	href="#twenty-one">클린일렉스 K-차저 멤버십</a></li>
																<li id="menu-item-7264"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7264"><a
																	href="#twenty-two">LG헬로비전</a></li>
																<li id="menu-item-7265"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7265"><a
																	href="#twenty-three">휴맥스 EV 멤버십</a></li>
																<li id="menu-item-7266"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7266"><a
																	href="#twenty-four">삼성 EVC</a></li>
																<li id="menu-item-7267"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7267"><a
																	href="#twenty-five">레드이앤지 멤버십</a></li>
																<li id="menu-item-7268"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7268"><a
																	href="#twenty-six">기아자동차</a></li>
																<li id="menu-item-7269"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7269"><a
																	href="#twenty-seven">씨어스</a></li>
																<li id="menu-item-7270"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7270"><a
																	href="#twenty-eight">플러그링크</a></li>
																<li id="menu-item-7271"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7271"><a
																	href="#twenty-nine">이노케이텍</a></li>
																<li id="menu-item-7272"
																	class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7272"><a
																	href="#thirty">이지차저</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div
										class="vc_col-sm-8 wpb_column column_container vc_column_container col no-extra-padding inherit_tablet inherit_phone "
										data-padding-pos="all" data-has-bg-color="false"
										data-bg-color="" data-bg-opacity="1" data-animation=""
										data-delay="0">
										<div class="vc_column-inner">
											<div class="wpb_wrapper">
												<div id="one" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 2%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 환경부 공공충전인프라 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<!--  style="border: 1; border-width: thick;" -->
																						<th>완속</th>
																						<th>급속(50kW)</th>
																						<th>초급속(100kW 이상)</th>
																					</tr>
																					<tr>
																						<td>324.4</td>
																						<td>324.4</td>
																						<td>347.2원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>


																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1657546673496 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 거의 모든 충전사업자에 대해 동일 요금 적용</p>
																		</div>
																	</div>

																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.ev.or.kr/portal/board/notice/12678/?">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="two" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 에버온 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속</th>
																						<th>초급속</th>
																						<th>비회원/로밍</th>
																					</tr>
																					<tr>
																						<td>229.2원</td>
																						<td>324.4원</td>
																						<td>347.2원</td>
																						<td>380원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.everon.co.kr/notice/">관련 정보 >
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="three" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 차지비 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속/주거지</th>
																						<th>완성차 브랜드 충전소 완속/급속</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>259원</td>
																						<td>269원/345원</td>
																						<td>315원/345원</td>
																						<td>430원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1657547084288 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 일부 충전소(롯데타워 등) 제외</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.chargev.co.kr/customer-support/charging_fee">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="four" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 에스트래픽 에스에스차저멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속/주거지</th>
																						<th>완속/상업지</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>200원</td>
																						<td>260원</td>
																						<td>324.4원/347.2원</td>
																						<td>470원</td>
																					</tr>
																				</tbody>
																			</table>
																			<p>럭키패스/럭키패스 H 구독회원은SS Charger 홈페이지 및 애플리케이션을 통해
																				확인 부탁드립니다.</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://sscharger.co.kr/membership/charge">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="five" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 대영채비 채비인프라 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속(50kW)</th>
																						<th>초급속(100kW 이상)</th>
																					</tr>
																					<tr>
																						<td>200원 → 155원*</td>
																						<td>320원</td>
																						<td>340원</td>
																					</tr>
																				</tbody>
																			</table>
																			<p>* 2023년 1월 1일 ~ 종료 시까지 완속 충전 요금 인하 이벤트</p>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1657547390870 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 대상 : 채비회원, 충전기: 채비 완속 충전기</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://chaevi.com/kr/customer/notice.php?bgu=view&#038;idx=59">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="six" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 한국 전기차충전서비스 해피차저
																			멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>한국충전 충전기 : 286.7원</td>
																						<td>한국충전 충전기 : 324.4/347.2원<br /> 환경부 충전기 :
																							347.2/324.4원
																						</td>
																						<td>430원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.happecharger.com/board01.do">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="seven" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 파워큐브 ev-line 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속 고정형</th>
																						<th>완속 이동형</th>
																					</tr>
																					<tr>
																						<td>충전사업자 정책에 따라 건물 별로 상이</td>
																						<td>23시~09시 : 73.4원<br /> 09시~10시 : 100.9원<br />
																							10시~12시 : 152.6원<br /> 12시~17시 : 100.9원<br />
																							17시~20시 : 152.6원<br /> 20시~22시 : 100.9원<br />
																							22시~23시 : 152.6원
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663658361829 fs_15">
																		<div class="wpb_wrapper">
																			<p>
																				※ 기본 이용료 월 약 17,000원<br /> ※ 일부 저압지역은 10~20원 높게 책정
																			</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.ev-line.co.kr/cshelp/fare.asp">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="eight" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 이카플러그 이비랑 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속/주거지</th>
																						<th>완속/상업지</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>09시~10시 : 245원<br /> 10시~12시 : 296원<br />
																							12시~17시 : 245원<br /> 17시~20시 : 296원<br />
																							20시~22시 : 245원<br /> 22시~23시 : 296원<br />
																							23시~09시 : 192원
																						</td>
																						<td>09시~10시 : 259원<br /> 10시~12시 : 307원<br />
																							12시~17시 : 259원<br /> 17시~20시 : 307원<br />
																							20시~22시 : 259원<br /> 22시~23시 : 307원<br />
																							23시~09시 : 204원
																						</td>
																						<td>413원</td>
																						<td>440원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://www.ecarplug.com/community?tpf=board/view&board_code=1&code=781">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="nine" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 지엔텔 G차저 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속</th>
																						<th>초급속</th>
																						<th>비회원/로밍</th>
																					</tr>
																					<tr>
																						<td>196원</td>
																						<td>324.4원</td>
																						<td>347.2원</td>
																						<td>375원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.gcharger.net/v1/customer_notice_view.jsp?seq=90">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="ten" data-midnight="" data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 현대자동차 E-pit 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>비회원</th>
																						<th>일반회원</th>
																						<th>프라임회원</th>
																					</tr>
																					<tr>
																						<td>급속 : 500원<br /> 초급속 : 560원
																						</td>
																						<td>급속 : 410원<br /> 초급속 : 510원
																						</td>
																						<td>급속 : 310원<br /> 초급속 : 340원
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.e-pit.co.kr/brand-web/epit/charging-fare">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="eleven" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 스타코프</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>173.8원</td>
																						<td>255.7원</td>
																						<td>292.9원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.starkoff.co.kr/price-list">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twelve" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 한국전기차 인프라기술 KEVIT
																			멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속/초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>주거지<br /> 09시~10시 : 130원<br /> 10시~12시
																							: 195원<br /> 12시~17시 : 130원<br /> 17시~20시 :
																							195원<br /> 20시~22시 : 130원<br /> 22시~23시 : 195원<br />
																							23시~09시 : 140원<br /> 공공기관 : 195원<br /> 상업지 :
																							255.7원
																						</td>
																						<td>290원 / 300원</td>
																						<td>380원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.kevit.co.kr/service/fee">관련 정보
																					><span class="arrow"></span>
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="thirteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• GS칼텍스</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>회원</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>299원</td>
																						<td>319원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.gscev.com/kr/information/fare">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="fourteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• SK에너지</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>균일가</th>
																					</tr>
																					<tr>
																						<td>309원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://www.skenergy.com/main.asp">관련 정보 >
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="fifteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 보타리에너지</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>기본</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>255.7원</td>
																						<td>300원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663659195138 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 조이이브이 멤버십 결제 시 280원</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://botari.imweb.me/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=6023059&t=board">관련
																					정보 ><span class="arrow"></span>
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="sixteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_24px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 테슬라</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>데스티네이션 완속</th>
																						<th>수퍼차저 V2 (120kwh)</th>
																						<th>수퍼자처 V3 (250kwh)</th>
																					</tr>
																					<tr>
																						<td>무료</td>
																						<td>346원/kwh</td>
																						<td>423원/분</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663659328002 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 테슬라 차량만 이용 가능</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://teslakoreaclub.com/sc.png">관련 정보 ><span
																					class="arrow"></span></a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="seventeen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 제주전기차자동차서비스 조이이브이
																			멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>회원 완속/급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>280원/310원</td>
																						<td>480원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663659826972 fs_15">
																		<div class="wpb_wrapper">
																			<p>
																				※ 한국전력 이용 시 280원<br /> ※ 보타리에너지 이용 시 240원
																			</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://joyev.co.kr/community/notice/97">관련
																					정보 ><span class="arrow"></span>
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="eighteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 한국전력</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>아파트 고정형</th>
																						<th>급속(100kW 미만)</th>
																						<th>초급속(100kW 이상)</th>
																					</tr>
																					<tr>
																						<td>09시~10시 : 300.5원<br /> 10시~12시 : 324.4원<br />
																							12시~17시 : 300.5원<br /> 17시~20시 : 324.4원<br />
																							20시~22시 : 300.5원<br /> 22시~23시 : 324.4원<br />
																							23시~09시 : 274.6원
																						</td>
																						<td>324.4원</td>
																						<td>347.2원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663659910973 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 모든 사업자에 대해 동일하게 적용</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://evc.kepco.co.kr:4445/service/service02.do">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="nineteen" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 타디스테크놀로지 evPlug 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속</th>
																						<th>초급속</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>09시~10시 : 253.9원<br /> 10시~12시 : 289.9원<br />
																							12시~17시 : 253.9원<br /> 17시~20시 : 289.9원<br />
																							20시~22시 : 253.9원<br /> 22시~23시 : 289.9원<br />
																							23시~09시 : 214.9원
																						</td>
																						<td>290원</td>
																						<td>305원</td>
																						<td>420원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663659994042 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 설치 연식에 따라 일부 가격 상이</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://evplug.co.kr/notice?currentPage=1&search=%EC%9A%94%EA%B8%88">관련
																					정보 ><span class="arrow"></span>
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 현대오일뱅크</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>급속</th>
																						<th>초급속</th>
																					</tr>
																					<tr>
																						<td>292.9원</td>
																						<td>309.1원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.oilbank.co.kr/main/index.do">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-one" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 클린일렉스 K-차저 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>회원</th>
																						<th>비회원</th>
																					</tr>
																					<tr>
																						<td>09시~10시 : 230.9원<br /> 10시~12시 : 253.9원<br />
																							12시~17시 : 230.9원<br /> 17시~20시 : 253.9원<br />
																							20시~22시 : 230.9원<br /> 22시~23시 : 253.9원<br />
																							23시~09시 : 209.3원
																						</td>
																						<td>324.4원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663660130875 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 전압에 따라 일부 상이</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://kcharger.net/index.php?Mn=5&#038;Sn=1">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-two" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• LG헬로비전</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>균일가</th>
																					</tr>
																					<tr>
																						<td>240원/kwh</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://helloplugin.net/v1/customer_notice_view.jsp?seq=28">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-four" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 휴맥스 EV 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속 회원</th>
																						<th>완속 회원</th>
																						<th>급속/완속 비회원</th>
																					</tr>
																					<tr>
																						<td>253원</td>
																						<td>310원</td>
																						<td>400원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.humaxev.com/">관련 정보 ><span
																					class="arrow"></span></a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-five" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 삼성 EVC</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속 회원</th>
																					</tr>
																					<tr>
																						<td>09시~10시 : 265.7원<br /> 10시~12시 : 303.5원<br />
																							12시~17시 : 265.7원<br /> 17시~20시 : 303.5원<br />
																							20시~22시 : 265.7원<br /> 22시~23시 : 303.5원<br />
																							23시~09시 : 234.6원
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663660130875 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 전압에 따라 일부 상이</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://samsungevc.com/reference/evChargingInformation">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-six" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 레드이앤지 멤버십</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속</th>
																						<th>급속/초급속</th>
																					</tr>
																					<tr>
																						<td>67.9원 (고압 155.2원)</td>
																						<td>255.7원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663660368479 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 설치 연식에 따라 일부 가격 상이</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://www.redeng.co.kr/">• 관련 정보 ><span
																					class="arrow"></span></a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-seven" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 기아자동차</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<td>기아자동차 고객 무료</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.kia.com/kr/kia-ev/green-guide/benefit.html">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-eight" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 씨어스</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th colspan="2">완속 회원</th>
																					</tr>
																					<tr>
																						<td>00시~09시 : 157.5원<br /> 09시~10시 : 257.8원<br />
																							10시~12시 : 311.0원<br /> 12시~13시 : 257.8원<br />
																							13시~17시 : 311원<br /> 17시~23시 : 257.8원<br />
																							23시~24시: 157.5원
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://www.cus21.co.kr/charging_charge_unit_price_table/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=13299590&t=board">관련
																					정보 > </a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-nine" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 플러그링크</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속(고압/저압)</th>
																						<th>완속(공공기관)</th>
																						<th>완속(상업지 고압/저압)</th>
																					</tr>
																					<tr>
																						<td>168원/190원</td>
																						<td>190원</td>
																						<td>09시~10시 : 169원/189원<br /> 10시~12시 :
																							215원/235원<br /> 12시~17시 : 169원/189원<br />
																							17시~20시 : 215원/235원<br /> 20시~22시 : 169원/189원<br />
																							22시~23시 : 215원/235원<br /> 23시~09시 : 168원/188원
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>




																	<div
																		class="wpb_text_column wpb_content_element  vc_custom_1663661171800 fs_15">
																		<div class="wpb_wrapper">
																			<p>※ 위치에 따라 일부 가격 상이</p>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="https://www.pluglink.kr/service.php">관련 정보
																					><span class="arrow"></span>
																			</a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="twenty-six" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 이노케이텍</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>완속 (아파트)</th>
																						<th>완속 (공공기관/상업지)</th>
																					</tr>
																					<tr>
																						<td>129원 (고압기준)</td>
																						<td>250원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://www.kcu.ai/kcu/?mode=price">관련 정보 ><span
																					class="arrow"></span></a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="thirty" data-midnight=""
													data-column-margin="default"
													class="wpb_row vc_row-fluid vc_row inner_row"
													style="padding-top: 4%;">
													<div class="row-bg-wrap">
														<div class="row-bg"></div>
													</div>
													<div class="row_col_wrap_12_inner col span_12  left">
														<div
															class="vc_col-sm-12 wpb_column column_container vc_column_container col child_column no-extra-padding inherit_tablet inherit_phone "
															data-padding-pos="all" data-has-bg-color="false"
															data-bg-color="" data-bg-opacity="1" data-animation=""
															data-delay="0">
															<div class="vc_column-inner">
																<div class="wpb_wrapper">
																	<div
																		class="nectar-split-heading  font_size_tablet_21px font_size_phone_19px "
																		data-align="left" data-m-align="inherit"
																		data-text-effect="default"
																		data-animation-type="line-reveal-by-space"
																		data-animation-delay="150" data-animation-offset=""
																		data-m-rm-animation="" data-stagger=""
																		data-custom-font-size="true"
																		style="font-size: 24px; line-height: 25.92px;">
																		<h3 style="color: #444444;">• 이지차저</h3>
																	</div>
																	<div class="wpb_text_column wpb_content_element ">
																		<div class="wpb_wrapper">
																			<table border="1" width="100%">
																				<tbody>
																					<tr>
																						<th>급속/완속 (회원)</th>
																						<th>급속/완속 (비회원)</th>
																					</tr>
																					<tr>
																						<td>350원/168원</td>
																						<td>400원/400원</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>



																	<div
																		class="nectar-cta  alignment_tablet_default alignment_phone_default display_tablet_inherit display_phone_inherit font_size_desktop_16px font_size_tablet_16px font_size_phone_15px "
																		data-color="default" data-using-bg="false"
																		data-style="see-through" data-display="inline"
																		data-alignment="left" data-text-color="custom">
																		<p style="color: #444444;">
																			<span class="text"> </span><span class=""><a
																				target="_blank" class="link_text"
																				href="http://ezcharger.net/app/main">관련 정보 ><span
																					class="arrow"></span></a></span>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--/ajax-content-wrap-->

		</div>
	</div>
	<!--/ocm-effect-wrap-->
	<script>
			window.RS_MODULES = window.RS_MODULES || {};
			window.RS_MODULES.modules = window.RS_MODULES.modules || {};
			window.RS_MODULES.waiting = window.RS_MODULES.waiting || [];
			window.RS_MODULES.defered = true;
			window.RS_MODULES.moduleWaiting = window.RS_MODULES.moduleWaiting || {};
			window.RS_MODULES.type = 'compiled';
		</script>
	<script type="text/html" id="wpb-modifications"></script>

	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/revslider/public/assets/js/rbtools.min.js'
		defer async id='tp-tools-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/revslider/public/assets/js/rs6.min.js'
		defer async id='revmin-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/jquery.easing.min.js'
		id='jquery-easing-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/jquery.mousewheel.min.js'
		id='jquery-mousewheel-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/priority.js'
		id='nectar_priority-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/transit.min.js'
		id='nectar-transit-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/waypoints.js'
		id='nectar-waypoints-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/salient-portfolio/js/third-party/imagesLoaded.min.js'
		id='imagesLoaded-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/hoverintent.min.js'
		id='hoverintent-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/jquery.fancybox.min.js'
		id='fancyBox-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/anime.min.js'
		id='anime-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/stickkit.js'
		id='stickykit-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/third-party/superfish.js'
		id='superfish-js'></script>
	<script type='text/javascript' id='nectar-frontend-js-extra'>
/* <![CDATA[ */
var nectarLove = {"ajaxurl":"https:\/\/elecvery.com\/wp-admin\/admin-ajax.php","postID":"46","rooturl":"https:\/\/elecvery.com","disqusComments":"false","loveNonce":"050de0ee34","mapApiKey":""};
var nectarOptions = {"delay_js":"0","quick_search":"false","react_compat":"disabled","header_entrance":"false","mobile_header_format":"default","ocm_btn_position":"default","left_header_dropdown_func":"default","ajax_add_to_cart":"0","ocm_remove_ext_menu_items":"remove_images","woo_product_filter_toggle":"0","woo_sidebar_toggles":"true","woo_sticky_sidebar":"0","woo_minimal_product_hover":"default","woo_minimal_product_effect":"default","woo_related_upsell_carousel":"false","woo_product_variable_select":"default"};
var nectar_front_i18n = {"next":"Next","previous":"Previous"};
/* ]]> */
</script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/themes/salient/js/build/init.js'
		id='nectar-frontend-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/salient-core/js/third-party/touchswipe.min.js'
		id='touchswipe-js'></script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/page-links-to/dist/new-tab.js'
		id='page-links-to-js'></script>
	<script type='text/javascript' id='wpb_composer_front_js-js-extra'>
/* <![CDATA[ */
var vcData = {"currentTheme":{"slug":"salient"}};
/* ]]> */
</script>
	<script type='text/javascript'
		src='https://elecvery.com/wp-content/plugins/js_composer_salient/assets/js/dist/js_composer_front.min.js'
		id='wpb_composer_front_js-js'></script>
<script>
    $(document).ready(function() {
        $(function () {
            $(".menu-item").on("click", function(){
                var headerHeight = $("header").outerHeight();
                var href = $(this).attr("href");
                var target = $(href == "#" || href == "" ? "body" : href);
                var position = target.offset().top - headerHeight;
                $("html, body").animate({ scrollTop: position }, 600, "swing");
            });
        });
    });
    </script>
</body>
</html>