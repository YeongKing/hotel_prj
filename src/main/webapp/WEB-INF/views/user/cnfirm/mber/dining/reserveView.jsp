<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="다이닝 예약내역 페이지 상세 보기" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 다이닝 예약 내역, 예약 상세보기 | 엘리시안호텔</title>

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
	$(function(){
		getDetail();
	}); // ready

	//예약 내역 상세 조회 api
	function getDetail() {
		$.ajax({
			type : "POST",
			url : "diningResViewResult.do",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify({
				payNum : $("#payNum").val()
			}),
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj){
				const diningName = jsonObj.diningName;
				const visitDate = jsonObj.visitDate;
				const visitTime = jsonObj.visitTime;
				const diningResStatus = jsonObj.diningResStatus;
				const isCancellable = diningResStatus === '예약' ? true : false;     //취소 가능 여부
				const isModifiable = diningResStatus === '예약' ? true : false;       //정보 변경 가능 여부
				
				//방문자 정보
				const visitorEmail = jsonObj.visitorEmail;
				const visitorName = jsonObj.visitorName;
				const visitorPhone = jsonObj.visitorPhone;
				const visitorReqeust = jsonObj.visitorReqeust;
				const adultCnt = jsonObj.adultCnt;
				const childCnt = jsonObj.childCnt;
				const babyCnt = jsonObj.babyCnt;
				const visitPeople = '방문 인원 {1}명'.replace("{1}", jsonObj.visitPeople);
				const visitorCnt = `어른 \${adultCnt}명 | 어린이 \${childCnt}명 | 영유아 \${babyCnt}명`;
				
				$(".titDep2").text(diningName); //다이닝 이름
				$(".titDep4").text(diningResStatus); //예약 상태
				$(".reserveInfo .txt").text(`엘리시안 서울 | \${visitDate} | \${visitTime} | \${visitPeople}`); //호텔 명 | 예약 시간
				$(".visitorEmail").text(visitorEmail);
				$(".visitorName").text(visitorName);
				$(".visitorPhone").text(visitorPhone);
				$(".visitorReqeust").text(visitorReqeust);
				$(".visitorCnt").text(visitorCnt);
				
				//취소 가능
				if(isCancellable) {
					$("#cancelBtn").show();
				} // end if
                
				//정보 수정 가능
				if(isModifiable) {
					$("#updateBtn").show();
				} // end if

				//방문일
				let visitDay = new Date(visitDate);
				visitDay.setHours(0);
				visitDay.setMinutes(0);
				visitDay.setSeconds(0);
				visitDay.setMilliseconds(0);
				
				//조회일
				let nowDate = new Date();
				nowDate.setHours(0);
				nowDate.setMinutes(0);
				nowDate.setSeconds(0);
				nowDate.setMilliseconds(0);
				
				//방문일과 조회일의 날짜 차이
				let diffDay = (visitDay - nowDate) / (1000 * 60 * 60 * 24);
				let refundRate = 1; // 환불률
				 
				if(diffDay <= 0) {
					refundRate = 0;
				} else if(diffDay == 1) {
					refundRate = 0.5;
				} // end else
                
				//결제금 정보
				const deposit = jsonObj.payPrice;
				if(deposit != null){
					const refundAmount = deposit * refundRate;       //최종 환불 금액
					const refundFee = deposit - refundAmount;        //취소 수수료
					
					$("#amount").text(fncComma(deposit));
					$("#refundAmount").text(fncComma(refundAmount));
					$("#refundFee").text(fncComma(refundFee));
					$("#timeInfoMsg").text("수수료 계산 기준 일시  : " + new Date().format("yyyy-MM-dd HH:mm"));
					$(".depositAmount").text(fncComma(deposit));
				} else {
					//예약금이 없을 경우 예약금 부분 숨김처리
					$(".total").hide();
					$("#timeInfoMsgLi").hide();
				} // end else
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		}); // ajax
	} // getDetail

	//예약 취소
	/* function fncCancel(){
	    $.ajax({
	        type : "POST",
	        url : "/resve/dining/cancel.json",
	        cache : false,
	        dataType : "json",
	        data : {
	            reservationId: $("#reservationId").val(),
	            cancelReasonText: $("#cancelReasonText").val()
	        },
	        global : false,
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
	     	},
	        complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
	        },
	        success : function(data){
	            const result = data.result;
	
	            if (data.resultCode != "SUCCESS") {
	                alert(data.resultMsg);
	            } else {
	                alert("취소 처리 되었습니다. ");
	                location.reload();
	            }
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    })
	 }*/

	function fncUpdateForm() {
		location.href = "${pageContext.request.contextPath}/user/infoUpdateForm.do?payNum=" + $("#payNum").val();
	} // fncUpdateForm

	function fncList(){
		location.href = '${pageContext.request.contextPath}/user/diningResList.do';
	} // fncList
