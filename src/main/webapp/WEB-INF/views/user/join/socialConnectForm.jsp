<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- view-source:https://www.josunhotel.com/login/regiSnsMembForm.do -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>SNS 아이디 연결 | 엘리시안호텔</title>

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
<script type="text/javascript">
	 
	var PageScript = function() {}

	PageScript.prototype = {
		init : function() {},
		validate:function(){
			var bResult = true;
			var frstIdx = "";
			$(".txtBox p").each(function(){
				var $this = $(this);
				$this.find("input[type='text'],input[type='password']").each(function(idx){
					var validYn = true;
					var value = jQuery(this).val();
					var id = jQuery(this).attr("id");
					if(value == "" && id != "emailType"){
						validYn = false;
						if(frstIdx == ""){
							frstIdx = jQuery(this);
						}
					}
					if(!validYn){
						$this.addClass("error");
						$this.find(".alertMessage").show();
					}else{
						$this.removeClass("error");
						$this.find(".alertMessage").hide();
					}
				});
			});
			if(frstIdx != ""){
				bResult = false;
				frstIdx.focus();
				return false;
			}
			return bResult;
		},
		fncLogin : function() {
			var userId = jQuery("#userId").val();
			var userPw = jQuery("#userPw").val();
			var socialId = jQuery("#socialId").val();
			var loginMethod = jQuery("#loginMethod").val();
			
			if(PageScript.validate()){
				var param = {
					userId : userId,
					userPw : userPw,
					socialId : socialId,
					loginMethod : loginMethod
				};
	
				$.ajax({
					type: "POST",
					url: "/hotel_prj/user/socialConnect.do",
					data: JSON.stringify(param),
					contentType: "application/json",
					success: function(data) {
						if (data.success) {
							alert("연동이 완료되었습니다. 메인페이지로 이동합니다.");
							location.href = "/hotel_prj/user/index.do";
						} else {
							alert("연동에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.");
						}
					},
					error: function() {
						alert("서버 오류가 발생하였습니다. 관리자에게 문의하세요.");
					}
				});
			}
		}
	}

	$(document).ready(function() {
		PageScript = new PageScript();
		PageScript.init();
	});
</script>	
	
		<div id="container" class="container findingBox">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">로그인</h1><!-- 로그인 -->
			<div class="topArea">
                <h2 class="titDep2">SNS 아이디 연결</h2><!-- SNS 아이디 연결 -->
                <p class="pageGuide">이미 가입되어 있는 엘리시안 아이디가 있으시면 <br>SNS 아이디 연결을 할 수 있습니다.</p><!-- 이미 가입되어 있는 신세계 조선 호텔 아이디가 있으시면 <br>SNS 아이디 연결을 할 수 있습니다. -->
			</div>
			<div class="inner">
				<div class="txtBox">
                    <p class="txtBoxTitle">
                    	
                    		
			                   <em>&apos;${ loginMethod }&apos;</em>&nbsp;계정과 자동으로 연결을 원하시면<br>아이디와 비밀번호 입력 후 확인을 클릭해주세요. 
                    		
                    
                    </p><!-- 계정과 자동으로 연결을 원하시면<br>아이디와 비밀번호 입력 후 확인을 클릭해주세요. -->
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">아이디를 입력해주세요.</span><!-- 아이디를 입력해주세요. -->
                        <label class="hidden" for="userId">아이디</label><!-- 아이디 -->
                        <input type="text" id="userId" name="userId" placeholder="아이디" aria-required="true" /><!-- 아이디 -->
                    </p>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">비밀번호를 입력해주세요.</span><!-- 비밀번호를 입력해주세요. -->
                        <label class="hidden" for="userPw">비밀번호</label><!-- 비밀번호 -->
                        <input type="password" id="userPw" name="userPw" placeholder="비밀번호" aria-required="true" /><!-- 비밀번호 -->
                    </p>
                    <input type="hidden" id="socialId" name="socialId" value="${socialId}">
					<input type="hidden" id="loginMethod" name="loginMethod" value="${loginMethod}">
                    <div class="btnArea">
                        <button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID')">확인</button><!-- 확인 -->
                    </div>
                    <div class="loginLink">
                        <a href="http://localhost/hotel_prj/user/join.do" class="btnS icoArr">회원가입</a><!-- 회원가입 -->
                        <a href="http://localhost/hotel_prj/user/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기</a><!-- 아이디 / 비밀번호 찾기 -->
                    </div>
				</div>
            </div>		
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>

		<!-- //container -->


<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>

<div class="dimmed"></div>
</body>
</html>

