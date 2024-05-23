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

  <title>예약내역 - 객실 패키지 예약 내역, 예약 상세보기 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트예약확인, 조선호텔객실예약확인">
  <meta name="description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:title" content="예약내역 - 객실 패키지 예약 내역, 예약 상세보기 | 조선호텔앤리조트">
  <meta property="og:description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:url" content="https://josunhotel.com/cnfirm/mber/room/reserveView.do?confirmationNumber=411665&hotlSysCode=GJJ">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/cnfirm/mber/room/reserveView.do?confirmationNumber=411665&hotlSysCode=GJJ"/>
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
<jsp:include page="/header.jsp"></jsp:include>
<!--E header  -->






        <!--(페이지 URL)-->











<script>

$(document).ready(function(){
	var ckin = "2024.07.16";
	var ckout = "2024.07.17";
	var diffDay = dUtils.dateDiff(ckin, ckout);

	$("#dateText").append(ckin+" - "+ckout+" ("+diffDay+"박)");
	$("#printDateText").append(ckin+" - "+ckout+" ("+diffDay+"박)");
});

//2020-11-10 추가
//렌딩 라이브러리 클릭 이벤트
$(document).on("click", "input[type='checkbox'][id^='landing']", function(){
	//랜딩라이브러리 3개 초과 선택시 alert
	if(4 <= jQuery("input[type='checkbox'][id^='landing']:checked").length){
		alert('렌딩 라이브러리는 최대 3개까지 선택 가능합니다.'); //렌딩 라이브러리는 최대 3개까지 선택 가능합니다.
		return false;
	}
});


/*
랜딩라이브러리 레이어 팝업 OPEN
*/
function fncOpenGrslayer(hotlSysCode, confirmNo, legNum){
	commonJs.showLoadingBar();
	
	var param = {
		hotlSysCode : hotlSysCode,
		confirmationNumber : confirmNo,
		legNumber : legNum
	}
	
	$("#legNumber").val("");
	
	jQuery.ajax({
		type : "POST",
		url : "/resve/room/getGrsList.json",
		cache : false,
		dataType : "json",
		data : param,
		global : false,
		success : function(data){
			var resultCode = data.resultCode;
			var resultMsg = data.resultMsg;
			
			if(resultCode == "SUCCESS"){
				
				
				$("#landingArea").html("");
				
				var landingHtml = "";
				
				var list = data.grsList;
				if(list.length > 0){
					for(var i = 0; i < list.length; i++){
						
						landingHtml += "<li class=\"frmCheck\">";
						var isChecked = list[i].checked == "checked" ? list[i].checked : "";
						
						console.log("isChecked : " + isChecked);
						
						if(Number(list[i].availableLandingLibrary) > 0){
							landingHtml += "<input type=\"checkbox\" id=\"landing"+i+"\" "+isChecked+" value=\""+list[i].itemCode+"\">";	
						}else{
							
							if(isChecked == "checked"){
								landingHtml += "<input type=\"checkbox\" id=\"landing"+i+"\" "+isChecked+" value=\""+list[i].itemCode+"\">";
							}else{
								landingHtml += "<input type=\"checkbox\" id=\"landing"+i+"\" disabled=\"disabled\" value=\""+list[i].itemCode+"\">";	
							}
						}
						
						landingHtml += "<label for=\"landing"+i+"\">"+list[i].itemName+"</label>";
						landingHtml += "</li>";
					}
					$("#legNumber").val(legNum);
					$("#landingArea").html(landingHtml);
				}
				commonJs.closeLoadingBar();
				commonJs.popShow($('#layerPop1'));
			}else{
				alert(resultMsg);
			}
		},
		error:function(r, s, e){
			alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
		}
	});
}



