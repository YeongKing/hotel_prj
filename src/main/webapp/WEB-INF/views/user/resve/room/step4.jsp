<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>객실 예약 - 객실 예약완료 | 앨리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
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

<div id="container" class="container">
	<!-- 컨텐츠 S -->
	<h1 class="hidden">예약</h1>
	<div class="topArea">
		<div class="topInner">
			<p class="f75">예약이 완료되었습니다.</p>
			<div class="revNumber">예약번호<em>${rrVO.payNum}</em></div>
			<p class="pageGuide">요청하신 예약은 정상적으로 처리되었으며, 예약번호는 예약 조회 및 취소 시<br> 반드시 필요하니, 프린트 또는 메모해 주시기 바랍니다.</p>

		</div>
	</div>
	<!-- //topArea -->
			<div class="inner">
				<h2 class="titDep2">예약 정보</h2>
				<div class="commWrap rsvInfo">
					<dl class="commlist">
						<dt>엘리시안 서울</dt>
						<dd>
							<span class="txt"> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층
								엘리시안호텔 </span> <span class="thum"> <img
								src="http://localhost/hotel_prj/static/home/images/ko/pc/HOTEL/img_visual_jjchosun.png"
								alt="엘리시안 서울">
							</span>
						</dd>
					</dl>
					<dl class="commlist">
						<dt>예약 상세 정보</dt>
						<dd>

							<input type="hidden" id="chkinDe" value="${rrVO.ckinDate}" /> <input
								type="hidden" id="chcktDe" value="${rrVO.ckoutDate}" /> <span
								class="txt" id="dateTxt"></span> <span class="txt">ROOM
								ONLY</span> <span class="txt">1 Rooms</span> <span class="txt">
								${rrVO.roomRankName} / ${rrVO.bedName} / ${rrVO.viewName} </span> <span
								class="txt">${rrVO.adultsNum} Adults, ${rrVO.kidsNum}
								Children</span>
						</dd>
					</dl>
					<dl class="commlist">
						<dt>고객정보</dt>
						<dd>
							<span class="txt"> "${umd.name}" </span> <span class="txt">"${rrVO.guestPhone}"</span>
							<span class="txt">"${rrVO.guestEmail}"</span>
						</dd>
					</dl>
				</div>
				<!-- //rsvInfo -->

				<h2 class="titDep2">객실 상세 내역</h2>
				<ul class="toggleList rsvList">

					<li class="toggleOn"><strong class="listTit">객실</strong> <span
						class="opValue">${rrVO.adultsNum} Adults, ${rrVO.kidsNum}
							Children</span> <em class="intValue pay"> <fmt:formatNumber
								value="${rrVO.payPrice}" type="number" maxFractionDigits="0" /><em
							class="unit">KRW</em>
					</em>
						<button type="button" class="btnToggle">
							<span class="hidden">상세내용 보기</span>
						</button>
						<div class="toggleCont">
							<div class="toggleInner">
								<div class="commWrap">
									<dl class="commlist">
										<dt>객실 금액</dt>
										<dd>
											<ul class="infoData">

												<li><span class="lfData"><fmt:formatNumber
															value="${rrVO.payPrice}" type="number"
															maxFractionDigits="0" /></span></li>

											</ul>
										</dd>
									</dl>
									<dl class="commlist">
										<dt>박</dt>
										<dd>
											<ul class="infoData">
												<span class="lfData">${rrVO.night}박</span>

											</ul>
										</dd>
									</dl>
									<dl class="commlist">



										<dt></dt>
										<dd>
											<ul class="infoData">
												<li><span class="lfData"></span> <span class="rtData"></span>
												</li>

											</ul>
										</dd>


									</dl>
								</div>



							</div>
						</div></li>

				</ul>
				<!-- //toggleList -->
				<!-- 비회원 예약 일 경우 -->
				<div class="total noMember">
					<div class="totalWrap type02">
						<span class="tit">총 예약금액</span> <strong class="pay"><em>
								<fmt:formatNumber value="${rrVO.payPrice * rrVO.night}"
									type="number" maxFractionDigits="0" />
						</em>KRW</strong>
					</div>
				</div>
				<div class="btnArea">
					<a href="http://localhost/hotel_prj/user/index.do"
						class="btnSC btnL"> 메인 </a> <a
						href="http://localhost/hotel_prj/user/roomResList.do"
						class="btnSC btnL active"> 예약내역 확인 </a>
				</div>
				<div class="promotion">
					<h2 class="titDep2">추천 이벤트</h2>
					<div class="swipeWrapArea">
						<button type="button" class="btnSwipe btnPrev">
							<span class="hidden">이전</span>
						</button>
						<div class="swipeWrap swipeGroup">
							<ul class="swipeCont promList">
							
							<c:forEach var="homeEvent" items="${homeEventlist}" varStatus="i">
						<li class="swipeSlide">
							<span class="thum">
								<img src="${homeEvent.eventImgFullPath}" onerror="this.src='http://localhost/hotel_prj/util/event_img/img_event.jpg'" alt="${homeEvent.eventSubImgFullPath}">
								<!-- 멤버십 전용 패키지인 경우 -->
								<span class="hoverCont">
									<a href="http://localhost/hotel_prj/user/event.do" class="btnSC btnL">자세히 보기</a>
								</span>
							</span>
							<strong class="tit"><c:out value="${homeEvent.eventTitle}"/></strong>
							<span class="txt"><c:out value="${homeEvent.eventContent}"/></span>
							<span class="date"><c:out value="${homeEvent.eventStartDate}"/> - <c:out value="${homeEvent.eventEndDate}"/></span>
						</li>
						</c:forEach>
							
							
							
							
							
							
							
							
							<c:forEach var="roomEvent" items="${roomEventlist}" varStatus="i">
								<li class="swipeSlide">
								<a href="http://localhost/hotel_prj/user/eventDetail.do?eventNum=${roomEvent.eventNum}" ></a>
								<br/>
									    <p class="txt">${roomEvent.eventTitle}</p>
										<p class="date">
											<span><em>기간</em>${roomEvent.eventStartDate} - ${roomEvent.eventEndDate}</span> 
										
										</p> 
										<span class="thum"> 
										<img src="${roomEvent.eventImgFullPath}" onerror="this.src='http://localhost/hotel_prj/util/event_img/img_event.jpg'" alt="${roomEvent.eventSubImgFullPath}">
										</span>
								</a>
								</li>
							
							
							
							
							
							
							</c:forEach>
							
							
							
			
							</ul>
						</div>
						<button type="button" class="btnSwipe btnNext">
							<span class="hidden">다음</span>
						</button>
						<div class="indicator">
							<button type="button" class="num on">
								<em class="hidden">현재 이미지</em>01
							</button>
						</div>
					</div>
				</div>
				<script>$(window).on('load', function () {	commonJs.initSwipe($('.swipeWrap')); });</script>

			</div>
			<!-- //inner -->
	<!-- 컨텐츠 E -->
</div>
<!-- //wrapper -->

		<!-- //container -->
       <!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
 		
	</div>
	<!-- //wrapper -->


<div class="dimmed"></div>
</body>
</html>