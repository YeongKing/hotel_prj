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

  <title>객실 예약 - 호텔, 투숙기간, 객실 선택 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트객실, 조선호텔앤리조트예약, 조선호텔앤리조트 할인">
  <meta name="description" content="조선호텔앤리조트 객실을 예약하고, 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 즐겨보세요.">
  <meta property="og:title" content="객실 예약 - 호텔, 투숙기간, 객실 선택 | 조선호텔앤리조트">
  <meta property="og:description" content="조선호텔앤리조트 객실을 예약하고, 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 즐겨보세요.">
  <meta property="og:url" content="https://josunhotel.com/resve/room/step0.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/resve/room/step0.do"/>
  <link rel="shortcut icon" type="text/css" href="/static/home/images/ko/pc/common/favicon.ico" >
  <link href="/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  <link href="/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
  
  
  
    <link href="/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
  
  

  <link href="/hotel_prj/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
  <link href="/hotel_prj/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
  <script type="text/javascript" src="/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
  <script type="text/javascript" src="/hotel_prj/static/home/js/home.js"></script>
  <script type="text/javascript" src="/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>

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
  "name": "엘리시안서울",
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
















<script type="text/javascript">
//2022-07-27 추가, 쿼리 파라미터 숨김처리
history.replaceState({}, null, location.pathname);
jQuery(function(){
	
	if("" != ""){
		alert("");
	}
	
	//제주 [오픈날짜 하드코딩]
	var gjjOpenDate = new Date(2021, 00, 08); // 티져 오픈 날짜
	jQuery(document).ready(function(){
		
		jQuery("button").attr("type", "button");
		
		//체크인 체크아웃 초기 정보 세팅
		var initToday = new Date();
		
		//그랜드 조선 제주 티져 날짜 대응
		if(jQuery("#hotlSysCode").val() == "GJJ"){
			//제주 [오픈날짜 하드코딩]
			if(initToday < gjjOpenDate){
				initToday = gjjOpenDate;
			}
		}
		
		fncSetCalendarDate(initToday);
		
	});
	/*
		프로모션 타입 수정 이벤트
	*/
	jQuery("#promoType").on("change", function(){
		var value = jQuery(this).val();
		jQuery("#promoCode").attr("name", value);
	});
	/*
		호텔 선택 AREA 클릭 이벤트
	*/
	jQuery(".frmList input[type='radio']").on("click", function(){
		var hotlSysCode = jQuery(this).val();
		var hotelNm = jQuery(this).next().text();
		
		
		// ============== 객실 및 인원 선택 초기화 start ==================
		
		jQuery("#roomCnt").val("1");
		//인원 hidden value 초기화
		
		jQuery("input[name='adltCntArr']").val("0");
		jQuery("input[name='adltCntArr']").first().val("2");
		jQuery("input[name='chldCntArr']").val("0");
		
		//인원 text 초기화
		jQuery("[name='adltCntArr']").siblings("span").children().text("0");
		jQuery("[name='adltCntArr']").first().siblings("span").children().text("2");
		jQuery("[name='chldCntArr']").siblings("span").children().text("0");
		
		jQuery("#roomText").html("객실&nbsp;1개<span>성인&nbsp;2명</span>");
		
		//css 적용
		jQuery(".btnUp").removeClass("blank");
		jQuery(".btnDown").addClass("blank");
		jQuery(".btnDown").first().removeClass("blank");
		
		jQuery(".roomSel").removeClass("on");
		jQuery(".roomSel").first().addClass("on");
		
		
		// ============== 객실 및 인원 선택 초기화 start ==================
		
		
		
		if(hotlSysCode != "GJB" && hotlSysCode != "GJJ"){
			var link = "";
			if(hotlSysCode == "TWC"){
				link = "https://www.marriott.co.kr/hotels/travel/selwi-the-westin-chosun-seoul";
			}else if(hotlSysCode == "TWCB"){
				link = "https://www.marriott.co.kr/hotels/travel/puswi-the-westin-chosun-busan";
			}else if(hotlSysCode == "LESCAPE"){
				link = "https://lescapehotel.com/main";
			}else if(hotlSysCode == "FPBSS"){
				link = "https://www.marriott.co.kr/hotels/travel/selfp-four-points-seoul-namsan";
			}else if(hotlSysCode == "FPBSM"){
				link = "https://www.marriott.co.kr/hotels/travel/selfd-four-points-seoul-myeongdong";
			}else if(hotlSysCode == "GRP"){
				link = "https://www.marriott.co.kr/hotels/travel/selay-gravity-seoul-pangyo-autograph-collection";
			}else if(hotlSysCode == "JPY"){
				link = "https://www.marriott.co.kr/hotels/travel/sellc-josun-palace-a-luxury-collection-hotel-seoul-gangnam";
			}
			
			window.open(link);
			return false;
		}else{
			jQuery('.rsvList li.toggleOn').next('li').find('.btnToggle').trigger('click_checkDate');
			jQuery("#hotelNm").html(hotelNm);
			jQuery("#hotlSysCode").val(hotlSysCode);
			
			/* 그랜드 조선 제주 티져 오픈 날짜 대응 */
			var today = new Date(); //오늘 날짜
			
			if(hotlSysCode == "GJJ"){
				//인원수 안내 문구 변경
				jQuery("#ageTxtGuide").text('어린이 기준 : 37개월 ~ 12세');
				
				//오늘날짜가 티져 오픈일 보다 빠를때
				if(today < gjjOpenDate){
					fncSetCalendarDate(gjjOpenDate);
				}
			}else if(hotlSysCode == "GJB"){
				//인원수 안내 문구 변경
				jQuery("#ageTxtGuide").text('어린이 기준 : 1세 ~ 12세');
				
				fncSetCalendarDate(today);
			}
		}
	});
	/**
		성인,어린이 인원 수 추가/감소 Click Event
	*/
	jQuery(".numPeople button").on("click", function(){
		var target = jQuery(this).closest(".numPeople").data("target"); //성인, 어린이 여부
		var appendYn = jQuery(this).hasClass("btnUp"); //증가, 감소 여부
		var peopleCnt = jQuery(this).closest(".numPeople").find("input").val(); //현재 인원 수 
		var roomCnt = 0;
		var roomNum = jQuery(this).closest(".numWrap").attr("data-roomNum"); //현재 선택한 객실 번호
		var totalAdultCnt = 0; //총 성인 수
		var totalChildCnt = 0; //총 어린이 수
        var hotlSysCodeValue = jQuery("#hotlSysCode").val();
		var maxAdlt = jQuery("#maxAdlt").val();
		var maxChld = jQuery("#maxChld").val();

        //2022-09-19 호텔별 최대 인원 수 변경
        if(hotlSysCodeValue == "GJJ"){
            maxAdlt = 6;
            maxChld = 4;
        }
		
		if(roomNum != "1" && jQuery(".roomSel:eq("+parseInt(roomNum-2)+") input[name='adltCntArr']").val() == "0"){
			//alert("이전객실부터 선택하셈");
			return false;
		}
		
		//인원 추가
		if(appendYn){
			//객실 1이 아니고 성인 0명인 경우에 어린이 증가 시
			if(roomNum != "1" && target == "child" && jQuery("input[name='adltCntArr']:eq("+parseInt(roomNum-1)+")").val() < 1){
				peopleCnt = parseInt(peopleCnt);
			//현재 인원에  + 1시켜주기
			}else{
				if(target == "child" && parseInt(peopleCnt)< maxChld ){
					peopleCnt = parseInt(peopleCnt) + 1;	
				}else if(target == "adult" && parseInt(peopleCnt)< maxAdlt){
					peopleCnt = parseInt(peopleCnt) + 1;	
				}
			}

            //2022-09-19 수정 , GJJ일 경우 최대 투숙인원 변경
			if (hotlSysCodeValue == "GJJ") {
				var adltCntValue = target == "adult" ? peopleCnt : jQuery("input[name='adltCntArr']:eq("+parseInt(roomNum-1)+")").val();
				var chldCntValue = target == "child" ? peopleCnt : jQuery("input[name='chldCntArr']:eq("+parseInt(roomNum-1)+")").val();
				var totalCntValue = parseInt(adltCntValue) + parseInt(chldCntValue);
				
				//alert(hotlSysCode + ", " + adltCntValue + ", " + chldCntValue);
                //2022-09-19 수정 , GJJ일 경우 최대 투숙인원 변경
				if(totalCntValue > 8) {
					alert("온라인상 선택가능한 인원 수 이상 투숙하시는 경우에는 유선으로 문의 부탁드립니다.\n(그랜드 조선 제주 예약실 : 1811-0511)"); 
					return false;
				}
			}
			
		//인원 감소
		}else{
			//기존 인원이 1이상인 경우에만 인원 감소 시켜줌
			if(peopleCnt > 0){
				//1번 객실의 경우 성인은 1명보다 더 감소시킬 수 없음
				if(roomNum == "1" && target == "adult" && peopleCnt == "1"){
					peopleCnt = parseInt(peopleCnt);
				}else{
					peopleCnt = parseInt(peopleCnt) - 1;	
				}
			}
		}
		
		//1명 이상인 경우에 -버튼에 불 켜주기
		if(0 < peopleCnt){
			jQuery(this).closest(".numPeople").find(".btnDown").removeClass("blank");
		}else{
			jQuery(this).closest(".numPeople").find(".btnDown").addClass("blank");
		}
		
		var maxCnt = target == "adult" ? maxAdlt : maxChld;
		
		if(maxCnt == peopleCnt){
			jQuery(this).closest(".numPeople").find(".btnUp").addClass("blank");
		}else{
			jQuery(this).closest(".numPeople").find(".btnUp").removeClass("blank");
		}
		
		//input에 데이터 넣기
		jQuery(this).closest(".numPeople").find("input").val(peopleCnt);
		
		//성인 수가 0명인 경우
		if(peopleCnt == 0 && target == "adult" ){
			//해당 영역 불끄기
			jQuery(".roomSel:eq("+parseInt(roomNum-1)+")").removeClass("on");
			
			//어린이 수 강제로 0명 만들기
			jQuery(this).closest(".roomSel").find(".numPeople[data-target='child'] input").val("0");
			jQuery(this).closest(".roomSel").find(".numPeople[data-target='child'] span em").text("0");
			jQuery(this).closest(".roomSel").find(".numPeople button[class='btnDown']").addClass("blank");
			
			//객실 2번에 성인이 0명인 경우 객실 3번의 인원수를 초기화 한다
			if(roomNum == "2"){
				jQuery(".roomSel:eq(2)").removeClass("on");
				jQuery(".roomSel:eq(2) input").val("0");
				jQuery(".roomSel:eq(2) span em").text("0");
				jQuery(".roomSel:eq(2) button").each(function(){
					if(jQuery(this).hasClass("btnDown")){
						jQuery(this).addClass("blank");
					}
				});
			}
		}else{
			if(jQuery(this).closest(".roomSel").find(".numPeople[data-target='adult'] input").val() != "0"){
				jQuery(".roomSel:eq("+parseInt(roomNum-1)+")").addClass("on");	
			}
		}
		
		//인원 수 텍스트 교체
		jQuery(this).closest(".numPeople").find("span em").text(peopleCnt);	
		
		jQuery(".roomSel.on").each(function(){
			jQuery(this).find(".numPeople").each(function(){
				var cntTarget = jQuery(this).attr("data-target");
				if(cntTarget =="adult"){
					totalAdultCnt += parseInt(jQuery(this).find("input").val());
				}else{
					totalChildCnt += parseInt(jQuery(this).find("input").val());
				}
			});
		});
		
		roomCnt = jQuery(".roomSel.on").length;
		//객실 수 값 변경
		jQuery("#roomCnt").val(roomCnt);
		//객실 및 인원 선택 아코디언 텍스트 수정
		
		
			
				if(totalChildCnt != 0){
					jQuery("#roomText").html("객실&nbsp;"+roomCnt+"개<span>성인&nbsp;"+totalAdultCnt+"명</span><span>어린이&nbsp;"+totalChildCnt+"명</span>");	
				}else{
					jQuery("#roomText").html("객실&nbsp;"+roomCnt+"개<span>성인&nbsp;"+totalAdultCnt+"명</span>");
				}
			
			
		
		
	});
});

