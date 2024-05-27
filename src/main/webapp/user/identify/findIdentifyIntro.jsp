<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>












<!--( 템플릿 명(PC 기본 템플릿) 최종수정일 : 2024-03-07 17:08)-->
















  










	
        
		
		
		
		
		
		
        
        
	
	

 
<!DOCTYPE html>
<html lang="ko">
 <head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="7cc31c414eda7a3ea7b7a0bbb9c0a5c624370a87"/>

  <title>아이디/ 비밀번호찾기 - 본인인증 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트로그인, 조선호텔앤리조트회원가입, 조선호텔앤리조트회원, 조선호텔앤리조트아이디찾기">
  <meta name="description" content="조선호텔앤리조트 회원 아이디를 잊으셨나요? 휴대폰 본인인증을 통해 아이디를 확인하실 수 있습니다.">
  <meta property="og:title" content="아이디/ 비밀번호찾기 - 본인인증 | 조선호텔앤리조트">
  <meta property="og:description" content="조선호텔앤리조트 회원 아이디를 잊으셨나요? 휴대폰 본인인증을 통해 아이디를 확인하실 수 있습니다.">
  <meta property="og:url" content="https://josunhotel.com/identify/findIdentifyIntro.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/identify/findIdentifyIntro.do"/>
  <link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  
  
  
  
  

  <link href="http://localhost/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-173355219-1"></script>
  <script type="text/javascript">
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-173355219-1');
  </script>
  <!-- End Global site tag (gtag.js) - Google Analytics -->
  
  <!-- Google Tag Manager -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-NP6NJMP');</script>
  <!-- End Google Tag Manager -->

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


<!-- 네이버 사이트 연관 채널 Code -->	
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Person",
"name": "조선호텔앤리조트",
"url": "https://josunhotel.com/",
	"sameAs": [
		"https://www.instagram.com/josunhotelsandresorts/",
		"https://www.facebook.com/Josunhotelsandresorts",
		"https://pf.kakao.com/_EnFPj",
		"https://www.youtube.com/channel/UC7ZZk3mnc0DzJqPTdjD6tOw",
		"https://play.google.com/store/apps/details?id=com.ssg.josunhotel",
		"https://apps.apple.com/kr/app/id1528269578"
		]
}	
</script>
<!-- End 네이버 사이트 연관 채널 Code -->
   
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
    "https://gjb.josunhotel.com/util/file/download.do?fileSn=453363&sysCode=GJB"
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
 </head>
 <body>
 <!-- Google Tag Manager (noscript) -->
 <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP"
 height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
 <!-- End Google Tag Manager (noscript) -->

	<div class="skip"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
		<!--(HEAD 최종수정일 : 2024-05-07 17:12)-->
<!-- mass promotion 메뉴 동적 노출 -->


<script>
	jQuery(function(){
		jQuery.ajax({
			type : "GET",
			url : "/massPromotion/get.json",
			cache : false,
			dataType : "json",
			global : false,
			beforeSend: function() {
			},
			complete: function() {
			},
			success : function(data){
                var massPromtn = data.bean;
                //조회 결과에 따라 랜더링
                if(massPromtn != null && massPromtn != ""){
                    var url = getMassPromtnUrl();
                    var menuNm = massPromtn.promtnNm;
                    var sysCode = massPromtn.sysCode;
                    appendMassPromotionMenu(url, menuNm, sysCode);
                }
			},
			error:function(r, s, e){
			}
		});
	});

    function getMassPromtnUrl(){
        var url = "";
        var sysCode = jQuery("#sysCode").val();

        if(gfncIsApp()){
            //앱일 경우
            url = "/m/massPromotion/list.do";
        }else if(gfncIsMobile()){
            //모바일일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/m/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/m/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/m/massPromotion/list.do";
                }
            }
        }else {
            //pc일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/massPromotion/list.do";
                }
            }
        }
        return url;
    }

    function appendMassPromotionMenu(url, menuNm, sysCode){
        if(gfncIsApp()){
            //앱일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';

            var pathname = window.location.pathname;
            if(pathname.indexOf("/app/main.do") == 0){
                jQuery(".gnbArea ul.toggleList > li > .titArea:contains('패키지')").closest("ul").append(menuHtml);
            }else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }

            /*if(jQuery(".gnbArea ul.toggleList li:contains('패키지')").length > jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").length){
                jQuery(".gnbArea ul.toggleList li:contains('패키지')").closest("ul").append(menuHtml);
            } else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }*/

        }else if(gfncIsMobile()){
            //모바일일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';
            jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
        }else{
            //pc일 경우
            if(sysCode == "JOSUNHOTEL" || sysCode == "JPY"){
                //해당 페이지가 HUB거나 JPY일 경우
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".allMenu ul.menuDepth01 ul.menuDepth02 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }else {
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".headArea .utilMenu .gnbDepth1 .gnbDepth2 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }
        }
    }

