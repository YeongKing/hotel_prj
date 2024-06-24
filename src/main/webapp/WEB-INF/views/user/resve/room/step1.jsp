<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>객실 예약 - 객실, 요금 선택 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>

<body>

	<div class="skip"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">


 
 
 <!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
 <!--E header  -->
        <!--(페이지 URL)-->




<script type="text/javascript">
	
jQuery(function(){
    jQuery(document).ready(function(){
        jQuery("button").attr("type", "button");

        var selectCont = jQuery(".roomList li div.toggleCont:visible").closest("li");

        jQuery("#dateText").html(
            jQuery("#ckinDate").val() + "&nbsp;" + 
            dUtils.getDateToDay(jQuery("#ckinDate").val()) + "&nbsp;-&nbsp;" + 
            jQuery("#ckoutDate").val() + "&nbsp;" + 
            dUtils.getDateToDay(jQuery("#ckoutDate").val()) + 
            "<span>" + jQuery("#night").val() + "&nbsp;박</span>"
        );
    });
});



	/**
		객실 다시 검색 버튼 				
	*/
	function fncResvReset(){
		if(confirm("다시 검색하시겠습니까?")){ 
			location.href = "http://localhost/hotel_prj/user/room0.do";
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
	function fncGoStep2(roomRankCode,roomRankName,bedCode,bedName,viewCode,viewName,payPrice){
		jQuery("#roomRankCode").val(roomRankCode);
		jQuery("#roomRankName").val(roomRankName);
		jQuery("#bedCode").val(bedCode);
		jQuery("#bedName").val(bedName);
		jQuery("#viewCode").val(viewCode);
		jQuery("#viewName").val(viewName);
		
		jQuery("#payPrice").val(payPrice);
		
		jQuery("#step1Form").attr("action", "http://localhost/hotel_prj/user/room2.do");
		jQuery("#step1Form").submit();
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
 	function fncOpenRoomInfo(roomCode){
		
 	// roomCode 변수의 값을 설정 (예시: "STK", "STT","DSK", "DST", "SWK", "SWT")
 		//var roomCode = "STT"; // 이 값을 실제 데이터에 따라 변경

 		// roomCode에 따라 roomType을 설정
 		var roomType = "";
 		if (roomCode === "STK" || roomCode === "STT") {
 			roomType = "STANDARD";
 			roomSize = "25"
 			bedOption = "킹 1 또는 더블 2"
 	 	 	img2 = "http://localhost/hotel_prj/util/file/STANDARD_2.jpg"
 			if (roomCode==="STK"){
 				alt = "스탠다드 킹"
 	 	 		img1 = "http://localhost/hotel_prj/util/file/STANDARD_KING_2.jpg"
 			}else if (roomCode ==="STT"){
 				alt = "스탠다드 트윈"
 	 	 		img1 = "http://localhost/hotel_prj/util/file/STANDARD_TWIN_2.jpg"
 			}
 			
 		} else if (roomCode === "DSK" || roomCode === "DST") {
 		    roomType = "DELUXE";
 			roomSize = "35"
 	 		bedOption = "킹 1 또는 더블 2"
 	 		img2 = "http://localhost/hotel_prj/util/file/DELUXE_2.jpg"
 	 		if (roomCode==="DSK"){
 	 			alt = "디럭스 킹"	
 	 			img1 = "http://localhost/hotel_prj/util/file/DELUXE_KING_2.jpg"
 	 		}else if (roomCode ==="DST"){
 	 			alt = "디럭스 트윈"			
 	 			img1 = "http://localhost/hotel_prj/util/file/DELUXE_TWIN_2.jpg"
 	 				
 	 		}
 	 		
 		} else if (roomCode === "SWK" || roomCode === "SWT") {
 		    roomType = "SUITE";
 			roomSize = "55"
 	 		bedOption = "킹 2 또는 더블 4"
 	 	 	img2 = "http://localhost/hotel_prj/util/file/SUITE_2.jpg"
 	 		if (roomCode==="SWK"){
 	 			alt = "스위트 킹"	
 	 	 		img1 = "http://localhost/hotel_prj/util/file/SUITE_KING_2.jpg"
 	 		}else if (roomCode ==="SWT"){
 	 			alt = "스위트 트윈"	
 	 	 		img1 = "http://localhost/hotel_prj/util/file/SUITE_TWIN_2.jpg"
 	 				
 	 		}
 		}

		
		
		
		
		
		


					var html = "        <div class=\"layerCont\" style=\"top: 50%; left: 50%; margin-top: -375.438px; margin-left: -540px; user-select: auto !important;\" tabindex=\"0\" data-gtm-vis-recent-on-screen36519946_61=\"2378\" data-gtm-vis-first-on-screen36519946_61=\"2378\" data-gtm-vis-total-visible-time36519946_61=\"100\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "            <div class=\"detailCont\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                <h2 class=\"compTit\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">" + roomType + "</h2>";
					html += "                <div class=\"scrollArea\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                    <div class=\"designScroll\" style=\"height: 500px; width: 100%; overflow: hidden; user-select: auto !important;\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                        <div class=\"scrollWrap\" style=\"margin-right: -25px; overflow-y: scroll; padding-right: 40px; box-sizing: border-box; user-select: auto !important;\" tabindex=\"0\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                            <div class=\"customScrollBox\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                <div class=\"txtCont\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <p data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">전망에 따라 완벽한 엘리시안의 비경을 감상하실 수 있습니다.</p>";
					html += "                                </div>";
					html += "                                <div class=\"swipeWrap gallery ppGallery\" style=\"width: 940px; height: 561px; margin-top: 50px; user-select: auto !important;\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                    <button type=\"button\" class=\"btnSwipe btnPrev\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <span class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">이전</span>";
					html += "                                    </button>";
					html += "                                    <ul class=\"swipeCont\" style=\"position: absolute; width: 940px; overflow: visible; user-select: auto !important;\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                        <li class=\"swipeSlide\" style=\"width: 940px; float: none; position: absolute; top: 0px; left: 0px; opacity: 1; transition: none 0s ease 0s; transform: translate3d(0px, 0px, 0px); user-select: auto !important;\" aria-hidden=\"false\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                            <img src=\""+img1+"\" alt=\""+alt+"\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        </li>";
					html += "                                        <li class=\"swipeSlide\" style=\"width: 940px; float: none; position: absolute; top: 0px; left: 0px; opacity: 1; transition: none 0s ease 0s; transform: translate3d(940px, 0px, 0px); user-select: auto !important;\" aria-hidden=\"true\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                            <img src=\""+img2+"\" alt=\""+alt+"\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        </li>";
					html += "                                    </ul>";
					html += "                                    <button type=\"button\" class=\"btnSwipe btnNext\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <span class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">다음</span>";
					html += "                                    </button>";
					html += "                                </div>";
					html += "                                <p class=\"txtGuide\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">상기 이미지는 이해를 돕기 위한 이미지 컷으로 실제와 다를 수 있습니다.</p>";
					html += "                                <div class=\"propertyInfo\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <h2 class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">객실개요</h2>";
					html += "                                    <ul data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">LOCATION</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">32층 - 34층</dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">BEDS</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">"+ bedOption +"</dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">SIZE</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">"+ roomSize+"m<sup data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">2</sup></dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">ROOM FEATURES</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">침실 1, 화장실 1, 발코니 1</dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">VIEW</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">스탠다드, 가든뷰, 풀사이드뷰</dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                            <dl data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                                <dt data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">CHECK-IN/CHECK-OUT</dt>";
					html += "                                                <dd data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">15:00 / 10:00</dd>";
					html += "                                            </dl>";
					html += "                                        </li>";
					html += "                                    </ul>";
					html += "                                </div>";
					html += "                                <h2 class=\"titDep2\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">객실 어메니티</h2>";
					html += "                                <ul class=\"tabType01 tabType02 tabToggle\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <li class=\"on\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <a href=\"#tab01\" role=\"button\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Bath Room</a>";
					html += "                                    </li>";
					html += "                                    <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <a href=\"#tab02\" role=\"button\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Bed Room</a>";
					html += "                                    </li>";
					html += "                                    <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <a href=\"#tab03\" role=\"button\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Mini Bar</a>";
					html += "                                    </li>";
					html += "                                    <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <a href=\"#tab04\" role=\"button\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Closet</a>";
					html += "                                    </li>";
					html += "                                </ul>";
					html += "                                <div id=\"tab01\" class=\"tabCont\" style=\"display: block; user-select: auto !important;\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                    <h4 class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Bath Room</h4>";
					html += "                                    <ul class=\"tabRoomInfo\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">목욕가운</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">바스타월</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">페이스 타월</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">핸드 타월</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">샴푸</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">컨디셔너</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">바디로션</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">바디워시</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">샤워캡</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">헤어 드라이어</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">핸드워시</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">머리빗</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">헤어밴드</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">코튼 퍼프</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">면봉</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">비데</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">샤워부스&amp;욕조</li>";
					html += "                                    </ul>";
					html += "                                </div>";
					html += "                                <div id=\"tab02\" class=\"tabCont\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <h4 class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Bed Room</h4>";
					html += "                                    <ul class=\"tabRoomInfo\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">TV</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">침대</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">거위털 이불</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">거위털&amp;솜 베개</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">알람시계</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">에어컨</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">220V</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">음성 사서함</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">러기지랙</li>";
					html += "                                    </ul>";
					html += "                                </div>";
					html += "                                <div id=\"tab03\" class=\"tabCont\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <h4 class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Mini Bar</h4>";
					html += "                                    <ul class=\"tabRoomInfo\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">냉장고</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">전기 포트</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">물컵</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">커피메이커</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">커피 캡슐</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">무료 티</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">무료 생수</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">웰컴쿠키</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">커피 머그</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">와인잔</li>";
					html += "                                    </ul>";
					html += "                                </div>";
					html += "                                <div id=\"tab04\" class=\"tabCont\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                    <h4 class=\"hidden\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">Closet</h4>";
					html += "                                    <ul class=\"tabRoomInfo\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">안전금고</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">구둣주걱</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">슬리퍼</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">옷걸이</li>";
					html += "                                        <li data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">소방 비상용품</li>";
					html += "                                    </ul>";
					html += "                                </div>";
					html += "                            </div>";
					html += "                            <div class=\"scrollbar-wrap\" style=\"height: 561px; user-select: auto !important;\" data-gtm-vis-has-fired36519946_61=\"1\">";
					html += "                                <div class=\"scrollbar\" style=\"height: 180.333px; user-select: auto !important; top: 0px;\" data-gtm-vis-has-fired36519946_61=\"1\"></div>";
					html += "                            </div>";
					html += "                        </div>";
					html += "                    </div>";
					html += "                </div>";
					html += "                <button type=\"button\" class=\"btnClose\" onclick=\"commonJs.popClose($('#layerPop2'));\" data-gtm-vis-has-fired36519946_61=\"1\" style=\"user-select: auto !important;\">";
					html += "                    닫기";
					html += "                </button>";
					html += "            </div>";
					html += "        </div>";

					jQuery("#layerPop2").html(html);
					commonJs.popShow(jQuery('#layerPop2'));
					commonJs.initDesignScroll($('.scrollWrap'));
					commonJs.initTab($('.tabToggle'));


			

				commonJs.initSwipe(jQuery(".swipeWrap"));
				jQuery(".swipeWrap").css("height", "561px");
				jQuery(".swipeWrap").css("margin-top", "50px");


		  
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
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS" /> 		
	<input type="hidden" name="ckinDate" id="ckinDate" value="${rrVO.ckinDate}" />	 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="${rrVO.ckoutDate}"/> 			
	<input type="hidden" name="night" id="night" value="${rrVO.night}" />	 						
	<input type="hidden" name="adltCntArr" id="adltCntArr0" value="${rrVO.adultsNum}" />				
	<input type="hidden" name="chldCntArr" id="chldCntArr0" value="${rrVO.kidsNum}" />				
	<input type="hidden" name="adultsNum" id="adultsNum" value="${rrVO.adultsNum}" />						
	<input type="hidden" name="kidsNum" id="kidsNum" value="${rrVO.kidsNum}" />						
	
	
	
	
	<input type="hidden" name="roomRankCode" id="roomRankCode" value="" />
	<input type="hidden" name="roomRankName" id="roomRankName" value="" />
	<input type="hidden" name="bedCode" id="bedCode" value="" />
	<input type="hidden" name="bedName" id="bedName" value="" />
	<input type="hidden" name="viewCode" id="viewCode" value="" />
	<input type="hidden" name="viewName" id="viewName" value="" />
	<input type="hidden" name="payPrice" id="payPrice" value="" />
														
	
<!-- 	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />	 -->					
<!-- 	<input type="hidden" name="adltCntArr" id="adltCntArr1" value="0" />				
		<input type="hidden" name="adltCntArr" id="adltCntArr2" value="0" />			
		<input type="hidden" name="chldCntArr" id="chldCntArr1" value="0" />					
		<input type="hidden" name="chldCntArr" id="chldCntArr2" value="0" />				
	 	<input type="hidden" name="sortCd" id="sortCd" value="" />						
		<input type="hidden" name="curruncyCd" id="curruncyCd" value="" />			
 		<input type="hidden" name="rateCode" id="rateCode" value="" />													
 		<input type="hidden" name="packageSn" id="packageSn" value="" />
		<input type="hidden" name="companyCode" id="companyCode" value="" />
		<input type="hidden" name="promotionCode" id="promotionCode" value="" /> -->
	
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
						<dd>${rrVO.adultsNum}</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>${rrVO.kidsNum}</dd>
					</dl>
				</div>
				<a href="#none" class="btnSC btnM icoArr" onclick="fncResvReset();">객실 다시 검색</a>
			</div>
		</div>
		<!-- //selResult -->
		<div class="inner">
			<div class="titArea">
				<ul class="tabType01">
					
					

					<li id="tab2" class="on"><a href="#none" onclick="fncViewTab(2);">객실</a></li>

				</ul>
				<div class="side">

					<div class="selectWrap" style="width:150px;display:none;" id="roomSort">
						
							
								
							
							
						
						<select name="roomSort" id="roomSort"  onchange="fncRoomSort(this);"   > 
<option value="">전체</option> 
<option value="A01" >ROOM</option> 
<option value="A02" >SUITE</option> 
<option value="A03" >KIDS</option> 
<option value="A04" >HILL SUITE</option> 
</select> 
	
					</div>
					

				</div>
			</div>
			
			
			

			
			
			
			<!-- //roomContainer -->
			
			
			
			<div class="roomContainer" id="roomContainer2" style="">
				<h3 class="hidden">객실로 보기</h3>
				
				<div class="joinBanner">
					<div>
						<span class="bannerTit">엘리시안 리워드 헤택<!-- 클럽조선 리워드 헤택 --></span>멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다.<!-- 멤버십 가입을 하시면 투숙 시, 할인 바우처를 발급해드립니다. -->
						<!-- <a href="" class="btnLine" target="_blank">멤버십 가입하기</a> -->
					</div>
				</div>
				<!-- roomList S  -->
				
				
				<ul class="toggleList roomList" id="roomList">
					<li class="noData" style="display:none;">
						<p class="txt">예약 가능한 객실이 없습니다.<br>다시 검색해주세요.</p> <!-- 객실 내 상품이 없을 경우 -->
						
					</li>
					
				    	<c:forEach var="room" items="${roomList}" varStatus="i">
				        <c:set var="totalPeople" value="${rrVO.adultsNum + rrVO.kidsNum}" />
				        <c:set var="extraPeople" value="${totalPeople - 2}" />
				        <c:set var="extraCharge" value="${extraPeople > 0 ? extraPeople * room.roomAddPrice : 0}" />
				        <c:set var="totalPrice" value="${room.roomBasicPrice + extraCharge}" />
				        
				        <c:choose>
				            <c:when test="${room.roomRankCode == '30_001' && room.bedCode == '50_003'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/DELUXE_KING_2.jpg" />
				                <c:set var="roomCode" value="DSK" />
				            </c:when>
				            <c:when test="${room.roomRankCode == '30_001' && room.bedCode == '50_002'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/DELUXE_TWIN_2.jpg" />
				                <c:set var="roomCode" value="DST" />
				            </c:when>
				            <c:when test="${room.roomRankCode == '30_002' && room.bedCode == '50_003'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/STANDARD_KING_2.jpg" />
				                <c:set var="roomCode" value="STK" />
				            </c:when>
				            <c:when test="${room.roomRankCode == '30_002' && room.bedCode == '50_002'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/STANDARD_TWIN_2.jpg" />
				                <c:set var="roomCode" value="STT" />
				            </c:when>
				            <c:when test="${room.roomRankCode == '30_003' && room.bedCode == '50_003'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/SUITE_KING_2.jpg" />
				                <c:set var="roomCode" value="SWK" />
				            </c:when>
				            <c:when test="${room.roomRankCode == '30_003' && room.bedCode == '50_002'}">
				                <c:set var="img" value="http://localhost/hotel_prj/util/file/SUITE_TWIN_2.jpg" />
				                <c:set var="roomCode" value="SWT" />
				            </c:when>
				        </c:choose>

					
						<li id="room_${status.index}" data-roomlclas="A01" >
								<dl class="roomIntro">
									<dt class="roomName">
										${room.roomRankName } ${room.bedName}, ${room.viewName} 
									</dt>
									<dd class="keyword"><span>ROOM</span></dd>
									<dd class="roomBenefit">${room.viewName} |  ${room.roomSize}㎡</dd>
									<dd class="btnView">
										<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('${roomCode}');">
											객실 상세보기
										</a>
									</dd>
									<dd class="priceWrap">
										<span class="price" data-krw="${totalPrice}">
											${totalPrice}<em>KRW</em>
										</span>
										
											
												<span class="day">1박</span>
											
											
										
									</dd>
									<dd class="thum">
										
											
											
												<img src="${img}" alt="mainImg">										
											
										
									</dd>
									<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
								</dl>
							
								<div class="toggleCont"  >
									<div class="toggleInner">
										<div class="roomDetail">
											<ul class="optionList type02">
												
													<li id="room_0_0">
														<div class="roomInfor">
															<div class="titArea">
																<strong class="tit">ROOM ONLY</strong>
																
															</div>
															<p class="roomBenefit">본관 1박</p>
															
															<div class="date">
																${rrVO.ckinDate} - ${rrVO.ckoutDate} 
															</div>
															<span class="price" data-krw="${totalPrice}">
																<em>${totalPrice}</em>KRW
															</span>
														</div>
														
																
																	<a href="#none" class="btnBook" onclick="fncGoStep2('${room.roomRankCode}','${room.roomRankName}','${room.bedCode}','${room.bedName}','${room.viewCode}','${room.viewName}','${totalPrice}');"><span>예약하기</span></a>
															
													</li>
											</ul>
										</div>
									</div>
								</div>
							</li>
					
					
					
					
					
					
					</c:forEach>
					
					
					
					
					
					
					
					
					
					
					
					
					
<!-- 						<li id="room_0" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE TWIN, CITY VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">City View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DST');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="250000" data-jpy="28500" data-usd="181" data-cnh="1315" data-eur="169">
										250,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_TWIN.jpg" alt="디럭스 트윈">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
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
														<span class="price" data-krw="250000" data-jpy="28500" data-usd="181" data-cnh="1315" data-eur="169">
															<em>250,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','0','0','DST','31BFR1N','531357');">비교함 담기</button>
													</div>
													
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DST','31BFR1N','531357');"><span>예약하기</span></a>
														
												</li>
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_1" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE KING, CITY VIEW
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">City View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DSK');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="250000" data-jpy="28500" data-usd="181" data-cnh="1315" data-eur="169">
										250,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_KING.jpg" alt="디럭스 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
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
														<span class="price" data-krw="250000" data-jpy="28500" data-usd="181" data-cnh="1315" data-eur="169">
															<em>250,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','1','0','DSK','31BFR1N','531357');">비교함 담기</button>
													</div>				
																<a href="#none" class="btnBook" onclick="fncGoStep2('DSK','31BFR1N','531357');"><span>예약하기</span></a>

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
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DGK');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="280000" data-jpy="31900" data-usd="203" data-cnh="1473" data-eur="189">
										280,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_KING.jpg" alt="디럭스 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
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
														<span class="price" data-krw="280000" data-jpy="31900" data-usd="203" data-cnh="1473" data-eur="189">
															<em>280,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','2','0','DGK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGK','31BFR1N','531357');"><span>예약하기</span></a>
															
														
												</li>

											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_3" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE TWIN, GARDEN VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Garden View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DGT');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="280000" data-jpy="31900" data-usd="203" data-cnh="1473" data-eur="189">
										280,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_TWIN.jpg" alt="디럭스 트윈 ">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
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
														<span class="price" data-krw="280000" data-jpy="31900" data-usd="203" data-cnh="1473" data-eur="189">
															<em>280,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','3','0','DGT','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DGT','31BFR1N','531357');"><span>예약하기</span></a>
															
														
													
												</li>

										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_4" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE KING, POOLSIDE VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DPK');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="300000" data-jpy="34200" data-usd="217" data-cnh="1578" data-eur="202">
										300,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_KING.jpg" alt="디럭스 킹">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
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
														<span class="price" data-krw="300000" data-jpy="34200" data-usd="217" data-cnh="1578" data-eur="202">
															<em>300,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','4','0','DPK','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPK','31BFR1N','531357');"><span>예약하기</span></a>
												</li>
											
										</ul>
									</div>
								</div>
							</div>
						</li>
					
						<li id="room_5" data-roomlclas="A01" >
							<dl class="roomIntro">
								<dt class="roomName">
									DELUXE TWIN,  POOLSIDE VIEW 
								</dt>
								<dd class="keyword"><span>ROOM</span></dd>
								<dd class="roomBenefit">Poolside View |  Size: 46.7㎡</dd>
								<dd class="btnView">
									<a href="#none" class="btnS icoArr" onclick="fncOpenRoomInfo('DPT');">
										객실 상세보기
									</a>
								</dd>
								<dd class="priceWrap">
									<span class="price" data-krw="300000" data-jpy="34200" data-usd="217" data-cnh="1578" data-eur="202">
										300,000<em>KRW ~</em>
									</span>
									
										
											<span class="day">1박 / 세금 별도</span>
										
										
									
								</dd>
								<dd class="thum">
									
										
										
											<img src="http://localhost/hotel_prj/util/file/DELUXE_TWIN.jpg" alt="디럭스 트윈">										
										
									
								</dd>
								<button type="button" class="btnToggle btnSC btnRsv">RESERVE<span class="hidden">상세내용 보기</span></button>
							</dl>
							//roomIntro
							<div class="toggleCont"  >
								<div class="toggleInner">
									<div class="roomDetail">
										<ul class="optionList type02">
											
												<li id="room_5_0">
													<div class="roomInfor">
														<div class="titArea">
															<strong class="tit">ROOM ONLY</strong>
															
														</div>
														<p class="roomBenefit">본관 1박</p>
														
														
														<div class="date">
															2024.01.01 - 2024.11.30
														</div>
														<span class="price" data-krw="300000" data-jpy="34200" data-usd="217" data-cnh="1578" data-eur="202">
															<em>300,000</em>KRW ~
														</span>
														
															<button type="button" class="btnLine" onclick="fncOpenPackBenefit('531357','GJJ');">
																상품 상세보기
															</button>
														
														<button type="button" class="btnComparison btnLine" onclick="fncAddCompareProduct('room','5','0','DPT','31BFR1N','531357');">비교함 담기</button>
													</div>
													
													
													
														
															
															
															
																<a href="#none" class="btnBook" onclick="fncGoStep2('DPT','31BFR1N','531357');"><span>예약하기</span></a>
												</li>
										</ul>
									</div>
								</div>
							</div>
						</li> -->

				</ul>
				<!-- roomList E-->
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
<div id="layerPop2" class="layerPop" style="display: block; user-select: auto !important;">
   
</div>
	<!-- //패키지 혜택 상세보기 레이어 -->
	<div id="layerPop3" class="layerPop">
	아아
	</div>
	
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
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
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

