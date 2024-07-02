<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="공지사항"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>QNA - 자주찾는질문목록 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link
	href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css"
	rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>

<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<div class="skip">
		<a href="#container">본문 바로가기</a>
	</div>
	<div class="wrapper">
		<!--S header  -->
		<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
		<!--E header  -->

		<script>
			$(document)
					.on(
							"click",
							".headArea .btnMenu",
							function() {
								if (jQuery(this).hasClass("menuOn")) {
									var expsrCount = 3;
									var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
									var randomArray = generateRandomNumberArray(
											expsrCount, $loungeList.length);
									$loungeList.addClass("hidden");
									$loungeList.each(function(index) {
										if (randomArray.indexOf(index) > -1) {
											$(this).removeClass("hidden");
										}
									});
								}
							})
		</script>
		<script>
			$(document)
					.ready(
							function() {
								//상단 카테고리 클릭시 이벤트
								$("#tabArea > li")
										.click(
												function() {
													if (!$(this).hasClass("on")) {
														$(this).addClass("on");
													}
													jQuery("#page").val("1");
													jQuery("#searchCtgry").val(
															$(this).attr("id"));
													jQuery("#form")
															.attr("action",
																	"http://localhost/hotel_prj/user/qna.do");
													jQuery("#form").attr(
															"method", "get");
													jQuery("#form").submit();
												});
								var searchCtgry = "${qVO.searchCtgry}"; // 모델에서 받아온 searchCtgry 값
								// 기본적으로 "전체" 탭이 선택되도록 설정
								if (!searchCtgry) {
									$("#tabArea li#F00").addClass("on"); // 기본 탭 선택
									$("#searchCtgry").val("F00");

								} else {
									$("#tabArea li").removeClass("on"); // 모든 탭 클래스 초기화
									$("#tabArea li#" + searchCtgry).addClass(
											"on"); // 모델에서 받은 탭 선택
									$("#searchCtgry").val(searchCtgry);
								}
							});
			//엔터 이벤트
			function fncKeyEvent() {
				if (event.keyCode == 13) {
					fncGetList("1");
				}
			}
			//페이지 이동 이벤트
			function fncPage(page) {
				jQuery("#page").val(page);
				jQuery("#form").attr("action",
						"http://localhost/hotel_prj/user/qna.do");
				jQuery("#form").attr("method", "get");
				jQuery("#form").submit();

			}
			//검색 이벤트
			function fncSearch() {

				jQuery("#searchCtgry").val($("#searchCtgry").val());
				jQuery("#page").val(1);
				jQuery("#form").attr("action",
						"http://localhost/hotel_prj/user/qna.do");
				jQuery("#form").attr("method", "get");
				jQuery("#form").submit();

			}
		</script>
		<form action="http://localhost/hotel_prj/user/qna.do" method="get"
			id="form">
			<input type="hidden" name="page" id="page" value="1">
			<div id="container" class="container mypage ctmService">
				<h1 class="hidden">고객센터</h1>
				<div class="topArea">
					<div class="topInner">
						<h2 class="titDep1">Customer Service</h2>
						<p class="pageGuide">
							호텔 이용과 관련된 궁금한 사항을 남겨주시면 신속하게 답변 드리겠습니다.<br>항상 고객의 소리에 귀
							기울이는 엘리시안 서울이 되겠습니다.
						</p>
					</div>
				</div>
				<div class="inner">
					<div class="lnbArea">
						<ul class="lnb ctmType">
							<li class="on"><a
								href="http://localhost/hotel_prj/user/notice.do">공지사항</a></li>
							<li class="on"><a
								href="http://localhost/hotel_prj/user/qna.do">QNA</a></li>
						</ul>
					</div>
					<div class="myContents">
						<h3 class="titDep2">QNA</h3>
						<h4 class="titDep3 hidden">QNA</h4>
						<div class="searchBox">
							<div class="searchOp">
								<span class="hidden">검색</span>
								<div class="selectWrap" style="width: 220px">
									<select name="searchCtgry" id="searchCtgry"
										class="form-control" style="height: 150px;">
										<option value="F00">전체</option>
										<option value="F01">예약</option>
										<option value="F02">결제</option>
										<option value="F03">계정</option>
										<option value="F04">기타</option>
									</select>
								</div>
								<div class="intWord">
									<span class="intArea"> <input type="text"
										id="searchDataValue" name="searchDataValue"
										style="width: 675px" title="검색어 입력" placeholder="검색어를 입력해주세요."
										onkeypress="fncKeyEvent();" value="">
									</span>
								</div>
							</div>
							<div class="btnWrap">
								<a href="#search" class="btnSC btnM" role="button"
									onclick="fncSearch(); return false;">검색</a>
							</div>
						</div>
						<ul class="tabType01 tabType02 tabToggle" id="tabArea">
							<li id="F00" class="on"><a href="#tab01-F00">전체</a></li>
							<li id="F01"><a href="#tab01-F01">예약</a></li>
							<li id="F02"><a href="#tab01-F02">결제</a></li>
							<li id="F03"><a href="#tab01-F03">계정</a></li>
							<li id="F04"><a href="#tab01-F04">기타</a></li>
						</ul>
						<div id="tab01-F00" class="tabCont" style="display: block">
							<h3 class="hidden">전체</h3>
							<div class="tabFaqType">
								<ul class="toggleList rsvList">
									<c:forEach var="qna" items="${qnaList}">
										<li>
											<div class="titArea">
												<strong class="listTit"> ${qna.qnaType} </strong> <span
													class="opValue">${qna.qnaTitle}</span>
											</div>
											<button type="button" class="btnToggle">
												<span class="hidden">상세내용 보기</span>
											</button>
											<div class="toggleCont">
												<div class="toggleInner">${qna.qnaContent}</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div id="tab01-F01" class="tabCont">
							<h3 class="hidden">예약</h3>
							<div class="tabFaqType">
								<ul class="toggleList rsvList">
								</ul>
							</div>
						</div>
						<div id="tab01-F02" class="tabCont">
							<h3 class="hidden">결제</h3>
							<div class="tabFaqType">
								<ul class="toggleList rsvList"></ul>
							</div>
						</div>
						<div id="tab01-F03" class="tabCont">
							<h3 class="hidden">계정</h3>
							<div class="tabFaqType">
								<ul class="toggleList rsvList"></ul>
							</div>
						</div>
						<div id="tab01-F04" class="tabCont">
							<h3 class="hidden">기타</h3>
							<div class="tabFaqType">
								<ul class="toggleList rsvList">
								</ul>
							</div>
						</div>
						<div class="pagination">
							<c:forEach var="page" begin="1" end="${totalPage}"
								varStatus="status">
								<c:choose>
									<c:when test="${page == qVO.page}">
										<span class="current"><span class="hidden">현재페이지</span>${page}</span>
									</c:when>
									<c:otherwise>
										<a href="javascript:fncPage(${page});">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
		<!--E footer  -->
	</div>
</body>
</html>

