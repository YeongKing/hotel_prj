/***********************************************************************************************************
 * 조선호텔 hub 메인페이지 및 gnb 스크립트 
 **********************************************************************************************************/

var commonJs_josun = {};
this.commonJs_josun = commonJs_josun;
var ANIMATION_EASING = 'easeOutExpo';

$(document).ready(function(){
})

$(window).on('load', function () {
	commonJs_josun.setGnb($('.btnMenu'));
	commonJs_josun.setMainAreaParallax('mainArea');

})

/***********************************************************************************************************
 * document.Ready 시 호출 
 **********************************************************************************************************/



 /*********************************************************************************************************
 *  window.onLoad 시 호출
 *********************************************************************************************************/

 /**
  * gnb 적용
  * layout.html
  * 
  * @param {Element} btnMenuEl
  */
commonJs_josun.setGnb = function(btnMenuEl){
	if(!btnMenuEl.length){
		return;
	}

	var allMenu = $('.allMenu');

	$.fn.gnbOpenFunc = function () {
		$(this).addClass('menuOn');
		$('.header').addClass('gnbOn');
		allMenu.css({
			'height': 0
		}).show().stop().animate({
			'height': $(window).outerHeight()
		}, 500, ANIMATION_EASING)
	}
	$.fn.gnbCloseFunc = function(){
		btnMenuEl.removeClass('menuOn');
		allMenu.stop().animate({
			'height': 0
		},300, 'linear', function(){
			allMenu.hide();
			$('.header').removeClass('gnbOn');
		})
	}

	var st = 0;
	btnMenuEl.off('click.gnb').on('click.gnb', function(){
		if(!$(this).hasClass('menuOn')){
			//open
			st = $(window).scrollTop();
			$(this).gnbOpenFunc();
			commonJs.preventBodyScroll();
		}else{
			//close
			$(this).gnbCloseFunc();
			commonJs.allowBodyScroll();
			$(window).scrollTop(st);
		}
	})

	$('.allMenu .btnClose').on('click', function(){
		//close
		$(this).gnbCloseFunc();
		commonJs.allowBodyScroll();
		$(window).scrollTop(st);

	})
}


/**
 * 메인페이지 스크롤링 패럴렉스 및 인디케이터 적용
 * HUMA1000M.html
 * 
 */