function fncUpdateLib(){
	commonJs.showLoadingBar();
	
	var bpArr = new Array();
	var bpNmArr = new Array();
	var checkLength = $("input[id^='landing']:checked").length;
	var legNumber = jQuery("#legNumber").val()
	
		
	$("input[id^='landing']").each(function(){
		if($(this).is(":checked")){
			bpArr.push($(this).val());
			bpNmArr.push(jQuery(this).closest("li.frmCheck").find("label").text());
		}
	});
	
	if(checkLength > 0){
		$("#bp").val(bpArr.toString());
		$("#bpNm").val(bpNmArr.toString());	
	}else{
		$("#bp").val("");
		$("#bpNm").val("");
	}
	
	var param = {
		hotlSysCode : jQuery("#hotlSysCode").val()
		,ckinDate : jQuery("#ckinDate").val()
		,ckoutDate : jQuery("#ckoutDate").val()
		,confirmationNumber : jQuery("#confirmationNumber").val()
		,legNumber : legNumber
		,bp : jQuery("#bp").val()
		,bpNm : jQuery("#bpNm").val()
	};
	
	jQuery.ajax({
		type : "POST",
		url : "/resve/room/updateGrs.json",
		cache : false,
		dataType : "json",
		data : param,
		global : false,
		success : function(data){
			var resultCode = data.resultCode;
			var resultMsg = data.resultMsg;
			
			if(resultCode == "SUCCESS"){
				alert('수정되었습니다.');
				$("#bpNm"+legNumber).text(bpNmArr.toString());
				commonJs.popClose($('#layerPop1'));
			}else{
				alert(resultMsg);
			}
			
			commonJs.closeLoadingBar(); //로딩바 hide
		},
		error:function(r, s, e){
			alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			commonJs.closeLoadingBar(); //로딩바 hide
		}
	});
	
}


function fncResveCancel(){

	commonJs.showLoadingBar(); //로딩바 show
	var confirmationNumber = jQuery("#confirmationNumber").val();
	var param = {
			confirmationNumber : confirmationNumber,
			hotlSysCode : jQuery("#hotlSysCode").val()
		}

    //2022-12-26 추가 seo ga4
    gfncPushRoomCancelSeoData(confirmationNumber);
	
	jQuery.ajax({
		type : "POST",
		url : "/resve/room/resvCancel.json",
		cache : false,
		dataType : "json",
		data : param,
		global : false,
		success : function(data){
			var resultCode = data.resultCode;
			var resultMsg = data.resultMsg;
			if(resultCode == "SUCCESS"){
				alert('예약이 취소되었습니다.');
				commonJs.popClose($('#layerPop2'));
				$("#form").attr("method", "post");
				$("#form").attr("action", "/cnfirm/mber/room/reserveView.do");
				$("#form").submit();
			}else{
				alert(resultMsg);
			}
			commonJs.closeLoadingBar(); //로딩바 hide
		},
		error:function(r, s, e){
			alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
		}
	});
	
}



function fncList(){
	$("#form").attr("method", "post");
	$("#form").attr("action", "/cnfirm/mber/room/reserveList.do");
	$("#form").submit();
}

