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

<title>마이페이지 | 엘리시안호텔</title>

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
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script> 
 
<div id="container" class="container mypage">

<script type="text/javascript">
	$(function(){
		fncLnbInfoApi();
		fncMainRoomRes();
	}); // ready
	
	function fncMainRoomRes() {
		$.ajax({
			url : "mainRoomResList.do",
			type : "GET",
			contentType : "application/json",
			dataType : "json",
			success : function(jsonObj) {
				// 로그인한 아이디의 예약 리스트가 있다면
				if(jsonObj.flag === true) {
					// 예약 내역이 없습니다 삭제
					$('ul').remove('.membershipCashList');
					
					// myContents에 myReserveBox 추가
					var myReserveBox = $('<div></div>').addClass('myReserveBox');
					
					var title = $('<strong></strong>').text('객실 예약 내역').addClass('tit');
					var txtGuide = $('<p></p>').text('예약일자를 기준으로 현재부터 3개월 이후의 예약 내역을 확인할 수 있습니다.').addClass('txtGuide');
					var ul = $('<ul></ul>').addClass('myReserveList');
					
					$.each(jsonObj.data, function(index, res) {
						var li  = $('<li></li>');
						var a = $('<a></a>').attr('href', '#');
						var myReserveInfo = $('<div></div>').addClass('myReserveInfo');
						var dl = $('<dl></dl>');
						var dt = $('<dt></dt>').text('[' + res.payNum + '] ' + res.roomInfo);
						var dd = $('<dd></dd>').text(res.checkIn + ' - ' + res.checkOut);
						
						dl.append(dt).append(dd);
						myReserveInfo.append(dl);
						a.append(myReserveInfo);
						li.append(a);
						ul.append(li);
					})
					
					var searchAllA = $('<a></a>').attr('href', 'roomResList.do');
					var btn = $('<button></button>').attr('type', 'button').addClass('btnLine').text('전체보기');
					
					searchAllA.append(btn);

					myReserveBox.append(title).append(txtGuide).append(ul).append(searchAllA);
					$('.myContents').append(myReserveBox);
					
				}// end if
			},
			error:function(xhr){
				console.log(xhr.status);
				alert("관리자에게 문의하세요.");
			}
		});
	} // fncMainRoomRes
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
<div class="myContents">
	<h3 class="hidden">마이페이지</h3>
	<!-- 예약 확인 -->
	<h4 class="hidden">예약 확인</h4>

	<!-- loop -->
	<ul class="membershipCashList">
		<li class="noData">
		<p class="txt">예약 내역이 없습니다.<br>엘리시안 호텔의 다양한 상품을 예약해보세요.</p>
		</li>
	</ul>
	<!-- //loop -->
</div>

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