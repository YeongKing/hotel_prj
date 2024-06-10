<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
<script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
<script type="text/javascript" src="/hotel_prj/static/home/js/home.js"></script>
<script type="text/javascript" src="/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>

<script type="text/javascript">
	// IE 브라우저인지 체크
	if (navigator.userAgent.indexOf("MSIE") !== -1 || navigator.userAgent.indexOf("Trident") !== -1) {
		// Edge 브라우저로 전환
		alert('Internet Explorer 브라우저의 서비스 지원 종료(2022년 6월 15일)에 따라 조선호텔앤리조트 웹사이트 이용 시 크로미엄 기반(Chromium Base)의 브라우저 사용을 권장 드립니다.\n\n※ 크로미엄(Chromium) 기반 브라우저\n- 크롬(Google Chrome)\n- 마이크로소프트 엣지(Microsoft Edge)\n- 파이어폭스(Mozilla Firefox)\n- 오페라(Opera)\n- 웨일(Naver Wale)\n- 사파리(Apple Safari) 등');
		window.location.replace("microsoft-edge:" + window.location.href);
    
		// IE 브라우저 종료
		//edge 켜지지 않고, ie만 종료되어 setTimeout사용
		setTimeout(function(){
			window.open('', '_parent', '');
			window.close();
		},100)
	}
    
	function fncChangeLang (changeLang) {
		let currentLang = 'ko';
			$(location).attr("href", "/intro.do?locale=" + changeLang);
	}
</script>

<!--schema.org 적용(2021.05.03) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Hotel",
  "name": "조선호텔앤리조트",
  "url": "https://josunhotel.com/",
  "image": [
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=426021&cntntsSn=426020",
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=253318&cntntsSn=253316",
    "https://gjb.josunhotel.comutil/file/download.do?fileSn=453363&sysCode=GJB"
  ],
  "description": "Experience the Difference - 조선호텔앤리조트는 신세계 그룹에서 운영하며, 고품격 라이프 스타일을 제안하는 서비스 전문 기업입니다.",
  "sameAs": [
    "https://www.instagram.com/josunhotelsandresorts",
    "https://www.facebook.com/Josunhotelsandresorts",
    "https://pf.kakao.com/_EnFPj",
    "https://www.youtube.com/channel/UC7ZZk3mnc0DzJqPTdjD6tOw",
    "https://play.google.com/store/apps/details?id=com.ssg.josunhotel",
    "https://apps.apple.com/kr/app/id1528269578"
  ],
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "Republic of Korea",
    "addressRegion": "서울시",
    "addressLocality": "중구",
    "streetAddress": "소공로 16",
    "postalCode": "04533"
  },
  "telephone": "02-771-0500"
}
</script>