</script>

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



	
		<div class="myContents">
		
			<form id="form" name="form">
				<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="GJJ" />
				<input type="hidden" name="ckinDate" id="ckinDate" value="20240716" />
				<input type="hidden" name="ckoutDate" id="ckoutDate" value="20240717" />
				<input type="hidden" name="confirmationNumber" id="confirmationNumber" value="411665" />
				<input type="hidden" name="engLastName" id="engLastName" value="KIM" />
				<input type="hidden" name="engFirstName" id="engFirstName" value="MUYEONG" />
				<input type="hidden" name="roomResveSn" id="roomResveSn" value="2044066" />
				<input type="hidden" name="searchDataType" value="" />
				<input type="hidden" name="agoMonth" value=""/>
				<input type="hidden" name="searchDataBeginDe" value=""/>
				<input type="hidden" name="searchDataEndDe" value=""/>
				<input type="hidden" name="searchCtgry" value=""/>
				<input type="hidden" name="legNumber" id="legNumber" />
				<input type="hidden" name="bp" id="bp" />
				<input type="hidden" name="bpNm" id="bpNm" />
			</form>
			
			<h2 class="titDep2">ROOM ONLY</h2>
			<p class="categoryTxt">
				예약번호 <em>411665</em>
				<span class="vBar">RESERVED<!-- 예약완료 --></span>
			</p>
			<button type="button" class="btnPrint small" onclick="commonJs.popShow($('#layerPop10'))">인쇄하기</button>
			<!-- 예약 정보 -->
			<h3 class="hidden">예약 정보</h3>
			<div class="reserveInfo">
				<h4 class="titDep4">예약 정보</h4>
				<div class="commWrap">
					<div class="commlist">
						<span class="txt">그랜드 조선 제주</span>
						<span class="txt" id="dateText"></span>
					</div>
					<div class="commlist">
						<span class="txt">1 ROOMS</span>
						<span class="txt">
							DELUXE /
							STANDARD VIEW /
							2DOUBLE
						 </span>
					</div>
					<div class="commlist">
						<span class="txt">
							2 ADULTS, 0 CHILDREN
						</span>
					</div>
				</div>
			</div>
			<!-- //예약 정보 -->
			<!-- 객실 상세 내역 -->
			<h3 class="titDep3">객실 상세 내역</h3>
			<ul class="toggleList rsvList">
				
				<li class="toggleOn"><!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
					<strong class="listTit">객실1</strong>
					<span class="opValue">2 ADULTS, 0 CHILDREN</span>
					<em class="intValue"><em>299,200</em> KRW</em>
					<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
					<div class="toggleCont">
						<div class="toggleInner">
							<div class="commWrap">
								<dl class="commlist">
									<dt>객실 금액</dt>
									<dd>
										<ul class="infoData">
											
												<li>
													<span class="lfData">2024.07.16</span>
													<span class="rtData">272,000</span>
												</li>
											
										</ul>
									</dd>
								</dl>
								<dl class="commlist">
									<dt>옵션 금액</dt>
									<dd>
										<ul class="infoData">
											
											
											
										</ul>
									</dd>
								</dl>
								<dl class="commlist">
									<dt>세금 및 봉사료</dt>
									<dd>
										<ul class="infoData">
											<li>
												<span class="lfData">세금(10%)</span>
												<span class="rtData">27,200</span>
											</li>
											<!-- <li><span class="lfData">봉사료(10%)</span><span class="rtData">8,000</span></li> -->
										</ul>
									</dd>
								</dl>
							</div>
							
							
							
							
							
							
						</div>
					</div><!-- //toggleCont -->
				</li>
				
			</ul><!-- //객실 상세 내역 -->
			
			
			
			<div class="total noMember">
				<div class="totalWrap type02">
					<span class="tit">총 예약금액</span>
					<strong class="pay">
						<em>299,200</em>KRW
					</strong>
				</div>
			</div>
			<!-- <p class="txtGuide">상기 요금은 포인트 사용 시 예상되는 결제 금액으로 실제와는 다를 수 있습니다.</p> -->                     
			
			<!-- 회원 정보 -->
			<h3 class="titDep3">회원정보</h3>
			<table class="tblV">
				<colgroup>
					<col style="width:240px">
					<col style="width:auto">
				</colgroup>
				<caption>예약 회원정보 목록</caption>
				<thead>
				<tbody>
					
						
						
							<tr>
								<th scope="row">영문 이름</th>
								<td>MUYEONG&nbsp;KIM</td>
							</tr>
						
					
					<tr>
						<th scope="row">연락처</th>
						<td>010-7427-0406</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="lower">whdcks208@naver.com</td>
					</tr>
				</tbody>
			</table>
			<h3 class="titDep3">신용카드 정보</h3>
			<table class="tblV">
				<colgroup>
					<col style="width:240px">
					<col style="width:auto">
				</colgroup>
				<caption>결재 신용카드 정보 목록</caption>
				<thead>
				<tbody>
					<tr>
						<th scope="row">신용카드 종류</th>
						<td>비씨</td>
					</tr>
					<tr>
						<th scope="row">신용카드 번호</th>
						<td>**********1606</td>
					</tr>
				</tbody>
			</table>
			<ul class="txtGuide">
				
					
						<li>신용카드 정보는 고객님의 프로그램에 의한 개런티 외에는 어떤 목적으로도 사용되지 않습니다.</li>
						<li>본 정보는 온라인 예약 시직접 결제가 이루어지지 않으며, 체크아웃 시 동일한 신용카드 지참을 부탁드립니다.</li>
					
					
				
				
				
			</ul>
			<h3 class="titDep3">취소 규정</h3>
			<ul class="listDep1">
				<li>체크인 7일 전 오후 6시 이전 : 위약금 없이 변경 및 취소 가능</li>
