<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- view-source:https://www.josunhotel.com/resve/dining/complete.do?reservationId=zfRwJnbl7cF6OEiZ6uQo0w-->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>다이닝 예약 - 예약 완료 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->
<style>
.listTit{
	font-weight: bold;
	color: #006400; 
}
 .listTit::before {
        content: '•';
        color: #006400; /* 진한 초록색 점 */
        margin-right: 5px; /* 점과 글자 사이의 간격 */
  }
</style>
</head>

<body>

<div class="wrapper ">
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
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->



<div id="container" class="container">
    <!-- 컨텐츠 S -->
    <h1 class="hidden">예약</h1>
	<div class="topArea">
		<div class="topInner">
			<p class="f75">예약이 완료되었습니다.</p>
			<div class="revNumber">예약번호<em>${drInfoVO.payNum}</em></div>
			<p class="pageGuide">요청하신 예약은 정상적으로 처리되었으며, 예약번호는 예약 조회 및 취소 시<br> 반드시 필요하니, 프린트 또는 메모해 주시기 바랍니다.</p>

		</div>
	</div>
    <!-- //topArea -->
    <div class="inner">
        <h2 class="titDep2">예약 정보 </h2>
        <div class="commWrap rsvInfo drDining_st04">
            <dl class="commlist">
                <dt>${drInfoVO.diningName}</dt>
                <dd>
                    <span class="txt">엘리시안 호텔 ${drInfoVO.location}</span>
                    <span class="thum"><img src="http://localhost/hotel_prj/util/dining_img/${drInfoVO.diningImg}"></span>
                </dd>
            </dl>
            <dl class="commlist">
                <dt>예약 상세 정보 </dt>
	            <dd>
                    <span class="txt visitDate" >날짜 : ${drInfoVO.visitDate}</span>
                    <span class="txt visitDateTime" >시간 : ${drInfoVO.visitDateTime }</span>
                    <span class="txt person" ></span>
                </dd>
                <dt>추가 요청사항 </dt>
                <dd>
                    <span class="txt requests" >${drInfoVO.requests }</span>
                </dd>
            </dl>
            <dl class="commlist">
                <dt>고객 정보 </dt>
	            <dd>
	            	<strong class="listTit">예약자</strong>
                    <span class="txt bookerName">${drInfoVO.bookerName} 님</span>
                    <span class="txt bookerPhone">${drInfoVO.bookerPhone}</span>
                    <span class="txt bookerEmail">${drInfoVO.bookerEmail}</span>
                </dd>
	            <br>
                <dd>
                	<strong class="listTit">방문자</strong>
                    <span class="txt visitorName">${drInfoVO.vistorName} 님</span>
                    <span class="txt visitorPhone">${drInfoVO.visitorPhone}</span>
                </dd>
            </dl>
            <dl class="commlist depositArea">
                <dt>결제 예약금 </dt>
                <dd>
                    <span class="txt deposit" >${drInfoVO.totalPrice} KRW</span>
                </dd>
            </dl>
        </div>
        <div class="btnArea">
            <a href="http://localhost/hotel_prj/user/index.do" class="btnSC btnL">메인 </a>
            
                <a href="http://localhost/hotel_prj/user/diningResList.do" class="btnSC btnL active">예약내역 확인<!-- 예약내역 확인 --></a>
            
            
        </div>
    </div>
    <!-- //inner -->
    <!-- 컨텐츠 E -->
</div>
<!-- //wrapper -->	



<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->



	</div>
	<!-- //wrapper -->


</body>
</html>

