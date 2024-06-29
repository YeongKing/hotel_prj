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

<title>개인정보관리 - 회원탈퇴, 비밀번호 입력 | 엘리시안호텔</title>

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
    //회원탈퇴 신청화면 진입전 패스워드 재확인
	function fncWithDraPwCfmApi() {
		var password = $("#password").val();
		
		if(password.length == 0) {
	      alert('비밀번호를 입력해주세요.');		
	      return;
		} // end if
		
	    $("#loginPassword").val(password);
	    
		var formData =  $("#formWithPwForm").serialize();
		
		$.ajax({
			type : "POST",
			url : "checkPwUserInfo.do",
			data : formData, 
			dataType : "json",
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj) {
				var result = jsonObj.result;
				if(result == "SUCCESS") { 
					goConvertPage();
				} else { 
					alert("비밀번호가 틀렸습니다. 다시 확인해주세요.");
					$("#password").focus();
				} // end else
			},
			error:function(){
				alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
			}
		});
	} // fncWithDraPwCfmApi
    
	//회원탈퇴 페이지 이동
    function goConvertPage() {
    	$("#formWithPwForm").attr("action", "withdraCfmForm.do");
	    $("#formWithPwForm").attr("method", "post");
	    $("#formWithPwForm").submit();
	} // goConvertPage
</script> 

<form id="formWithPwForm">
<input type="hidden" id="loginPassword" name="loginPassword" value=""  />
</form>
  
<div id="container" class="container mypage">

<script type="text/javascript">
 	$(function(){
		fncLnbInfoApi();
	}); 
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
	<p class="pageGuide tleft">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
		<div class="frmInfo">
			<ul class="intList">
				<li><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
				<div class="intWrap">
					<span class="tit">
						<label for="userpw">PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner">
					<span class="intArea">
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요." style="width:1000px" aria-required="true" onkeydown="javascript: if(event.keyCode == 13) {fncWithDraPwCfmApi();}">
						<span class="alertMessage">비밀번호를 입력해주세요.</span>
					</span>
				</div>
				</li>
			</ul>
		</div>
		
		<div class="btnArea">
			<button type="button" class="btnSC btnL" onclick="fncWithDraPwCfmApi();">다음</button>
		</div>
	</div>
	<!-- myContents -->

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