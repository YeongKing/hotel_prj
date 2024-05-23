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

  <title>객실 예약 - 객실, 요금 선택 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트객실, 조선호텔앤리조트예약, 조선호텔앤리조트 할인">
  <meta name="description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:title" content="객실 예약 - 객실, 요금 선택 | 조선호텔앤리조트">
  <meta property="og:description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:url" content="https://josunhotel.com/resve/room/step1.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/resve/room/step1.do"/>
  <link rel="shortcut icon" type="text/css" href="/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
  
  
  
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
<jsp:include page="/header.jsp"></jsp:include>
 <!--E header  -->
        <!--(페이지 URL)-->












<script type="text/javascript">
	
	jQuery(function(){
		jQuery(document).ready(function(){
			jQuery("button").attr("type", "button");

			var selectCont = jQuery(".roomList li div.toggleCont:visible").closest("li");

			
				
				
			


			jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")
		});
	});
	
	/**
		객실 다시 검색 버튼 				
	*/
	function fncResvReset(){
		if(confirm("다시 검색하시겠습니까?")){ 
			location.href = "/resve/room/step0.do";
			return false;
		}
	}
	/**
		상품, 객실 탭 선택 시 show, hide function
		@param idx
	*/
	function fncViewTab(idx){
		jQuery(".tabType01 li").removeClass("on");
		jQuery(".roomContainer").hide();
		//[TO-DO] 회원 전용 상품 임시로 3번으로 이동 요청
		/*jQuery(".tabType01 li:eq("+idx+")").addClass("on");
		jQuery(".roomContainer:eq("+idx+")").show();
		if(idx == 2 ) {
			jQuery("#productSort").insertAfter("#roomSort");
			jQuery("#productSort").hide();
			jQuery("#roomSort").show();
		}else {
			jQuery("#roomSort").insertAfter("#productSort");
			jQuery("#productSort").show();
			jQuery("#roomSort").hide();
		}*/

		jQuery("#tab"+idx).addClass("on");
		jQuery("#roomContainer"+idx).show();
		if(idx == 2 ) {
			jQuery("#productSort").insertAfter("#roomSort");
			jQuery("#productSort").hide();
			jQuery("#roomSort").show();
		}else {
			jQuery("#roomSort").insertAfter("#productSort");
			jQuery("#productSort").show();
			jQuery("#roomSort").hide();
		}



		commonJs.initAccordion(jQuery('.toggleList'));
	}
	/**
		예약하기 버튼 클릭, 옵션 선택으로 이동
		@param roomCode 객실코드
		@param rateCode 레이트 코드
	*/
	function fncGoStep2(roomCode, rateCode, packageSn){
		jQuery("#roomCode").val(roomCode);
		jQuery("#rateCode").val(rateCode);
		jQuery("#packageSn").val(packageSn);
		jQuery("#step1Form").attr("action", "/resve/room/step2.do");
		jQuery("#step1Form").submit();
	}
	
	/**
	상품 비교함 빼기
	
	@param type 상품타입 (ex 상품 : product , 객실 : room)
	@param index 메인 인덱스
	@param subIndex 서브 인덱스
	*/
	function fncSubCompareProduct(type, index, subIndex, roomCode, rateCode, packageSn){
		var removeTarget = jQuery(".compList li[role='"+type+"_"+index+"_"+subIndex+"']");
		var removeTargetDetail = jQuery(".compList02 li[role='"+type+"_"+index+"_"+subIndex+"']");
		var renameTarget = jQuery("#"+type+"_"+index+"_"+subIndex);
		var newFloatingStr = ""; //새로 그려줄 영역 Str
		var compareCnt = 0; //비교함 갯수
		
		removeTarget.remove();
		removeTargetDetail.remove();
		
		newFloatingStr += "<li>";
		newFloatingStr += "	<div class=\"compWrap noCont\">"
		newFloatingStr += "		<p class=\"txt\">비교할 상품을 추가하실 수 있습니다.</p>";
		newFloatingStr += "		<span class=\"thum\"></span>";
		newFloatingStr += "	</div>";
		newFloatingStr += "</li>";
		
		jQuery(".compList").append(newFloatingStr);
		renameTarget.find("button.btnComparison").text("비교함 담기"); 
		renameTarget.find("button.btnComparison").attr("onclick", "fncAddCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+rateCode+"','"+rateCode+"','"+packageSn+"')");
		
		jQuery(".compList li").each(function(idx){
			jQuery(this).attr("data-index", idx);
		});
		jQuery(".compList").find(".compWrap").each(function(){
			if(!jQuery(this).hasClass("noCont")){
				compareCnt++;
			}
		});

		
			
				jQuery(".comparison .btnArea button").text(compareCnt+"개 비교하기"); //비교하기 갯수 추가				
			
			
		
	
		if(compareCnt < 2){
			jQuery(".comparison .btnWrap button").attr("onclick", "alert('비교할 상품을 2개 이상 담아주세요.'); return false;"); 
			commonJs.popClose(jQuery('#layerPop1'));
		}
		if(compareCnt == 0){
			jQuery(".comparison").hide();
		}
	}
	
	/**
		상품 비교함 담기
		
		@param type 상품타입 (ex 상품 : product , 객실 : room)
		@param index 메인 인덱스
		@param subIndex 서브 인덱스
		@param roomCode 객실코드
		@param rateCode 레이트코드
		@param packageSn 패키지 고유번호
	*/
	function fncAddCompareProduct(type, index, subIndex, roomCode, rateCode, packageSn){
		var targetIdx = -1;
		var addTarget = jQuery(".compList");
		var addLayTarget = jQuery(".compLayer");
		var compareTarget = jQuery("#"+type+"_"+index);
		var compareTargetDetail = jQuery("#"+type+"_"+index+"_"+subIndex);
		var compareCnt = 0; //비교함 갯수
		var compareStr = ""; //플로팅 영역 str 
		var compareDetailStr = ""; //layerPopup str
		var duplicateYn = false;
		
		var resvEvent = $(compareTargetDetail).find("a").attr("onclick");
		
		//동일한 상품이 비교하기 함에 들어있는지 확인
		addTarget.find("li").each(function(){
			if(jQuery(this).attr("role") == type+"_"+index+"_"+subIndex){
				duplicateYn = true;
				return false;
			}
		});
		
		if(duplicateYn){
			alert("동일한 상품이 이미 들어가 있습니다.");  
			return false;
		}
		//비교함 추가할 영역 찾기
		addTarget.find(".compWrap").each(function(){
			compareCnt++;
			if(jQuery(this).hasClass("noCont")){
				targetIdx = jQuery(this).closest("li").data("index");
				return false;
			}
		});
		
		if(targetIdx == -1){
			alert("상품은 최대 3개까지 추가 가능합니다."); 
			return false;
		}
		
		compareTargetDetail.find("button.btnComparison").text("비교함 빼기"); 
		compareTargetDetail.find("button.btnComparison").attr("onclick", "fncSubCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+rateCode+"','"+rateCode+"','"+packageSn+"')");
		
		
		
			
				jQuery(".comparison .btnArea button").text(compareCnt+"개 비교하기"); //비교하기 갯수 추가				
			
			
		
		
		if(compareCnt > 1){
			jQuery(".comparison .btnWrap button").attr("onclick", "commonJs.popShow(jQuery('#layerPop1'));");
		}
		if(type == "product"){
			
			//비교하기 함 플로팅 메뉴 그리기
			compareStr += "<div class=\"compWrap\">";
			compareStr += "	<strong class=\"tit\">"+compareTarget.find(".roomName").text()+"</strong>";
			compareStr += "	<span class=\"txt\">"+compareTargetDetail.find(".titArea .tit").text()+"</span>";
			compareStr += "	<span class=\"thum\"><img src=\""+compareTarget.find(".thum img").attr("src")+"\" alt=\"\"></span>";
			compareStr += "</div>";
			compareStr += "<button type=\"button\" class=\"btnDel\" onclick=\"fncSubCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+roomCode+"','"+rateCode+"','"+packageSn+"');\">비교함 삭제</button>";
			
			//비교하기 레이어 팝업 그리기
			compareDetailStr += "<li role=\""+type+"_"+index+"_"+subIndex+"\">";
			compareDetailStr += "	<dl>";
 			compareDetailStr += "		<dt class=\"tit\">"+compareTarget.find(".roomName").text()+"</dt>";
			compareDetailStr += "		<dd class=\"thum\"><img src=\""+compareTarget.find(".thum img").attr("src")+"\" alt=\"\"></dd>";
			compareDetailStr += "		<dd class=\"txt\">"+compareTargetDetail.find(".roomBenefit").text()+"</dd>";
			compareDetailStr += "		<dd class=\"benefit\"><strong>BENEFIT</strong>"+compareTarget.find(".roomIntro .roomBenefit").text()+"</dd>";
			compareDetailStr += "		<dd class=\"date\">"+compareTarget.find(".date").text()+"</dd>";
			compareDetailStr += "		<dd class=\"price\">"+compareTargetDetail.find(".price").text().replace("~","")+"</dd>";
			compareDetailStr += "		<dd class=\"btn\">";
			compareDetailStr += "			<a href=\"#none\" class=\"btnSC btnM active\" onclick=\""+resvEvent+"\">예약하기</a>"; 
			compareDetailStr += "			<button type=\"button\" class=\"btnDel btnLine\" onclick=\"fncSubCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+roomCode+"','"+rateCode+"','"+packageSn+"');\">상품은 최대 3개까지 추가 가능합니다.</button>"; 
			compareDetailStr += "		</dd>";
			compareDetailStr += "	</dl>";
			compareDetailStr += "</li>";
			
		}else if(type == "room"){
			
			//비교하기 함 플로팅 메뉴 그리기
			compareStr += "<div class=\"compWrap\">";
			compareStr += "	<strong class=\"tit\">"+compareTargetDetail.find(".roomInfor .tit").text()+"</strong>";
			compareStr += "	<span class=\"txt\">"+compareTarget.find(".roomName").text()+"</span>";
			compareStr += "	<span class=\"thum\"><img src=\""+compareTarget.find(".thum img").attr("src")+"\" alt=\"\"></span>";
			compareStr += "</div>";
			compareStr += "<button type=\"button\" class=\"btnDel\" onclick=\"fncSubCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+roomCode+"','"+rateCode+"','"+packageSn+"');\">비교함 삭제</button>";
			
			//비교하기 레이어 팝업 그리기
			compareDetailStr += "<li role=\""+type+"_"+index+"_"+subIndex+"\">";
			compareDetailStr += "	<dl>";
			compareDetailStr += "		<dt class=\"tit\">"+compareTargetDetail.find(".roomInfor .tit").text()+"</dt>";
			compareDetailStr += "		<dd class=\"thum\"><img src=\""+compareTarget.find(".thum img").attr("src")+"\" alt=\"\"></dd>";
			compareDetailStr += "		<dd class=\"txt\">"+compareTarget.find(".roomIntro .roomBenefit").text()+"</dd>";
			compareDetailStr += "		<dd class=\"benefit\"><strong>BENEFIT</strong>"+compareTargetDetail.find(".roomInfor .roomBenefit").text()+"</dd>";
			compareDetailStr += "		<dd class=\"date\">"+compareTargetDetail.find(".date").text()+"</dd>";
			compareDetailStr += "		<dd class=\"price\">"+compareTargetDetail.find(".price").text().replace("~","")+"</dd>";
			compareDetailStr += "		<dd class=\"btn\">";
			compareDetailStr += "			<a href=\"#none\" class=\"btnSC btnM active\" onclick=\""+resvEvent+"\">예약하기</a>"; 
			compareDetailStr += "			<button type=\"button\" class=\"btnDel btnLine\" onclick=\"fncSubCompareProduct('"+type+"','"+index+"','"+subIndex+"','"+roomCode+"','"+rateCode+"','"+packageSn+"');\">상품은 최대 3개까지 추가 가능합니다.</button>"; 
			compareDetailStr += "		</dd>";
			compareDetailStr += "	</dl>";
			compareDetailStr += "</li>";
			
		}
		
		addTarget.find("li[data-index='"+targetIdx+"']").attr("role", type+"_"+index+"_"+subIndex);
		addTarget.find("li[data-index='"+targetIdx+"']").html(compareStr);
		addLayTarget.find(".compList02").append(compareDetailStr);
	}
	/**
		환율 가격 적용
	*/
	function fncChangeExrate(ele){
		var currencyCd = jQuery(ele).val();
		var exchangeUnit = currencyCd;
		if("CNH" == currencyCd){
			exchangeUnit = "CNY";
		}
		
		jQuery(".roomList li .priceWrap .price").each(function(){
			jQuery(this).html(fncComma(jQuery(this).attr("data-"+currencyCd.toLowerCase()))+"<em>"+exchangeUnit+" ~</em>");
		});
		
		jQuery(".roomList li .roomInfor .price").each(function(){
			jQuery(this).html("<em>"+fncComma(jQuery(this).attr("data-"+currencyCd.toLowerCase()))+"</em>"+exchangeUnit+" ~");
		});
	}
	/**
		상품 정렬
	*/
	function fncProductSort(el){
		var sortVal = jQuery(el).val();

		if(sortVal != ""){
			var productItemYn = false;
			var mberOnlyItemYn = false;
			jQuery("#productList > li").not(".noData").each(function(){
				var kwrdSn = jQuery(this).data("kwrdsn");
				
				if(kwrdSn.indexOf(sortVal) > -1){
					jQuery(this).show();
					productItemYn = true;
				}else{
					jQuery(this).hide();
				}
			});				
			
			if(!productItemYn){
				jQuery("#productList > li.noData").show();
			}else{
				jQuery("#productList > li.noData").hide();
			}

			jQuery("#mberOnlyList > li").not(".noData").each(function(){
				var kwrdSn = jQuery(this).data("kwrdsn");

				if(kwrdSn.indexOf(sortVal) > -1){
					jQuery(this).show();
					mberOnlyItemYn = true;
				}else{
					jQuery(this).hide();
				}
			});

			if(!mberOnlyItemYn){
				jQuery("#mberOnlyList > li.noData").show();
			}else{
				jQuery("#mberOnlyList > li.noData").hide();
			}

		}else{
			jQuery("#productList > li").show();
			jQuery("#mberOnlyList > li").show();

			if(jQuery("#productList > li").not(".noData").length > 0){
				jQuery("#productList > li.noData").hide();						
			}else{
				jQuery("#productList > li.noData").show();
			}

			if(jQuery("#mberOnlyList > li").not(".noData").length > 0){
				jQuery("#mberOnlyList > li.noData").hide();
			}else{
				jQuery("#mberOnlyList > li.noData").show();
			}
		}
	}
	/**
		객실 정렬
	*/
	function fncRoomSort(el){
		var sortVal = jQuery(el).val();
		
		if(sortVal != ""){
			var itemYn = false;
			
			jQuery("#roomList > li").not(".noData").each(function(){
				var roomlslasCd = jQuery(this).data("roomlclas");
				
				if(sortVal != roomlslasCd){
					jQuery(this).hide();
				}else{
					jQuery(this).show();
					itemYn = true;
				}
			});
			
			if(!itemYn){
				jQuery("#roomList > li.noData").show();
			}else{
				jQuery("#roomList > li.noData").hide();
			}
		}else{
			jQuery("#roomList > li").show();
			
			if(jQuery("#roomList > li").not(".noData").length > 0){
				jQuery("#roomList > li.noData").hide();
			}else{
				jQuery("#roomList > li.noData").show();
			}
		}
	}

	/*
		상품정보 보기 레이어 팝업
	*/
	function fncOpenRoomInfo(hotlSysCode, roomCode , roomClCode){
		
		var param = {
				"hotlSysCode" : hotlSysCode
				,"roomCode" : roomCode
				,"roomClCode" : roomClCode
		}

		jQuery.ajax({
			
			type : "GET",
			url : "/resve/room/getRoomContent.json",
			cache : false,
			dataType : "json",
			data : param,
			async: false,
			global : false,

			success : function(data){
				
				var resultCode = data.resultCode;
				var resultMsg = data.resultMsg;
				if(resultCode == "SUCCESS"){

					var content = data.content;
					var roomInfo = data.roomInfo;
					
					var galleryList = data.galleryImgList;
					

					var html =	"			<h2 class=\"compTit\">"+content.topTitle+"</h2>";
					html +=		"			<div class=\"scrollArea\">";
					html +=		"				<div class=\"scrollWrap\">";
					html +=		"					<div class=\"txtCont\">";
					html +=		"						<p>"+content.pageGuide+"</p>";
					html +=		"					</div>";

					if(galleryList.length == 0){
						html +=		"				<div class=\"imgCont\">";
						html +=		"					<img src=\"/util/file/image.do?fileSn="+roomInfo.repImgSn+"&sysCode="+roomInfo.sysCode+"\" alt=\""+roomInfo.repImgDc+"\">";
						html +=		"				</div>";
					}else {
						html +=		"					<div class=\"swipeWrap gallery ppGallery\" style=\"width: 940px;\">";
						html +=		"						<button type=\"button\" class=\"btnSwipe btnPrev\"><span class=\"hidden\">이전</span></button>";
						html +=		"						<ul class=\"swipeCont\">";
						for(var i=0; i < galleryList.length; i++){
							var fileSn = galleryList[i].fileSn;
							var subFileSn = galleryList[i].subFileSn;
							html +=		"						<li class=\"swipeSlide\" style=\"width: 940px;\">";
							html += 	'							<img src="/util/file/download.do?fileSn='+fileSn+'&subFileSn='+subFileSn+'&sysCode='+roomInfo.sysCode+'" alt="'+roomInfo.galleryImgDc+'">';
							html +=		"						</li>";
						}
						html +=		"						</ul>";
						html += 	"						<button type=\"button\" class=\"btnSwipe btnNext\"><span class=\"hidden\">다음</span></button>";
						html +=		"					</div>";
					}

					html +=		"					<p class=\"txtGuide\">상기 이미지는 이해를 돕기 위한 이미지 컷으로 실제와 다를 수 있습니다.</p>"; /*상기 이미지는 이해를 돕기 위한 이미지 컷으로 실제와 다를 수 있습니다.*/
					html +=		"					";
					html +=		"					<div class=\"propertyInfo\">";
					html +=		"						<h2 class=\"hidden\">객실개요</h2>";
					html +=		"						<ul>";
					html +=		"							"+content.propertyinfo;
					html +=		"						</ul>";
					html +=		"					</div>";
					html +=		"					<h2 class=\"titDep2\">객실 어메니티</h2>"; /*객실 어메니티*/
					html +=		"					"+content.tab;
					html +=		"					<div id=\"tab01\" class=\"tabCont\" style=\"display:block;\">";
					html +=		"						"+content.tab01;
					html +=		"					</div>";
					html +=		"					<div id=\"tab02\" class=\"tabCont\">";
					html +=		"						"+content.tab02;
					html +=		"						<p class=\"txtGuide\">"+content.txtguide+"</p>";
					html +=		"					</div>";
					html +=		"					<div id=\"tab03\" class=\"tabCont\">";
					html +=		"						"+content.tab03;
					html +=		"					</div>";
					html +=		"					<div id=\"tab04\" class=\"tabCont\">";
					html +=		"						"+content.tab04;
					html +=		"					</div>";
					if(content.tit01 != null || content.tit02 != null || content.tit03 != null || content.tit04 != null || content.tit05 != null){
						html +=		"					<h2 class=\"titDep2\">특별 서비스</h2>"; /* 특별 서비스 */
						html +=		"					<ul class=\"packageCont22\">";
							if(content.tit01 != null ){
							html +=		"						<li>";
							html +=		"							<dl>";
							html +=		"								<dt>"+content.tit01+"</dt>";
							html +=		"								<dd class=\"txtArea\">";
							html +=		"									"+content.tetarea01;
							html +=		"								</dd>";
							html +=		"							</dl>";
							html +=		"						</li>";
							}
							if(content.tit02 != null ){
							html +=		"						<li>";
							html +=		"							<dl>";
							html +=		"								<dt>"+content.tit02+"</dt>";
							html +=		"								<dd class=\"txtArea\">";
							html +=		"									"+content.tetarea02;
							html +=		"								</dd>";
							html +=		"							</dl>";
							html +=		"						</li>";
							}
							if(content.tit03 != null ){
							html +=		"						<li>";
							html +=		"							<dl>";
							html +=		"								<dt>"+content.tit03+"</dt>";
							html +=		"								<dd class=\"txtArea\">";
							html +=		"									"+content.tetarea03;
							html +=		"								</dd>";
							html +=		"							</dl>";
							html +=		"						</li>";
							}
							if(content.tit04 != null ){
							html +=		"						<li>";
							html +=		"							<dl>";
							html +=		"								<dt>"+content.tit04+"</dt>";
							html +=		"								<dd class=\"txtArea\">";
							html +=		"									"+content.tetarea04;
							html +=		"								</dd>";
							html +=		"							</dl>";
							html +=		"						</li>";
							}
							if(content.tit05 != null ){
							html +=		"						<li>";
							html +=		"							<dl>";
							html +=		"								<dt>"+content.tit05+"</dt>";
							html +=		"								<dd class=\"txtArea\">";
							html +=		"									"+content.tetarea05;
							html +=		"								</dd>";
							html +=		"							</dl>";
							html +=		"						</li>";
							}
						html +=		"					</ul>";
					}
					html +=		"				</div>";
					html +=		"			</div>";

					jQuery("#layerPop2 .detailCont").html(html);
					commonJs.popShow(jQuery('#layerPop2'));
					commonJs.initDesignScroll($('.scrollWrap'));
					commonJs.initTab($('.tabToggle'));


				}else{
					alert(data.resultMsg);
					commonJs.closeLoadingBar(); //로딩바 hide
					return false;
				}
			},
			complete: function() {
				commonJs.initSwipe(jQuery(".swipeWrap"));
				jQuery(".swipeWrap").css("height", "561px");
				jQuery(".swipeWrap").css("margin-top", "50px");
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		 })
	}


	/*
		패키지 혜택 상세보기 레이어 팝업 오픈
	*/
	function fncOpenPackBenefit(packageSn, hotlSysCode){
		
		var param = {
			"searchSysCode" : hotlSysCode
			,"packageSn" : packageSn
		};
		
		jQuery.ajax({
			type : "POST",
			url : "/package/getPackageInfo.json",
			cache : false,
			dataType : "json",
			data : param,
			global : false,
			success : function(data){
				var resultCode = data.resultCode;
				var resultMsg = data.resultMsg;
				
				if(resultCode == "SUCCESS"){
					var packageInfo = data.packageInfo;
					var kwrdList = data.kwrdList;
					var roomInfoList = data.roomInfoList;
					var bnefList = data.bnefList;
					var packageHtml = "";
					var dayCodeList = data.dayCodeList;
					var dayMkCodeList = data.dayMkCodeList;
					
					packageHtml += "<div class=\"layerCont\">";
					packageHtml += "	<h2 class=\"compTit\">"+packageInfo.operaGoodsNm+"</h2>";
					packageHtml += "	<div class=\"detailCont h750\">";
					packageHtml += "		<div class=\"scrollWrap\">";
					packageHtml += "			<div class=\"topViewCont\">";
					packageHtml += "				<div class=\"txtCont\">";
					packageHtml += "					<p class=\"txt\">"+packageInfo.operaGoodsDc+"</p>";
					if(kwrdList.length > 0){
						packageHtml += "				<div class=\"category\">";
						for(var i = 0; i < kwrdList.length; i++){
							packageHtml += "<span>"+kwrdList[i].kwrdNm+"</span>";	
						}
						packageHtml += "				</div>";	
					}
					packageHtml += "				</div>";
					packageHtml += "			</div>";
					packageHtml += "			<div class=\"inner\">";
					packageHtml += "				<h2 class=\"titDep2\">객실별 패키지 구성</h2>";
					packageHtml += "				<ul class=\"packageCont01\">";
					for(var j = 0; j < roomInfoList.length; j++){
						var roomInfo = roomInfoList[j];
						packageHtml += "				<li>";
						packageHtml += "					<strong class=\"tit\">"+roomInfo.roomNm+"</strong>";
						packageHtml += "					<div class=\"priceInfor\">";
						
						for(var k = 0; k < roomInfo.dayInfoList.length; k++){
							var dayInfo = roomInfo.dayInfoList[k];
							
							var day1Code = dayCodeList.filter(function(item){    
								return item.code === dayInfo.day1;
							});
							
							
							packageHtml += "					<div>";
							packageHtml += "						<strong class=\"day\">";
							packageHtml += " 					"+ day1Code[0].codeNm +"";
							if(dayInfo.mark != ""){
								var day2Code = dayCodeList.filter(function(item){    
									return item.code === dayInfo.day2;
								});
								var markCode = dayMkCodeList.filter(function(item){    
									return item.code === dayInfo.mark;
								});
								packageHtml += "				"+ markCode[0].codeNm +"";
								packageHtml += "				"+ day2Code[0].codeNm +"";
							}
							packageHtml += "						</strong>";
							packageHtml += "						<span class=\"price\"><em>"+ fncComma(dayInfo.amt) +"</em>KRW ~</span>";
							packageHtml += "					</div>";

						}
						packageHtml += "					</div>";
						packageHtml += "					<div class=\"guideTxt\">";
						packageHtml += "						<div class=\"listDep1\">";
						packageHtml += "							"+roomInfo.roomGuideCn.replace(/\n/gi,"<br>");
						packageHtml += "						</div>";
						packageHtml += "					</div>";
						packageHtml += "				</li>";
					}
					packageHtml += "				</ul>";
					packageHtml += "				<h2 class=\"titDep2\">주요 혜택</h2>"; 
					packageHtml += "				<ul class=\"packageCont22\">";
					for(var z = 0; z < bnefList.length; z++){
						var bnefInfo = bnefList[z];
						packageHtml += "				<li>";
						packageHtml += "					<dl>";
						packageHtml += "						<dt>"+bnefInfo.bnefNm+"</dt>";
						//packageHtml += "						<dd class=\"thum\"><img src=\"/util/file/download.do?fileSn="+bnefInfo.bnefImageSn+"&sysCode="+bnefInfo.sysCode+"\" alt=\""+bnefInfo.bnefImageDc+"\"></dd>";
						packageHtml += "						<dd class=\"txtArea\">";
						packageHtml += "						<p class=\"txt\">"+bnefInfo.detailDc.replace(/\n/gi,"<br>")+"</p>"
						if(bnefInfo.linkButtonNm != "" && bnefInfo.linkUrl != ""){
							packageHtml += "						<div class=\"btnArea\"><a href=\""+bnefInfo.linkUrl+"\" class=\"btnSC btnL active\" target=\"_blank\" title=\""+bnefInfo.linkButtonNm+"\">"+bnefInfo.linkButtonNm+"</a></div>";
						}
						packageHtml += "						</dd>";
						packageHtml += "					</dl>";
						packageHtml += "				</li>";
					}
					packageHtml += "				</ul>";
					packageHtml += "				<div class=\"noticeArea\">";
					packageHtml += "					<h3 class=\"titDep3\">유의사항</h3>"; 
					packageHtml += "					<div class=\"listDep1\">";
					packageHtml += "						"+packageInfo.noticeCn.replace(/\n/gi,"<br>");
					packageHtml += "					</div>";
					packageHtml += "					<div class=\"revInquiry\">";
					packageHtml += "						<h3 class=\"titDep3\">예약 문의</h3>"; 
					packageHtml += "						<span>유선 문의<em>"+packageInfo.inquiryTelno+"</em></span>"; 
					packageHtml += "						<span>이메일 문의<em><a href=\"mailto:"+packageInfo.inqryEmailAdres+"\">"+packageInfo.inqryEmailAdres+"</a></em></span>"; 
					packageHtml += "					</div>";
					packageHtml += "				</div>";
					packageHtml += "			</div>";
					packageHtml += "		</div>";
					packageHtml += "	</div>"; 
					packageHtml += "	<button type=\"button\" class=\"btnClose\" onclick=\"commonJs.popClose(jQuery('#layerPop3'));\">닫기</button>"; 
					packageHtml += "</div>";
					
					jQuery("#layerPop3").html(packageHtml);
					commonJs.popShow(jQuery('#layerPop3'));
					commonJs.initDesignScroll(jQuery('.scrollWrap'));
					
				}else{
					alert(resultMsg);
					return false;
				}
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
				return false;
			}
		});
	}

	function fncMemPop(speclPckageSn, roomCodeNm, speclDscntRt, speclRateCode, speclAddiGift, roomCode, rateCode, packageSn){
		
		commonJs.popClose(jQuery('#layerPop1'));
		
		var mbrLink = "/login/loginForm.do?nextURL=/resve/room/step2.do?hotlSysCode=GJJ&ckinDate=2024.05.21&ckoutDate=2024.05.22&night=1&roomCnt=1&adltSum=2&chldSum=0&roomCode="+roomCode+"&rateCode="+speclRateCode+"&packageSn="+speclPckageSn;
		
			mbrLink += "&adltCntArr="+2
		
			mbrLink += "&adltCntArr="+0
		
			mbrLink += "&adltCntArr="+0
		
		
			mbrLink += "&chldCntArr="+0
		
			mbrLink += "&chldCntArr="+0
		
			mbrLink += "&chldCntArr="+0
		

		var bnefText = "";
		if(speclDscntRt != "" && speclDscntRt != undefined){
			bnefText = speclDscntRt;
		}
		if(speclAddiGift != "" && speclAddiGift != undefined){
			if(bnefText != ""){
				bnefText += " 및 "+speclAddiGift;
			}else {
				bnefText += speclAddiGift;
			}
		}

		$("#roomTitleArea").text(roomCodeNm);
		$("#bnefArea").text(bnefText);
		$("#mbrResvBtn").attr("href", mbrLink);
		$("#nMbrResvBtn").attr("onclick", "fncGoStep2('"+roomCode+"', '"+rateCode+"', '"+packageSn+"');");
		
		commonJs.popShow(jQuery('#layerPop4'));
	}
	
	function fncConfirmMemLogin(roomCode, rateCode, packageSn) {
		if(confirm("본 상품은 추가 할인이 적용 되는 회원전용 상품으로 회원예약만 가능합니다.\n무료 회원가입 또는 로그인 후 진행하시겠습니까?")) {
			var mbrLink = "/login/loginForm.do?nextURL=/resve/room/step2.do?hotlSysCode=GJJ&ckinDate=2024.05.21&ckoutDate=2024.05.22&night=1&roomCnt=1&adltSum=2&chldSum=0&roomCode="+roomCode+"&rateCode="+rateCode+"&packageSn="+packageSn;
			
			
				mbrLink += "&adltCntArr="+2
			
				mbrLink += "&adltCntArr="+0
			
				mbrLink += "&adltCntArr="+0
			
			
				mbrLink += "&chldCntArr="+0
			
				mbrLink += "&chldCntArr="+0
			
				mbrLink += "&chldCntArr="+0
			
			
			location.href = mbrLink;
		}
	}
</script>
<form action="" name="step1Form" id="step1Form" method="post">
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="GJJ" /> 		
	<input type="hidden" name="ckinDate" id="ckinDate" value="2024.05.21" />	 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="2024.05.22" /	> 			
	<input type="hidden" name="night" id="night" value="1" />	 						
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />						
	
		<input type="hidden" name="adltCntArr" id="adltCntArr0" value="2" />				
	
		<input type="hidden" name="adltCntArr" id="adltCntArr1" value="0" />				
	
		<input type="hidden" name="adltCntArr" id="adltCntArr2" value="0" />				
	
	
		<input type="hidden" name="chldCntArr" id="chldCntArr0" value="0" />				
	
		<input type="hidden" name="chldCntArr" id="chldCntArr1" value="0" />				
	
		<input type="hidden" name="chldCntArr" id="chldCntArr2" value="0" />				
	
	<input type="hidden" name="sortCd" id="sortCd" value="" />						
	<input type="hidden" name="curruncyCd" id="curruncyCd" value="" />			
	<input type="hidden" name="roomCode" id="roomCode" value="" />													
	<input type="hidden" name="rateCode" id="rateCode" value="" />													
	<input type="hidden" name="adltSum" id="adltSum" value="2" />						
	<input type="hidden" name="chldSum" id="chldSum" value="0" />						
	<input type="hidden" name="packageSn" id="packageSn" value="" />
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
						<li class="on">
							<span class="hidden">현재단계</span>
							<em>객실, 요금 선택</em>
						</li>
						<li>
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
						<dd>그랜드 조선 제주</dd>
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
			<div class="titArea">
				<ul class="tabType01">
					
					
					<li id="tab1" class="on"><a href="#none" onclick="fncViewTab(1);">상품으로 보기 6</a></li>
					<li id="tab2" ><a href="#none" onclick="fncViewTab(2);">객실로 보기 12</a></li>
					<li id="tab3" ><a href="#none" onclick="fncViewTab(3);">회원 전용 0</a></li>
				</ul>
				<div class="side">
					<div class="selectWrap" style="width:150px;" first="true" id="productSort">
						<select data-msg="전체" data-direction="down" onchange="fncProductSort(this);">
							<option value="" selected="">전체</option>
							
								<option value="K01" >Room Only</option>
							
								<option value="K02" >멤버십 전용</option>
							
								<option value="K03" >선결제</option>
							
								<option value="K04" >얼리버드</option>
							
								<option value="K05" >패키지</option>
							
								<option value="K06" >조식</option>
							
						</select>
					</div>
					<div class="selectWrap" style="width:150px;display:none;" id="roomSort">
						
							
								
							
							
						
						<select name="roomSort" id="roomSort"  onchange="fncRoomSort(this);"   > 
<option value="">전체</option> 
<option value="A01" >ROOM</option> 
<option value="A02" >SUITE</option> 
<option value="A03" >KIDS</option> 
<option value="A04" >HILL SUITE</option> 
</select> 
	
					</div>
					
					<div class="selectWrap" style="width:200px;" first="true" id="exchangeRateSort">
						<select name="exchangeRate" id="exchangeRate" class="form-control" onchange="fncChangeExrate(this);"   ><option value="KRW" >대한민국(KRW)</option><option value="USD" >USA(USD)</option><option value="CNH" >中國 (CNY)</option><option value="JPY" >日本 (JPY)</option><option value="EUR" >EU(EUR)</option></select>
					</div>
				</div>
			</div>
			
			
			
			
			<div class="roomContainer" id="roomContainer3" style="display:none;">
				<h3 class="hidden">회원 전용</h3>
				
					<div class="joinBanner">
						<div>
							<span class="bannerTit">클럽조선 리워드 헤택<!-- 클럽조선 리워드 헤택 --></span>멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다.<!-- 멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다. -->
							<a href="https://josunhotel.com/identify/identifyIntro.do" class="btnLine" target="_blank">멤버십 가입하기</a>
						</div>
					</div>
				
				<ul class="toggleList roomList" id="mberOnlyList">
					<li class="noData" >
						<p class="txt">
							예약 가능한 패키지 상품이 없습니다.<br>다시 검색해주세요.
						</p>
						
					</li>
					
				</ul>
				<!-- //roomList -->
			</div>
			
			
			
			<div class="roomContainer" id="roomContainer1" >
				<h3 class="hidden">상품으로 보기</h3>
				
					<div class="joinBanner">
						<div>
							<span class="bannerTit">클럽조선 리워드 헤택<!-- 클럽조선 리워드 헤택 --></span>멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다.<!-- 멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다. -->
							<a href="https://josunhotel.com/identify/identifyIntro.do" class="btnLine" target="_blank">멤버십 가입하기</a>
						</div>
					</div>
				
				<ul class="toggleList roomList" id="productList">
					<li class="noData" style="display:none;">
						<p class="txt">
							예약 가능한 패키지 상품이 없습니다.<br>다시 검색해주세요.
						</p>
						
					</li>
					
						<li id="product_0" data-kwrdsn="K05" >
							<dl class="roomIntro">
								<dt class="roomName">
									ROOM ONLY
								</dt>
								<dd class="keyword">
									
										
									
										
									
										
									
										
									
										
											<span>패키지</span>
										
									
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Room Only</span>
									
									
								</dd>
								<dd class="roomBenefit">
									본관 1박
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('531357','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2024.01.01 - 2024.11.30</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
										212,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=531479&sysCode=GJJ" alt="Room Only">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_0_0" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN, STANDARD VIEW </strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
															<em>212,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DST' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','0','DST','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_0_1" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, STANDARD VIEW</strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
															<em>212,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DSK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','1','DSK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_0_2" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 46.7㎡</p>
														<span class="price" data-krw="238000" data-jpy="27400" data-usd="175" data-cnh="1272" data-eur="161">
															<em>238,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DGK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','2','DGK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_0_3" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
															<em>255,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','3','DPK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_0_4" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN,  POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
															<em>255,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPT' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','4','DPT','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_0_5" data-test="D05">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">ROYAL SUITE</strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 202㎡</p>
														<span class="price" data-krw="1275000" data-jpy="146800" data-usd="940" data-cnh="6818" data-eur="865">
															<em>1,275,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','RS' ,'B07');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','5','RS','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('RS','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_0_6" data-test="D05">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">THE SUITE</strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 267.5㎡</p>
														<span class="price" data-krw="1487500" data-jpy="171300" data-usd="1096" data-cnh="7954" data-eur="1009">
															<em>1,487,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','PS' ,'B08');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','0','6','PS','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('PS','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="product_1" data-kwrdsn="K04" >
							<dl class="roomIntro">
								<dt class="roomName">
									Mindful Stay - Basic Package.
								</dt>
								<dd class="keyword">
									
										
									
										
									
										
									
										
											<span>얼리버드</span>
										
									
										
									
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Mindful Stay</span>
									
										<span>ESG</span>
									
									
								</dd>
								<dd class="roomBenefit">
									리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('1980937','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2024.04.22 - 2024.11.30</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="217500" data-jpy="25000" data-usd="160" data-cnh="1163" data-eur="147">
										217,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1994641&sysCode=GJJ" alt="전사 ESG 패키지 룸온리">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_1_0" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, STANDARD VIEW</strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="217500" data-jpy="25000" data-usd="160" data-cnh="1163" data-eur="147">
															<em>217,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DSK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','1','0','DSK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_1_1" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN, STANDARD VIEW </strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="217500" data-jpy="25000" data-usd="160" data-cnh="1163" data-eur="147">
															<em>217,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DST' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','1','1','DST','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_1_2" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 46.7㎡</p>
														<span class="price" data-krw="243600" data-jpy="28000" data-usd="179" data-cnh="1302" data-eur="165">
															<em>243,600</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DGK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','1','2','DGK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_1_3" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="261000" data-jpy="30000" data-usd="192" data-cnh="1395" data-eur="177">
															<em>261,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','1','3','DPK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_1_4" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN,  POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="261000" data-jpy="30000" data-usd="192" data-cnh="1395" data-eur="177">
															<em>261,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPT' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','1','4','DPT','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="product_2" data-kwrdsn="K06" >
							<dl class="roomIntro">
								<dt class="roomName">
									BED &amp; BREAKFAST
								</dt>
								<dd class="keyword">
									
										
									
										
									
										
									
										
									
										
									
										
											<span>조식</span>
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Breakfast</span>
									
									
								</dd>
								<dd class="roomBenefit">
									본관 1박 + 조식 2인
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('371799','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2020.12.01 - 2024.12.31</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="230000" data-jpy="26400" data-usd="169" data-cnh="1229" data-eur="156">
										230,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1932557&sysCode=GJJ" alt="그랜드 조선 제주 본관 아리아 조식 패키지">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_2_0" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN, STANDARD VIEW </strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="230000" data-jpy="26400" data-usd="169" data-cnh="1229" data-eur="156">
															<em>230,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DST' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','0','DST','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_2_1" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, STANDARD VIEW</strong>
														</div>
														<p class="roomBenefit">Standard View |  Size: 46.7㎡</p>
														<span class="price" data-krw="230000" data-jpy="26400" data-usd="169" data-cnh="1229" data-eur="156">
															<em>230,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DSK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','1','DSK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_2_2" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 46.7㎡</p>
														<span class="price" data-krw="257600" data-jpy="29600" data-usd="189" data-cnh="1377" data-eur="174">
															<em>257,600</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DGK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','2','DGK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
														
													
													
													
												
												<li class="type01" id="product_2_3" data-test="D02">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE KING, POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="276000" data-jpy="31700" data-usd="203" data-cnh="1475" data-eur="187">
															<em>276,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPK' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','3','DPK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_2_4" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">DELUXE TWIN,  POOLSIDE VIEW </strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 46.7㎡</p>
														<span class="price" data-krw="276000" data-jpy="31700" data-usd="203" data-cnh="1475" data-eur="187">
															<em>276,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','DPT' ,'B01');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','4','DPT','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_2_5" data-test="D05">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">ROYAL SUITE</strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 202㎡</p>
														<span class="price" data-krw="1380000" data-jpy="158900" data-usd="1017" data-cnh="7379" data-eur="936">
															<em>1,380,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','RS' ,'B07');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','5','RS','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('RS','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_2_6" data-test="D05">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">THE SUITE</strong>
														</div>
														<p class="roomBenefit">Poolside View |  Size: 267.5㎡</p>
														<span class="price" data-krw="1610000" data-jpy="185400" data-usd="1187" data-cnh="8609" data-eur="1093">
															<em>1,610,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','PS' ,'B08');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','2','6','PS','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('PS','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="product_3" data-kwrdsn="K01" >
							<dl class="roomIntro">
								<dt class="roomName">
									Hill Suite Room Only
								</dt>
								<dd class="keyword">
									
										
											<span>Room Only</span>
										
									
										
									
										
									
										
									
										
									
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Room Only</span>
									
										<span>Suite</span>
									
									
								</dd>
								<dd class="roomBenefit">
									Hill Suite Room Only
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('1724391','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2023.10.17 - 2024.12.31</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
										382,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1952615&sysCode=GJJ" alt="Hill Suite Room Only">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_3_0" data-test="D06">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE SUPER KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
															<em>382,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSGK' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','3','0','HSGK','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_3_1" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL SUITE TWIN, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
															<em>382,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HHGT' ,'B10');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','3','1','HHGT','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_3_2" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE TWIN, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 89㎡</p>
														<span class="price" data-krw="450500" data-jpy="51900" data-usd="332" data-cnh="2409" data-eur="305">
															<em>450,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSOT' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','3','2','HSOT','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_3_3" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 193.1㎡</p>
														<span class="price" data-krw="722500" data-jpy="83200" data-usd="532" data-cnh="3863" data-eur="490">
															<em>722,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPG' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','3','3','HPG','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_3_4" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 193.1㎡</p>
														<span class="price" data-krw="807500" data-jpy="93000" data-usd="595" data-cnh="4318" data-eur="548">
															<em>807,500</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPO' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','3','4','HPO','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="product_4" data-kwrdsn="K06" >
							<dl class="roomIntro">
								<dt class="roomName">
									HILL SUITE BED &amp; BREAKFAST
								</dt>
								<dd class="keyword">
									
										
									
										
									
										
									
										
									
										
									
										
											<span>조식</span>
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Breakfast</span>
									
										<span>Suite</span>
									
									
								</dd>
								<dd class="roomBenefit">
									힐 스위트 1박  + 조식 2인
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('1673541','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2023.10.06 - 2024.12.31</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="414000" data-jpy="47600" data-usd="305" data-cnh="2213" data-eur="281">
										414,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1727362&sysCode=GJJ" alt="HILL SUITE BED &amp; BREAKFAST 그랜드 조선 힐 스위트 조식">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_4_0" data-test="D06">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE SUPER KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="414000" data-jpy="47600" data-usd="305" data-cnh="2213" data-eur="281">
															<em>414,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSGK' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','4','0','HSGK','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_4_1" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL SUITE TWIN, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="414000" data-jpy="47600" data-usd="305" data-cnh="2213" data-eur="281">
															<em>414,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HHGT' ,'B10');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','4','1','HHGT','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_4_2" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE TWIN, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 89㎡</p>
														<span class="price" data-krw="487600" data-jpy="56100" data-usd="359" data-cnh="2607" data-eur="331">
															<em>487,600</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSOT' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','4','2','HSOT','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_4_3" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 193.1㎡</p>
														<span class="price" data-krw="782000" data-jpy="90000" data-usd="576" data-cnh="4181" data-eur="530">
															<em>782,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPG' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','4','3','HPG','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_4_4" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 193.1㎡</p>
														<span class="price" data-krw="874000" data-jpy="100600" data-usd="644" data-cnh="4673" data-eur="593">
															<em>874,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPO' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','4','4','HPO','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="product_5" data-kwrdsn="K05" >
							<dl class="roomIntro">
								<dt class="roomName">
									ALMOST HEAVEN
								</dt>
								<dd class="keyword">
									
										
									
										
									
										
									
										
									
										
											<span>패키지</span>
										
									
										
									
									<!-- 2021-04-20 패키지 키워드 추가 -->
									
										<span>Couple</span>
									
										<span>Suite</span>
									
									
								</dd>
								<dd class="roomBenefit">
									힐 스위트 1박 + 그랑제이 Access (조식 + 커피 & 티 서비스 + 그랑 초이스)
								</dd>
								
								
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenPackBenefit('347825','GJJ');">
											자세히 보기
										</a>
									</dd>
								
								
								
								<dd class="date">2016.10.30 - 2024.08.31</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="600000" data-jpy="69100" data-usd="442" data-cnh="3208" data-eur="407">
										600,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1727475&sysCode=GJJ" alt="Hill Suite 그랜드 조선 힐 스위트">										
										
									
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<div class="toggleCont" >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList">
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_5_0" data-test="D06">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE SUPER KING, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="600000" data-jpy="69100" data-usd="442" data-cnh="3208" data-eur="407">
															<em>600,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSGK' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','5','0','HSGK','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_5_1" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL SUITE TWIN, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 89㎡</p>
														<span class="price" data-krw="600000" data-jpy="69100" data-usd="442" data-cnh="3208" data-eur="407">
															<em>600,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HHGT' ,'B10');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','5','1','HHGT','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
														
													
													
												
												<li class="type02" id="product_5_2" data-test="D04">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">HILL STUDIO SUITE TWIN, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 89㎡</p>
														<span class="price" data-krw="680000" data-jpy="78300" data-usd="501" data-cnh="3636" data-eur="461">
															<em>680,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HSOT' ,'B09');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','5','2','HSOT','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_5_3" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, GARDEN VIEW</strong>
														</div>
														<p class="roomBenefit">Garden View |  Size: 193.1㎡</p>
														<span class="price" data-krw="1000000" data-jpy="115200" data-usd="737" data-cnh="5347" data-eur="678">
															<em>1,000,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPG' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','5','3','HPG','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>																
											
												
												
													
													
													
														
													
												
												<li class="type03" id="product_5_4" data-test="D07">
													<div class="roomInfor">
															<div class="titArea">
															<strong class="tit">PRESTIGE HILL SUITE, OCEAN VIEW</strong>
														</div>
														<p class="roomBenefit">Ocean View |  Size: 193.1㎡</p>
														<span class="price" data-krw="1100000" data-jpy="126700" data-usd="811" data-cnh="5882" data-eur="746">
															<em>1,100,000</em>KRW ~
														</span>
														<button type="button" class="btnLine" onclick="fncOpenRoomInfo('GJJ','HPO' ,'B11');">
															객실 상세보기
														</button>
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('product','5','4','HPO','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>																
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
				</ul>
				<!-- //roomList -->
			</div>
			<!-- //roomContainer -->
			
			
			
			<div class="roomContainer" id="roomContainer2" style="display:none;">
				<h3 class="hidden">객실로 보기</h3>
				
				<div class="joinBanner">
					<div>
						<span class="bannerTit">클럽조선 리워드 헤택<!-- 클럽조선 리워드 헤택 --></span>멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다.<!-- 멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다. -->
						<a href="https://josunhotel.com/identify/identifyIntro.do" class="btnLine" target="_blank">멤버십 가입하기</a>
					</div>
				</div>
				
				<ul class="toggleList roomList" id="roomList">
					<li class="noData" style="display:none;">
						<p class="txt">예약 가능한 객실이 없습니다.<br>다시 검색해주세요.</p> <!-- 객실 내 상품이 없을 경우 -->
						
					</li>
					
						<li id="room_0" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE TWIN, STANDARD VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Standard View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'DST' ,'B01');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
										212,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=553735&sysCode=GJJ" alt="디럭스 트윈">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_0_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
															<em>212,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','0','0','DST','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_0_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Mindful Stay - Basic Package.</strong>
															
														</div>
														<p class="roomBenefit">리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..</p>
														
														
														<div class="date">
															2024.04.22 - 2024.11.30
														</div>
														<span class="price" data-krw="217500" data-jpy="25000" data-usd="160" data-cnh="1163" data-eur="147">
															<em>217,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1980937','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','0','1','DST','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_0_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="230000" data-jpy="26400" data-usd="169" data-cnh="1229" data-eur="156">
															<em>230,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','0','2','DST','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_1" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE KING, STANDARD VIEW
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Standard View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'DSK' ,'B01');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
										212,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=553751&sysCode=GJJ" alt="디럭스 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_1_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="212500" data-jpy="24400" data-usd="156" data-cnh="1136" data-eur="144">
															<em>212,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','1','0','DSK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_1_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Mindful Stay - Basic Package.</strong>
															
														</div>
														<p class="roomBenefit">리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..</p>
														
														
														<div class="date">
															2024.04.22 - 2024.11.30
														</div>
														<span class="price" data-krw="217500" data-jpy="25000" data-usd="160" data-cnh="1163" data-eur="147">
															<em>217,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1980937','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','1','1','DSK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_1_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="230000" data-jpy="26400" data-usd="169" data-cnh="1229" data-eur="156">
															<em>230,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','1','2','DSK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_2" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE KING, GARDEN VIEW
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Garden View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'DGK' ,'B01');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="238000" data-jpy="27400" data-usd="175" data-cnh="1272" data-eur="161">
										238,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=961228&sysCode=GJJ" alt="디럭스 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_2_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="238000" data-jpy="27400" data-usd="175" data-cnh="1272" data-eur="161">
															<em>238,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','2','0','DGK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_2_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Mindful Stay - Basic Package.</strong>
															
														</div>
														<p class="roomBenefit">리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..</p>
														
														
														<div class="date">
															2024.04.22 - 2024.11.30
														</div>
														<span class="price" data-krw="243600" data-jpy="28000" data-usd="179" data-cnh="1302" data-eur="165">
															<em>243,600</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1980937','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','2','1','DGK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_2_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="257600" data-jpy="29600" data-usd="189" data-cnh="1377" data-eur="174">
															<em>257,600</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','2','2','DGK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_3" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE KING, POOLSIDE VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'DPK' ,'B01');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
										255,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=553705&sysCode=GJJ" alt="그랜드 조선 제주 디럭스 풀사이드뷰 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_3_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
															<em>255,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','3','0','DPK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_3_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Mindful Stay - Basic Package.</strong>
															
														</div>
														<p class="roomBenefit">리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..</p>
														
														
														<div class="date">
															2024.04.22 - 2024.11.30
														</div>
														<span class="price" data-krw="261000" data-jpy="30000" data-usd="192" data-cnh="1395" data-eur="177">
															<em>261,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1980937','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','3','1','DPK','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_3_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="276000" data-jpy="31700" data-usd="203" data-cnh="1475" data-eur="187">
															<em>276,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','3','2','DPK','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_4" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE TWIN,  POOLSIDE VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'DPT' ,'B01');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
										255,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=553727&sysCode=GJJ" alt="그랜드 조선 제주 디럭스 풀사이드뷰 트윈">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_4_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="255000" data-jpy="29300" data-usd="188" data-cnh="1363" data-eur="173">
															<em>255,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','4','0','DPT','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_4_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Mindful Stay - Basic Package.</strong>
															
														</div>
														<p class="roomBenefit">리사이클링 한정판 굿즈와 함께, 지속 가능한 가치 있는 쉼의 여정을 즐겨보세요..</p>
														
														
														<div class="date">
															2024.04.22 - 2024.11.30
														</div>
														<span class="price" data-krw="261000" data-jpy="30000" data-usd="192" data-cnh="1395" data-eur="177">
															<em>261,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1980937','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','4','1','DPT','41MINDRO','1980937');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','41MINDRO','1980937');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_4_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="276000" data-jpy="31700" data-usd="203" data-cnh="1475" data-eur="187">
															<em>276,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','4','2','DPT','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_5" data-roomlclas="A04" >
							<dl class="roomIntro">
								<dt class="roomName">
									HILL STUDIO SUITE SUPER KING, GARDEN VIEW
								</dt>
								<dd class="keyword"><span>HILL SUITE</span></dd>
								<dd class="roomBenefit">Garden View |  Size: 89㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'HSGK' ,'B09');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
										382,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=966505&sysCode=GJJ" alt="힐 스튜디오 스위트 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_5_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Hill Suite Room Only</strong>
															
														</div>
														<p class="roomBenefit">Hill Suite Room Only</p>
														
														
														<div class="date">
															2023.10.17 - 2024.12.31
														</div>
														<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
															<em>382,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1724391','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','5','0','HSGK','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_5_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">HILL SUITE BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박  + 조식 2인</p>
														
														
														<div class="date">
															2023.10.06 - 2024.12.31
														</div>
														<span class="price" data-krw="414000" data-jpy="47600" data-usd="305" data-cnh="2213" data-eur="281">
															<em>414,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1673541','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','5','1','HSGK','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_5_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ALMOST HEAVEN</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박 + 그랑제이 Access (조식 + 커피 &amp; 티 서비스 + 그랑 초이스)</p>
														
														
														<div class="date">
															2016.10.30 - 2024.08.31
														</div>
														<span class="price" data-krw="600000" data-jpy="69100" data-usd="442" data-cnh="3208" data-eur="407">
															<em>600,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('347825','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','5','2','HSGK','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSGK','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_6" data-roomlclas="A04" >
							<dl class="roomIntro">
								<dt class="roomName">
									HILL SUITE TWIN, GARDEN VIEW
								</dt>
								<dd class="keyword"><span>HILL SUITE</span></dd>
								<dd class="roomBenefit">Garden View |  Size: 89㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'HHGT' ,'B10');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
										382,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=966532&sysCode=GJJ" alt="힐 스위트">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_6_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Hill Suite Room Only</strong>
															
														</div>
														<p class="roomBenefit">Hill Suite Room Only</p>
														
														
														<div class="date">
															2023.10.17 - 2024.12.31
														</div>
														<span class="price" data-krw="382500" data-jpy="44000" data-usd="282" data-cnh="2045" data-eur="259">
															<em>382,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1724391','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','6','0','HHGT','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_6_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">HILL SUITE BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박  + 조식 2인</p>
														
														
														<div class="date">
															2023.10.06 - 2024.12.31
														</div>
														<span class="price" data-krw="414000" data-jpy="47600" data-usd="305" data-cnh="2213" data-eur="281">
															<em>414,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1673541','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','6','1','HHGT','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_6_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ALMOST HEAVEN</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박 + 그랑제이 Access (조식 + 커피 &amp; 티 서비스 + 그랑 초이스)</p>
														
														
														<div class="date">
															2016.10.30 - 2024.08.31
														</div>
														<span class="price" data-krw="600000" data-jpy="69100" data-usd="442" data-cnh="3208" data-eur="407">
															<em>600,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('347825','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','6','2','HHGT','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HHGT','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_7" data-roomlclas="A04" >
							<dl class="roomIntro">
								<dt class="roomName">
									HILL STUDIO SUITE TWIN, OCEAN VIEW
								</dt>
								<dd class="keyword"><span>HILL SUITE</span></dd>
								<dd class="roomBenefit">Ocean View |  Size: 89㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'HSOT' ,'B09');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="450500" data-jpy="51900" data-usd="332" data-cnh="2409" data-eur="305">
										450,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=897968&sysCode=GJJ" alt="힐 스튜디오 스위트 트윈">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_7_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Hill Suite Room Only</strong>
															
														</div>
														<p class="roomBenefit">Hill Suite Room Only</p>
														
														
														<div class="date">
															2023.10.17 - 2024.12.31
														</div>
														<span class="price" data-krw="450500" data-jpy="51900" data-usd="332" data-cnh="2409" data-eur="305">
															<em>450,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1724391','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','7','0','HSOT','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_7_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">HILL SUITE BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박  + 조식 2인</p>
														
														
														<div class="date">
															2023.10.06 - 2024.12.31
														</div>
														<span class="price" data-krw="487600" data-jpy="56100" data-usd="359" data-cnh="2607" data-eur="331">
															<em>487,600</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1673541','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','7','1','HSOT','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_7_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ALMOST HEAVEN</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박 + 그랑제이 Access (조식 + 커피 &amp; 티 서비스 + 그랑 초이스)</p>
														
														
														<div class="date">
															2016.10.30 - 2024.08.31
														</div>
														<span class="price" data-krw="680000" data-jpy="78300" data-usd="501" data-cnh="3636" data-eur="461">
															<em>680,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('347825','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','7','2','HSOT','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HSOT','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_8" data-roomlclas="A04" >
							<dl class="roomIntro">
								<dt class="roomName">
									PRESTIGE HILL SUITE, GARDEN VIEW
								</dt>
								<dd class="keyword"><span>HILL SUITE</span></dd>
								<dd class="roomBenefit">Garden View |  Size: 193.1㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'HPG' ,'B11');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="722500" data-jpy="83200" data-usd="532" data-cnh="3863" data-eur="490">
										722,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=966558&sysCode=GJJ" alt="프레스티지 힐 스위트 ">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_8_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Hill Suite Room Only</strong>
															
														</div>
														<p class="roomBenefit">Hill Suite Room Only</p>
														
														
														<div class="date">
															2023.10.17 - 2024.12.31
														</div>
														<span class="price" data-krw="722500" data-jpy="83200" data-usd="532" data-cnh="3863" data-eur="490">
															<em>722,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1724391','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','8','0','HPG','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_8_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">HILL SUITE BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박  + 조식 2인</p>
														
														
														<div class="date">
															2023.10.06 - 2024.12.31
														</div>
														<span class="price" data-krw="782000" data-jpy="90000" data-usd="576" data-cnh="4181" data-eur="530">
															<em>782,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1673541','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','8','1','HPG','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_8_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ALMOST HEAVEN</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박 + 그랑제이 Access (조식 + 커피 &amp; 티 서비스 + 그랑 초이스)</p>
														
														
														<div class="date">
															2016.10.30 - 2024.08.31
														</div>
														<span class="price" data-krw="1000000" data-jpy="115200" data-usd="737" data-cnh="5347" data-eur="678">
															<em>1,000,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('347825','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','8','2','HPG','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPG','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_9" data-roomlclas="A04" >
							<dl class="roomIntro">
								<dt class="roomName">
									PRESTIGE HILL SUITE, OCEAN VIEW
								</dt>
								<dd class="keyword"><span>HILL SUITE</span></dd>
								<dd class="roomBenefit">Ocean View |  Size: 193.1㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'HPO' ,'B11');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="807500" data-jpy="93000" data-usd="595" data-cnh="4318" data-eur="548">
										807,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=553935&sysCode=GJJ" alt="프레스티지 힐 스위트 ">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_9_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">Hill Suite Room Only</strong>
															
														</div>
														<p class="roomBenefit">Hill Suite Room Only</p>
														
														
														<div class="date">
															2023.10.17 - 2024.12.31
														</div>
														<span class="price" data-krw="807500" data-jpy="93000" data-usd="595" data-cnh="4318" data-eur="548">
															<em>807,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1724391','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','9','0','HPO','31HBFR1N','1724391');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31HBFR1N','1724391');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_9_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">HILL SUITE BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박  + 조식 2인</p>
														
														
														<div class="date">
															2023.10.06 - 2024.12.31
														</div>
														<span class="price" data-krw="874000" data-jpy="100600" data-usd="644" data-cnh="4673" data-eur="593">
															<em>874,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('1673541','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','9','1','HPO','31HBFR1NB','1673541');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31HBFR1NB','1673541');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_9_2">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ALMOST HEAVEN</strong>
															
														</div>
														<p class="roomBenefit">힐 스위트 1박 + 그랑제이 Access (조식 + 커피 &amp; 티 서비스 + 그랑 초이스)</p>
														
														
														<div class="date">
															2016.10.30 - 2024.08.31
														</div>
														<span class="price" data-krw="1100000" data-jpy="126700" data-usd="811" data-cnh="5882" data-eur="746">
															<em>1,100,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('347825','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','9','2','HPO','31PKGHN','347825');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('HPO','31PKGHN','347825');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_10" data-roomlclas="A02" >
							<dl class="roomIntro">
								<dt class="roomName">
									ROYAL SUITE
								</dt>
								<dd class="keyword"><span>SUITE</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 202㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'RS' ,'B07');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="1275000" data-jpy="146800" data-usd="940" data-cnh="6818" data-eur="865">
										1,275,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=897861&sysCode=GJJ" alt="그랜드 조선 제주 로얄 스위트">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_10_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="1275000" data-jpy="146800" data-usd="940" data-cnh="6818" data-eur="865">
															<em>1,275,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','10','0','RS','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('RS','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_10_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="1380000" data-jpy="158900" data-usd="1017" data-cnh="7379" data-eur="936">
															<em>1,380,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','10','1','RS','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('RS','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_11" data-roomlclas="A02" >
							<dl class="roomIntro">
								<dt class="roomName">
									THE SUITE
								</dt>
								<dd class="keyword"><span>SUITE</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 267.5㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('GJJ', 'PS' ,'B08');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="1487500" data-jpy="171300" data-usd="1096" data-cnh="7954" data-eur="1009">
										1,487,500<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="/util/file/download.do?fileSn=1173141&sysCode=GJJ" alt="그랜드 조선 제주 The Suite 더 스위트">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							<!-- //roomIntro -->
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<div class="roomDetailTit">
											<h4 class="titDep3">OFFERS</h4>
											<p class="roomDetail-reference"><span class="badge-info reward">리워드 혜택</span>표시는 회원전용 상품입니다.</p>
										</div>
										<ul class="optionList type02">
											
												<li id="room_11_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="1487500" data-jpy="171300" data-usd="1096" data-cnh="7954" data-eur="1009">
															<em>1,487,500</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','11','0','PS','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('PS','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>
											
												<li id="room_11_1">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">BED &amp; BREAKFAST</strong>
															
														</div>
														<p class="roomBenefit">본관 1박 + 조식 2인</p>
														
														
														<div class="date">
															2020.12.01 - 2024.12.31
														</div>
														<span class="price" data-krw="1610000" data-jpy="185400" data-usd="1187" data-cnh="8609" data-eur="1093">
															<em>1,610,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('371799','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','11','1','PS','31BFRB1N','371799');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('PS','31BFRB1N','371799');"><span>예약하기</span></a>
															
														
													
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
				</ul>
				<!-- //roomList -->
			</div>					
		</div>
	
		<!-- //inner -->
		<!-- comparison : 비교함 -->
		<div class="comparison" style="">
			<div class="btnArea">
				<button type="button" class="btnComp"></button> <!-- 열렸을 때 on 클래스 추가 -->
			</div>
			<div class="compCont">
				<div class="compInner">
					<ul class="compList">
						<li data-index="0">
							<div class="compWrap noCont">
								<p class="txt">비교할 상품을 추가하실 수 있습니다.</p>
								<span class="thum"></span>
							</div>
						</li>
						<li data-index="1">
							<div class="compWrap noCont">
								<p class="txt">비교할 상품을 추가하실 수 있습니다.</p>
								<span class="thum"></span>
							</div>
						</li>
						<li data-index="2">
							<div class="compWrap noCont">
								<p class="txt">비교할 상품을 추가하실 수 있습니다.</p>
								<span class="thum"></span>
							</div>
						</li>
					</ul>
					<div class="btnWrap">
						<button type="button" class="btnSC btnM active" onclick="alert('비교할 상품을 2개 이상 담아주세요.'); return false;">비교하기</button>
						<p class="txtGuide">최대 3개 비교 가능</p>
					</div>
				</div>
			</div>
		</div>
		<!-- //comparison : 비교함 -->
		<!-- 컨텐츠 E -->
	</div>
	<!-- 비교하기 Layer -->
	<div id="layerPop1" class="layerPop">
		<div class="layerCont">
			<div class="compLayer">
				<h2 class="compTit">패키지 비교하기</h2>
				<ul class="compList02"></ul>
			</div>
			<button type="button" class="btnClose" onclick="commonJs.popClose(jQuery('#layerPop1'));">닫기</button>
		</div>
	</div>
	<!-- //비교하기 Layer -->
	<div id="layerPop2" class="layerPop">
		<div class="layerCont" style="top: 50%; left: 50%; margin-top: -395px; margin-left: -540px;">
			<div class="detailCont">
			</div>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop2'));">
				닫기
			</button>
		</div>
	</div>
	<!-- //패키지 혜택 상세보기 레이어 -->
	<div id="layerPop3" class="layerPop"></div>
	
	<!-- 회원특가상품 Layer -->
	<div id="layerPop4" class="layerPop">
		<div class="layerCont specialPrice">
			<h2 class="compTit" id="roomTitleArea">Deluxe Double City</h2>

	        <p class="desc">
                본 상품은 회원 할인이 적용 되는 상품으로 회원으로 예약 시 
				<br>
				<b id="bnefArea"></b>
                을 받으실 수 있습니다.
			</p>
            <p class="txt">로그인 후 진행하시겠습니까?</p>

	        <div class="btnArea">
	            <a href="#none" class="btnSC btnM" id="nMbrResvBtn">비회원 예약</a>
	            <a href="#none" class="btnSC btnM active" id="mbrResvBtn">로그인</a>
	        </div>
	        <div class="btmGuide">
	            <p>
	            	아직 클럽조선 리워드 회원이 아니신가요?
	            	<a href="https://josunhotel.com/identify/identifyIntro.do" class="btnS icoArr">
	            		회원가입
	            	</a>
	            </p>
	        </div>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop4'))">닫기</button>
		</div>
	</div>
	<!-- //회원특가상품 Layer -->
</form>
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

