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

<title>개인정보관리 - 회원탈퇴 | 엘리시안호텔</title>

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

<!-- S header -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!-- E header -->
 
<script type="text/javascript">
	//회원탈퇴API 실행(무료회원)
	function withdrawalApi() {
		var formData =  jQuery("#withdraCfmForm").serialize();
		$.ajax({
		type : "POST",
		url : "/mypage/withdrawalApi.do",
		cache : false,
		data : formData, 
		dataType : "json",
		global : false,
		success : function(data) {
			if(data.statusR==200 && data.codeR=='S00000') { 
				/* alert("회원 탈퇴 되었습니다."); */
				alert('회원 탈퇴 되었습니다');
				goLogout();
				
			}else if(data.statusR==400){
			/* 	alert(data.statusR + " : 패스워드가 일치하지 않습니다."); */
				alert(data.statusR + '패스워드가 일치하지 않습니다.');
			}else{ 
				alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
			}
		},
		error:function(){
			alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
		}
	});
	}

	//회원탈퇴 처리후 로그아웃 실행
	function goLogout() {
		jQuery("#withdraCfmForm").attr("action", "/login/logout.do");
	    jQuery("#withdraCfmForm").attr("method", "post");
	    jQuery("#withdraCfmForm").submit();
	}
</script> 

<form id="withdraCfmForm">
</form>
  
<div id="container" class="container mypage">

<script type="text/javascript">
 	$(document).ready(function(){
	 
		fncLnbInfoApi();
 	   
	}); 
  
  	//LNB정보조회(쿠폰수,가용포인트) API호출
 	function fncLnbInfoApi() {
		var formData =  jQuery("#formLnb").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/mypage/lnbInfoApi.do",
			cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				if(data.statusR==200 && data.codeR=='S00000') { 
					  //회원명 세팅
					  var nameHtml = ''+data.name;
				      /* $('.name').html(nameHtml); */
				      $('#nm1').html(nameHtml);
				      //가용포인트 세팅 
				      $('#usefulPointSpan').html(fncComma(data.usefulPoint));
				      //보유쿠폰수 세팅 
				      $('#couponCntDiv').html(fncComma(data.couponCnt));
				}else{
					alert(data.statusR + " : 관리자에게 문의하세요");
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}
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
	<h3 class="titDep2">회원 탈퇴</h3>
	<p class="pageGuide tleft">탈퇴를 신청하시기 전에 아래의 유의사항을 한 번 더 확인해 주시기 바랍나다.</p>
		<div class="cautionBox">
			<span class="tit">유의 사항</span>
			<ul class="listDep1">
				<li>탈퇴를 신청하시면 번복이 불가능합니다.</li>
				<li>개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 및 문의내역 기록도 모두 삭제됩니다.</li>
				<li>탈퇴 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.</li>
			</ul>
		</div>

		<div class="btnArea">
			<button type="button" class="btnSC btnL active" onclick="withdrawalApi();">탈퇴</button>
		</div>
                    
	</div>
</div>
<!-- inner -->

</div>
<!-- //container -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->

</body>
</html>