<li>체크인 7일 전 오후 6시 이후 ~ 1일 전 오후 6시 이전 : 최초 1박 요금의 20% 부과</li>
<li>체크인 1일 전 오후 6시 이후 : 취소 및 No-show 위약금 발생
<ul class="listDep2">
<li>1박 투숙 : 객실료의 80% 위약금 부과</li>
<li>2박 이상 투숙 : 최초 1박 요금의 100% 부과</li>
</ul>
			</ul>
			<div class="btnArea">
				<a href="#none" onclick="fncList();" class="btnSC btnL">목록</a>
				
					
						
							
								
									<a href="#none" class="btnSC btnL active" onclick="commonJs.popShow($('#layerPop2'))">예약취소</a>
								
								
							
						
					
					
				
			</div>
		</div>
	</div>
</div>

<!-- 랜딩 라이브러리(추가/수정) Layer -->

	<div id="layerPop1" class="layerPop">
		<div class="layerCont">
			<div class="reserveOpArea">
	            <strong class="tit">렌딩 라이브러리 추가/수정</strong>
	            <ul class="frmList type03" id="landingArea">
	                
	            </ul>
				<p class="txtGuide">렌딩 라이브러리 사전 예약은 3개까지 가능하며, 추가로 물품 예약을 원하시는 경우 현장에서 요청 부탁드립니다.</p>
				<p class="txtGuide">숙박 날짜에 수량이 소진된 물품은 선택이 불가능합니다.</p>
				<p class="txtGuide">체크인 당일 재고 상황에 따라 대여가 어려울 수 있습니다.</p>
				<div class="btnArea">
					<button type="button" class="btnSC btnM" onclick="commonJs.popClose($('#layerPop1'));">취소</button>
					<button type="button" class="btnSC btnM active" onclick="fncUpdateLib();">수정</button>
				</div>
			</div>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'));">닫기</button>
		</div>
	</div>

<!-- //랜딩 라이브러리(추가/수정) Layer -->
	
<!-- 예약취소 Layer -->

 
	<div id="layerPop2" class="layerPop">
		<div class="layerCont">
			<div class="reserveOpArea">
	            <strong class="tit">예약 취소</strong>
	            <p class="txtConfirm">예약을 취소 하시겠습니까?</p>
				<ul class="listDep1">
	                <li>예약취소 시 기존 예약으로 복구가 불가합니다.</li>
	                <li>취소 및 환불 정책 기준으로 예약 취소가 진행됩니다.</li>
	            </ul>
	            
				<div class="btnArea">
					
						<button type="button" class="btnSC btnM" onclick="commonJs.popClose($('#layerPop2'))">취소</button>
					
					<button type="button" class="btnSC btnM active" onclick="fncResveCancel();">예약취소</button>
				</div>
			</div>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop2'))">닫기</button>
		</div>
	</div>

<!-- //예약취소 Layer -->

<!-- 예약취소불가 Layer -->
<div id="layerPop3" class="layerPop">
	<div class="layerCont">
		<div class="reserveOpArea">
            <strong class="tit">예약 취소</strong>
            <p class="txtConfirm">체크인 7일 전 예약의 경우 예약실(1811-0511)을 통한 유선 취소만 가능합니다.</p>
			<div class="btnArea">
				<button type="button" class="btnSC btnM active" onclick="commonJs.popClose($('#layerPop3'));">확인</button>
			</div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop3'))">닫기</button>
	</div>
</div>
<!-- //예약취소불가 Layer -->


