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

  <title>객실 예약 - 옵션 선택 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트객실, 조선호텔앤리조트예약, 조선호텔앤리조트 할인">
  <meta name="description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:title" content="조선호텔앤리조트객실, 조선호텔앤리조트예약, 조선호텔앤리조트 할인">
  <meta property="og:description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:url" content="https://josunhotel.com/resve/room/step2.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/resve/room/step2.do"/>
  <link rel="shortcut icon" type="text/css" href="/static/home/images/ko/pc/common/favicon.ico" >
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
<jsp:include page="/user/header.jsp"></jsp:include>
<!--E header  -->



        <!--(페이지 URL)-->








<script type="text/javascript">
	jQuery(function(){
		jQuery(document).ready(function(){
			
			//체크인 체크아웃 날짜 html 주입
			jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")
			
			//랜딩라이브러리 클릭 이벤트
			jQuery("input[type='checkbox']").on("click", function(){
				var id = jQuery(this).attr("id");
				var itemCode = jQuery(this).val();
				var availItem = parseInt(jQuery("#"+itemCode).val());
				
				//2020-11-10 추가
				//랜딩라이브러리 3개 초과 선택시 alert
				if(4 <= jQuery(this).closest("ul").find("input[type='checkbox']:checked").length){
					alert("렌딩 라이브러리는 최대 3개까지 선택 가능합니다."); //렌딩 라이브러리는 최대 3개까지 선택 가능합니다.
					return false;
				}
				
				
				if(jQuery(this).is(":checked")){
					availItem--;
				}else{
					availItem++;
				}
				
				jQuery("ul[id^='landingList'] input[type='checkbox'][value='"+itemCode+"']").each(function(idx){
					if(jQuery(this).attr("id") != id){
						if(availItem == 0){
							jQuery(this).attr("disabled", true);
						}else{
							jQuery(this).attr("disabled", false);
						}
					}
				});
				
				jQuery("#"+itemCode).val(availItem);
			});
			
			
			
			//옵션 추가, 감소 버튼 이벤트
			jQuery("#optInfo .addOption button").on("click", function(){
				var roomIdx = jQuery(this).closest("li").data("roomidx");	//객실 인덱스
				var optType = jQuery(this).closest(".addOption").data("type");	//옵션 종류  ex) optA : 성인, optC : 어린이, optE : 엑스트라베드
				var beforeCount = parseInt(jQuery(this).closest(".numPeople").find("span").text());	//현재 옵션 갯수
				var afterCount;		//바뀔 카운트
				var btnType = jQuery(this).data("btntype"); //버튼 타입  ex) up , down
				if(btnType == "up"){
					afterCount = beforeCount + 1;
				}else if(btnType == "down" && beforeCount > 0){
					afterCount = beforeCount - 1;
				}
				//성인 옵션 갯수 세팅
				if(optType == "optA"){
					var adultCnt = jQuery("[name='adltCntArr']:eq("+roomIdx+")").val();		//해당 객실 성인 수
					if(adultCnt < afterCount){
						afterCount = beforeCount;
					}
					
					// 성인수와 옵션입력 개수가 같을 경우 추가 버튼 disabled
					if(adultCnt == afterCount){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optAQtyArr']").val(afterCount);
					
				//어린이 옵션 갯수 세팅
				}else if(optType == "optC"){
					var childCnt = jQuery("[name='chldCntArr']:eq("+roomIdx+")").val();		//해당 객실 어린이 수
					if(childCnt < afterCount){
						afterCount = beforeCount;
					}
					
					// 어린이수와 옵션입력 개수가 같을 경우 추가 버튼 disabled
					if(childCnt == afterCount){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optCQtyArr']").val(afterCount);
				//엑스트라베드 옵션 갯수 세팅
				}else if(optType == "optE"){
					if(afterCount > 1){
						afterCount = 1;
					}
					
					// 베드는 1개까지만 추가 가능 
					if(afterCount == 1){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optEQtyArr']").val(afterCount);
				}
				if(afterCount < 1){
					jQuery(this).addClass("blank");
				}else{
					jQuery(this).removeClass("blank");
				}
				if(afterCount > 0){
					jQuery(this).closest(".addOption").find(".btnDown").attr("disabled", false);
				}else{
					jQuery(this).closest(".addOption").find(".btnDown").attr("disabled", true);
				}
				jQuery(this).closest(".numPeople").find("span").text(afterCount);
				
				fncOptCalculate();		//전체 요금 계산
			});
		});
	});
	
	/**
		비회원 회원 전환 콜백
	*/
	function fncLoginCallBack(){
		fncGoStep3();	
	}
	/**
	객실 다시 검색 버튼 				
	*/
	function fncResvReset(){
		if(confirm("다시 검색하시겠습니까?")){ 
			location.href = "/resve/room/step0.do";
		}
	}
	
	/**
		옵션 가격 계산				
	*/
	function fncOptCalculate(){
		var roomCnt = jQuery("#roomCnt").val();					//객실 수
		var nightCnt = parseInt(jQuery("#night").val());					//박 수
		var resvTotalAmount = 0;								//전체 객실 총 합계 가격
		var hotlSysCode = jQuery("#hotlSysCode").val();
		for(var i = 0; i < roomCnt; i++){
			var target = jQuery("#optInfo").children("li:eq("+i+")");
			var optACnt, optCCnt, optECnt = 0;					//성인, 어린이, 엑스트라베드 갯수
			var optAAmount, optCAmount, optEAmount = 0;			//성인, 어린이, 엑스트라베드 가격
			var optHtml = "";									//객실별 정보 옵션 영역 html 
			var roomAmount = parseInt(jQuery("#roomAmount"+i).val());		//객실별 객실 가격
			
			var roomTotlAmount = 0;								//객실 총 합계 가격
			var roomOptAmount = 0;								//객실,옵션 합계
			var taxAmount = 0;									//세금
			var serviceAmount = 0;								//봉사료
			//각 옵션 별 가격 및 갯수 확인
			target.find(".addOption").each(function(idx){
				if(idx == 0){
					optACnt = jQuery(this).find("[name='optAQtyArr']").val();
					optAAmount = jQuery(this).find("[name='optAAmount']").val();
				}else if(idx == 1){
					optCCnt = jQuery(this).find("[name='optCQtyArr']").val();
					optCAmount = jQuery(this).find("[name='optCAmount']").val();
				}else if(idx == 2){
					optECnt = jQuery(this).find("[name='optEQtyArr']").val();
					optEAmount = jQuery(this).find("[name='optEAmount']").val();
				}
			});
			// 성인 조식 우측 아코디언 영역 추가
			if(optACnt > 0){
				optHtml += "<li><span class=\"lfData\">성인 조식</span><span class=\"rtData\">"+fncComma(parseInt(optAAmount * optACnt * nightCnt))+"</span></li>"; //성인 조식
			}
			// 어린이 조식 우측 아코디언 영역 추가
			if(optCCnt > 0){
				optHtml += "<li><span class=\"lfData\">어린이 조식</span><span class=\"rtData\">"+fncComma(parseInt(optCAmount * optCCnt * nightCnt))+"</span></li>"; //어린이 조식
			}
			// 엑스트라베드 우측 아코디언 영역 추가
			if(optECnt > 0){
				optHtml += "<li><span class=\"lfData\">엑스트라 베드</span><span class=\"rtData\">"+fncComma(parseInt(optEAmount * optECnt * nightCnt))+"</span></li>"; //엑스트라 베드
			}
			
			// 옵션이 하나도 선택안됐을경우 옵션 영역 hide
			if(optHtml != ""){
				jQuery("#roomOptInfo"+i).show();
				jQuery("#roomOptInfo"+i).html(optHtml);
			}else{
				jQuery("#roomOptInfo"+i).hide();
			}
			
			
			
			roomOptAmount = roomAmount + parseInt(optAAmount * optACnt * nightCnt) + parseInt(optCAmount * optCCnt * nightCnt) + parseInt(optEAmount * optECnt * nightCnt);
			taxAmount = roomOptAmount / 10;
			if(hotlSysCode != "GJB" && hotlSysCode != "GJJ"){
				serviceAmount = (roomOptAmount + taxAmount) / 10;
			}
			roomTotlAmount = roomOptAmount + taxAmount + serviceAmount;	//객실 별 예약금액 합계
			resvTotalAmount += roomTotlAmount;	//총 예약금액 합계
			
			taxAmount = Math.round(taxAmount);					// 세금 반올림
			serviceAmount = Math.round(serviceAmount);			// 봉사료 반올림
			roomTotlAmount = Math.round(roomTotlAmount);		// 전체 객실요금 반올림
			resvTotalAmount = Math.round(resvTotalAmount);		// 전체 예약요금 반올림
			
			jQuery("#roomTax"+i).html(fncComma(taxAmount));
			jQuery("#roomService"+i).html(fncComma(serviceAmount));
			//jQuery("#roomAmount"+i).html(fncComma(roomTotlAmount));
			jQuery("#roomInfo").children("li:eq("+i+")").find(".listTit .price em").text(fncComma(roomTotlAmount));
		}
			jQuery("#resvTotalAmount").html(fncComma(resvTotalAmount));
	}
	/**
		스텝 3으로 이동			
	*/
	function fncGoStep3(){
		jQuery("#optInfo > li").each(function(idx){
			var landingStr = new Array();
			var landingNmStr = new Array();
			jQuery(this).find("input[type='checkbox']").each(function(){
				if(jQuery(this).is(":checked")){
					landingStr.push(jQuery(this).val());
					landingNmStr.push(jQuery(this).closest("li").find("label").text());
				}
			});
			jQuery("#bpArr"+idx).val(landingStr);
			jQuery("#bpNmArr"+idx).val(landingNmStr);
		});
		
		jQuery("#step2Form").attr("action", "/resve/room/step3.do");
		jQuery("#step2Form").submit();
	}
</script>
<form action="" name="step2Form" id="step2Form" method="post">
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="GJJ" /> 		
	<input type="hidden" name="ckinDate" id="ckinDate" value="2024.05.23" /> 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="2024.05.24" /> 			
	<input type="hidden" name="night" id="night" value="1" /> 						
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />					
	
		<input type="hidden" name="adltCntArr" value="2" />							
	
		<input type="hidden" name="adltCntArr" value="0" />							
	
		<input type="hidden" name="adltCntArr" value="0" />							
	
	
		<input type="hidden" name="chldCntArr" value="0" />							
	
		<input type="hidden" name="chldCntArr" value="0" />							
	
		<input type="hidden" name="chldCntArr" value="0" />							
	
	<input type="hidden" name="sortCd" id="sortCd" value="" />						
	<input type="hidden" name="curruncyCd" id="curruncyCd" value="" />			
	<input type="hidden" name="roomCode" id="roomCode" value="DST" />				
	<input type="hidden" name="rateCode" id="rateCode" value="31BFR1N" />				
	<input type="hidden" name="adltSum" id="adltSum" value="2" />					
	<input type="hidden" name="chldSum" id="chldSum" value="0" />					
	<input type="hidden" name="packageSn" id="packageSn" value="531357" />					
	<input type="hidden" name="companyCode" id="companyCode" value="" />
	<input type="hidden" name="promotionCode" id="promotionCode" value="" />
	
	<div id="container" class="container">
		<!-- 컨텐츠 S -->
		<h1 class="hidden">예약</h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<div class="stepWrap">
					<ol>
						<li class="prev">
							<em>객실, 요금 선택</em>
						</li>
						<li class="on">
							<span class="hidden">현재단계</span>
							<em>옵션 선택</em>
						</li>
						<li>
							<em>예약자 정보 입력</em>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- //topArea -->
		<div class="selResult">
			<div class="inner">
				<div class="infoArea">
					<dl class="dlType01">
						<dt>HOTEL</dt>
						<dd>엘리시안 서울</dd>
					</dl>
					<dl class="dlType02">
						<dt>DATE</dt>
						<dd id="dateText"></dd>
					</dl>
					<dl class="dlType03">
						<dt>ROOMS</dt>
						<dd>1</dd>
					</dl>
					<dl class="dlType03">
						<dt>ADULTS</dt>
						<dd>2</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>0</dd>
					</dl>
				</div>
				<a href="#none" class="btnSC btnM icoArr" onclick="fncResvReset();">객실 다시 검색</a>
			</div>
		</div>
		<!-- //selResult -->
		<div class="inner">
			<!-- rsvRoomWrap -->
			<div class="rsvRoomWrap">
				<div class="lCont">
					<h2 class="titDep2">ROOM ONLY</h2>
					<p class="categoryTxt">
						DELUXE /
						2DOUBLE /  
						STANDARD VIEW  
					</p>
					<ul class="toggleList rsvList roomRsv" id="optInfo">
						
							<li class="toggleOn" data-roomidx="0"><!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<input type="hidden" name="bpArr" id="bpArr0" value="" />
								<input type="hidden" name="bpNmArr" id="bpNmArr0" value="" />
								<strong class="listTit">객실1</strong>
								<button type="button" class="btnToggle">
									<span class="hidden">상세내용 보기</span>
								</button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">
										<h3 class="opTit">BREAKFAST</h3>
										
											
                                                
												
											
										
											
                                                
													<div class="addOption" data-type="optA">
														<span class="txt">성인 조식 추가</span>
														<span class="price">KRW 57,272</span>
														<div class="numPeople type02">
															<input type="hidden" name="optAAmount" id="optAAmount0" value="57272"/>
															<input type="hidden" name="optAArr" id="optAArr0" value="BK"/>
															<input type="hidden" name="optAQtyArr" id="optAQtyArr0" value="0"/>
															<button type="button" class="btnDown blank" data-btntype="down" disabled>인원 수 감소</button>
															<span>0</span>
															<button type="button" class="btnUp" data-btntype="up">인원 수 증가</button>
														</div>
													</div>
												
												
											
										
											
                                                
												
													<div class="addOption" data-type="optC">
														<span class="txt">어린이 조식 추가</span>
														<span class="price">KRW 31,091</span>
														<div class="numPeople type02">
															<input type="hidden" name="optCAmount" id="optCAmount0" value="31091"/>
															<input type="hidden" name="optCArr" id="optCArr0" value="CHBK"/>
															<input type="hidden" name="optCQtyArr" id="optCQtyArr0" value="0"/>
															<button type="button" class="btnDown blank" data-btntype="down" disabled>인원 수 감소</button>
															<span>0</span>
															<button type="button" class="btnUp" data-btntype="up" disabled>인원 수 증가</button>
														</div>
													</div>
												
											
										
										<ul class="txtGuide">
											<li>조식 옵션 추가 시, 투숙 일수와 동일한 횟수의 조식이 제공됩니다.</li>
											
											
												<li>인원 추가 금액에는 조식이 포함되어 있지 않습니다. 조식 추가 기능을 통해 별도로 추가가 가능합니다.</li>
												<li>어린이 조식 추가 비용 적용 대상은 37개월 이상 12세 이하입니다.</li>
											
											<li>사전 추가된 조식의 경우 특별요금이 적용된 혜택으로, 체크인 후 미사용 시 환불이 불가합니다.<!-- 사전 추가된 조식의 경우 특별요금이 적용된 혜택으로, 체크인 후 미사용 시 환불이 불가합니다. --></li>
											<li>만나이 통일법 시행에 따라 2023.06.28부터 연령 표기 변경되었습니다.<!-- 코로나19에 따른 사회적 거리두기 정부 시책이 진행될 경우, 뷔페 조식은 다른 장소 및 단품 메뉴로 대체 제공될 수 있습니다. --></li>
										</ul>
										
										
											
											
												
													<input type="hidden" name="optEAmount" id="optEAmount0" value="0"/>
													<input type="hidden" name="optEArr" id="optEArr0" value="0" />
													<input type="hidden" name="optEQtyArr" id="optEQtyArr0" value="0"/>
												
													<input type="hidden" name="optEAmount" id="optEAmount0" value="0"/>
													<input type="hidden" name="optEArr" id="optEArr0" value="0" />
													<input type="hidden" name="optEQtyArr" id="optEQtyArr0" value="0"/>
												
													<input type="hidden" name="optEAmount" id="optEAmount0" value="0"/>
													<input type="hidden" name="optEArr" id="optEArr0" value="0" />
													<input type="hidden" name="optEQtyArr" id="optEQtyArr0" value="0"/>
												
											
										
										
										
										
											
											
												<input type="hidden" name="chldAgeArr" value="">
											
										
										<h3 class="opTit">
											<label for="request01">REQUESTS</label>
										</h3>
										<textarea name="contArr" placeholder="호텔 이용 시 문의하실 사항이 있으시면 입력해 주세요." ></textarea>
										<p class="txtGuide">전달해주신 요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br/>다만, 부득이하게 반영되지 않을 수 있는 점, 양해 부탁드립니다.</p> 
									</div>
								</div>
							</li>
						
					</ul>
				</div>
				<div class="rCont floating" style="margin-top: 378.6px;">
					<ul class="toggleList rsvList" id="roomInfo">
						
						
							
							
								
									
								
								
							
							
							<input type="hidden" id="roomAmount0" value="212500.0" />
							<li class="toggleOn"> <!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<strong class="listTit">
									객실1
									<span class="price" id="roomAmount0"><em>233,750</em>KRW</span>
								</strong>
								<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">
										<div class="optionTotal scrollWrap">
											<ul class="infoData">
												
													
													<li>
														<span class="lfData">2024.05.23</span>
														<span class="rtData">212,500</span>
													</li>
												
											</ul>
											<ul class="infoData" id="roomOptInfo0" style="display:none;"></ul>
											<ul class="infoData" >
												<li><span class="lfData">세금</span><span class="rtData" id="roomTax0">21,250</span></li>
												<li style="display: none;"><span class="lfData">봉사료</span><span class="rtData" id="roomService0">0</span></li>
											</ul>
										</div>
									</div>
								</div>
							</li>	
						
					</ul>
					<div class="totalCont">
						<div class="totalPrice">
							<span class="txt">총 예약금액</span>
							
								
									<span class="subTxt">+ 세금(10%)</span>										
								
								
							
							<span class="price"><em id="resvTotalAmount">233,750</em>KRW</span>
						</div>
						<div class="btnArea">
							
							
							
								<div>
									<a href="#none" class="btnSC btnL active" onclick="fncGoStep3();">
										회원 예약
									</a>
								</div>
							
						</div>
						<p class="txtReference">회원 예약 시 현장 사용 할인 쿠폰이 즉시 발급됩니다.</p>
					</div>
				</div>
			</div>
			<!-- //rsvRoomWrap -->
		</div>
		<!-- //inner -->
		<!-- 컨텐츠 E -->
	</div>

	
</form>
<div id="layerPop1" class="layerPop">
	<div class="layerCont layerClear">
		<div class="swipeWrap">
			<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>
			<!-- 20200609 수정 -->
			<ul class="swipeCont">
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">모빌<!-- 모빌 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library01.jpg" alt=""></dd>
						<dd class="txt">
							7가지 핵심 발달 단계 시스템을 기초로 아기의 호기심을 만족시켜 줍니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">유아용 의자<!-- 유아용 의자 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library02.jpg" alt=""></dd>
						<dd class="txt">
							넓은 시트 폭으로 장시간 앉아있어도 편안하고 올바른 자세를 유지할 수 있습니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">젖병 소독기<!--  젖병 소독기 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library03.jpg" alt=""></dd>
						<dd class="txt">
							상·하 UV 자외선 살균 시스템을 갖추고 있습니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">바운서<!-- 바운서 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library04.jpg" alt=""></dd>
						<dd class="txt">
							엄마품에 있듯이 최상의 안정감을 선사합니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">유아용 침대<!-- 유아용 침대 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library05.jpg" alt=""></dd>
						<dd class="txt">
							아이의 쾌적하고 편안한 수면을 위해 디자인된 침대입니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">아기 욕조<!-- 아기 욕조 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library06.jpg" alt=""></dd>
						<dd class="txt">
							미끄럼 방지 처리되어 안전한 목욕이 가능한 접이식 제품 입니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">침대안전가드<!-- 침대안전가드 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library07.jpg" alt=""></dd>
						<dd class="txt">
							튼튼한 강철 프레임으로 안전사고를 방지하는 제품입니다.
							
						</dd>
					</dl>
				</li>
				<li class="swipeSlide">
					<dl class="itemImg">
						<dt class="tit">유아용 분유포트<!-- 유아용 분유포트 --></dt>
						<dd class="thum"><img src="/static/home/images/ko/pc/HURE/img_lending_library08.jpg" alt=""></dd>
						<dd class="txt">
							정확한 온도 조절이 가능하며, 보온 기능을 갖춘 무선주전자입니다.
							
						</dd>
					</dl>
				</li>
			</ul>
			<!-- //20200609 수정 -->
			<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>
			<div class="numPaging"><span class="hidden">현재 이미지</span><span class="num now">05</span> / <span class="hidden">총 이미지 개수</span><span class="num">10</span></div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose(jQuery('#layerPop1'))">
			닫기
		</button>
	</div>
</div>






<script>
 $(document).ready(function(){
    var userInputId = getLoginCookie("userInputId");//저장된 쿠기값 가져오기
    $("#frm_userid").val(userInputId); 
     
    if($("#frm_userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteLoginCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#frm_userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setLoginCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteLoginCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getLoginCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

	<script type="text/javascript">
		var PageScript = function() {
			var callback = {
					execute:function(data){}
			};
		}
		
		PageScript.prototype = {
			init : function() {
				this.bindSnsLinkEvent();
			}
			,fncCloseLayerPopup : function(param_loginSeCode, callback){
				$('.dimmed').css('display', 'none');
				$('.layerPop.login').css('display', 'none');
			}
			,validate:function(){
				
				var bResult = true;
				
				/*
				사용자 입력정보 VALIDATION 체크
				해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
				최초 미입력 된 element로 focus 이동됨
				*/
				var frstIdx = "";
				$(".membersLogin p").each(function(){
					var $this = $(this);
					$this.find("input[type='text'],input[type='password']").each(function(idx){
						var validYn = true;
						var value = jQuery(this).val();
						var id = jQuery(this).attr("id");
						if(value == "" && id != "emailType"){
							validYn = false;
							if(frstIdx == ""){
								frstIdx = jQuery(this);
							}
						}
						if(!validYn){
							$this.addClass("error");
							$this.find(".alertMessage").show();
						}else{
							$this.removeClass("error");
							$this.find(".alertMessage").hide();
						}
					});
					
				});
				if(frstIdx != ""){
	  				bResult = false;
					frstIdx.focus();
					return false;
				}
				return bResult;
			}
			,fncLogin : function(param_loginSeCode) {
				
				var frm_userid = "";
				var frm_userpw = "";
				var param_nextUrl = "";
	
				// 아이디 로그인시
				if (param_loginSeCode != "SNS") {
					if(PageScript.validate()){
						frm_userid = jQuery("#frm_userid").val(); // 입력된 아이디
						frm_userpw = jQuery("#frm_userpw").val(); // 입력된 비밀번호
		
						// 아이디 입력 화인
						if (frm_userid == "") {
							alert("아이디를 입력해주세요.");
							jQuery("#frm_userid").focus();
							return;
						}
		
						// 비밀번호 입력 확인
						if (frm_userpw == "") {
							alert("비밀번호를 입력해주세요.");
							jQuery("#frm_userpw").focus();
							return;
						}
						
						var param = {
							loginSeCode : param_loginSeCode
							,loginId : frm_userid
							,loginPassword : frm_userpw
							,fromPageType : 'LOGIN'
							,nextURL : param_nextUrl
						}
						
						/****************************
						 * post 날리기 전에 요청전과 후의 동작을 정의
						 ****************************/
						$.ajaxSetup({
							beforeSend : function(xhr, settings) {
								commonJs.showLoadingBar();
								//alert('before=>xhr:' + JSON.stringify(xhr));
								//							   alert('before=>xhr:' + JSON.stringify(xhr) + "settings:"+JSON.stringify(settings));
							},
							complete : function(xhr, textStatus) {
								//alert('complete=>xhr:' + JSON.stringify(xhr) + ":textStatus:" + textStatus);
							}
						});
			
						/**********************************
						 * post 요청
						 **********************************/
						$.post("/login/api/login.json", param, function(data, status, xhr) {
							commonJs.closeLoadingBar();				
							if (data.loginYn == "N") {
								alert(data.msg);
								jQuery('.dimmed').show();
							}else{
								fncLoginCallBack(); //로그인 콜백이 필요한 경우 해당 이름으로 function 정의해서 사용하면 가능함
								PageScript.fncCloseLayerPopup();
							}
			
						}, "json")
			
						// error handling
						.fail(function(xhr, status, error) {
							alert("로그인 수행중 서버 오류가 발생하였습니다.");
						});
					}
				}
	
			}
			,bindSnsLinkEvent : function() {
				$('.snsLogin > a').each(
					function() {
						$(this).bind('click', function() {
							var lnkType = $(this).attr('class');
							var winSize = '';
							var lnkUrl = '';
							switch (lnkType) {
							case "google":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/googleLogin.do?fromPageType=LOGIN";
								break;
							case "facebook":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/facebookLogin.do?fromPageType=LOGIN";
								//alert('준비중입니다.');
								//return;	
								break;
							case "naver":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/naverLogin.do?callbackType=login&fromPageType=LOGIN";
								break;
							case "kakao":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=LOGIN";
								break;
							case "apple":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/appleLogin.do?fromPageType=LOGIN";
								break;

							default:
								break;
							}

							window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');

						});

					});
			}
	
		}
	
		$(document).ready(function() {
			PageScript = new PageScript();
			PageScript.init();
		});
		
		function redirectNextPage(nextURL) {
			//document.location.href = nextURL;
		}
		
		function redirectPage() {
			fncLoginCallBack('Y'); //로그인 콜백이 필요한 경우 해당 이름으로 function 정의해서 사용하면 가능함
			PageScript.fncCloseLayerPopup();
		}
	</script>

	<div id="loginLayerPop" class="layerPop login" style="display:none;">
		<div class="layerCont" style="top: 50%; left: 50%; margin-top: -319.5px; margin-left: -520px;">
			<div class="compLayer">
				<h2 class="compTit">로그인<!-- 로그인 --></h2>
				<div class="compCont"><!-- 20200528 수정 : width(삭제) -->
					<div class="loginBox">
						<div class="membersLogin">
							<p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage" style="display:none;">아이디를 입력해주세요.<!-- 아이디를 입력해주세요. --></span>
								<label class="hidden" for="frm_userid">아이디</label>
								<input type="text" id="frm_userid" placeholder="아이디" aria-required="true" />
							</p>
							<p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage" style="display:none">비밀번호를 입력해주세요.</span><!-- 비밀번호를 입력해주세요. -->
								<label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 -->
								<input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" />
							</p>
							<!-- 20200528 수정 : 아이디저장(추가) -->
							<span class="frm">
								<input type="checkbox" id="idSaveCheck"><label for="idSaveCheck">아이디 저장</label><!-- 아이디 저장 -->
							</span>
							<!-- //20200528 수정 : 아이디저장(추가) -->
							<button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID'); return false;">로그인<!-- 로그인 --></button>
							<div class="loginLink">
								<a href="/identify/identifyIntro.do" class="btnS icoArr">회원가입<!-- 회원가입 --></a>
								<a href="/identify/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기<!-- 아이디 / 비밀번호 찾기 --></a>
							</div>
						</div>
						<div class="snsLogin">
							<a href="javascript:void(0);" class="google">구글 로그인<!-- 구글 로그인 --></a>
							<a href="javascript:void(0);" class="facebook">페이스북 로그인<!-- 페이스북 로그인 --></a>
							
								<a href="javascript:void(0);" class="naver">네이버 로그인<!-- 네이버 로그인 --></a>
								<a href="javascript:void(0);" class="kakao">카카오톡 로그인<!-- 카카오톡 로그인 --></a>
							
							<a href="javascript:void(0);" class="apple">애플 로그인<!-- 애플 로그인 --></a><!-- 20200528 수정 : 애플로그인(추가) -->
						</div>
					</div>
				</div>
			</div>
			<ul class="txtGuide">
				<li>이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다.<!-- 이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다. --></li>
				<li>오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다.<!-- 오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다. --></li>
                <li>메리어트 호텔에서 예약하신 경우, 메리어트 사이트에서만 예약 확인이 가능합니다.<!-- 메리어트 호텔에서 예약하신 경우, 메리어트 사이트에서만 예약 확인이 가능합니다. --></li><!-- 20200528 수정 : 가이드(문구변경) -->
			</ul>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#loginLayerPop'));">닫기</button>
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

