<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 문자 인증</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<!-- E head css -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->

<style type="text/css">
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: gothamL, notokrL;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin-top: -100px;
}

h3 {
    color: #000;
    padding: 0;
    box-sizing: border-box;
    word-break: keep-all;
    word-wrap: break-word;
    font: 500 30px gothamB, notokrR;
    margin: 0 0 15px;
    letter-spacing: -.085em;
}

.verify {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.verify p {
    margin: 10px 0;
    position: relative; /* 부모 요소의 위치 설정 */
}

.verify input {
    margin: 0;
    box-sizing: border-box;
    word-break: keep-all;
    word-wrap: break-word;
    font-weight: 400;
    line-height: 1.8;
    color: #000;
    vertical-align: middle;
    font-size: 18px;
    font-family: gothamL, notokrL;
    width: 50%;
    height: 65px;
    padding: 20px;
    border: none;
    background-color: #f9f9f9;
}

.verify .alertMessage {
    display: none;
    width: 100%;
    color: #b01414;
    font: 500 14px/32px notokrR;
    position: absolute;
    top: -32px;
    left: 0;
    margin-bottom: 10px;
}

body {
    overflow: hidden; /* 스크롤바 숨기기 */
}

.error input {
    border: 1px solid #b01414;
    background-color: #fff6f6;
}

.error .alertMessage {
    display: block;
}
</style>
<script type="text/javascript">
    var code2 = "";
    var userId = "";

    //팝업 창 크기 조정 불가능하게 설정
    window.onload = function() {
        window.resizeTo(600, 800);
        window.moveTo((screen.width - 600) / 2, (screen.height - 400) / 2);
    };

    window.onresize = function() {
        window.resizeTo(750, 750);
    };

    function validateInput(inputSelector, errorClass) {
        var isValid = true;
        var $input = $(inputSelector);
        if ($input.val().trim() === '') {
            $input.closest(errorClass).addClass('error');
            isValid = false;
        } else {
            $input.closest(errorClass).removeClass('error');
        }
        return isValid;
    }

    function isValidPhoneFormat(phone) {
        var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
        return phonePattern.test(phone);
    }

    function removeHyphens(phone) {
        return phone.replace(/-/g, '');
    }

    function gfncNameCert() {
        var phone = $("#frm_userPhone").val();
        if (validateInput('#frm_userPhone', '.verifyPhoneFrm') && isValidPhoneFormat(phone)) {
            var sanitizedPhone = removeHyphens(phone);
            simulateSMSSuccess(sanitizedPhone); // 현재 테스트용 함수 사용
         	// sendSMS(sanitizedPhone); // 실제 SMS 전송 (추후 테스트 완료 후 사용)
        } else {
            $('#frm_userPhone').closest('.verifyPhoneFrm').addClass('error');
        }
    }

    function verifyPopup() {
        if (validateInput('#frm_userNum', '.verifyNumFrm')) {
            if ($("#frm_userNum").val() == code2) {
                alert("인증번호가 일치합니다.");
                $("#phoneDoubleChk").val("true");
                $("#frm_userNum").attr("disabled", true);
                fetchUserInfo($("#frm_userPhone").val());
            } else {
                alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
                $("#phoneDoubleChk").val("false");
                $("#frm_userPhone").attr("readonly", false);
                $("#phoneChk").attr("disabled", false);
                $('#frm_userNum').closest('.verifyNumFrm').addClass('error');
            }
        } else {
            $(".verifyNumFrm .alertMessage").css("display", "block");
            $('#frm_userNum').closest('.verifyNumFrm').addClass('error');
        }
    }

    function fetchUserInfo(phone) {
        $.ajax({
            type: "GET",
            url: "/hotel_prj/user/getUserDetails.do?phone=" + phone,
            cache: false,
            success: function(data) {
                if (data) {
                    $("#userName").text(data.userName);
                    $("#userId").val(data.userId);  // Hidden input에 userId 설정
                    $("#findPwResult").css("display", "block");
                    $("#verificationForm").css("display", "none");
                    window.userId = data.userId;
                } else {
                    alert("회원 정보를 가져오지 못했습니다.");
                    $("#frm_userPhone").attr("readonly", false);
                    $("#phoneChk").attr("disabled", false);
                }
            },
         	// AJAX 요청 실패 시 오류 메시지 출력
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error); 
                alert("회원 정보를 가져오지 못했습니다."); 
                $("#frm_userPhone").attr("readonly", false); 
                $("#phoneChk").attr("disabled", false);
                console.error(xhr.responseText); // 서버 응답의 자세한 내용 출력
            }
        });
    }

    function simulateSMSSuccess(phone) {
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
        $("#frm_userNum").attr("disabled", false);
        $("#frm_userPhone").attr("readonly", true);
        $("#phoneChk").attr("disabled", true);
        code2 = "123456";
        $("#userId").val(window.userId); // 추가: userId 설정
    }
    
    function sendSMS(phone) {
        $.ajax({
            type: "GET",
            url: "/hotel_prj/user/phoneCheck.do?phone=" + phone,
            cache: false,
            success: function(data) {
                if (data === "error") {
                    alert("가입된 회원이 아닙니다. 회원가입을 먼저 진행해 주세요.");
                    window.opener.location.href = "/hotel_prj/user/join.do";
                    window.close();
                } else {
                    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
                    $("#frm_userNum").attr("disabled", false);
                    $("#frm_userPhone").attr("readonly", true);
                    $("#phoneChk").attr("disabled", true);
                    code2 = data;
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
            }
        });
    }

    $(document).ready(function() {
    	$("#userId").val(window.userId); // 추가: userId 설정
        $('#frm_userPhone').on('focus', function() {
            $(this).closest('.verifyPhoneFrm').removeClass('error');
        });

        $('#frm_userNum').on('focus', function() {
            $(this).closest('.verifyNumFrm').removeClass('error');
        });

        $('#frm_userPhone').on('input', function() {
            var input = $(this).val().replace(/[^0-9]/g, '');
            var formatted = '';

            if (input.length > 3) {
                formatted += input.substr(0, 3) + '-';
                input = input.substr(3);
            }

            if (input.length > 4) {
                formatted += input.substr(0, 4) + '-';
                input = input.substr(4);
            }

            formatted += input;
            $(this).val(formatted);

            if (formatted.length >= 13) {
                $(this).val(formatted.substr(0, 13));
            }
        });

        $("#phoneChk").click(function() {
            gfncNameCert();
        });

        $("#phoneChk2").click(function() {
            verifyPopup();
        });
    });

    //패스워드 변경버튼 
    function changePw() {
    	var userId = window.userId;
        var newLoginPassword = jQuery.trim(jQuery("#loginPassword").val());
        var userPwRe = jQuery.trim(jQuery("#loginPasswordRe").val());

        var frstIdx = "";
        jQuery(".inner p").each(function() {
            var $this = jQuery(this);
            var validYn = true;
            $this.find("input[type='text'],input[type='password']").each(function(idx) {
                var value = jQuery(this).val();
                var id = jQuery(this).attr("id");
                if (value == "" && id != "emailType") {
                    validYn = false;
                    if (frstIdx == "") {
                        frstIdx = jQuery(this);
                    }
                }
            });

            if (!validYn) {
                $this.addClass("error");
                $this.find(".alertMessage").show();
            } else {
                $this.removeClass("error");
                $this.find(".alertMessage").hide();
            }
        });

        if (frstIdx != "") {
            frstIdx.focus();
            return false;
        }

        var userPw = jQuery.trim(jQuery("#loginPassword").val());
        var userPwRe = jQuery.trim(jQuery("#loginPasswordRe").val());

        if (!gfncPatternCheck(userPw)) {
            alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
            jQuery("#loginPassword").focus();
            return;
        }

        if (!gfncPatternCheck(userPwRe)) {
            alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
            jQuery("#loginPasswordRe").focus();
            return;
        }

        if (userPw.includes(userId)) {
            alert("비밀번호에 아이디를 포함할 수 없습니다.");
            $("#loginPassword").focus();
            return;
        }

        if (userPwRe.includes(userId)) {
            alert("비밀번호에 아이디를 포함할 수 없습니다.");
            $("#loginPasswordRe").focus();
            return;
        }

        function containsSameCharMaxCnt(src) {
            let localMaxCnt = 0;
            let globalMaxCnt = 0;
            let dummy = '';
            for (var i = 0; i < src.length; i++) {
                if (src[i] == dummy) {
                    localMaxCnt++;
                    globalMaxCnt = Math.max(globalMaxCnt, localMaxCnt);
                } else {
                    localMaxCnt = 0;
                }
                dummy = src[i];
            }
            return globalMaxCnt + 1;
        }

        if (containsSameCharMaxCnt(userPw) >= 3 || containsSameCharMaxCnt(userPwRe) >= 3) {
            alert("비밀번호에 연속된 숫자 또는 문자를 사용할 수 없습니다.");
            $("#loginPassword").focus();
            return;
        }

        if (newLoginPassword !== userPwRe) {
            alert('비밀번호 확인이 일치하지 않습니다.');
            jQuery("#loginPasswordRe").focus();
            return;
        }
        
        var formData = JSON.stringify({
            userId: userId,
            newLoginPassword: newLoginPassword
        });

        console.log("Sending formData: ", formData);
        $.ajax({
            type: "POST",
            url: "modifyUserPw.do",
            data: formData,
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            success: function(response) {
                console.log("Response from server: ", response);
                if (response.resultCode === 'SUCCESS') {
                    alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');
                    window.opener.location.href = "/hotel_prj/user/login.do"; // 부모 페이지에서 리다이렉션
                    window.close(); // 팝업 창 닫기
                } else if (response.resultCode === 'SAMEASCUR') {
                    alert('변경 할 비밀번호가 이전 비밀번호와 동일합니다.');
                } else {
                    alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
                alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
            }
        });

    }
</script>



</head>
<body>
    <!-- 본인인증 창 -->
    <div id="verificationForm" class="container">
        <h3 style="margin-bottom: 30px !important;">휴대폰 문자 인증</h3>
        <div class="verify">
            <p class="verifyPhoneFrm">
                <!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                <span class="alertMessage" style="margin-left: -115px">휴대폰 번호를 입력해주세요.</span>
                <label class="hidden" for="frm_userPhone">휴대폰 번호</label>
                <input type="text" id="frm_userPhone" placeholder="휴대폰 번호" aria-required="true" />
                <button type="button" id="phoneChk" class="btnSC btnM" style="margin-left: 10px; height: 50px; width: 40px;">인증번호 전송</button>
            </p>
            <p class="verifyNumFrm">
                <span class="alertMessage" style="margin-top: 10px; margin-left: -55px;">인증번호를 입력해주세요.</span>
                <label class="hidden" for="frm_userNum">인증번호</label>
                <input type="text" id="frm_userNum" placeholder="인증번호 입력" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){verifyPopup();}" 
                    style="width: 100% !important; margin-top: 10px;"/>
            </p>
            <button type="button" id="phoneChk2" class="btnSC btnL active" style="margin-top: 30px;">본인 인증 확인</button>
        </div>
    </div>
    
    
    <form id="formPwChng">
        <input type="hidden" name="userId" id="userId">
    
	<!-- 본인인증 결과 창 -->
    <div id="findPwResult" class="container findingBox" style="display:none; margin-top: 50px;">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">비밀번호 찾기</h1>
			<div class="topArea">
			</div>
			<div class="inner">
				<h2 class="titDep2" style="font-size: 28px;">비밀번호 재입력</h2>
				<div class="txtBox" style="width: 500px !important; height: 500px !important; margin-left: 50px;">
                    <p class="txtBoxTitle">새로운 비밀번호를 입력해주세요.</p>
                     <!-- 20200716 수정 : 구조/문구(변경/추가) -->
                    <ul class="txtBoxDescription">
                        <li>영문/숫자/특수문자 조합 8~12자리</li>
                        <li>ID 포함, 연속되는 문자/숫자 3자리 이상 사용 불가</li>
                    </ul>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">비밀번호를 입력해주세요.</span>
                        <label class="hidden" for="loginPassword">새 비밀번호</label>
                        <input type="password" id="loginPassword" name="loginPassword"  placeholder="새 비밀번호" aria-required="true" maxlength="12"/>
                    </p>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">동일한 비밀번호를 입력해주세요.</span>
                        <label class="hidden" for="loginPasswordRe">새 비밀번호 확인</label>
                        <input type="password" id="loginPasswordRe" name="loginPasswordRe"  placeholder="새 비밀번호 확인" aria-required="true" maxlength="12"/>
                    </p>
					<div class="btnArea">
                        <button type="button" class="btnSC btnL active btnFull" onclick="changePw(); return false;">확인</button>
                    </div>
				</div>	
                <ul class="txtGuide">
                    <li>변경된 비밀번호는 회원정보에 반영됩니다.</li>
                    <li>수정 완료하신 후 로그인하시면 방문 가능합나다.</li>
                </ul>
            </div>	
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>
		</form>


</body>

</html>