commonJs_josun.setMainAreaParallax = function(mainArea){

	if(!$('[class*=' + mainArea + ']').length){
		return;
	}

	var _ = throttleAndDebounce();
	var screenResize = _.debounce(function () {
		commonJs_josun.setMainAreaParallax('mainArea');
	}, 400);

	$(window).off('resize.mainAreaParallax').on('resize.mainAreaParallax', function(){
		screenResize();
	})

	var ctlData = $('.container').data('controller');
	if(ctlData!=undefined){
		ctlData.destroy(true);
	}

	var ctl = new ScrollMagic.Controller();
	var ofsArray = [];
	var mainIndicator = $('.mainIndicator');
	var isAnimated = false;
	var isDimmed = false;
	var header = $('.header');
	var footer = $('.footer');
	var scrollFinished = false;
	var revArea = $('.revArea');
	var mainBannerEl = $('.mainBanner');
	var deviceCheckEl = $('.deviceCheck');
	var osMac = navigator.platform.toUpperCase().indexOf('MAC')>=0;
	
	ctl.scrollTo = function(newpos, callback){
		new TimelineMax({
			onComplete: callback
		}).to('html, body', 0.5, { scrollTop: newpos });
	}

	$('.container').on('preventAnimate', function(){
		isAnimated = true;
	});
	$('.container').on('allowAnimate', function(){
		isAnimated = false;
	});
	$('.container').on('dimmedOn', function(){
		isDimmed = true;
	});
	$('.container').on('dimmedOff', function(){
		isDimmed = false;
	});
	

	$('.mainArea01').off('mousewheel DOMMouseScroll').on(' mousewheel DOMMouseScroll', function(e){
		//.contents02 show
		var delta = 0;
		var E = e.originalEvent;
		if(E.detail){
			delta = E.detail * -40;
		}else{
			delta = E.wheelDelta;
		}
		if(!scrollFinished  && delta < 0){
			e.stopPropagation();
			e.preventDefault();
			return false;
		}
	})

	$('[class*=' + mainArea + ']').each(function (idx) {

		var ofsTop = $(this).offset().top;
		ofsArray.push(ofsTop);
		

		//창화면 높이가 910(고정) 이상일때 sectionSwiper 적용
		if ($(window).outerHeight() >= 910) {
			//set section Swipe
			new ScrollMagic.Scene({
				triggerElement: this,
				triggerHook: 'onLeave',
			})
				.setPin(this, { pushFollowers: false })
				.addTo(ctl);
		}

		//scrollDown 
		new ScrollMagic.Scene({
			triggerElement: this,
			triggerHook: (osMac) ? '0.99' : '0.95',
		})
			.on('enter', function () {
				
				if (isAnimated) {
					return;
				}
				if (idx == 0) {
					//.contents01 show
					$('.contents01').css('z-index', '1');
					revArea.removeClass('cts02').addClass('cts01');

					if($(window).scrollTop()>200){
						return;
					}
					new TimelineMax({
						onComplete: function () {
							scrollFinished = true;
						}
					}).delay(0.3).fromTo($('.contents01 .mainTxt'), 0.7, { opacity: 0 }, { opacity: 1 }, 0)
						.fromTo(revArea, 0.7, { opacity: 0, y: '+100px' }, { opacity: 1, y: '0px' }, 0);

				}else {
					if(idx!=0){
						new TimelineMax({
							onStart: function(){
								/*revArea.removeClass('cts01').addClass('cts02');*/
								revArea.removeClass('cts01');
								if(idx == 4){
									revArea.addClass('cts02');
								}
							}
						}).fromTo(revArea, 0.5, { opacity: 0, y: '+100px' }, { opacity: 1, y: '0px' });
					}

					if(!isDimmed){
						ctl.scrollTo(ofsTop, function(){
							revArea.find('.clearCont.opened .btnClose:visible').each(function () {
								$(this).trigger('click.setRevArea');
							})
						});
					}
					
				}
			})
			.addTo(ctl);


		//scrolling up
		new ScrollMagic.Scene({
			triggerElement: this,
			triggerHook: (osMac) ? '0.01' : '0.1',
		})
			.on('leave', function () {
				
				$('.contents01 .mainTxt').css({
					'opacity': 1
				})

				if (isAnimated) {
					return;
				}

				if (idx == 1) {
					//mainArea01
					scrollFinished = true;
					$('.contents02').css('z-index', 1);
				}
				if(!isDimmed){
					ctl.scrollTo(ofsArray[(idx - 1 > 0 ? idx - 1 : 0)]);
				}
			})
			.addTo(ctl);	
			

		//indicator 
		new ScrollMagic.Scene({
			triggerElement: this,
			triggerHook: 'enter',
			duration: $(this).outerHeight()
		})
			.on('enter', function () {

				if(isDimmed){
					return;
				}

				/*var headerType02 = [2, 3, 5]; //해당 idx일경우 헤더 클래스 type02적용
				var headerType03 = [0, 1, 4];  //'' 헤더 클래스 type03적용
				var indicatorType = [0, 1, 4]; //'' 인디케이터 클래스 type02적용*/
				
				//2021-05-10 intro 순서 변경 요청으로 인한 수정 작업
				/*var headerType02 = [1, 2, 5]; //해당 idx일경우 헤더 클래스 type02적용
				var headerType03 = [0, 3, 4];  //'' 헤더 클래스 type03적용
				var indicatorType = [0, 3, 4]; //'' 인디케이터 클래스 type02적용*/

                //2022-05-23 intro 조선 라운지 section 추가로 인한 수정 작업
                var headerType02 = [1, 2, 3, 6]; //해당 idx일경우 헤더 클래스 type02적용
                var headerType03 = [0, 4, 5];  //'' 헤더 클래스 type03적용
                var indicatorType = [0, 4, 5]; //'' 인디케이터 클래스 type02적용

				header.removeClass('type02 type03');
				mainIndicator.removeClass('type02');
				
				if(idx==0){
					if(!mainBannerEl.data('topBannerClosed')){
						mainBannerEl.trigger('showTopBanner');
					}
					if(!deviceCheckEl.data('deviceCheckClosed')){
						deviceCheckEl.trigger('showDeviceCheck');
					}
					revArea.removeClass('cts02').addClass('cts01');
				}else{
					//2021-05-10 intro 순서 변경 요청으로 인한 수정 작업
					if(idx == 4){
						revArea.removeClass('cts01').addClass('cts02');
					}else{
						revArea.removeClass('cts01 cts02');
					}
					mainBannerEl.trigger('hideTopBanner');
					deviceCheckEl.trigger('hideDeviceCheck');
				}

				if((headerType02.indexOf(parseInt(idx))!== -1)){
					header.addClass('type02');
				}
				if((headerType03.indexOf(parseInt(idx))!== -1)){
					header.addClass('type03');
				}
				if ((indicatorType.indexOf(parseInt(idx)) !== -1)) {
					mainIndicator.addClass('type02');
				}

				mainIndicator.find('li').eq(idx).addClass('on').siblings('li').removeClass('on');
				mainIndicator.show();
			})
			.addTo(ctl);
	});

	//footer scrolling up
	new ScrollMagic.Scene({
		triggerElement: footer.get(0),
		triggerHook: dUtils.Round(1 - (footer.outerHeight() / $(window).outerHeight()).toFixed(3), 2)
	})
		.on('leave', function () {
			if (isAnimated) {
				return;
			}
			if(!isDimmed){
				ctl.scrollTo(ofsArray[ofsArray.length - 1]);
			}

		})
		.addTo(ctl);

	//footer scrolling down 
	new ScrollMagic.Scene({
		triggerElement: $('.footArea').get(0),
		triggerHook: 0.95
	})
		.on('enter', function () {
			if (isAnimated) {
				return;
			}
			if(!isDimmed){
				ctl.scrollTo(ofsArray[ofsArray.length - 1] + footer.outerHeight());
			}
		})
		.addTo(ctl);

	//인디케이터 클릭
	mainIndicator.find('li').off('click').on('click', function (e) {
		e.preventDefault();
		var idx = $(this).index();
		if ($(window).scrollTop() == ofsArray[idx]) {
			return;
		}

		$('.container').trigger('preventAnimate');
		var ofs = ($(window).outerHeight() - 100);
		$(window).scrollTop(($(window).scrollTop() > ofsArray[idx]) ?
			ofsArray[idx] + ofs : ofsArray[idx] - ofs);
		ctl.scrollTo(ofsArray[idx], function () {
			$('.container').trigger('allowAnimate');
		});

	})
	$('.container').data('controller', ctl);

}

 /*********************************************************************************************************
 *  참조 함수들
 *********************************************************************************************************/
