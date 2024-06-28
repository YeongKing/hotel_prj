<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="객실 예약내역 페이지 메인" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 객실 예약 내역 | 엘리시안호텔</title>

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

<script>
	function fncSearch(){
		$("#resvForm").attr("method", "get");
		$("#resvForm").attr("action", "roomResList.do");
		$("#resvForm").submit();
	} // fncSearch
	
	function fncResvDetail(payNum){
		$("#payNum").val(payNum);
		$("#resvForm").attr("method", "get");
		$("#resvForm").attr("action", "roomResView.do");
		$("#resvForm").submit();
	} // fncResvDetail
	
	function fncSetMonth(agoMonth){
		var beginDate = new Date();
		var monthOfYear = beginDate.getMonth();
		var endDate = new Date();

		if(agoMonth != ''){
			endDate.setMonth(monthOfYear+Number(agoMonth));
			$("#datepickerFrom").val(gfncDateFormat(beginDate,'yyyy.MM.dd'));
			$("#datepickerTo").val(gfncDateFormat(endDate,'yyyy.MM.dd'));
		} else{
			$("#datepickerFrom").val("");
			$("#datepickerTo").val("");
		} // end else
	} // fncSetMonth

	function fncMore(page){
		var maxCnt = 20;
		var listCnt = "0";
		var totalCnt = page*maxCnt;
		
		for(var i = $("#listArea > li:visible").length; i < totalCnt; i++){
			$("#show_"+i).show();
		} // end for
		
		if(Number(listCnt) < totalCnt) {
			$("#moreBtn").hide();
		} else {
			$("#moreBtn").html("<button type=\"button\" class=\"btnLine more\" onclick=\"fncMore('"+(Number(page)+1)+"');\">MORE</button>");
		} // end else
	} // fncMore
	
	function fncChangeDate(){
		$("input[id^=agoMonth]:checked").prop("checked", false);
	} // fncChangeDate
</script>

<div id="container" class="container mypage">

<script type="text/javascript">
	$(function(){
		fncLnbInfoApi();
	}); // ready
</script> 

<h1 class="hidden">마이페이지</h1>
<div class="topArea">
	<div class="topInner">
		<h2 class="titDep1">My Page</h2>
		<p class="pageGuide">회원을 위한 다양한 혜택이 준비되어 있습니다.</p>
	</div>
</div> 

<div class="inner">
	<!-- LNB -->
	<jsp:include page="/WEB-INF/views/user/mypage/lnb.jsp"></jsp:include>
	<!-- LNB -->
	
	<!-- resvForm -->
	<form id="resvForm" name="resvForm">
	<input type="hidden" id="payNum" name="payNum" />
	
	<!-- myContents -->
	<div class="myContents">
		<h3 class="titDep2">예약확인</h3>
		<ul class="tabType01 tabType02">
			<li class="on"><a href="http://localhost/hotel_prj/user/roomResList.do">객실</a></li>
			<li><a href="http://localhost/hotel_prj/user/diningResList.do">다이닝</a></li>
		</ul>
		
		<!-- tab01 -->
		<div id="tab01" class="tabCont" style="display:block">
		<h3 class="hidden">객실</h3>
			<!-- searchBox -->
			<div class="searchBox">
			<div class="searchOp">
				<span class="hidden">기간 조회</span>
				
				<div class="selectWrap" style="width:346px">
					<select title="조회옵션" data-height="150px" id="searchDataType" name="searchDataType">
						<option value="SEOUL" selected="selected">엘리시안 서울</option>
					</select>
				</div>

				<div class="period">
					<span class="hidden">날짜선택</span>
					<span class="intArea">
						<input type="text" style='width:143px;' title="검색 시작일" readonly="readonly"
								id="datepickerFrom" name="searchDataBeginDe" value="${searchDataBeginDe}" onchange="fncChangeDate();" />
					</span>
					<span class="hBar">-</span>
					<span class="intArea">
						<input type="text" style='width:143px;' title="검색 종료일" readonly="readonly"
								id="datepickerTo" name="searchDataEndDe" value="${searchDataEndDe}" onchange="fncChangeDate();" />
					</span>
				</div>
				
				<div class="frmList periodOp">
					<span class="frmRadio">
						<input type="radio" id="agoMonth1" onclick="fncSetMonth('1');" name="agoMonth" value="1" ${checkedMonth == '1' ? 'checked' : ''} />
						<label for="agoMonth1">1개월</label>
					</span>
					
					<span class="frmRadio">
						<input type="radio" id="agoMonth3" onclick="fncSetMonth('3');" name="agoMonth" value="3" ${checkedMonth == '3' ? 'checked' : ''} />
						<label for="agoMonth3">3개월</label>
					</span>
					
					<span class="frmRadio">
						<input type="radio" id="agoMonth6" onclick="fncSetMonth('6');" name="agoMonth" value="6" ${checkedMonth == '6' ? 'checked' : ''} />
						<label for="agoMonth6">6개월</label>
					</span>
				</div>
			</div>
			
			<div class="btnWrap">
				<a href="#" class="btnSC btnM" role="button" onclick="fncSearch();">기간조회</a>
			</div>
			
			<ul class="txtGuide">
				<li>온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.</li>
				<li>체크인일 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.</li>
				<li>과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.</li>
			</ul> 
			</div>
			<!-- searchBox -->
			
			<!-- listBox -->
			<div class="listBox">
			<div class="countList">
				<span class="count">총 <em><c:out value="${roomResListSize}"/></em>건</span>
				<div class="selectWrap" style="width:200px;">
					<select title="목록정렬" data-height="150px" id="searchCtgry" name="searchCtgry" onchange="fncSearch();">
						<option value="" ${selectedCategory == '' ? 'selected' : ''}>ALL</option>
						<option value="RESERVED" ${selectedCategory == 'RESERVED' ? 'selected' : ''}>RESERVED</option>
						<option value="CANCELED" ${selectedCategory == 'CANCELED' ? 'selected' : ''}>CANCELED</option>
					</select>
				</div>
			</div>
			
			<c:set var="roomResList" value="${roomResList}"/>
			<ul class="cardList reserveInfo">
			<c:choose>
				<c:when test="${not empty roomResList}">
				<c:forEach items="${roomResList}" var="rrl" varStatus="i">
					<li id="show_${i.count}">
						<div class="cardInner">
						<span class="status" ${rrl.roomResStatus == 'CANCELED' ? "style='color:#B01414'" : ""}><c:out value="${rrl.roomResStatus}"/></span>
						<em class="tit">
							<a href="#none" onclick="fncResvDetail('${rrl.payNum}');"><c:out value="${rrl.roomInfo}"/></a>
						</em>
						<p class="info">엘리시안 서울 / 객실 1개 / 성인 <c:out value="${rrl.adultsNum}"/>, 어린이 <c:out value="${rrl.kidsNum}"/></p>
						<p class="number">예약번호
							<em><c:out value="${rrl.payNum}"/></em>
						</p>
						<p class="date"><c:out value="${rrl.checkIn}"/> - <c:out value="${rrl.checkOut}"/></p>
						</div>
					</li>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<li class="noData"><p class="txt">검색 결과가 없습니다.</p></li>
				</c:otherwise>
			</c:choose>	
			</ul>
			</div>
			<!-- listBox -->
		</div>
		<!-- tab01 -->
	</div>
	<!-- myContents -->
	</form>
	<!-- resvForm -->
	
		
</div>
<!-- //inner -->
	
</div>
<!-- //container -->


<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->
</body>
</html>