</script>

<c:set var="payNum" value="${payNum}"/>
<input type="hidden" id="payNum" name="payNum" value="${payNum}">

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
	
	<!-- myContents -->
	<div class="myContents drDiningMypage">
	<h2 class="titDep2"></h2>
	<!-- 예약 정보 -->
	<h3 class="hidden">예약 정보 </h3>
	<div class="reserveInfo">
		<h4 class="titDep4"></h4>
		<div class="commWrap">
		<div class="commlist">
			<span class="txt"></span>
		</div>
		</div>
	</div>
	<!-- //예약 정보 -->

	<!-- 방문자 정보 -->
	<h3 class="titDep3">
		방문자 정보
		<button type="button" id="updateBtn" class="btnModify" onclick="fncUpdateForm();" style="display: none">정보수정</button>
	</h3>

	<table class="tblV">
		<colgroup>
			<col style="width:240px">
			<col style="width:auto">
		</colgroup>
	
		<caption>예약 방문자정보 목록</caption>
		<thead>
		<tbody>
			<tr>
			    <th scope="row">이름</th>
			    <td class="visitorName"></td>
			</tr>
                    
 			<tr>
				<th scope="row">연락처</th>
				<td class="visitorPhone"></td>
			</tr>
			
			<tr>
				<th scope="row">이메일</th>
				<td class="lower visitorEmail"></td>
			</tr>
                    
			<tr>
				<th scope="row">요청사항</th>
				<td class="visitorRequest"></td>
			</tr>
                    
			<tr>
				<th scope="row">내역</th>
				<td class="visitorCnt"></td>
			</tr>
		</tbody>
	</table>
	<!-- //회원 정보 -->

	<!-- 금액 정보 -->
	<h3 class="hidden">금액 정보</h3>
	<div class="total noMember">
		<div class="totalWrap type02">
			<span class="tit">선 결제 금액(예약금)</span>
			<strong class="pay"><em class="depositAmount"></em>KRW</strong>
		</div>
	</div>
	<!-- //금액 정보 -->

	<!-- 취소 규정 -->
	<h3 class="titDep3 refundPolicyTitle">취소 규정</h3>
	<ul class="listDep1 refundPolicy">
		<li>노쇼 시 : 환불 불가</li>
		<li>당일 취소 : 환불 불가</li>
		<li>1일 전 취소 : 50% 환불</li>
		<li>2일 전 취소 : 100% 환불</li>
	</ul>
	<!-- // 취소 규정 -->
		
	<div class="btnArea">
		<a href="#" class="btnSC btnL" onclick="fncList();">목록</a>
		<a href="#" id="cancelBtn" class="btnSC btnL active" onclick="commonJs.popShow($('#layerPop2'))" style="display: none">예약 취소</a>
	</div>

	</div>
	<!-- MyContents -->

<!-- 예약취소 Layer -->
<div id="layerPop2" class="layerPop">
    <div class="layerCont">
        <div class="reserveOpArea drDiningCancel">
            <strong class="tit">예약 취소 </strong>
            <p class="txtConfirm">예약을 취소 하시겠습니까? </p>
            <ul class="listDep1">
                <li>예약취소 시 기존 예약으로 복구가 불가합니다. </li>
                <li>취소 및 환불 정책 기준으로 예약 취소가 진행됩니다. </li>
            </ul>
            
            <div class="total">
                <div class="totalWrap">
                    <span class="tit">예약 금액</span>
                    <strong class="pay"><em id="amount"></em></strong>
                </div>
                
                <div class="totalWrap">
                    <span class="tit">취소 수수료</span>
                    <strong class="pay"><em id="refundFee"></em></strong>
                </div>
                
                <div class="totalWrap type02">
                    <span class="tit">최종 환불 금액</span>
                    <strong class="pay"><em id="refundAmount"></em>KRW</strong>
                </div>
            </div>
            
            <ul class="txtGuide" id="timeInfoMsgLi">
	            <li>취소수수료는 [예약취소] 버튼이 눌러진 시간을 기준으로 처리 됩니다. 화면상 수수료 계산 시간과 상이할 경우를 유의해 주세요. (단, 예약 후 30분 이내에 취소 시, 모든 취소수수료 미 발생)</li>
                <li id="timeInfoMsg"></li>
            </ul>
            
            <div class="btnArea">
                <button type="button" class="btnSC btnM" onclick="commonJs.popClose($('#layerPop2'))">취소 </button>
                <button type="button" class="btnSC btnM active" onclick="fncCancel();">예약 취소 </button>
            </div>
        </div>
        <button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop2'))">닫기 </button>
    </div>
</div>
<!-- //예약취소 Layer -->
		
</div>
<!-- //inner -->
	
</div>
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