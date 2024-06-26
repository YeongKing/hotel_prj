<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 객실 패키지 예약 내역, 예약 상세보기 | 엘리시안호텔</title>

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

<script>
	$(function(){
		var ckin = $("#checkIn").val();
		var ckout = $("#checkOut").val();
		var diffDay = dUtils.dateDiff(ckin, ckout);
	
		$("#dateText").append(ckin+" - "+ckout+" ("+diffDay+"박)");
		$("#printDateText").append(ckin+" - "+ckout+" ("+diffDay+"박)");
	}); // ready

	function fncResveCancel(){
		commonJs.showLoadingBar(); //로딩바 show
		var payNum = $("#payNum").val();
		
		// 취소 규정 날짜 유효성 검증
		var checkIn = $("#checkIn").val();
		var today = new Date();
		var todayDateOnly = today.getFullYear() + '.' + String(today.getMonth()+1).padStart(2, '0') + '.' + String(today.getDate()).padStart(2, '0');
		var tomorrow = new Date(today);
		tomorrow.setDate(today.getDate()+1);
		var tomorrowDateOnly = tomorrow.getFullYear() + '.' + String(tomorrow.getMonth()+1).padStart(2, '0') + '.' + String(tomorrow.getDate()).padStart(2, '0');
		
		if(todayDateOnly === checkIn) {
			alert("당일 취소는 불가합니다.");
			commonJs.closeLoadingBar(); //로딩바 hide
			commonJs.popClose($('#layerPop2'));
			return;
		} // end if
		
		if(tomorrowDateOnly === checkIn) {
			var result = confirm("1일 전 취소는 50% 환불됩니다. 취소하시겠습니까?");

			if(result === false) {
				commonJs.closeLoadingBar(); //로딩바 hide
				commonJs.popClose($('#layerPop2'));
				return;
			} // end if
		} // end if
		
		var param = {
				payNum : payNum,
			}
	
		$.ajax({
			type : "POST",
			url : "resvCancel.do",
			dataType : "json",
			contentType : 'application/json',
			data : JSON.stringify({payNum : payNum}),
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj){
				var resultCode = jsonObj.resultCode;
				if(resultCode == "SUCCESS"){
					alert('예약이 취소되었습니다.');
					commonJs.popClose($('#layerPop2'));
					$("#form").attr("method", "get");
					$("#form").attr("action", "roomResList.do");
					$("#form").submit();
				} else{
					alert("죄송합니다. 예약 취소가 정상적으로 처리되지 않았습니다. 관리자에게 문의해주세요.");
				} // end else
			},
			error:function(r, s, e){
				console.log(r.status);
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});
	} // fncResveCancel

	function fncList(){
		$("#form").attr("method", "post");
		$("#form").attr("action", "roomResList.do");
		$("#form").submit();
	} // fncList
</script>

<div id="container" class="container mypage">

