<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="검색 결과가 나올 시" %>
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

  <title>예약내역 - 객실 패키지 예약 내역 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트예약확인, 조선호텔객실예약확인">
  <meta name="description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:title" content="예약내역 - 객실 패키지 예약 내역 | 조선호텔앤리조트">
  <meta property="og:description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:url" content="https://josunhotel.com/cnfirm/mber/room/reserveList.do?confirmationNumber=&hotlSysCode=&test=GJB&searchDataType=GJJ&searchDataBeginDe=2024.05.23&searchDataEndDe=2024.08.23&agoMonth=3&searchCtgry=">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/cnfirm/mber/room/reserveList.do?confirmationNumber=&hotlSysCode=&test=GJB&searchDataType=GJJ&searchDataBeginDe=2024.05.23&searchDataEndDe=2024.08.23&agoMonth=3&searchCtgry="/>
  <link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  
  
  
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
  
  

  <link href="/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
  <link href="/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
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
<jsp:include page="/user/header.jsp"></jsp:include>
<!--E header  -->





        <!--(페이지 URL)-->










<script>

	
	function fncSearch(){
		$("#resvForm").attr("method", "get");
		$("#resvForm").attr("action", "/cnfirm/mber/room/reserveList.do");
		$("#resvForm").submit();
	}

	
	function fncResvDetail(confirmNo, hotlSysCode){
		
		$("#confirmationNumber").val(confirmNo);
		$("#hotlSysCode").val(hotlSysCode);
		$("#resvForm").attr("method", "post");
		$("#resvForm").attr("action", "/cnfirm/mber/room/reserveView.do");
		$("#resvForm").submit();
	}

	
	function fncSetMonth(agoMonth){
		
		var beginDate = new Date();
		var monthOfYear = beginDate.getMonth();
		var endDate = new Date();

		if(agoMonth != ''){
			endDate.setMonth(monthOfYear+Number(agoMonth));
			$("#datepickerFrom").val(gfncDateFormat(beginDate,'yyyy.MM.dd'));
			$("#datepickerTo").val(gfncDateFormat(endDate,'yyyy.MM.dd'));
		}else{
			$("#datepickerFrom").val("");
			$("#datepickerTo").val("");
		}
	}

	
	function fncMore(page){
		
		var maxCnt = 20;
		var listCnt = "1";
		var totalCnt = page*maxCnt;
		
		for(var i = $("#listArea > li:visible").length; i < totalCnt; i++){
			$("#show_"+i).show();
		}
		
		if(Number(listCnt) < totalCnt){
			$("#moreBtn").hide();
		}else{
			$("#moreBtn").html("<button type=\"button\" class=\"btnLine more\" onclick=\"fncMore('"+(Number(page)+1)+"');\">MORE</button>");
		}
	}
	
	function fncChangeDate(){
		$("input[id^=agoMonth]:checked").prop("checked", false);
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



	
		<form id="resvForm" name="resvForm">
		<input type="hidden" id="confirmationNumber" name="confirmationNumber" />
		<input type="hidden" id="hotlSysCode" name="hotlSysCode" />
		<input type="hidden" id="test" name="test" value="GJJ" />
		<div class="myContents">
			<h3 class="titDep2">예약확인</h3>
			<ul class="tabType01 tabType02">
				<li class="on"><a href="#none">객실/패키지</a></li>
				<li><a href="/m/cnfirm/mber/dining/reserveList.do">다이닝</a></li>
				<li><a href="/m/cnfirm/mber/activity/reserveList.do">액티비티</a></li>
				
					<li><a href="/m/cnfirm/mber/vouch/reserveList.do">멤버십</a></li>
				
			</ul>
			<div id="tab01" class="tabCont" style="display:block">
				<h3 class="hidden">객실/패키지</h3>
				<div class="searchBox">
					<div class="searchOp">
						<span class="hidden">기간 조회</span>
						<div class="selectWrap" style="width:346px">
							<select title="조회옵션" data-height="150px" id="searchDataType" name="searchDataType">
								
								
								
									
								
									
								
									
								
									
										<option value="GJB" >그랜드 조선 부산</option>
									
								
									
										<option value="GJJ" selected="selected">그랜드 조선 제주</option>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								 
								
								
							</select>
						</div>
						
						
						
						
						
						<div class="period">
							<span class="hidden">날짜선택</span>
							<span class="intArea">
								<input type="text" style='width:143px;' title="검색 시작일" readonly="readonly" id="datepickerFrom" name="searchDataBeginDe" value="2024.05.23" onchange="fncChangeDate();" />
							</span>
							<span class="hBar">-</span>
							<span class="intArea">
								<input type="text" style='width:143px;' title="검색 종료일" readonly="readonly" id="datepickerTo" name="searchDataEndDe" value="2024.08.23" onchange="fncChangeDate();" />
							</span>
						</div>
						<div class="frmList periodOp">
							<span class="frmRadio">
								<input type="radio" id="agoMonth1" onclick="fncSetMonth('1');" name="agoMonth" value="1"  />
								<label for="agoMonth1">1개월</label>
							</span>
							<span class="frmRadio">
								<input type="radio" id="agoMonth3" onclick="fncSetMonth('3');" name="agoMonth" value="3" checked="checked" />
								<label for="agoMonth3">3개월</label>
							</span>
							<span class="frmRadio">
								<input type="radio" id="agoMonth6" onclick="fncSetMonth('6');" name="agoMonth" value="6"  />
								<label for="agoMonth6">6개월</label>
							</span>
						</div>
					</div>
					<div class="btnWrap">
						<a href="#none" class="btnSC btnM" role="button" onclick="fncSearch();">기간조회</a>
					</div>
					<ul class="txtGuide">
						<li>온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.</li>
						<li>예약날짜 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.</li>
						<li>과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.</li>
						<li>
							레스케이프는 레스케이프 홈페이지에서 예약 확인이 가능합니다.
							<a href="https://www.lescapehotel.com/main" class="btnLine" target="_blank">바로가기</a>
						</li>
						<li>
							메리어트 브랜드의 예약 내역은 해당 사이트에서 조회하실 수 있습니다.
							<a href="https://www.marriott.co.kr/" class="btnLine" target="_blank">바로가기</a>
						</li>
					</ul> 
				</div>
				<div class="listBox">
					
					<div class="countList">
						<span class="count">총 <em>1</em>건</span>
						<div class="selectWrap" style="width:200px;">
							<select title="목록정렬" data-height="150px" id="searchCtgry" name="searchCtgry" onchange="fncSearch();">
								<option value="">ALL</option>
								<option value="RESERVED" >RESERVED</option>
								<option value="CHECKIN" >CHECK IN</option>
								<option value="CHECKEDOUT" >CHECKEDOUT</option>
								<option value="CANCELED" >CANCELED</option>
								<option value="NOSHOW" >NO SHOW</option>
							</select>
						</div>
					</div>
					
					<ul class="cardList reserveInfo">
						
							
								
									<li id="show_0" >
										<div class="cardInner">
											<span class="status" >RESERVED</span>
											<em class="tit">
												<a href="#none" onclick="fncResvDetail('411665', 'GJJ');">
													ROOM ONLY
												</a>
											</em>
											<p class="info">그랜드 조선 제주 / 객실 1개 / 성인  2, 어린이  0</p>
											<p class="number">
												예약번호
												<em>411665</em>
											</p>
											<p class="date">
												2024.07.16 - 
												2024.07.17 
											</p>
										</div>
									</li>
								
							
														
						
					</ul>
					
				</div>
			</div>
		</div>
		</form>
	</div>
</div>
		
<div class="dimmed"></div>
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

