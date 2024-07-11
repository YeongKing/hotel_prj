<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
 <head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="7cc31c414eda7a3ea7b7a0bbb9c0a5c624370a87"/>

  <title></title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta property="og:title" content="">
  <meta property="og:description" content="">
  <meta property="og:url" content="https://josunhotel.com/join/joinComplete.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/join/joinComplete.do"/>
  
<!-- S head css -->
<link rel="shortcut icon" type="image/x-icon" href="/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >
<link rel="icon" type="image/x-icon" href="/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >

<link href="/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
<link href="/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
<link href="/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

  <script type="text/javascript" src="/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="/static/home/js/ko/pc/pubPlugin.js"></script>
  <script type="text/javascript" src="/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
  <script type="text/javascript" src="/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
  <script type="text/javascript" src="/static/home/js/ko/pc/selectbox.js"></script> 
  <script type="text/javascript" src="/static/home/js/ko/pc/swiper.min.js"></script> 
  <script type="text/javascript" src="/static/home/js/home.js"></script>
  <script type="text/javascript" src="/static/home/bluewaves/js/pc/bw_contents.js"></script>

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
   
 </head>
 <body>

	<div class="skip"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
		<!--(HEAD 최종수정일 : 2024-05-07 17:12)-->

<!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->



		<div id="container" class="container join">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">회원가입</h1>
			<div class="topArea">
				<div class="topInner">
					<p class="f75">회원가입이 완료되었습니다.</p>
					<p class="pageGuide">엘리시안의 회원이 되신 것을 환영합니다.</p>
				</div>
			</div>
			<div class="inner">
				<div class="txtBox">
					<p class="txtResult">안녕하십니까 <em>${userName}</em>님,<br>엘리시안 회원 가입을 감사드립니다.</p>
					<div class="btnArea">
						<button type="button" class="btnSC btnL active" onclick="location.href='/hotel_prj/user/login.do' ">로그인 페이지로 이동</button>
					</div>
				</div>
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
	</div>
	<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>