<c:set var="roomResDomain" value="${roomResDomain}"/>

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

	<div class="myContents">
		
	<form id="form" name="form">
		<input type="hidden" name="payNum" id="payNum" value="${roomResDomain.payNum}" />
		<input type="hidden" name="checkIn" id="checkIn" value="${roomResDomain.checkIn}" />
		<input type="hidden" name="checkOut" id="checkOut" value="${roomResDomain.checkOut}" />
		<input type="hidden" name="searchDataType" value="SEOUL" />
		<input type="hidden" name="agoMonth" value="3"/>
		<input type="hidden" name="searchCtgry" value="ALL"/>
	</form>
			
		<h2 class="titDep2"><c:out value="${roomResDomain.roomInfo}"/></h2>
		<p class="categoryTxt">예약번호 <em><c:out value="${roomResDomain.payNum}"/></em>
			<span class="vBar" ${roomResDomain.roomResStatus == 'CANCELED' ? "style='color:#B01414'" : ""}><c:out value="${roomResDomain.roomResStatus}"/></span>
		</p>

		<!-- 예약 정보 -->
		<h3 class="hidden">예약 정보</h3>
		<div class="reserveInfo">
			<h4 class="titDep4">예약 정보</h4>
			<div class="commWrap">
				<div class="commlist">
					<span class="txt">엘리시안 서울</span>
					<span class="txt" id="dateText"></span>
				</div>
				
				<div class="commlist">
					<span class="txt">1 ROOMS</span>
					<span class="txt"><c:out value="${roomResDomain.roomInfo}"/></span>
				</div>
				
				<div class="commlist">
					<span class="txt">
						<c:out value="${roomResDomain.adultsNum}"/> ADULTS, <c:out value="${roomResDomain.kidsNum}"/> CHILDREN
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
				<span class="opValue"><c:out value="${roomResDomain.adultsNum}"/> ADULTS, <c:out value="${roomResDomain.kidsNum}"/> CHILDREN</span>
				<em class="intValue"><em><fmt:formatNumber value="${roomResDomain.payPrice}"/></em> KRW</em>
				<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
					
				<div class="toggleCont">
				<div class="toggleInner">
				<div class="commWrap">
					<dl class="commlist">
						<dt>객실 금액</dt>
						<dd>
						<ul class="infoData">
							<li>
							<span class="lfData"><c:out value="${roomResDomain.roomResDate}"/></span>
							<span class="rtData"><fmt:formatNumber value="${roomResDomain.roomBasicPrice}"/></span>
							</li>
						</ul>
						</dd>
					</dl>
					
					<dl class="commlist">
						<dt>옵션 금액</dt>
						<dd>
						<ul class="infoData">
							<li>
							<span class="lfData">인원추가</span>
							<span class="rtData"><fmt:formatNumber value="${roomResDomain.addPrice}"/></span>
							</li>
						</ul>
						</dd>
					</dl>
				</div>
				</div>
				</div>
				<!-- //toggleCont -->
			</li>
		</ul><!-- //객실 상세 내역 -->

		<div class="total noMember">
			<div class="totalWrap type02">
				<span class="tit">총 예약금액</span>
				<strong class="pay">
					<em><fmt:formatNumber value="${roomResDomain.payPrice}"/></em>KRW
				</strong>
			</div>
		</div>
			
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
					<td><c:out value="${roomResDomain.engName}"/></td>
				</tr>
				
				<tr>
					<th scope="row">연락처</th>
					<td><c:out value="${roomResDomain.guestPhone}"/></td>
				</tr>
				
				<tr>
					<th scope="row">이메일</th>
					<td class="lower"><c:out value="${roomResDomain.guestEmail}"/></td>
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
				<%-- <tr>
					<th scope="row">신용카드 종류</th>
					<td><c:out value="${roomResDomain.cardName}"/></td>
				</tr> --%>
				
				<tr>
					<th scope="row">신용카드 번호</th>
					<td><c:out value="${roomResDomain.cardNum}"/></td>
				</tr>
			</tbody>
		</table>
		
		<ul class="txtGuide">
			<li>신용카드 정보는 고객님의 프로그램에 의한 개런티 외에는 어떤 목적으로도 사용되지 않습니다.</li>
			<!-- <li>본 정보는 온라인 예약 시 직접 결제가 이루어지지 않으며, 체크아웃 시 동일한 신용카드 지참을 부탁드립니다.</li> -->
		</ul>
		
		<h3 class="titDep3">취소 규정</h3>
		<ul class="listDep1">
			<li>노쇼 시 : 환불 불가</li>
			<li>당일 취소 : 환불 불가</li>
			<li>1일 전 취소 : 50% 환불</li>
			<li>2일 전 취소 : 100% 환불</li>
		</ul>
		
		<div class="btnArea">
			<a href="#none" onclick="fncList();" class="btnSC btnL">목록</a>
			<c:if test="${roomResDomain.roomResStatus != 'CANCELED'}">
				<a href="#none" class="btnSC btnL active" onclick="commonJs.popShow($('#layerPop2'))">예약취소</a>
			</c:if>
		</div>
	</div>
</div>
<!-- //inner -->

</div>
<!-- //container -->

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
			<p class="txtConfirm" style="margin-top: 20px;">취소 규정</p>
			<ul class="listDep1">
				<li>노쇼 시 : 환불 불가</li>
				<li>당일 취소 : 환불 불가</li>
				<li>1일 전 취소 : 50% 환불</li>
				<li>2일 전 취소 : 100% 환불</li>
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

<!-- //container -->

 <!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
 
</div>
<!-- //wrapper -->

<!-- layer 생성 시 배경 어둡게 -->
<div class="dimmed" style="display: none;"></div>

</body>
</html>