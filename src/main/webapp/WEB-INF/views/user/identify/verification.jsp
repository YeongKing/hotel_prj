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

// 팝업 창 크기 조정 불가능하게 설정
window.onload = function() {
    window.resizeTo(600, 800);
    window.moveTo((screen.width - 600) / 2, (screen.height - 400) / 2);
};

window.onresize = function() {
    window.resizeTo(600, 550);
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
        sendSMS(sanitizedPhone); // 실제 SMS 전송 (추후 테스트 완료 후 사용)

        // SMS 전송 성공 시의 로직을 직접 호출합니다.
        //simulateSMSSuccess(sanitizedPhone); // 테스트용 함수 사용
    } else {
        $('#frm_userPhone').closest('.verifyPhoneFrm').addClass('error');
    }
}

function verifyPopup() {
    if (validateInput('#frm_userNum', '.verifyNumFrm')) {
        if ($("#frm_userNum").val() == code2) {
            alert("인증번호가 일치합니다."); // 인증번호가 일치할 경우
            $("#phoneDoubleChk").val("true");
            $("#frm_userNum").attr("disabled", true);
            fetchUserInfo($("#frm_userPhone").val()); // 회원 정보 조회 함수 호출
        } else {
            alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); // 인증번호가 일치하지 않을 경우
            $("#phoneDoubleChk").val("false");
            $("#frm_userPhone").attr("readonly", false); // 휴대폰 번호 입력 필드 활성화
            $("#phoneChk").attr("disabled", false); // 인증번호 전송 버튼 활성화
            $('#frm_userNum').closest('.verifyNumFrm').addClass('error');
        }
    } else {
        $(".verifyNumFrm .alertMessage").css("display", "block");
        $('#frm_userNum').closest('.verifyNumFrm').addClass('error');
    }
}

// 회원 정보 조회 함수
function fetchUserInfo(phone) {
    $.ajax({
        type: "GET",
        url: "/hotel_prj/user/getUserDetails.do?phone=" + phone, // 하이픈 포함된 전화번호를 사용
        cache: false,
        success: function(data) {
            if (data) {
                $("#userName").text(data.userName); // 회원 이름 표시
                $("#userId").text(data.userId); // 회원 ID 표시
                $("#userResult").css("display", "block"); // 결과 창 표시
                $("#verificationForm").css("display", "none"); // 본인인증 창 숨기기
            } else {
                alert("회원 정보를 가져오지 못했습니다."); // 회원 정보 조회 실패 시 알림
                $("#frm_userPhone").attr("readonly", false); // 휴대폰 번호 입력 필드 활성화
                $("#phoneChk").attr("disabled", false); // 인증번호 전송 버튼 활성화
            }
        },
        error: function(xhr, status, error) {
            alert("회원 정보를 가져오지 못했습니다."); // 회원 정보 조회 실패 시 알림
            $("#frm_userPhone").attr("readonly", false); // 휴대폰 번호 입력 필드 활성화
            $("#phoneChk").attr("disabled", false); // 인증번호 전송 버튼 활성화
        }
    });
}

// 팝업창에서 부모창으로 이동 및 팝업창 닫기
function moveToLogin() {
    window.opener.location.href = "/hotel_prj/user/login.do"; // 부모 페이지에서 리다이렉션
    window.close(); // 팝업 창 닫기
}

// 실제 SMS 전송 함수 (추후 테스트 완료 후 사용)
function sendSMS(phone) {
    $.ajax({
        type: "GET",
        url: "/hotel_prj/user/phoneCheck.do?phone=" + phone, // 하이픈이 제거된 전화번호를 사용
        cache: false,
        success: function(data) {
            if (data === "error") {
                alert("가입된 회원이 아닙니다. 회원가입을 먼저 진행해 주세요."); // DB에 저장된 회원이 아니면 알림
                window.opener.location.href = "/hotel_prj/user/join.do"; // 부모 페이지에서 리다이렉션
                window.close(); // 팝업 창 닫기
            } else {
                alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); // 인증번호 발송 완료 알림
                $("#frm_userNum").attr("disabled", false); // 인증번호 입력 필드 활성화
                $("#frm_userPhone").attr("readonly", true); // 휴대폰 번호 입력 필드 읽기 전용으로 설정
                $("#phoneChk").attr("disabled", true); // 인증번호 전송 버튼 비활성화
                code2 = data; // 전송된 인증번호 저장
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: ", status, error); // AJAX 요청 실패 시 오류 메시지 출력
        }
    });
}

/* SMS 전송 성공을 시뮬레이션하는 함수 (현재 테스트용)
function simulateSMSSuccess(phone) {
    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); // 인증번호 발송 완료 알림
    $("#frm_userNum").attr("disabled", false); // 인증번호 입력 필드 활성화
    $("#frm_userPhone").attr("readonly", true); // 휴대폰 번호 입력 필드 읽기 전용으로 설정
    $("#phoneChk").attr("disabled", true); // 인증번호 전송 버튼 비활성화
    code2 = "123456"; // 테스트용 인증번호 설정
}
*/

$(document).ready(function() {
    $('#frm_userPhone').on('focus', function() {
        $(this).closest('.verifyPhoneFrm').removeClass('error');
    });

    $('#frm_userNum').on('focus', function() {
        $(this).closest('.verifyNumFrm').removeClass('error');
    });

    $('#frm_userPhone').on('input', function() {
        var input = $(this).val().replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
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
            $(this).val(formatted.substr(0, 13)); // 최대 길이 제한
        }
    });

    $("#phoneChk").click(function() {
        gfncNameCert();
    });

    $("#phoneChk2").click(function() {
        verifyPopup();
    });
});
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
    
<!-- 본인인증 결과 창 -->
<div id="userResult" class="container findingBox" style="display:none; margin-top: 50px;">
    <!-- 컨텐츠 S -->
    <h1 class="hidden">아이디 찾기</h1>
    <div class="topArea">
    </div>
    <div class="inner">
        <h3 class="titDep2" style="font-size: 28px;">아이디 / 비밀번호 찾기</h3>
        <div class="txtBox" style="width: 450px !important; margin-left: 70px;">
            <p class="txtBoxTitle">아이디를 확인해 주세요.</p>
            <p class="txtBoxResult"><span id="userName"></span>님의 아이디는<br><em><span id="userId"></span></em> 입니다.</p>
            <div class="btnArea">
                <button type="button" class="btnSC btnL active" onclick="moveToLogin();">로그인 페이지로 이동</button>
            </div>
        </div>
    </div>
</div>


</body>

</html>