//check in, check out 날짜 , 달력 세팅을 위한 fnc
function fncSetCalendarDate(startDate){
	
	var nightTxt = '박';
	
	//달력 라이브러리 예약 가능 날짜 수정
	var setCalendarEndDate = new Date(startDate);
	setCalendarEndDate.setDate(365);
	commonJs.calendarMgr._resetDate($( ".calContainer" ), startDate, setCalendarEndDate);
	
	var setCalendarStartDate = new Date(startDate);
	var setCkinDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckinDate").val(setCkinDate);

	setCalendarStartDate.setDate(setCalendarStartDate.getDate() + 1);
	var setCkoutDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckoutDate").val(setCkoutDate);
	
	jQuery("#dateText").html(setCkinDate + "&nbsp;" + dUtils.getDateToDay(setCkinDate) + "&nbsp;-&nbsp;" + setCkoutDate + "&nbsp;" + dUtils.getDateToDay(setCkoutDate) + "<span>"+ dUtils.dateDiff(setCkinDate, setCkoutDate)+" "+nightTxt +"</span>");
	jQuery("#night").val(dUtils.dateDiff(setCkinDate, setCkoutDate));
	
}

function fncSearchList(){
	//validation check
	if(jQuery("#hotlSysCode").val() == ""){
		// 호텔 시스템 코드 없음
		alert("호텔을 선택해주세요."); 
		return false;
	}
	if(jQuery("#ckinDate").val() == "" || jQuery("#ckoutDate").val() == ""){
		// 체크인, 체크아웃 날짜 미선택
		alert("투숙기간을 선택해주세요."); 
		return false;
	}
	/*if(jQuery(".promInt input[type='text']").val() != "" && jQuery("#promoType").val() == ""){
		alert("프로모션 타입을 선택해주세요."); 
		return false;
	}*/
	commonJs.showLoadingBar();
	jQuery("#step0Form").attr("action", "/hotel_prj/user/resve/room/step1.jsp");
	alert("선택된 호텔코드 : "+$("#hotlSysCode").val() + "\n" + 
			"체크인 날짜 : " +$("#ckinDate").val() + "\n" +
			"체크아웃 날짜 : " + $("#ckoutDate").val() + "\n" +
			"어른 : " +  $('input[name="adltCntArr"]').val() + "\n" +
			"어린이 : " +  $('input[name="chldCntArr"]').val());
	jQuery("#step0Form").submit();
}
</script>
<form id="step0Form" name="step0Form" method="post" >
	
		
			<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS"/> 	
		
		
	
	
	<input type="hidden" name="ckinDate" id="ckinDate" value="" /> 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="" /> 			
	<input type="hidden" name="night" id="night" value="" />					
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />				
	<input type="hidden" id="maxAdlt" value="3" />								
	<input type="hidden" id="maxChld" value="2" />								
	<div id="container" class="container">
		<!-- 컨텐츠 S --> 
		<h1 class="hidden">예약<!-- 예약 --></h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<p class="pageGuide">엘리시안호텔의 다양하고 감각적인 인테리어와 특별한 여유를<br> 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.</p> 
			</div>
		</div>
		<!-- //topArea -->
		<div class="inner">
			
			<ul class="toggleList rsvList checkDate">
				
					<li>
						<strong class="listTit">호텔명<!--  호텔 선택--></strong>
						<em class="intValue" id="hotelNm">엘리시안 서울</em>
						<button type="button" class="btnToggle">
							<span class="hidden">상세내용 보기<!--  상세내용 보기--></span>
						</button> <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐, disabled 속성 추가시 비활성화 -->
						<div class="toggleCont">
							<div class="toggleInner">
								<div class="hotelSel">
									<ul class="frmList">
										
										
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode0" name="frmRdo" value="JPY"  >
													<label for="hotelCode0">조선 팰리스</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode1" name="frmRdo" value="TWC"  >
													<label for="hotelCode1">웨스틴 조선 서울</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode2" name="frmRdo" value="TWCB"  >
													<label for="hotelCode2">웨스틴 조선 부산</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode3" name="frmRdo" value="GJB"  >
													<label for="hotelCode3">그랜드 조선 부산</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode4" name="frmRdo" value="GJJ" checked="checked" >
													<label for="hotelCode4">그랜드 조선 제주</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode5" name="frmRdo" value="LESCAPE"  >
													<label for="hotelCode5">레스케이프</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode6" name="frmRdo" value="GRP"  >
													<label for="hotelCode6">그래비티 서울 판교</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode7" name="frmRdo" value="FPBSS"  >
													<label for="hotelCode7">포포인츠 바이 쉐라톤 조선 서울역</label>
												</li>
											
										
											
												<li class="frmRadio">
													<input type="radio" id="hotelCode8" name="frmRdo" value="FPBSM"  >
													<label for="hotelCode8">포포인츠 바이 쉐라톤 조선, 서울 명동</label>
												</li>
											
										
											
										
											
										
											
										
									</ul>
									<p class="txtGuide">메리어트 브랜드 및 레스케이프 호텔 선택 시, 해당 사이트로 이동 됩니다.</p>
								</div>
							</div>
						</div>
						<!-- //toggleCont -->
					</li>
				
				<li class="toggleOn">
					<strong class="listTit">투숙기간 선택</strong>
					<em class="intValue" id="dateText"></em> 
					<button type="button" class="btnToggle">
						<span class="hidden">상세내용 보기</span>
					</button>
					<div class="toggleCont" style="display: block;">
						<div class="toggleInner">
							<div class="calContainer"></div>
						</div>
					</div>
					<!-- //toggleCont -->
				</li>
				<li>
					<strong class="listTit">객실 및 인원 선택</strong>
					<em class="intValue" id="roomText">
						객실 1
						
							개
						
						<span>
							성인 2
							
								명
							
						</span>
					</em> 
					<button type="button" class="btnToggle">
						<span class="hidden">상세내용 보기</span>
					</button>
					<div class="toggleCont">
						<div class="toggleInner">
							<div class="roomContainer">
								<div class="roomWrap">
									<div class="roomSel on">
										<div class="roomInner">
											<strong class="roomTit">객실</strong>
											<div class="numWrap" data-roomNum="1">
												<div class="numPeople" data-target="adult">
													<input type="hidden" name="adltCntArr" value="2"/>
													<button type="button" class="btnDown">인원 수 감소</button>
													<span>성인 <em>2</em></span>
													<button type="button" class="btnUp">인원 수 증가</button>
												</div>
												<div class="numPeople" data-target="child">
													<input type="hidden" name="chldCntArr" value="0"/>
													<button type="button" class="btnDown">인원 수 감소</button>
													<span>어린이 <em>0</em></span>
													<button type="button" class="btnUp">인원 수 증가</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- //roomWrap -->
								<ul class="txtGuide">
									
										
											<li id="ageTxtGuide">어린이 기준 : 37개월 ~ 12세</li>
										
										
									
								</ul>
							</div>
							<!-- //roomContainer -->
							<div class="btnArea">
								<a href="#none" class="btnSC btnL active" onclick="fncSearchList();">객실 검색</a>
							</div>
						</div>
					</div>
					<!-- //toggleCont -->
				</li>
			</ul>
			<!-- //toggleList -->
		</div>
		<!-- //inner -->
		<!-- 컨텐츠 E -->
	</div>
</form>
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