<!-- 인쇄하기 Layer -->
<div id="layerPop10" class="layerPop">
	<div class="layerCont printLayer">
		<div class="printCont">
			<div class="printIntro">
				본 페이지를 인쇄합니다.<a href="#none" class="btnPrint02">인쇄하기</a>
			</div>
			<div class="inner">
				<div class="myContents">
					<h2 class="titDep2">ROOM ONLY</h2>
					<p class="categoryTxt">예약번호
						<em>411665</em>
						<span class="vBar">
							RESERVED
						</span>
					</p>
					<h3 class="hidden">예약 정보</h3>
					<div class="reserveInfo">
						<h4 class="titDep4">예약 정보</h4>
						<div class="commWrap">
							<div class="commlist">
								<span class="txt">그랜드 조선 제주</span>
								<span class="txt" id="printDateText"></span>
							</div>
							<div class="commlist">
								<span class="txt">1 ROOMS</span>
								<span class="txt">
									DELUXE /
									STANDARD VIEW /
									2DOUBLE
								</span>
							</div>
							<div class="commlist">
								<span class="txt">
									2 ADULTS, 0 CHILDREN
								</span>
							</div>
						</div>
					</div>
					<h3 class="titDep3">객실 상세 내역</h3>
					<ul class="toggleList rsvList">
						
							<li class="toggleOn"><!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<strong class="listTit">객실 1</strong>
								<span class="opValue">2 ADULTS, 0 CHILDREN</span>
								<em class="intValue"><em>299,200</em> KRW</em>
								<div class="toggleCont">
									<div class="toggleInner">
										<div class="commWrap">
											<dl class="commlist">
												<dt>객실 금액</dt>
												<dd>
													<ul class="infoData">
														
															<li>
																<span class="lfData">2024.07.16</span>
																<span class="rtData">272,000</span>
															</li>
														
													</ul>
												</dd>
											</dl>
											<dl class="commlist">
												<dt>옵션 금액</dt>
												<dd>
													<ul class="infoData">
														
														
														
													</ul>
												</dd>
											</dl>
											<dl class="commlist">
												<dt>세금 및 봉사료</dt>
												<dd>
													<ul class="infoData">
														<li><span class="lfData">세금(10%)</span><span class="rtData">27,200</span></li>
													</ul>
												</dd>
											</dl>
										</div>
										
										
										
									</div>
								</div>
							</li>
						
					</ul>
					<h3 class="hidden">금액 정보</h3>
					<div class="total noMember">
						<div class="totalWrap type02">
							<span class="tit">총 예약금액</span><strong class="pay"><em>299,200</em>KRW</strong>
						</div>
					</div>
					<!-- <p class="txtGuide">상기 요금은 포인트 사용 시 예상되는 결제 금액으로 실제와는 다를 수 있습니다.</p> -->                     
					<h3 class="titDep3">회원정보</h3>
					<table class="tblV">
						<colgroup><col style="width:240px"><col style="width:auto"></colgroup>
						<caption>예약 회원정보 목록</caption>
						<tbody>
							<tr><th scope="row">국문 이름</th><td>김무영</td></tr>
							<tr><th scope="row">영문 이름</th><td>MUYEONG&nbsp;KIM</td></tr>
							<tr><th scope="row">연락처</th><td>010-7427-0406</td></tr>
							<tr><th scope="row">이메일</th><td>whdcks208@naver.com</td></tr>
						</tbody>
					</table>
					<h3 class="titDep3">신용카드 정보</h3>
					<table class="tblV">
						<colgroup><col style="width:240px"><col style="width:auto"></colgroup>
						<caption>결재 신용카드 정보 목록</caption>
						<tbody>
							<tr><th scope="row">신용카드 종류</th><td>비씨</td></tr>
							<tr><th scope="row">신용카드 번호</th><td>**********1606</td></tr>
						</tbody>
					</table>
					<ul class="txtGuide">
						<li>신용카드 정보는 고객님의 프로그램에 의한 개런티 외에는 어떤 목적으로도 사용되지 않습니다.</li>
						<li>본 정보는 온라인 예약 시직접 결제가 이루어지지 않으며, 체크아웃 시 동일한 신용카드 지참을 부탁드립니다.</li>
					</ul>
					<h3 class="titDep3">취소 규정</h3>
					<ul class="listDep1">
						<li>체크인 7일 전 오후 6시 이전 : 위약금 없이 변경 및 취소 가능</li>
<li>체크인 7일 전 오후 6시 이후 ~ 1일 전 오후 6시 이전 : 최초 1박 요금의 20% 부과</li>
<li>체크인 1일 전 오후 6시 이후 : 취소 및 No-show 위약금 발생
<ul class="listDep2">
<li>1박 투숙 : 객실료의 80% 위약금 부과</li>
<li>2박 이상 투숙 : 최초 1박 요금의 100% 부과</li>
</ul>
					</ul>
				</div>
			</div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop10'))">닫기</button>
	</div>
</div>
<!-- //인쇄하기 Layer -->

		<!-- //container -->
 
 
 
 <!--S footer  -->
<jsp:include page="/footer.jsp"></jsp:include>
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

