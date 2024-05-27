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

  <title>마이페이지 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트회원, 조선호텔앤리조트마이페이지, 조선호텔앤리조트내예약">
  <meta name="description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:title" content="마이페이지 | 조선호텔앤리조트">
  <meta property="og:description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:url" content="https://josunhotel.com/mypage/main.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/mypage/main.do"/>
  <link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  
  
  
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
  
  

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
		
		
			//국문에서 또는 국문으로 변경 시 로그아웃
			if(currentLang == "ko" || changeLang == "ko"){
				if (confirm("언어를 변경하시면, 자동 로그아웃 됩니다.\n변경 하시겠습니까?\n\nIf you change the language, you will be logged out 		automatically.\nDo you want to proceed?")) {
					$(location).attr("href", "/login/logout.do?nextURL=/login/loginForm.do&locale=" + changeLang);
				}
			}else {
				$(location).attr("href", "/intro.do?locale=" + changeLang);
			}
			
		
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









<head>
 <script type="text/javascript" src="/static/home/js/home.js"></script> 
</head>
 
 <script type="text/javascript">
 $(document).ready(function(){
	 
	 //멤버십상품정보 국문 아닐경우 숨김
	 var langCode = $('#langCode').val();
	 if(langCode!='ko') {
	/*    $('#membershipDiv').css('visibility','hidden'); */
		 $('#membershipDiv').css('display','none');
		 $('#membdhipResDiv').css('display','none');
	 } 
	 
	}); 
 
 </script>
<input type="hidden" id="langCode" name="langCode" value="ko"/>  

		<div id="container" class="container mypage">
		









 