</script>

<script>
        //2022-05-23 조선라운지 추가
        //헤더 메뉴 버튼 클릭 이벤트
        jQuery(document).on("click",".headArea .btnMenu" ,function(){

            //메뉴 펼쳐질때 라운지 list 3가지 무작위 노출
            if(jQuery(this).hasClass("menuOn")){
                var expsrCount = 3;
                var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
                var randomArray = generateRandomNumberArray(expsrCount, $loungeList.length);

                $loungeList.addClass("hidden");
                $loungeList.each(function(index){
                    if(randomArray.indexOf(index) > -1){
                        jQuery(this).removeClass("hidden");
                    }
                });
            }
        })
</script>


<!--S header  -->
<jsp:include page="/user/footer.jsp"></jsp:include>
<!--E header  -->



        <!--(페이지 URL)-->


 
  <script type="text/javascript">
  
	// 본인인증 콜백 함수
	function fncSirenCallback(data) {
		
		var result = data.result;	// 결과: 인증성공(1)
		
		if (result == "1") {
			var _vNameKor = data.name;	// 성명
			var _vMobile  = data.cellNo;	// 휴대전화번호
			//alert("성명1 : " + _vNameKor + ", 휴대전화번호 : " + _vMobile);
			
			// 2021-10-13 수정
			// 휴면회원 여부를 체크하기 위해 비밀번호 찾기일때도 id찾기 api 호출
			//아이디찾기 api호출
			fncIdFind();
			
			//패스워드 변경화면으로 이동
			//goPwChngPage();

		} else {
			alert("본인인증에 실패하였습니다.");
		}
	}
	
	
	//아이디 찾기API 호출
 	function fncIdFind() {
 		var formData =  jQuery("#formIdentify").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/identify/findIdApi.do",
			cache : false,
		    data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {

				//아이디(이름)확인 화면에 전달할 정보
				jQuery("#loginId").val(data.loginId);
				jQuery("#korMberNm").val(data.korMberNm);

				if(data.statusR==200 && data.codeR=='S00000' && data.mberSttusSeCode=='01') {
					var tabSe =  jQuery("#tabSe").val();
					// 2021-10-13 수정
					// 휴면회원 여부를 체크하기 위해 비밀번호 찾기일때도 id찾기 api 호출
					if(tabSe == "id"){
						//아이디 확인페이지 이동
						goIdPage();
					}else {
						//패스워드 변경화면으로 이동
						goPwChngPage();
					}

				}else if(data.statusR==200 && data.codeR=='S00000' && data.mberSttusSeCode=='02'){
					if(confirm("회원님은 조선호텔앤리조트 계정에 1년 이상 로그인하지 않아 휴면상태로 전환되었습니다.\n휴면 해제를 진행하시겠습니까?")){
						fncReleaseApi();
					}
				}else if(data.statusR==200 && data.codeR=='S00000' && data.mberSttusSeCode=='03'){
					alert("탈퇴회원 입니다.");
					
				}else{
					
					if ("FC1006" == data.codeR) {
						alert("등록된 회원이 아닙니다.");
					} else {
						alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
					}
				}
			},
			error:function(){
				 alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
			}
		});
 	}
	
	//아이디확인 페이지이동
    function goIdPage() {
    	jQuery("#formIdentify").attr("action", "/identify/findIdPage.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
	
  //비밀번호 찾기용 변경 페이지이동
    function goPwChngPage() {
    	jQuery("#formIdentify").attr("action", "/identify/changePwPage.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
  
    //비밀번호 찾기용 변경 페이지이동
    var tabSe = "";
    function tabChange(tabSe) {
	     jQuery("#tabSe").val(tabSe);
	     //클릭하는 탭별로 제어
	     if(tabSe=='id') {	  
	         $('#tabId').removeClass('on').addClass('on');
	         $('#tab01').attr('style',"display: block");
	         $('#tabPw').removeClass('on').addClass('off');
	         $('#tab02').attr('style',"display: none");
	    }else {
	    	 $('#tabId').removeClass('on').addClass('off');
	    	 $('#tab01').attr('style',"display: none");
	         $('#tabPw').removeClass('on').addClass('on');
	         $('#tab02').attr('style',"display: block");
	     }
	}


  //휴면계정 해제API 호출
  function fncReleaseApi() {
	  var formData =  jQuery("#formIdentify").serialize();
	  jQuery.ajax({
		  type : "POST",
		  url : "/identify/releaseApi.do",
		  cache : false,
		  data : formData,
		  dataType : "json",
		  global : false,
		  success : function(data) {

			  if(data.statusR==200 && data.codeR=='S00000') {
				  var tabSe =  jQuery("#tabSe").val();
				  if(tabSe == "id"){
					  //아이디 확인페이지 이동
					  goIdPage();
				  }else{
					  //패스워드 변경화면으로 이동
					  goPwChngPage();
				  }
			  }else{
				  alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
			  }
		  },
		  error:function(){
			  alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
		  }
	  });
  }


  // 휴면해제 확인 페이지이동
  function goReleaseRsltPage() {
	  jQuery("#formIdentify").attr("action", "/identify/releaseRsltPage.do");
	  jQuery("#formIdentify").attr("method", "post");
	  jQuery("#formIdentify").submit();
  }
  </script>
	
	
 <form id="formIdentify" >
  <!-- 본인인증 사용유형 -->
  <input type="hidden" id="loginId" name="loginId" value="" />
  <input type="hidden" id="korMberNm" name="korMberNm" value="" />
  <input type="hidden" id="tabSe" name="tabSe" value="id" />
  </form>
  
 
  <!-- 본인인증 소스 include Start -->
 









<form method="post" name="reqPCCForm">
	<input type='hidden' name='reqInfo' value='FDD8B4244814A6C0A018CA0F26A4FF01100875729E1ED83997607129B0BC1A95F1CFB6726E647BC2DAA427333A94BA1049108E1DFBFE75D65FF06580AF99AB80B5C38B3E67A7A53192EAD169667F27AC7F5B4241CAC084842B8FA1DC4B81AE8E56E90389AD97065B98B0E2710C2AA01EC788306C60A4B4DFBB5DDB336A0C652A53813C4BCA0CB5997B196ABB9C10C92C859A845FCCC04B7BA8B002657E346DF568CAEEEC2F2B282E6CE54D699084E8C0A0D871234334A86B8A904156EA0C17063155618021313A0890FA773A10DE312FF5D1591DFC9C53767D34FCA7E8EBA7A9' /> 
	<input type='hidden' name='retUrl' value='32https://www.josunhotel.com/common/selfCrtfc/nameCallback.do?pageType=find' /> 
	<input type='hidden' name='chk_type' value='' /> 
	<input type='hidden' name='rcv_method' value='' />
</form>


 <!-- 본인인증 소스 include End -->

		<div id="container" class="container findingBox">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">아이디 찾기</h1>
			<div class="topArea">
				<h2 class="titDep2">아이디 / 비밀번호 찾기</h2>
			</div>
			<div class="inner">
				<ul class="tabType01 tabType02">
					<li  id="tabId"  class="on">  <a href="javascript:tabChange('id');"> 아이디 찾기</a></li>
					<li  id="tabPw" class="off">  <a href="javascript:tabChange('pw');"> 비밀번호 찾기</a></li>
				</ul>
				<!-- tabCont(아이디찾기) -->
				<div id="tab01" class="tabCont" style="display: block;">
					<h3 class="hidden">아이디 찾기</h3>
					<div class="txtBox">
						<p class="txtBoxTitle">아이디를 잊으셨나요?<br>휴대폰 본인인증을 통해<br>아이디를 확인하실 수 있습니다.</p>
						<p class="txtBoxDescription">휴대폰 인증의 경우 회원님 명의로 되어있는<br>휴대폰 번호를 통해서 본인확인 과정을 거치게 됩니다.<br>회원님의 개인정보와 일치하지 않는 소유자의 휴대폰일 경우,<br>확인이 이루어지지 않습니다.</p>
						<div class="btnArea">
							<button type="button" class="btnSC btnL active" onclick="gfncNameCert(); return false;">휴대폰 본인 인증</button>
						</div>
					</div>
				</div>
				<!-- //tabCont(아이디찾기) -->
				<!-- tabCont(비밀번호찾기) -->
				<div id="tab02" class="tabCont" style="display: none;">
					<h3 class="hidden">비밀번호 찾기</h3>
					<div class="txtBox">
						<p class="txtBoxTitle">비밀번호를 잊으셨나요?<br>휴대폰 본인인증을 통해 고객님의 비밀번호를 안전하게 재설정 가능합니다.</p>
						<p class="txtBoxDescription">휴대폰 인증의 경우 회원님 명의로 되어있는<br>휴대폰 번호를 통해서 본인확인 과정을 거치게 됩니다.<br>회원님의 개인정보와 일치하지 않는 소유자의 휴대폰일 경우,<br>확인이 이루어지지 않습니다.</p>
						<div class="btnArea">
							<button type="button" class="btnSC btnL active" onclick="gfncNameCert(); return false;">휴대폰 본인 인증</button>
						</div>
					</div>
				</div>
				<!-- //tabCont(비밀번호찾기) -->
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>


		<!-- //container -->
		
		
       <!--S footer  -->
		<jsp:include page="/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
	</div>
	<!-- //wrapper -->

<!-- 호텔 찾기 Layer -->
<div id="hotelFindLayer" class="layerPop">
	<div class="layerCont">
		<div class="hotelFindPop">
			<h2>호텔 찾기</h2>
			<ul class="hotelSelect">
								<li>
					<a href="https://jpg.josunhotel.com/main.do" target="_blank" title="새창열림">		
						<span class="hotelLogo palace">
						</span>
						<span class="hotelTit">조선 팰리스<!-- 조선 팰리스 --></span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selwi-the-westin-chosun-seoul" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinSeoul">
						</span>
						<span class="hotelTit">웨스틴 조선 서울</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/puswi-the-westin-chosun-busan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinBusan">
						</span>
						<span class="hotelTit">웨스틴 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjb.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandBusan">
						</span>
						<span class="hotelTit">그랜드 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjj.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandJeju">
						</span>
						<span class="hotelTit">그랜드 조선 제주</span>
					</a>
				</li>
				<li>
					<a href="https://lescapehotel.com/main" target="_blank" title="새창열림">
						<span class="hotelLogo lescape">
						</span>
						<span class="hotelTit">레스케이프 호텔</span>
					</a>
				</li>
				<li>
					<a href="https://grp.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo gravityPangyo">
						</span>
						<span class="hotelTit">그래비티 서울 판교</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfp-four-points-seoul-namsan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonSeoulstation">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선 서울역</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfd-four-points-seoul-myeongdong" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonMyeongdong">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선, 서울 명동</span>
					</a>
				</li>
			</ul>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#hotelFindLayer'))">닫기</button>
	</div>
</div>
<!-- //호텔 찾기 Layer -->
<div class="dimmed"></div>
</body>
</html>
