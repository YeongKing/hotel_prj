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

<title>로그인 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
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

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> <!-- 카카오 -->
<script>
Kakao.init('${kakaoAppKey}'); // 카카오 앱 키

 $(document).ready(function(){
	 
    var userInputId = getLoginCookie("userInputId");//저장된 쿠기값 가져오기
    
    $("#frm_userid").val(userInputId); 
     
    if($("#frm_userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteLoginCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#frm_userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
    
    window.PageScript = new PageScript();
});
 
function setLoginCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteLoginCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getLoginCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

var PageScript = function() {
    this.init();
}

PageScript.prototype = {
    init: function() {
        this.bindSnsLinkEvent();
    },
    validate: function() {
        var bResult = true;
        var frstIdx = "";
        $(".membersLogin p").each(function() {
            var $this = $(this);
            $this.find("input[type='text'],input[type='password']").each(function(idx) {
                var validYn = true;
                var value = jQuery(this).val();
                var id = jQuery(this).attr("id");
                if (value == "" && id != "emailType") {
                    validYn = false;
                    if (frstIdx == "") {
                        frstIdx = jQuery(this);
                    }
                }
                if (!validYn) {
                    $this.addClass("error");
                    $this.find(".alertMessage").show();
                } else {
                    $this.removeClass("error");
                    $this.find(".alertMessage").hide();
                }
            });
        });
        if (frstIdx != "") {
            bResult = false;
            frstIdx.focus();
            return false;
        }
        return bResult;
    },
    fncLogin: function(param_loginSeCode) {
        console.log("fncLogin 호출됨"); // 디버깅 로그
        var frm_userid = "";
        var frm_userpw = "";
        var param_nextUrl = decodeURIComponent("/intro.do");

        // 아이디 로그인시
        if (param_loginSeCode != "SNS") {
            if (PageScript.validate()) {
                console.log("유효성 검사 통과"); // 디버깅 로그

                frm_userid = jQuery("#frm_userid").val(); // 입력된 아이디
                frm_userpw = jQuery("#frm_userpw").val(); // 입력된 비밀번호

                // form 데이터 설정
                jQuery("#loginId").val(frm_userid);
                jQuery("#loginPassword").val(frm_userpw);
                jQuery("#loginSeCode").val(param_loginSeCode);
                jQuery("#nextURL").val(param_nextUrl);

                // 폼 제출
                console.log("폼 제출"); // 디버깅 로그
                jQuery("#form").submit();
            } else {
                console.log("유효성 검사 실패"); // 디버깅 로그
            }         
        }
    },
    bindSnsLinkEvent: function() {
        $('.snsLogin > a').each(function() {
            $(this).bind('click', function() {
                var lnkType = $(this).attr('class');
                switch (lnkType) {
                    case "google":
                    	window.location.href = 'https://accounts.google.com/o/oauth2/auth?client_id=540622652015-mhtf329rjo58t00he69h3au7gr5uk8s8.apps.googleusercontent.com&redirect_uri=http://localhost/hotel_prj/user/googleLogin.do&response_type=code&scope=email profile openid&prompt=login';
                        break;
                    case "facebook":
                        window.open('/sns/facebookLogin.do?fromPageType=LOGIN', 'popupSnsLoginWin', 'width=750,height=850,scrollbars=no,toolbar=no,menubar=no');
                        break;
                    case "naver":
                        window.open('/sns/naverLogin.do?callbackType=login&fromPageType=LOGIN', 'popupSnsLoginWin', 'width=750,height=850,scrollbars=no,toolbar=no,menubar=no');
                        break;
                    case "kakao":
                        Kakao.Auth.authorize({
                            redirectUri: 'http://localhost/hotel_prj/user/kakaoLogin.do',
                            prompts: 'login' //자동 로그인 방지
                        });
                        break;
                    case "apple":
                        window.open('/sns/appleLogin.do?fromPageType=LOGIN', 'popupSnsLoginWin', 'width=750,height=850,scrollbars=no,toolbar=no,menubar=no');
                        break;
                    default:
                        break;
                }
            });
        });
    }
}

$(document).ready(function() {
    window.PageScript = new PageScript();
});

function redirectNextPage(nextURL) {
    window.location.href = nextURL;
}

function redirectPage() {
    var nextURL = decodeURIComponent("/intro.do");
    
    if (nextURL != '') {
        window.location.href = nextURL;
    } else {
        window.location.href = 'main.do';
    }
}

function noMbrLoginPage() {
    $('#form').attr('action', "/login/noMbrLoginForm.do");
    $('#form').attr('target', "_self");
    $('#form').attr('method', "post");
    $('#form').submit();
}

function checkOrigin(origin) {
    const josunhotelDomain = "https://josunhotel.com";
    const josunhotelwwwDomain = "https://www.josunhotel.com";
    const appDomain = "https://app.josunhotel.com";

    if (origin === josunhotelDomain
        || origin === josunhotelwwwDomain
        || origin === appDomain) {
        return true;
    }
    return false;
}

window.addEventListener('message', function(e) {
    if (typeof e.data == "string") {
        if (checkOrigin(e.origin)) {
            if (e.data == "") {
                redirectPage();
            } else {
                redirectNextPage(e.data);
            }
        } else {
            alert("허용되지 않은 도메인");
        }
    }
})
</script>





<!-- 휴면해제 본인인증 page form -->
<form id="releaseIdentifyForm" name="releaseIdentifyForm" method="post">
	<input type="hidden" name="loginId" value="">
    <input type="hidden" name="email" value="">
</form>

<form id="form" name="form" method="post" action="set_session.do">
	<input type="hidden" id="loginId" name="userId" value="" /> 
	<input type="hidden" id="loginPassword" name="userPw" value="" /> 
	<input type="hidden" id="loginSeCode" name="loginSeCode" value="" /> 
	<input type="hidden" id="nextURL" name="nextURL" value="/intro.do" /> 
	<input type="hidden" id="hotlSysCode" name="hotlSysCode" value="" />
		<!-- //header -->
		<div id="container" class="container login">
			<!-- 컨텐츠 S -->
			<h1 class="hidden"><entry key="comm.login.page.msg.0010"></h1>
			<div class="topArea">
				<div class="topInner">
					<h2 class="titDep1">Sign In</h2>
					<p class="pageGuide">
					머무는 모든 순간이 특별해집니다.<!-- 머무는 모든 순간이 특별해집니다. -->
					</p>
				</div>
			</div>
			<div class="inner"> <!-- 소셜 로그인 추가 시 style 제거 -->
				<ul class="tabType01 tabType02">
					<li class="on"><a href="#">
					엘리시안 회원 로그인<!-- 아이디 로그인 -->
					</a></li>
					<!-- 비회원 block
					<li>
						<a href="javascript:return false;" target="_self"
						onclick="noMbrLoginPage()">
						비회원 예약확인<!-- 비회원 예약확인
						</a>
					</li>
						 -->
				</ul>
				<!-- tabCont(아이디 로그인) -->
				<div id="tab01" class="tabCont" style="display: block">
					<h3 class="hidden">
					아이디 로그인<!-- 아이디 로그인 -->
					</h3>
					<div class="loginBox"> <!-- 소셜 로그인 추가 시 style 제거 -->
						<div class="membersLogin"> <!-- 소셜 로그인 추가 시 style 제거 -->
							<p class="loginFrm">
								<!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage">
								아이디를 입력해주세요.<!-- 아이디를 입력해주세요. -->
								</span> 
								<label class="hidden" for="frm_userid">아이디</label> 
								<input type="text" id="frm_userid" placeholder="아이디" aria-required="true" /><!-- 아이디 -->
							</p>
							<p class="loginFrm">
								<span class="alertMessage">비밀번호를 입력해주세요.<!-- 비밀번호를 입력해주세요. --></span> 
								<label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 --> 
								<input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" /><!-- 비밀번호 -->
							</p>
							<!-- 20200528 수정 : 아이디저장(추가) -->
							<!-- 아이디 저장 block 
							<span class="frm"> 
								<input type="checkbox" id="idSaveCheck">
								<label for="idSaveCheck">아이디 저장</label>
							</span>
							<!-- //20200528 수정 : 아이디저장(추가) -->
							<button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID'); return false;">로그인<!-- 로그인 --></button>
							
							<div class="loginLink">
							    <a href="http://localhost/hotel_prj/user/join.do" class="btnS icoArr">회원가입<!-- 회원가입 --></a>
							    <a href="http://localhost/hotel_prj/user/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기<!-- 아이디 / 비밀번호 찾기 --></a>
							</div>
						</div>
						<div class="snsLogin">
                            
                            <!-- 소셜 로그인 -->
							<a href="javascript:void(0);" class="google">구글 로그인</a> 
							<a href="javascript:void(0);" class="facebook">페이스북 로그인</a> 
							
								<a href="javascript:void(0);" class="naver">네이버 로그인</a>
                                
								<a href="javascript:void(0);" class="kakao">카카오톡 로그인</a>
							
							<a href="javascript:void(0);" class="apple">애플 로그인</a>
							<!-- 20200528 수정 : 애플로그인(추가) -->
						</div>
					</div>
				</div>
				<ul class="txtGuide">
					<li>오프라인 회원의 경우 온라인 회원가입 후 이용이 가능합니다.<!-- 오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다. --></li>
                    <li>유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다.<!--유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다. --></li>
                    
                    
                    
                    
					<!-- 20200528 수정 : 가이드(문구변경) -->
				</ul>
				<!-- //tabCont(아이디/카드번호 로그인) -->
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>
		<!-- //container -->

</form>
<div class="dimmed" style="display: none"></div>
<!--- //Login(Layer Popup) -->
		<!-- //container -->
		
		
		
		
       <!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
 		
 		
	</div>
	<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>