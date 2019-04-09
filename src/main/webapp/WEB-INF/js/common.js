$(document).ready(function(){
	//배너 항상접기
/*	sessionStorage.setItem("bannerOff", "off");*/
	//배너 항상접기 end
	getBannerSession();
	
/*	var banner_size = $("#banner_list_hidden").val();
	if(banner_size = 0){
		$('.c-banner__item_no').show();
		sessionStorage.setItem("bannerOff", "off");
	}else{
		$('.c-banner__item').removeClass('c-banner__item_no');
	};
	*/
	
	/*wa 마크 지우기*/
	var filter = "win16|win32|win64|mac";
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			$('.c-footer__aligner').removeClass('waLogoDiv');
		}else{
		}
	}
	/*end*/
	
	//	 input placeholder 
	var forms;
	forms = $('input'), $('textarea');
	forms.placeholder();	

	// gnb
	$('.c-gnb__link').on('mouseenter focusin', function(){
		$('.c-header').addClass('c-header--active');
		$('.c-gnb__item').removeClass('c-gnb__item--active');
		$('.c-depth2__item').removeClass('c-depth2__item--active');
		$(this).parent().addClass('c-gnb__item--active');
	});

	$('.c-gnb').on('mouseleave', function(){
		$('.c-header').removeClass('c-header--active');
		$('.c-gnb__item').removeClass('c-gnb__item--active');
		$('.c-depth2__item').removeClass('c-depth2__item--active');
	});
	

	$('.c-depth2__link').on('mouseenter focusin', function(){
		$('.c-depth2__item').removeClass('c-depth2__item--active');
		$(this).parent().addClass('c-depth2__item--active');
	});

	$('.c-depth2__item').has('.c-depth3').addClass('c-depth2__item--depth3');	

	// focus
	$('.c-lnb__link').on('focusin', function(){
		$('body, html').animate({'scrollTop':$('.c-lnb').offset().top-300},200);
	});

	$('.c-gnb__item:last-child .c-depth2__item:last-child').on('focusout', function(){
		$('.c-header').removeClass('c-header--active');
		$('.c-gnb__item').removeClass('c-gnb__item--active');
		$('.c-depth2__item').removeClass('c-depth2__item--active');
	});

	$('.c-gnb__item:first-child .c-gnb__link').on('focusout', function(){
		$('.c-navi__link').on('focus', function(){
			$('.c-header').removeClass('c-header--active');
			$('.c-gnb__item').removeClass('c-gnb__item--active');
			$('.c-depth2__item').removeClass('c-depth2__item--active');
		});
	});

	// skip_navigation 
	$('.skip_navigation > ul > li:first-child > a').on('click', function(){
		var thisHref =  $(this).attr('href'),
			  thisSc = $(thisHref).offset().top;
		
		if ( $('.c-banner').hasClass('c-banner--active')){
			if ( $('.c-lnbs').has('.l-depth3')){
				$('body, html').animate({'scrollTop':thisSc-180},200);
			}else {
				$('body, html').animate({'scrollTop':thisSc-200},200);
			}
		}else {
			$('body, html').animate({'scrollTop':thisSc},200);
		}
	});

	$('.m-facilities__info').add('.m-recruit__link').each(function(){
		$(this).on('focusin', function(){
			var thisSc = $(this).offset().top;
			if ( $('body').hasClass('is-banner-active')){
				$('body, html').animate({'scrollTop':thisSc-100},200);
			}else {
				$('body, html').animate({'scrollTop':thisSc-300},200);
			}
		});
	});

	// scroll
	if ( $(window).scrollTop() > 50 ) {
		$('body').addClass('is-scroll-active');
		$('.c-banner').addClass('c-banner--active');
	}else {
		$('body').removeClass('is-scroll-active');
	}

	$(window).scroll(function(){
		var scTop = $(this).scrollTop();

		if ( scTop > 50 ) {
			$('body').addClass('is-scroll-active');
		}else {
			$('body').removeClass('is-scroll-active');		
		}
	});
	
	// banner
	$('.c-banner__list').bxSlider({
		infiniteLoop: false,
		keyboardEnabled: true,
		auto: true
	});

	$('.c-banner__trigger').on('click', function(){
		if ( $('.c-banner').hasClass('c-banner--active')){
			$('.c-banner').removeClass('c-banner--active');
			$('body').addClass('is-banner-active');
			
			sessionStorage.setItem("bannerOff", "off");
		}else {
			$('.c-banner').addClass('c-banner--active');
			$('body').removeClass('is-banner-active');
			
			sessionStorage.clear();
		}
		
		return false;
	});

	$('.c-banner__close').on('click', function(){
		$('.c-banner').removeClass('c-banner--active');
		$('body').addClass('is-banner-active');
		$('.c-banner__trigger').focus();
		
        sessionStorage.setItem("bannerOff", "off");

        return false;
	});
	
	// quick-top
	$('.c-quick-top').on('click', function(){
		$('body, html').animate({'scrollTop':'0'},300);
		
		return false;
	});

	// drawer
	$('.m-depth2__item').has('.m-depth3').addClass('m-depth2__item--depth3');

	$('.c-drawer__trigger').on('click', function(){
		$('.m-depth2__item').has('.m-depth3').addClass('m-depth2__item--depth3');

		if ( $('.c-drawer').hasClass('.c-drawer--active')){
			$('html').removeClass('is-drawer-open');
			$('.c-drawer').removeClass('c-drawer--active');
		}else {
			$('.c-drawer').addClass('c-drawer--active');
			$('html').addClass('is-drawer-open');
		}
		
		/*return false;*/
	});

	$('.c-drawer').on('click', function(){
		if (event.target == this){
			$('html').removeClass('is-drawer-open');
			$('.c-drawer').removeClass('c-drawer--active');
		}
	});

	$('.c-drawer__close').on('click', function(){
		$('html').removeClass('is-drawer-open');
		$('.c-drawer').removeClass('c-drawer--active');

		return false;
	});

	$('.m-gnb__link').on('click', function(){
		if ($(this).parent().hasClass('m-gnb__item--active')){
			$(this).parent().removeClass('m-gnb__item--active');
		}else {
			$(this).parent().addClass('m-gnb__item--active');
		}
		return false;
	});

	$('.m-depth2__link').on('click', function(){
		if ($(this).parent().hasClass('m-depth2__item--active')){
			$(this).parent().removeClass('m-depth2__item--active');
		}else {
			$(this).parent().addClass('m-depth2__item--active');
		}
		/*return false;*/
	});

	// family-stie
	var familySite = $('.family-site__list').bxSlider({
		slideMargin: 12,
		moveSlides: 1,     // 슬라이드 이동시 개수
		slideWidth: 200,   // 슬라이드 너비
		minSlides: 6,      // 최소 노출 개수
		maxSlides: 6,
		pager: false,
		auto: true,
		pause: 4000,
		controls: false,
		infiniteLoop: false,
		keyboardEnabled: true
	});
	
	//김영정
	
	$('.family-site__list li a').focusin(function () {
	      $('.family-site__list li').removeClass('focus');
	      $(this).parents('li').addClass('focus');
	      familySite.stopAuto();
	      if($('.family-site__list li:first-child').hasClass('focus')){
	    	  familySite.css('transform', 'translate3d(0, 0px, 0px)');
	       }
	   });

	$(window).load(function(){
		if ( $(this).width() <= 768 ){
			familySite.reloadSlider({
				slideMargin: 6,
				moveSlides: 1,     // 슬라이드 이동시 개수
				slideWidth: 1000,   // 슬라이드 너비
				minSlides: 2,      // 최소 노출 개수
				maxSlides: 2,
				pager: false,
				auto: true,
				pause: 4000,
				controls: false,
				infiniteLoop: false,
				keyboardEnabled: true
			});
		}else {
			familySite.reloadSlider({
				slideMargin: 12,
				moveSlides: 1,     // 슬라이드 이동시 개수
				slideWidth: 200,   // 슬라이드 너비
				minSlides: 6,      // 최소 노출 개수
				maxSlides: 6,
				pager: false,
				auto: true,
				pause: 4000,
				controls: false,
				infiniteLoop: false,
				keyboardEnabled: true
			});
		}
	});

	$(window).resize(function(){
		if ( $(this).width() <= 768 ){
			familySite.reloadSlider({
				slideMargin: 6,
				moveSlides: 1,     // 슬라이드 이동시 개수
				slideWidth: 1000,   // 슬라이드 너비
				minSlides: 2,      // 최소 노출 개수
				maxSlides: 2,
				pager: false,
				auto: true,
				pause: 4000,
				controls: false,
				infiniteLoop: false,
				keyboardEnabled: true
			});
		}else {
			familySite.reloadSlider({
				slideMargin: 12,
				moveSlides: 1,     // 슬라이드 이동시 개수
				slideWidth: 200,   // 슬라이드 너비
				minSlides: 6,      // 최소 노출 개수
				maxSlides: 6,
				pager: false,
				auto: true,
				pause: 4000,
				controls: false,
				infiniteLoop: false,
				keyboardEnabled: true
			});
		}
	});

	$('.family-site__control').on('click', function(){
		if ( $(this).hasClass('family-site__control--prev')){
			familySite.goToPrevSlide();
		}else if ( $(this).hasClass('family-site__control--next')){
			familySite.goToNextSlide();
		}else if ( $(this).hasClass('family-site__control--pause')){
			familySite.stopAuto();
            $(this).text('재생');
			$(this).removeClass('family-site__control--pause');
			$(this).addClass('family-site__control--play');
		}else if ( $(this).hasClass('family-site__control--play')){
			familySite.startAuto();
            $(this).text('일시정지');
			$(this).removeClass('family-site__control--play');
			$(this).addClass('family-site__control--pause');
		}

		return false;
	});
});

function getBannerSession() {
	var bannerOff = sessionStorage.getItem("bannerOff");
	if(bannerOff == "off"){
		$('.c-banner').removeClass('c-banner--active');
		$('body').addClass('is-banner-active');
	}
}

/*
//www추가하는 스크립트 2018-07-10 09:31 권수
var host = location.host.toLowerCase(); 
var currentAddress = location.href; 
if (host.indexOf("www")== -1) 
{ 
currentAddress = currentAddress.replace("//","//www."); 
location.href = currentAddress; 
}*/
/*
//https추가하는 스크립트 2018-07-10 09:31 권수
if (document.location.protocol == 'http:') {
    document.location.href = document.location.href.replace('http:', 'https:');
}
*/