<script type="text/javascript">
 $(document).ready(function(){
	 
	 fncLnbInfoApi();
 	   
	}); 
  
  	//LNB정보조회(쿠폰수,가용포인트) API호출
 	function fncLnbInfoApi() {
		var formData =  jQuery("#formLnb").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/mypage/lnbInfoApi.do",
			cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				if(data.statusR==200 && data.codeR=='S00000') { 
					  //회원명 세팅
					  var nameHtml = ''+data.name;
				      /* $('.name').html(nameHtml); */
				      $('#nm1').html(nameHtml);
				      //가용포인트 세팅 
				      $('#usefulPointSpan').html(fncComma(data.usefulPoint));
				      //보유쿠폰수 세팅 
				      $('#couponCntDiv').html(fncComma(data.couponCnt));
				     
				      ///언어코드가 영문이면 멤버십메뉴 숨김
// 				      if(data.langCode=='en') {
// 				    	  $('#mbrshp1').css('display','none');
// 				    	  $('#mbrshp2').css('display','none');
// 				      }
				      
				}else{
					alert(data.statusR + " : 관리자에게 문의하세요");
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}
	
  </script> 
 
  <form id="formLnb">
  <input type="hidden" id="langCode" name="langCode" value="ko" />
  </form>
                 
			<h1 class="hidden">마이페이지</h1>
			<div class="topArea">
                <div class="topInner">
                    <h2 class="titDep1">My Page</h2>
                    <p class="pageGuide"><!-- 멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다. -->멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.</p>
                </div>
			</div> 
			<div class="inner">
                <!-- LNB -->
                <div class="lnbArea">
                 <!-- 20200806 수정 : 구조(변경) -->
                    <div class="myInfo">
                       <p class="name"> <a href="/mypage/main.do"><em id="nm1">  </em><!-- 님 -->님</a> </p>
                        <div class="info">
                            <a href="/mypage/myPointForm.do">
                                <span class="tit"><!-- 포인트 -->포인트</span>
                                <span  class="txt"><em id="usefulPointSpan">  </em><abbr title="Josun Point">J</abbr></span>
                            </a>
                            <a href="/mypage/myCouponaForm.do">
                                <span class="tit"><!-- 쿠폰 -->쿠폰</span>
                                <span id="couponCntDiv" class="txt"></span>
                            </a>
                        </div>
                    </div>
                    <ul class="lnb">
                        <!-- 20200709 수정 : LNB목록(text변경) -->
                        
	                        <li id="mbrshp1">멤버십확인
	                            <ul>
	                                <li><a href="/mypage/myGoodsForm.do">CLUB JOSUN VIP 내역</a></li>
	                            </ul>
	                        </li>
                        
                        <!-- //20200709 수정 : LNB목록(text변경) -->
                        <li><!-- 예약확인 -->예약확인
                            <ul>
                                <li><a href="/cnfirm/mber/room/reserveList.do"><!-- 객실 &middot; 패키지 예약 내역 -->객실 &middot; 패키지 예약 내역</a></li>
                                <li><a href="/cnfirm/mber/dining/reserveList.do"><!-- 다이닝 예약 내역 -->다이닝 예약 내역</a></li>
                                <li><a href="/cnfirm/mber/activity/reserveList.do"><!-- 액티비티 예약 내역 -->액티비티 예약 내역</a></li>
                                
                                <li id="mbrshp2"><a href="/cnfirm/mber/vouch/reserveList.do"><!-- 멤버십 예약 내역 -->멤버십 예약 내역</a></li>
                                
                            </ul>
                        </li>
                        <li><!-- 관심 리스트 -->관심 리스트
                            <ul>
                                <li><a href="/mber/interest/roomList.do"><!-- 객실 리스트 -->객실 리스트</a></li>
                                <li><a href="/mber/interest/packageList.do"><!-- 패키지 리스트 -->패키지 리스트</a></li>
                            </ul>
                        </li>
                        <li><!-- 개인정보관리 -->개인정보관리
                            <ul>
                                <li>
                                <a href="/mypage/myInfoForm.do"> <!-- 회원 정보 수정 -->회원 정보 수정 </a>  
                                
                                 </li>
                                <li><a href="/mypage/pwChngForm.do"><!-- 비밀번호 변경 -->비밀번호 변경</a></li>
                                <li><a href="/mypage/withdraPwCfmForm.do"><!-- 회원 탈퇴 -->회원 탈퇴</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>


 
        

<script type="text/javascript">
	var vocRegistValid = false;
	jQuery(function() {
		jQuery.ajax({
			
			type : "POST",
			url : "/voc/getInitCodeList.json",
			cache : false,
			dataType : "json",
			data : {},
			global : false,
			success : function(data){
				var _langCode = data.langCode
				
				$("#langCode").val(_langCode);

				if(_langCode == "ko"){
					$("#otherLang").empty();
				}else {
					$("#koLang").empty();
				}
				
			},
			
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});
		
		//keyup 이벤트로 validation 체크
		jQuery("input[type='text']").on("keyup", function(){
			var validFlag = true;
			jQuery(this).closest("li").find("input[type='text']").each(function(idx){
				if(jQuery(this).val() == ""){
					validFlag = false;
				}	
			});
		
			if(validFlag && jQuery(this).closest("li").hasClass("error")){
				jQuery(this).closest("li").removeClass("error");
				jQuery(this).closest("li").find(".alertMessage").hide();
			}
		});
		
		//전화번호  maxlength만큼 입력 시 다음 input 으로 이동
		jQuery("input[id^='idPhone']").keyup(function(idx){
	        var charLimit = jQuery(this).attr("maxlength");
	        if(jQuery(this).attr("role") != "last"){
		        if(this.value.length >= charLimit) {
		        	jQuery(this).parent().next().next().find("input").focus();
		            return false;
		        }
	        }
	    });
	});
	
	function fncCancel() {
		$(".alertMessage").hide();
		
		$("#vocForm")[0].reset();
		commonJs.popClose($('#layerPop2'));
		
	}
	
	
	function fncRegist(){
		

		/*
		사용자 입력정보 VALIDATION 체크
		해당 열  input이 하나라도 미기재 된 경우 validation false
		최초 미입력 된 element로 focus 이동됨
		*/
		var frstIdx = "";
		jQuery(".intList li").each(function(){
			var $this = jQuery(this);
			var validYn = true;
			$this.find("input[type='text'], select").each(function(idx){
				var value = jQuery(this).val();
				var id = jQuery(this).attr("id");
				
				
				if(value == "" && id != "availableTime"){
					validYn = false;
					if(frstIdx == ""){
						frstIdx = jQuery(this);
					}
				}
			});
			
			if(!validYn){
				$this.addClass("error");
				$this.find(".alertMessage").show();
			}else{
				$this.removeClass("error");
				$this.find(".alertMessage").hide();
			}
		});
		if(frstIdx != ""){
			frstIdx.focus();
			return false;
		}
		
		var idPhone = $("#idPhone1").val()+"-"+$("#idPhone2").val()+"-"+$("#idPhone3").val();
		$("#idPhone").val(idPhone);
		if($("#langCode").val() == "ko"){
			var korNm = $("#korNm").val()
			$("#nmCust").val(korNm);
		}else{
			var engNm = $("#engLastName").val()+" "+$("#engFirstName").val();
			$("#nmCust").val(engNm);
		}
		
		$("#bnefNo").val($(".titDep1").text());
		
		// 개인정보 수집ㆍ이용 동의
		if(!jQuery("#privacyAgree").is(":checked")){
			alert("개인정보 수집ㆍ이용에 동의해주세요."); 
			jQuery("#privacyAgree").focus();
			return false;
		}

		jQuery.ajax({
			type : "POST",
			url : "/voc/regist.json",
			cache : false,
			dataType : "json",
			data : jQuery("#vocForm").serialize(),
			global : false,
			beforeSend: function (data, frm, opt) {
				//중복 등록 방지
				if(vocRegistValid){
					alert("처리중입니다.");
					return false;
				}else {
					vocRegistValid = true;
				}
			},
			success : function(data){
				var resultCode = data.resultCode;
				var resultMsg = data.resultMsg;
				commonJs.popClose($('#layerPop2'));
				if(resultCode == "SUCCESS"){
					//상담신청이 정상적으로 접수되었습니다.\r\n내용 확인 후 빠른 시일 내에 담당자가 연락드릴 예정입니다.
					alert('상담신청이 정상적으로 접수되었습니다.\r\n내용 확인 후 빠른 시일 내에 담당자가 연락드릴 예정입니다.');
				}else{
					alert(resultMsg);
				}
				vocRegistValid = false;
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});

	}
</script>
<form id="vocForm" name="vocForm">
	<input type="hidden" id="vocType" name="vocType" value="voc01"/>	
	<input type="hidden" id="idSysReg" name="idSysReg" value="001"/>	
	<input type="hidden" id="tpChnnSystem" name="tpChnnSystem" value="01"/>	
	<input type="hidden" id="tpChnnPath" name="tpChnnPath" value="0101"/>	
	<input type="hidden" id="cdVocPattern" name="cdVocPattern" value="06"/>	
	<input type="hidden" id="cdVocCause" name="cdVocCause" value="005005005"/>	
	<input type="hidden" id="cdVocSource" name="cdVocSource" value="802"/>	
	<input type="hidden" id="idPhone" name="idPhone" value=""/>	
	<input type="hidden" id="nmCust" name="nmCust" value=""/>	
	<input type="hidden" id="langCode" name="langCode" value=""/>	
	<input type="hidden" id="bnefNo" name="bnefNo" value=""/>	
<!-- 멤버십 상담신청 Layer -->
<div id="layerPop2" class="layerPop">
	<div class="layerCont" style="top: 50%; left: 50%; margin-top: -395px; margin-left: -540px;">
		<div class="membershipConsult">
			<h2 class="compTit">멤버십 상담신청</h2>
			<div class="scrollWrap">
				<h3 class="hidden">작성자 정보</h3>
				<div class="frmInfo">
					<ul class="intList">
						<!-- 20200602 수정 -->
						<!-- 국문 -->
						<li id="koLang">
							<div class="intWrap"><span class="tit"><label for="eName">KOREAN NAME</label><span class="essential">필수</span></span></div>
							<div class="intInner duobuleInp">
								<span class="intArea"><input type="text" id="korNm" style="width:437px" aria-required="true" placeholder="국문 이름을 입력하세요." onkeyup="gfncOnlyKorNm(this);;"></span>
								<span class="alertMessage">이름을 입력해주세요.</span>
							</div>
						</li>
						<!-- //국문 -->
						<!-- 다국어 -->
						<li id="otherLang">
							<div class="intWrap"><span class="tit"><label for="eName02">ENGLISH NAME</label><span class="essential">필수</span></span></div>
							<div class="intInner duobuleInp">
								<span class="intArea">
									<input type="text" id="engLastName" style="width:215px" aria-required="true" placeholder="Family Name(성)" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();">
								</span>
								<span class="intArea">
									<input type="text" id="engFirstName" style="width:215px" aria-required="true" placeholder="First Name(이름)" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();">
								</span>
								<span class="alertMessage">이름을 입력해주세요.</span>
							</div>
						</li>
						<li>
							<div class="intWrap"><span class="tit"><label for="phone02">PHONE NUMBER</label><span class="essential">필수</span></span></div>
							<div class="intInner phoneInp">
								<span class="intArea"><input type="text" id="idPhone1" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" maxlength="3"></span>
								<span class="dash"></span>
								<span class="intArea"><input type="text" id="idPhone2" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" maxlength="4"></span>
								<span class="dash"></span>
								<span class="intArea"><input type="text" id="idPhone3" role="last" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" maxlength="4"></span>
								<span class="alertMessage">휴대폰 번호를 입력해주세요.</span>
							</div>
							<p class="txtGuide">전화 번호는 상담 가능한 연락처를 기입해주세요.</p>
						</li>
						<!-- //다국어 -->
						<!-- //20200602 수정 -->
						<li>
							<div class="intWrap"><span class="tit"><label for="cardType">Available Times</label></span></div>
							<div class="intInner">
								<div class="intArea selectWrap" style="width:617px">
									<select id="availableTime" name="availableTime" data-height="150px" data-msg="상담 가능 시간을 선택해주세요." data-direction="down" title="상담시간선택">
										<option value="오전 오후 모두 가능">오전 오후 모두 가능</option>
										<option value="오전 9:00~12:00">오전 9:00~12:00</option>
										<option value="오후 13:00~16:00">오후 13:00~16:00</option>
										<option value="오후 16:00~18:00">오후 16:00~18:00</option>
									</select>
								</div>
							</div>
							<p class="txtGuide">상담가능 시간은 편의를 위한 선택사항이며, 선택한 시간과 다를 수 있습니다.</p>
							<p class="txtGuide">멤버십 관련 문의 및 상담은 회원관리과 운영시간(AM 09:00 ~ PM 05:30)에만 진행됩니다.</p>
							
						</li>
					</ul>
				</div>

				<h3 class="titDep3">개인정보 수집 및 이용에 관한 동의</h3>
				<ul class="toggleList agreeCont">
					<li class="toggleOn">
						<span class="frm type02">
							<input type="checkbox" id="privacyAgree" value="Y"><label for="privacyAgree">[필수]개인정보 수집 &middot; 이용 동의</label>
						</span>
						<button type="button" class="btnToggle"><span class="hidden">상세내용 닫기</span></button><!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
						<div class="toggleCont">
							<div class="toggleInner">
								<!-- 20200806 수정 : 약관(추가) -->
								<p class="notiTxt">
									
									조선호텔앤리조트는 클럽조선 회원가입과 관련하여 아래와 같은 개인정보를 수집 및 이용하고 있습니다.<br>개인정보 처리에 대한 상세한 사항은 조선호텔앤리조트 홈페이지의 &lsquo;개인정보처리방침&rsquo;을 참조하십시오.
								</p>
								<p class="notiTxt">
									
									본 개인정보 수집 및 이용 동의서의 내용과 상충되는 부분은 본 동의서의 내용이 우선합니다.
								</p>
								<table class="tblH">
									<colgroup><col style="width:33%"><col style="width:34%"><col style="width:auto"></colgroup>
									<caption>개인정보수집 및 이용에 대한 동의 목록</caption>
									<thead>
										<tr>
											<th scope="col">수집 항목</th>
											<th scope="col">수집 목적</th>
											<th scope="col">보유 기간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="tcenter">이름, 휴대폰번호</th>
											<td>서비스 이용자 식별 및 의사소통</td>
											<td class="f18">상담신청 접수 후 3년</td>
										</tr>
									</tbody>
								</table>
								<p class="txtGuide">
									
									위의 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으나 동의를 거부하실 경우 서비스 이용이 불가합니다.
								</p>				
								<!-- //20200806 수정 : 약관(추가) -->
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="btnArea">
				<button type="button" class="btnSC btnM" onclick="fncCancel();">취소</button>
				<button type="button" class="btnSC btnM active" onclick="fncRegist();return false;">상담 예약</button>
			</div>
		</div>
		<button type="button" class="btnClose" onclick="fncCancel();">닫기</button>
	</div>
</div>
<!-- //멤버십 상담신청 Layer -->
<div class="dimmed"></div>
</form>
                <!-- myContents -->
                <div class="myContents">
                    <h3 class="hidden">마이페이지</h3>
                    <div class="myAccountBox">
                        <div class="myAccountInfo">
                            <!-- 20200528 수정 : 회원번호 → 리워즈 번호(콘텐츠변경) -->
                            <dl>
                                <dt><!-- 리워드 번호 -->리워드 번호<span class="side"><button type="button" class="btnLine" onclick="commonJs.popShow($('#layerPop5'))"><!-- 리워드 혜택 -->리워드 혜택</button></span></dt><!-- 20200709 수정 : (리워즈 → 리워드) 문구(변경) -->
                                <dd><span class="accountNum">7333-0100-0591-0710</span></dd>
                            </dl>
                            <!-- //20200528 수정 : 회원번호 → 리워즈 번호(콘텐츠변경) -->
                            <dl>
                                <dt><a href="/mypage/myPointForm.do" class="btnArr"><abbr title="Josun Point">J</abbr><!-- 포인트 -->포인트</a></dt>
                                <dd><span class="usablePoint">0</span><p class="txtGuide">2024.05.23</p></dd>
                            </dl>
                        </div>
                    </div>
                    <!-- //myAccountBox -->

                    <!-- 조선멤버스 쿠폰 -->
                    <h4 class="hidden"><!-- 조선멤버스 쿠폰 -->조선멤버스 쿠폰</h4>
                    <div class="myCouponBox">
                        <dl>
                            <dt><!-- 발급 쿠폰 -->발급 쿠폰</dt>
                            <dd><em>11</em><span class="hidden"><!-- 개 -->개</span></dd><!-- 20200528 수정 : 쿠폰단위(숨김) -->
                        </dl>
                        <dl>
                            <dt><!-- 사용 쿠폰 -->사용 쿠폰</dt>
                            <dd><a href="/mypage/myCouponeForm.do" title="사용 쿠폰함 바로가기"><em>0</em><span class="hidden"><!-- 개 -->개</span></a></dd><!-- 20200528 수정 : 쿠폰단위(숨김) -->
                        </dl>
                        <dl>
                            <dt><!-- 잔여 쿠폰 -->잔여 쿠폰</dt>
                            <dd><a href="/mypage/myCouponaForm.do" title="잔여 쿠폰함 바로가기"><em class="pointTxt">11<span class="hidden"><!-- 개 -->개</span></em></a></dd><!-- 20200528 수정 : 쿠폰단위(숨김) -->
                        </dl>
                    </div>
                    <!-- //조선멤버스 쿠폰 -->

                  <!-- 클럽조선 회원정보 20200528 수정 : 콘텐츠(추가) -->
                     
                    <!-- //클럽조선 회원정보 20200528 수정 : 콘텐츠(추가) -->

                    <!-- 20200709 수정 : (예약 내역 → 예약 확인) 문구(변경) -->
                    <!-- 예약 확인 -->
                    <h4 class="hidden"><!-- 예약 확인 -->예약 확인</h4><!-- 20200709 수정 : (예약 내역 → 예약 확인) 문구(변경) -->
                   <!-- loop -->
                    
                    
                     
	                     <div class="myReserveBox">
	                        <strong class="tit"><!-- 객실/패키지 예약 내역 -->객실/패키지 예약 내역</strong>
	                        <p class="txtGuide"><!-- 현재부터 3개월 이후의 예약 내역을 확인할 수 있습니다. -->현재부터 3개월 이후의 예약 내역을 확인할 수 있습니다.</p>
	                        <ul class="myReserveList">
	                        
	                          
	                            <li>
	                                <a href="/cnfirm/mber/room/reserveView.do?confirmationNumber=411665&hotlSysCode=GJJ">
	                                    <div class="myReserveInfo">
	                                        <dl>
	                                            <dt>[411665] ROOM ONLY</dt>
	                                            <dd>2024.07.16 - 2024.07.17</dd>
	                                        </dl>
	                                    </div>
	                                </a>
	                            </li>
	                            
	                        
	                        </ul>
	                       <a href="/cnfirm/mber/room/reserveList.do"> <button type="button" class="btnLine" ><!-- 전체보기 -->전체보기</button> </a>
	                    </div>
                    
                    
                    <!-- //loop -->
                     
                    
                 
                    
                    
                    <!-- //예약 확인 -->
                    <!-- //20200709 수정 : (예약 내역 → 예약 확인) 문구(변경) -->

                    <!-- 관심 리스트 -->
                    
                    <!-- //관심 리스트 -->
				</div>
				</div>
			</div>
			<!-- //inner -->
			
 <!-- 리워드 혜택 Layer -->
<div id="layerPop5" class="layerPop">
	<div class="layerCont">
		<div class="compLayer" style="width:760px">
			<h2 class="compTit"><!-- 리워드 혜택 -->리워드 혜택</h2>
            <h3 class="compSubTit">POINT</h3>
            <ul class="listDep1">
                <li><!-- 레스토랑 이용 시 1% 포인트 적립 -->레스토랑 이용 시 1% 포인트 적립</li>
                <li><!-- 1,000<abbr title="Josun Point">J</abbr> 이상부터 사용 가능 -->1,000<abbr title="Josun Point">J</abbr> 이상부터 사용 가능</li>
            </ul>

            <h3 class="compSubTit">BENEFIT</h3>
            <!-- 20200720 수정 : 문구(변경) -->
            <ul class="listDep1">
                <li><!-- 웰컴 드링크 2잔(1회 제공, 1년 이내 객실 투숙 시 이용 가능) --> 웰컴 드링크 2잔(1회 제공, 1년 이내 객실 투숙 시 이용 가능)</li>
                <li><!-- 객실 1만원 할인권 5매(호텔 별 1매 씩 사용 가능, 2년 이내 객실 투숙 시 이용 가능) -->객실 1만원 할인권(호텔 별 1매 씩 사용 가능, 2년 이내 객실 투숙 시 이용 가능)</li>
            </ul>
            <!--<p class="txtGuide">상기 혜택은 객실 투숙 시 이용 가능합니다.</p>-->
            <!-- //20200720 수정 : 문구(변경) -->
			<div class="btnArea">
				<button type="button" class="btnSC btnM active" onclick="commonJs.popClose($('#layerPop5'))">확인</button>
			</div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop5'))"><!-- 닫기 -->닫기</button>
	</div>
</div>
<!-- //리워드 혜택 Layer -->
<!-- 혜택 및 쿠폰보기 Layer -->
<div id="layerPop3" class="layerPop">
	<div class="layerCont">
		<div class="compLayer" style="width:940px">
            <div class="menuPanArea">
                <h2 class="compTit">REWARDS PLUS</h2>
                <!-- tab -->
                <ul class="tabType01 tabType02 tabToggle">
                    <li class="on"><a href="#tab01" role="button">객실 특전</a></li>
                    <li><a href="#tab02" role="button">레스토랑 특전</a></li>
                    <li><a href="#tab03" role="button">호텔 부대 시설 특전</a></li>
                </ul>
                <div id="tab01" class="tabCont" style="display:block">
                    <h3 class="hidden"><span class="hidden">현재페이지</span>객실 특전</h3>
                    <div class="tabInner">
                        <div class="scrollWrap" tabIndex="0">
                            <h3 class="compSubTit">웨스틴 조선 서울 30% 할인</h3>
                            <ul class="listDep1">
                                <li>할인 제외 기간 : 12월 23일, 24일, 30일, 31일</li><!-- 20200720 수정 : (2월 → 12월) 문구(수정)-->
                                <li>모든 객실은 1인 1실 기준이며, 인원 추가시 추가 요금이 발생합니다.</li>
                                <li>예약 및 문의  02-317–0404</li>
                            </ul>
                            <!--<p class="txtGuide">객실 패키지 이용 시 1만원 할인되며, 하루 최대 3객실에 한하여 적용됩니다.</p>--><!-- 20200720 수정 : 문구(삭제)-->
                            
                            <h3 class="compSubTit">포포인츠 바이 쉐라톤 조선 서울역 30% 할인</h3><!-- 20200720 수정 : (서울 남산(서울역 앞) → 서울역) 문구(수정)-->
                            <ul class="listDep1">
                                <li>할인 제외일 : 12월 24일</li><!-- 20200720 수정 : (2월 → 12월) 문구(수정)-->
                                <li>모든 객실은 2인 1실 기준이며, 인원 추가시 추가 요금이 발생합니다.</li>
                                <li>예약 및 문의  02-6070–7000</li>
                            </ul>
                            <!--<p class="txtGuide">객실 패키지 이용 시 1만원 할인되며, 하루 최대 3객실에 한하여 적용됩니다.</p>--><!-- 20200720 수정 : 문구(삭제)-->
                            <div class="noticeArea">
                                <h3 class="titDep3">유의 사항</h3>
                                <ul class="listDep1">
                                    <li>상기 모든 혜택은 회원 본인에 한하여 사용 가능하며, 양도 및 대여가 불가합니다.</li>
                                    <li>회원 할인을 원하실 경우, 예약시 클럽조선 리워드 플러스 회원임을 알려주시고 호텔 체크인 시 회원 카드를 반드시 
                                        제시하여 주시기 바랍니다.</li>
                                    <li>상기 모든 혜택은 다른 혜택과 중복하여 할인 적용되지 않습니다.</li>
                                    <li>할인율은 정상 요금(공시 요금)을 기준으로 하며, 사전 예약에 한해 적용됩니다.<br>
                                        정상 요금(공시 요금)은 호텔 사정에 따라 변동될 수 있습니다.<br>
                                        프레지덴셜 스위트 룸은 할인에서 제외됩니다.</li>
                                    <li>조선호텔 및 타사(온&middot;오프라인 포함)에서 판매하는 객실 패키지 상품 또는 기획 상품 구매 시 상기 할인 혜택이 적용되지 않습니다.</li>
                                    <li>상기 정상 요금 할인과 패키지 1만원 할인은 중복 적용되지 않습니다.</li>
                                    <li>객실 패키지 이용 시 1만원 할인되며, 하루 최대 3객실에 한하여 적용됩니다.</li><!-- 20200720 수정 : 문구(추가)-->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab02" class="tabCont" style="display:none">
                    <h3 class="hidden"><span class="hidden">현재페이지</span>레스토랑 특전레스토랑 특전</span></h3>
                    <div class="tabInner">                        
                        <div class="scrollWrap" tabIndex="0">
                            <h3 class="compSubTit">10% 할인</h3>
                            <ul class="listDep1">
                                <li>웨스틴 조선 서울 : 나인스 게이트, 스시조, 홍연, 아리아, 루브리카, 라운지 &amp; 바, 조선델리</li>
                                <li>포포인츠 바이 쉐라톤 조선 서울역 : 더 이터리, 더 바</li><!-- 20200720 수정 : (서울 : 남산 → 서울역 : ) 문구(수정)-->
                                <li>외부 레스토랑 : 뱅커스 클럽(명동 은행연합회관 16층), 호무랑(청담동 SSG Food Market 1층)</li>
                            </ul>
                            <div class="noticeArea">
                                <h3 class="titDep3">유의 사항</h3>
                                <ul class="listDep1">
                                    <li>본 특전은 호텔에서 정한 레스토랑에 한하여 적용됩니다.</li>
                                    <li>1개의 회원 카드를 가지고 테이블을 분할하여 할인 받으실 수 없습니다.</li>
                                    <li>카드에 명시된 예약시 클럽조선 리워드 플러스 회원 본인에 한해 할인 혜택이 가능하며, 타인에게 양도 또는 대여할 수 없습니다.</li>
                                    <li>상기 명시한 특전은 다른 혜택과 중복하여 할인 적용되지 않습니다.</li>
                                    <li>이그제큐티브 라운지, 인룸다이닝, 리프레쉬먼트 센터, 비즈니스 센터, 연회 행사, 조선호텔 상품권, 레스토랑 리테일 제품, 
                                        테이크 아웃 와인, 명절 선물 상품은할인 혜택이 적용되지 않습니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab03" class="tabCont" style="display:none">
                    <h3 class="hidden"><span class="hidden">현재페이지</span>호텔 부대 시설 특전</span></h3>
                    <div class="tabInner">
                        <h3 class="compSubTit">10% 할인</h3>
                        <!-- 20200720 수정 : 내용(변경) -->
                        <ul class="listDep1">
                            <li>격물공부(플라워 &amp; 라이프 스타일 숍) : 웨스틴 조선 서울</li>
                        </ul>
                        <div class="noticeArea">
                            <h3 class="titDep3">유의 사항</h3>
                            <ul class="listDep1">
                                <li>플라워 숍 내 리테일 상품은 할인에서 제외됩니다.</li>
                                <li>상기 이용 대상 영업장은 조선호텔 조선호텔 사정에 따라 추후 조정될 수 있습니다.</li>
                            </ul>
                        </div>
                        <!-- //20200720 수정 : 내용(변경) -->
                    </div>
                </div>
                <!-- tab -->
                <div class="btnArea">
                    <button type="button" class="btnSC btnM active" onclick="commonJs.popClose($('#layerPop3'))">확인</button>
                </div>
            </div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop3'))">닫기</button>
	</div>
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

