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

<title>개인정보관리 - 비밀번호변경 | 엘리시안호텔</title>

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
    //패스워드 변경버튼 
 	function fnChngPwApi() {
 		/*
		사용자 입력정보 VALIDATION 체크
		해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
		최초 미입력 된 element로 focus 이동됨
		*/
		var frstIdx = "";
		$(".intList span").each(function(){
			var $this = $(this);
			var validYn = true;
			$this.find("input[type='text'],input[type='password']").each(function(idx){
				var value = $(this).val();
				var id = $(this).attr("id");
				if(value == "" && id != "emailType"){
					validYn = false;
					if(frstIdx == ""){
						frstIdx = $(this);
					} // end if
				} // end if
			});
			
			if(!validYn) {
				$this.addClass("error");
				$this.find(".alertMessage").show();
			} else{
				$this.removeClass("error");
				$this.find(".alertMessage").hide();
			} // end if
		});
		
		if(frstIdx != ""){
			frstIdx.focus();
			return false;
		} // end if
    	
        //--------비밀번호 형식검증------------		
		 var userPw 	= $.trim($("#loginPassword").val());		// 비밀번호 입력
		 var userPwRe 	= $.trim($("#loginPasswordRe").val());		// 비밀번호 재입력 확인
		 var userId = $("#userId").val();
		 
		 	// 비밀번호1 형식 검증
			if(!gfncPatternCheck(userPw, 8, 12)) {
				alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
				$("#loginPassword").focus();
				return;
			} // end if
			
			// 비밀번호2 형식 검증
			if(!gfncPatternCheck(userPwRe, 8, 12)) {
				alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
				$("#loginPasswordRe").focus();
				return;
			} // end if
			
			// 비밀번호1 아이디 포함 검증
			if(userPw.includes(userId)) {
				alert("비밀번호에 아이디를 포함할 수 없습니다.");
				$("#loginPassword").focus();
				return;
			} // end if

			// 비밀번호2 아이디 포함 검증
			if(userPwRe.includes(userId)) {
				alert("비밀번호에 아이디를 포함할 수 없습니다.");
				$("#loginPasswordRe").focus();
				return;
			} // end if
			
			// 비밀번호1 연속된 숫자 또는 문자 검증
			if(containsSameCharMaxCnt(userPw) >= 3 || containsContinuosCharMaxCnt(userPwRe) >= 3) {
				alert("비밀번호에 연속된 숫자 또는 문자를 사용할 수 없습니다.");
				$("#loginPassword").focus();
				return;
			} // end if
			
			// 비밀번호2 연속된 숫자 또는 문자 검증
			if(containsSameCharMaxCnt(userPwRe) >= 3 || containsContinuosCharMaxCnt(userPwRe) >= 3) {
				alert("비밀번호에 연속된 숫자 또는 문자를 사용할 수 없습니다.");
				$("#loginPasswordRe").focus();
				return;
			} // end if
			
			// 비밀번호 확인 일치 검증
			if(userPw != userPwRe) {
				alert('비밀번호 확인이 일치하지 않습니다.');
				$("#loginPasswordRe").focus();
				return;
			} // end if
		
    	//-----------------패스워드 변경API 호출-------------------
 		var formData =  $("#formPwChng").serialize();
 		$.ajax({
			type : "POST",
			url : "modifyMemberpw.do",
		    data : formData, 
			dataType : "json",
			success : function(jsonObj) {
				//신규회원 
				if(jsonObj.resultCode=='SUCCESS' ) { 
					alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');
					goLogout();
				} else if(jsonObj.resultCode=='NOTCURPASS'){
					alert('현재 사용중인 비밀번호가 아닙니다.');
				
				}else if(jsonObj.resultCode=='SAMEASCUR'){
					alert('변경 할 비밀번호가 이전 비밀번호와 동일합니다.');
					
				}else{
					alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
				}
			},
			error:function(){
				alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
			}
		});
 	}
    
 	//회원탈퇴 처리후 로그아웃 실행
    function goLogout() {
        location.href = "${pageContext.request.contextPath}/user/logout.do";
 		//jQuery("#formPwChng").attr("action", "/login/logout.do");
	    //jQuery("#formPwChng").attr("method", "post");
	    //jQuery("#formPwChng").submit();
	} // goLogout
</script>

<form id="formPwChng" >
<input type="hidden" id="userId" value="${userId}">
<div id="container" class="container mypage">
 
<script type="text/javascript">
	$(document).ready(function(){
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
	<h3 class="titDep2">비밀 번호 변경</h3>
	<p class="pageGuide tleft">현재 비밀번호를 올바르게 입력해야만 비밀번호 변경이 가능합니다.</p>
		<div class="frmInfo">
			<ul class="intList">
				<li><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
				<div class="intWrap">
					<span class="tit">
						<label for="userpw">CURRENT PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner">
					<span class="intArea">
						<input type="password" id="curLoginPassword" name="curLoginPassword" placeholder="현재 비밀번호를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">비밀번호를 입력해주세요.</span>
					</span>
				</div>
				</li>

				<li>
				<div class="intWrap">
					<span class="tit">
						<label for="userpw">NEW PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>
                               
     			<div class="intInner">
					<span class="intArea">
						<input type="password" id="newLoginPassword" name="newLoginPassword" placeholder="영문, 숫자, 특수문자 조합 8~12자리를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">비밀번호를 입력해주세요.</span>
					</span>
				</div>   
				                             
				<p class="txtGuide">비밀번호 내 ID가 포함되거나, 연속되는 문자 또는 숫자는 3자리 이상 사용할 수 없습니다.</p>
				</li>
                            
				<li class="intList-repwd">
				<div class="intWrap">
					<span class="tit">
						<label for="userpw-re">CONFIRM PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>

				<div class="intInner">
					<span class="intArea">
						<input type="password" id="loginPasswordRe" name="loginPasswordRe" placeholder="동일한 비밀번호를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">동일한 비밀번호를 입력해주세요.</span>
					</span>
 				</div>
				</li>
			</ul>
		</div>
                    
		<div class="btnArea">
			<button type="button" class="btnSC btnL active" onclick="fnChngPwApi(); return false;">확인</button>
		</div>
	</div>
</div>
<!-- inner -->
</div>
<!-- //container -->
</form>

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->

</body>
</html>