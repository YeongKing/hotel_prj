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

<title>엘리시안호텔 공식 사이트 | ELYSIAN HOTEL Official Website</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
<link href="/hotel_prj/static/home/css/ko/pc/main_josunhotel.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>
 
<body>
<div class="skip"><a href="#container">본문 바로가기</a></div>
<div class="wrapper mainWrapper topBanner">
<!-- mass promotion 메뉴 동적 노출 -->





 <!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
 <!--E header  -->

<!--(페이지 URL)-->
<script type="text/javascript">

jQuery(function(){

	//handleActiveAnchor(".js-active", "메리어트 사이트로 이동"); //메리어트 사이트로 이동

	var defaultHotelCode = "ELS";

    //조선 라운지 섹션별도 스와이프
    var swipeLounge = new Swiper('.swiper-lounge', {
        slidesPerView: 3,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        grabCursor: true,
        loop: true,
        loopFillGroupWithBlank: true,
    });

	jQuery(document).ready(function(){



		jQuery("[name='selectVal']").prop('selectedIndex', 0).seletMenuUpdate(); // 페이지 로딩시 예약바 room 선택되도록
		//getCookie('JOSUNHOTEL_banner'); //오늘 하루 열지않기 여부 확인

		var initToday = new Date();

		fncSetCalendarDate(initToday);

		/**
			객실 호텔 선택 영역 Click Event
		**/
		jQuery(".hotelSelect li").on("click", function(){
			var target = jQuery(this);
			var hotlSysCode = target.data("code");
			var hotelNm = target.data("nm");

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

			jQuery("#roomCntText").text("1");
			jQuery("#adultCntText").text("2");
			jQuery("#childCntText").text("0");

			//css 적용
			jQuery(".btnUp").removeClass("blank");
			jQuery(".btnDown").addClass("blank");
			jQuery(".btnDown").first().removeClass("blank");

			jQuery(".roomSel").removeClass("on");
			jQuery(".roomSel").first().addClass("on");

			// ============== 객실 및 인원 선택 초기화 start ==================

			if(hotlSysCode == "ELS"){
				jQuery(".hotelSelect li").removeClass("on");
				jQuery(this).addClass("on");
				jQuery("#hotlSysCode").val(hotlSysCode);
				jQuery("#hotelName").text(hotelNm);

				/* 그랜드 조선 제주 티져 오픈 날짜 대응 */
				var today = new Date(); //오늘 날짜


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


			//인원 추가
			if(appendYn){

					if(target == "child" && parseInt(peopleCnt)< maxChld ){
						peopleCnt = parseInt(peopleCnt) + 1;
					}else if(target == "adult" && parseInt(peopleCnt)< maxAdlt){
						peopleCnt = parseInt(peopleCnt) + 1;
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
			jQuery("#roomCntText").text(roomCnt);
			jQuery("#adultCntText").text(totalAdultCnt);
			jQuery("#childCntText").text(totalChildCnt);
		});

		//2021-02-01 추가
		//다이닝 소개문구에 가격/시간 정보 있을 시 hidden처리
		jQuery(".mainDiningHidden").addClass("hidden");

		//객실 및 인원수 확인 버튼 클릭시 닫기
		jQuery(".roomContainer .btnSC.btnL").click(function(){
		    jQuery(".btnClose").click();
		});
	});
});

//check in, check out 날짜 , 달력 세팅을 위한 fnc
function fncSetCalendarDate(startDate){

	//달력 라이브러리 예약 가능 날짜 수정
	var setCalendarEndDate = new Date(startDate);
	setCalendarEndDate.setDate(365);
	//commonJs.setCalendarChkInOutDate($( ".calContainer" ), startDate, setCalendarEndDate);
	commonJs.calendarMgr._resetDate($( ".calContainer" ), startDate, setCalendarEndDate);

	var setCalendarStartDate = new Date(startDate);
	var setCkinDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckinDate").val(setCkinDate);

	setCalendarStartDate.setDate(setCalendarStartDate.getDate() + 1);
	var setCkoutDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckoutDate").val(setCkoutDate);
	jQuery("#dateTextHub").html(setCkinDate + "&nbsp;<em>" + dUtils.getDateToDay(setCkinDate) + "</em>&nbsp;<span>-</span>&nbsp;" + setCkoutDate + "&nbsp;" +"<em>"+ dUtils.getDateToDay(setCkoutDate) +"</em>");
	jQuery("#night").val(dUtils.dateDiff(setCkinDate, setCkoutDate));
}


//다이닝 선택

function fncSearchList(resveType){
	//validation check
	if(resveType == "R"){
		
		$('#adultsNum').val($("#adultCntText").text());
		$('#kidsNum').val($("#childCntText").text());
		

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

		jQuery("#mainResveForm").attr("action", "http://localhost/hotel_prj/user/room1.do");
		jQuery("#mainResveForm").submit();
	}else if(resveType == "D"){
		jQuery("#mainDiningForm").attr("action", "/hotel_prj/user/resve/dining/step0.jsp");
		jQuery("#mainDiningForm").submit();
	}
}

function closeHubPopup(){
    // 메인 팝업 닫기 버튼 이벤트
    var isTodayClose = jQuery("#mainPopupTodayCloseBtn").is(":checked");;
    var sysCode = jQuery("#sysCode").val();
    if(isTodayClose){
        setCookie(sysCode+"_popUp","done", 1);
    }
    jQuery("#mainPopLayer").next().hide();
    jQuery("#mainPopLayer").remove();
}
</script>
 
<input type="hidden" name="sysCode" id="sysCode" value="JOSUNHOTEL"/>
<div id="container" class="container">
<!-- 컨텐츠 S -->
<script>
	$(function(){
		//window.onload = function(){
			jQuery(".wrapper").removeClass("topBanner");
		//};
	});
</script>

<div class="hubMain">
	<h1 class="hidden">신세계 조선 호텔</h1>
	<!--  mainArea01  -->
	<div class="mainArea01">
		<h2 class="hidden">HOME</h2>
		<div class="contents01">
			<div class="mainBg"><img src="/hotel_prj/static/home/images/ko/pc/HUMA/bg_main01.jpg" alt="Rest in utopia"></div>
			<div class="mainTxt"><strong>Rest in utopia</strong></div>
			<!-- scroll icon -->
			<div class="icon-scroll">
				<span class="txt-scroll" style="">SCROLL</span>
				<img src="/hotel_prj/static/home/images/ko/pc/common/ico_scroll.png" class="ico-scroll" alt="스크롤">
				<div class="arrows-scroll"><span></span><span></span><span></span></div>
			</div>
			<!-- scroll icon -->
		</div>
	</div>
	<!--  mainArea01  -->
	
	<!--  mainArea04  -->
	<div class="mainArea04">
		<h2 class="hidden">OFFERS</h2>
		<div class="inner">
			<a href="http://localhost/hotel_prj/user/event.do" id="goToOffers" class="icoArr">GO TO EVENT</a>
			<div class="swipeWrapArea">
				<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>
				<div class="swipeWrap swipeGroup">
					<ul class="swipeCont">
						<c:forEach var="homeEvent" items="${homeEventlist}" varStatus="i">
						<li class="swipeSlide">
							<span class="thum">
								<img src="${homeEvent.eventImgFullPath}"  alt="${homeEvent.eventSubImgFullPath}">
								<!-- 멤버십 전용 패키지인 경우 -->
								<span class="hoverCont">
									<a href="http://localhost/hotel_prj/user/eventDetail.do?eventNum=${homeEvent.eventNum}" class="btnSC btnL">자세히 보기</a>
								</span>
							</span>
							<strong class="tit"><c:out value="${homeEvent.eventTitle}"/></strong>
							<span class="txt"><c:out value="${homeEvent.eventContent}"/></span>
							<span class="date"><c:out value="${homeEvent.eventStartDate}"/> - <c:out value="${homeEvent.eventEndDate}"/></span>
						</li>
						</c:forEach>

					</ul>
				</div>
				<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>
			</div>
		</div>
	</div>
	<!--  mainArea04  -->
            
	<!--  mainArea02  -->
	<div class="mainArea02">
		<h2 class="hidden">HOTELS</h2>
		<div class="contents02">
			<div class="homeboxBg">
				<ul>
					<li class="on">
						<img src="/hotel_prj/static/home/images/ko/pc/HUMA/bg_main01_01.jpg" alt="Meet Our Hotel">
					</li> <!-- 아래 swipe 에 따라 해당 순서의 li로 변경, li에 on 클래스 추가 -->
					<li>
						<img src="/hotel_prj/static/home/images/ko/pc/HUMA/bg_main01_02.jpg" alt="Meet Our Hotel">
					</li>
				</ul>
			</div>
				
			<div class="swipeWrapArea homeboxCont">
				<div class="swipeWrap">
					<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>
					<ul class="swipeCont">
						<li class="swipeSlide on"> <!-- 해당 클래스에 on 클래스 추가 -->
							<div class="homeBox">
								<div class="cont">
									<strong class="tit">Meet Elysian Hotel</strong>
									<span class="sTit">REST IN UTOPIA</span>
									<ul class="hList lg11">
										<li class="hType01"><a href="http://localhost/hotel_prj/user/aboutUs.do">엘리시안 서울</a></li>
									</ul>
								</div>
							</div>
						</li>
						
						<li class="swipeSlide">
							<div class="homeBox">
								<div class="cont">
									<strong class="tit">Meet Elysian Hotel</strong>
									<span class="sTit">REST IN UTOPIA</span>
									<p class="txt01">꿈과 현실이 만나는 곳<br>
													엘리시안 호텔에서 평온함과 럭셔리를 경험해보세요.</p>
									<p class="txt02">일상의 번잡함에서 벗어나, 이상향 속에서의 여유로운 휴식을 제공합니다.<br>
													우아하게 디자인된 객실에서 숨 막히는 전경과 함께 최고의 안락함을 만끽하세요.<br>
													엘리시안 호텔에서의 모든 순간은 당신을 위한 완벽한 휴식을 위해 준비되어 있습니다.</p>
									<a href="http://localhost/hotel_prj/user/aboutUs.do" class="btnSC btnM">VIEW MORE</a>
								</div>
							</div>
						</li>
					</ul>
					<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>
				</div>
			</div>
		</div>
	</div>
	<!--  mainArea02 -->
	
	<!-- mainArea05 -->
	<div class="mainArea05">
		<h2 class="hidden">DINING</h2>
		<div class="contBox" data-parallax="self-down">
			<div class="txtArea">
				<strong class="titDep1">Dining</strong>
				<p class="txt">엘리시안호텔의 라이프 스타일 브랜드<br>호스피탈리티 전문성을 바탕으로 확장한 라이프 스타일 브랜드를 소개합니다.</p>
			</div>
			
			<div class="obList">
				<ul>
					<!-- <li class="obList03"><a href="#"><span class="hidden">RAMSEY</span></a></li> 마우스 오버 되면 on 클래스 추가
					<li class="obList02"><a href="#"><span class="hidden">밍글스</span></a></li>
					<li class="obList04"><a href="#"><span class="hidden">바오하우스</span></a></li>
					<li class="obList05"><a href="#"><span class="hidden">오미자</span></a></li>
					<li class="obList06"><a href="#"><span class="hidden">테라로사</span></a></li>
					<li class="obList07"><a href="#"><span class="hidden">모모야마</span></a></li>
					<li class="obList08"><a href="#"><span class="hidden">플로라</span></a></li>
					<li class="obList09"><a href="#"><span class="hidden">스테이 헬스</span></a></li> -->
				</ul>
			</div>
		</div>
		
		<ul class="obBg">
			<li class="bg01 on"><img src="/hotel_prj/static/home/images/ko/pc/HUMA/bg_main03_03.jpg" alt="RAMSEY"></li> <!-- 상단 obList 와 매칭되는 li에 on 클래스 추가 -->

		</ul>
	</div>
	<!-- mainArea05 -->
	
	<!-- //mainIndicator -->
	<div class="mainIndicator"> <!-- mainArea01 일 경우에는 비노출, mainArea04 일 경우 type02 추가 -->
		<ul>
			<li class="indicator01 on"><a href="#none">HOME</a></li>
			<li class="indicator02"><a href="#none">EVENT</a></li>
			<li class="indicator03"><a href="#none">HOTELS</a></li>
			<li class="indicator04"><a href="#none">DINING</a></li>
		</ul>
	</div>
	<!-- //mainIndicator -->
	
	<!-- revArea -->
	<div class="revArea"> <!-- contents01 일 경우 cts01, contents02 일 경우 cts02 클래스 적용 -->
		<div class="selectGroup">
		<strong class="tit">RESERVATION</strong>
			<div class="selectWrap" style="width:205px;">
				<select data-height="150px" data-direction="up" name="selectVal">
					<option selected="selected" value="R">ROOM</option>
				</select>
			</div>
		</div>

		<div class="selectInner">
			<form id="mainResveForm" name="mainResveForm" method="Post" >
				<input type="hidden" name="sysCode" id="sysCode" value="ELYSIANYHOTEL"/>
				<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS" /> 	
				<input type="hidden" name="ckinDate" id="ckinDate" value="" /> 				
				<input type="hidden" name="ckoutDate" id="ckoutDate" value="" /> 			
				<input type="hidden" name="night" id="night" value="" />					
				<input type="hidden" name="roomCnt" id="roomCnt" value="1" />				
				<input type="hidden" name="maxAdlt" id="maxAdlt" value="6" />				
				<input type="hidden" name="maxChld" id="maxChld" value="2" />
								
				<input type="hidden" name="adultsNum" id="adultsNum" value="" />				
				<input type="hidden" name="kidsNum" id="kidsNum" value="" />				
				
				<div class="selectRoom" role="area">
					<div class="selectHotel">
						<a href="#none">
							<strong class="tit">HOTEL</strong>
							<span class="hotelName" id="hotelName">엘리시안 서울</span>
						</a>
					
						<div class="mainHotel clearCont">
							<ul class="hotelSelect">
								<li data-code="ELS" class="eysianSeoul on" data-nm="엘리시안 서울" class="elysianSeoul">
									<a href="#none" id="hotel_select_ELS"><span class="hotelTit">엘리시안 서울</span></a>
								</li>
							</ul>
							<button type="button" class="btnClose">닫기</button>
						</div>
					</div>
				
					<div class="chkInout">
						<a href="#none">
							<strong class="tit">CHECK IN / OUT</strong>
							<span class="date" id="dateTextHub"></span>
						</a> <!-- 클릭 시 하단 mainCalendar 펼쳐짐 -->
									
						<div class="mainCalendar clearCont">
							<div class="calContainer calendarS"></div>
								<button type="button" class="btnClose">닫기</button>
							</div>
					</div>
					
					<div class="roomWrap">
						<a href="#none">
							<span class="rBox">
								<strong class="tit">ROOM</strong>
								<span id="roomCntText">1</span>
							</span>
							
							<span class="rBox">
								<strong class="tit">ADULT</strong>
								<span id="adultCntText">2</span>
							</span>
										
							<span class="rBox">
								<strong class="tit">CHILDREN</strong>
								<span id="childCntText">0</span>
								<!-- <span id="kidsNum">0</span> -->
							</span>
						</a> <!-- 클릭 시 하단 mainRoom 펼쳐짐 -->
									
						<div class="mainRoom clearCont">
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
								<button type="button" class="btnSC btnL">확인</button>
							</div>
							<button type="button" class="btnClose">닫기</button>
						</div>
						<!-- //mainRoom -->
					</div>
					<button type="button" class="btnSC btnSearch" onclick="fncSearchList('R');">SEARCH</button>
				</div>
			</form>
			<!-- //DINING 선택 일 경우 -->
		</div>
	</div>
	<!-- revArea -->
		
</div>
<!-- //hubMain -->

</div>
<!-- //container -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>

<script type="text/javascript">
    <c:if test="${not empty error}">
        alert('${error}');
    </c:if>
</script>
<!-- //wrapper -->

</body>
</html>