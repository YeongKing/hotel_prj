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

<title>회원가입 - 약관동의 및 회원정보 입력 | 엘리시안호텔</title>

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

<!-- <script type="text/javascript" src="/static/home/js/home.js"></script> -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

    //체크박스 클릭시 실행
    // jQuery 문서가 준비되면 실행
    $(document).ready(function () {
        // 동의항목 전체 선택 처리
        var $frmChk00 = $('#frmChk00');
        $frmChk00.change(function () {
            var $this = $(this);
            var checked = $this.prop('checked'); // 체크 여부 확인 (true, false 반환)
            $this.closest(".agreeBox").find('input[name="mberAgreChk"]').prop('checked', checked); // 모든 'mberAgreChk' 체크박스를 동일한 상태로 설정
        }); //전체동의 change

        // 개별 동의항목 처리
        var $mberAgres = $('input[name="mberAgreChk"]');
        $mberAgres.change(function () {
            var $agreeBox = $(this).closest(".agreeBox");
            var $mberAllChk = $agreeBox.find(".frmAll input[type='checkbox']");

            var agresLength = $agreeBox.find($mberAgres).length;
            var checkedLength = $agreeBox.find('input[name="mberAgreChk"]:checked').length;

            var selectAll = (agresLength == checkedLength);
            $mberAllChk.prop('checked', selectAll); // 모든 항목이 선택된 경우 전체 선택 체크박스도 선택
        });//개별동의 change
        
        
      

        $("#nationCode").on("change", function () {
            updateUserNameField();
            validateUserName();
        });//change
        
        $("#eName1, #eName2").on("input", function () {
            updateUserNameField();
        });


        $("#userName").on("input", function () {
            validateUserName();
        });//input
		
        // 초기 상태 설정
       // updateUserNameField();
        
        
        // 이메일 유형 선택 시 처리 ///////////////////////////////////
        $("#emailType").on("change", function () {
		    var value = $(this).val();
		    if (value == "") {
		        $("#email2").val("");
		        $("#email2").prop("readonly", false);
		    } else {
		        $("#email2").val(value);
		        $("#email2").prop("readonly", true);
		    }
		});//change


        // 아이디 영문, 숫자만 입력하도록 처리 //////////////////////////////
		$("#userId").on("keyup", function (e) {
		    if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
		        var inputVal = $(this).val();
		        $(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
		    }
		});//keyup

        
        //문자인증 및 인증번호 확인 기능 /////////////////////////////////////
		$("#phoneChk").click(function() {
		    gfncNameCert();
		});//click

		$("#phoneChk2").click(function() {
		    verifyPopup();
		});//click
        
		
		//전화번호 입력 시 포맷팅 ///////////////////////////////////////////
		$('#userPhone').on('focus', function() {
		    $(this).closest('.verifyPhoneFrm').removeClass('error');
		});//focus
		
		$('#userPhoneVerify').on('focus', function() {
		    $(this).closest('.verifyNumFrm').removeClass('error');
		});//focus

		$('#userPhone').on('input', function() {
		    var input = $(this).val().replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
		    var formatted = '';

		    if (input.length > 3) {
		        formatted += input.substr(0, 3) + '-';
		        input = input.substr(3);
		    }//end if

		    if (input.length > 4) {
		        formatted += input.substr(0, 4) + '-';
		        input = input.substr(4);
		    }//end if

		    formatted += input;
		    $(this).val(formatted);

		    if (formatted.length >= 13) {
		        $(this).val(formatted.substr(0, 13)); // 최대 길이 제한
		    }//end if
		});//input
		
		//생년월일////////////////////////////////////
		$("#userBirth").on("input", function() {
	        formatBirthDate(this);
	    }).on("blur", function() {
	        validateBirthDate(this);
	    });
        
    });//ready
    
    var natFlag=false;
    // 국가 코드 변경 시 처리 /////////////////////////////////////////////
    function updateUserNameField() {
    	
        var selectedCountry = $("#nationCode").val();
        if (selectedCountry !== "KR") {
            //$("#userNameField").hide(); // 필드를 숨김
            var eName1 = $("#eName1").val().toUpperCase();
            var eName2 = $("#eName2").val().toUpperCase();
            $("#userName").val(eName2 + " " + eName1);
            //$("#userName").val($("#eName2").val()+" "+$("#eName1").val()); //한국이름을 영어 이름 조합으로 설정
            $("#userName").attr("readonly",true)
            natFlag=false;    
        } else{ 
        	natFlag=true;
        	//alert("한국이름")
            $("#userName").attr("readonly",false)
        }
    }//updateUserNameField

    function validateUserName() {
        var selectedCountry = $("#nationCode").val();
        if (selectedCountry === "KR") {
            var userName = $("#userName").val();
            // 한글만 입력 가능하고 최대 10글자로 제한
            var validUserName = userName.replace(/[^가-힣]/g, '').substring(0, 10);
            $("#userName").val(validUserName);

            if (validUserName.length === 0 || validUserName.length > 10) {
                $("#userNameField").addClass('error');
                $("#userNameField .alertMessage").text("이름은 한글만 입력 가능하며 10자 이하로 입력해 주세요.").removeClass('hidden');
            } else {
                $("#userNameField").removeClass('error');
                $("#userNameField .alertMessage").addClass('hidden');
            }
        } else {
            $("#userNameField").removeClass('error');
            $("#userNameField .alertMessage").addClass('hidden');
        }//end if
    }//validateUserName

    var registFlag = false;

    //회원가입 요청
    function fncRegist() {
        var eName1 = jQuery.trim(jQuery("#eName1").val());  // 영문 성
        var eName2 = jQuery.trim(jQuery("#eName2").val());  // 영문 이름
        var userName = jQuery.trim(jQuery("#userName").val());  // 한글 이름
        var userId = jQuery.trim(jQuery("#userId").val());  // 아이디 입력
        var userPw = jQuery.trim(jQuery("#userPw").val());  // 비밀번호 입력
        var userPwRe = jQuery.trim(jQuery("#userPwRe").val());  // 비밀번호 재입력 확인
        var genderCode = jQuery.trim(jQuery("#genderCode").val());  // 성별
        var postcode = jQuery.trim(jQuery("#postcode").val());  // 우편번호
        var userBirth = jQuery.trim(jQuery("#userBirth").val());  // 생일
        var address = jQuery.trim(jQuery("#address").val());  // 주소
        var detailAddress = jQuery.trim(jQuery("#detailAddress").val()); // 상세주소
        var email1 = jQuery.trim(jQuery("#email1").val());  // 이메일1 입력
        var email2 = jQuery.trim(jQuery("#email2").val());  // 이메일2 입력
        var email = email1 + "@" + email2;  // 이메일 조합
        var nationCode = jQuery("#nationCode option:selected").val();
        var addressType = $('input[name="addressType"]:checked').val();
        var loginMethod = jQuery.trim(jQuery("#loginMethod").val()); //로그인 방법 일반으로 고정
        jQuery("#email").val(email);  // 이메일 조합형 hidden 세팅
        jQuery("#nationCodeH").val(nationCode);  // 국가코드 설정
		
        
     	// 약관 동의 체크
        if (!$('#frmChk01').is(':checked')) {
            alert("이용 약관에 동의해 주세요.");
            return;
        }

        // 약관동의 처리
        var chkArray = [];
        $('input[name="mberAgreChk"]').each(function() {
            if (this.id !== 'frmChk01') {  // frmChk01은 별도로 체크하므로 제외
                if ($(this).is(":checked")) {
                    chkArray.push(this.value + "Y");
                } else {
                    chkArray.push(this.value + "N");
                }
            }
        });
        $('#mberAgreArrH').val(chkArray);
        
        /*
        사용자 입력정보 VALIDATION 체크
        해당 열 input, select 박스가 하나라도 미기재 된 경우 validation false
        최초 미입력 된 element로 focus 이동됨
        */
        var frstIdx = "";
        jQuery(".intList li").each(function () {
            var $this = jQuery(this);
            var validYn = true;
            $this.find("input[type='text'],input[type='password']").each(function (idx) {
                var value = jQuery(this).val();
                var id = jQuery(this).attr("id");
                if (value == "" && id != "emailType" && id != "recomdrId" && id != "recomdrId2" && id != "cmpgnCode") {
                    validYn = false;
                    if (frstIdx == "") {
                        frstIdx = jQuery(this);
                    }
                }
                // 한글 이름 유효성 검사 추가
                if (id == "userName" && natFlag) {
                    var pattern_kor = /^[가-힣]+$/; // 한글만
                    if (value.length > 0) {
                        if (!pattern_kor.test(value)) {
                            validYn = false;
                            if (frstIdx == "") {
                                frstIdx = jQuery(this);
                            }
                            jQuery(this).closest('li').addClass('error');
                            jQuery(this).siblings('.alertMessage').text("이름은 한글만 입력 가능합니다.").show();
                        } else {
                            jQuery(this).closest('li').removeClass('error');
                            jQuery(this).siblings('.alertMessage').hide();
                        }
                    } else {
                        validYn = false;
                        if (frstIdx == "") {
                            frstIdx = jQuery(this);
                        }
                        jQuery(this).closest('li').addClass('error');
                        jQuery(this).siblings('.alertMessage').text("이름은 필수 입력값으로, 한글로 입력해주세요.").show();
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

        // 회원가입 약관 동의
        if ($("input:checkbox[id='frmChk01']").is(":checked") == false) {
            alert("이용 약관에 동의해 주세요.");
            jQuery("#frmChk01").focus();
            return;
        }

        // 개인정보 수집ㆍ이용 동의
        if ($("input:checkbox[id='frmChk01']").is(":checked") == false) {
            alert("개인정보 수집ㆍ이용에 동의해 주세요.");
            jQuery("#frmChk01").focus();
            return;
        }

        // 영문(성) 체크
        if (eName1.length > 0) {
            var pattern_eng = /[a-zA-Z]/;  // 문자
            if (!pattern_eng.test(eName1)) {
                alert("영문(성)은 영문만 입력 가능합니다.");
                jQuery("#eName1").focus();
                return;
            }
        } else {
            alert("영문(성)은 필수 입력값 입니다.");
            jQuery("#eName1").focus();
            return;
        }

        // 영문(이름) 체크
        if (eName2.length > 0) {
            var pattern_eng = /[a-zA-Z]/;  // 문자
            if (!pattern_eng.test(eName2)) {
                alert("영문(이름)은 영문만 입력 가능합니다.");
                jQuery("#eName2").focus();
                return;
            }
        } else {
            alert("영문(이름)은 필수 입력값 입니다.");
            jQuery("#eName2").focus();
            return;
        }
        
     	// 한글이름 형식 검증
        if (userName.length === 0) {  // 이름이 비어 있는 경우 경고 메시지 표시
            alert('이름은 필수 입력값 입니다.');
            jQuery("#userName").focus();
            return;
        }

        // 비밀번호1 형식 검증
        if (!gfncPatternCheck(userPw)) {
            alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
            jQuery("#userPw").focus();
            return;
        }
        
        // 비밀번호2 형식 검증
        if (!gfncPatternCheck(userPwRe)) {
            alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
            jQuery("#userPwRe").focus();
            return;
        }

        // 비밀번호 확인 일치 검증
        if (userPw != userPwRe) {
            alert('비밀번호 확인이 일치하지 않습니다.');
            jQuery("#userPwRe").focus();
            return;
        }
        
     	// 전화번호 유효성 검사 추가
        var userPhone = jQuery.trim(jQuery("#userPhone").val());
        if (userPhone.length < 1) {
            alert("전화번호를 입력해주세요.");
            jQuery("#userPhone").focus();
            return;
        }
        var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
        if (!phonePattern.test(userPhone)) {
            alert("올바른 전화번호를 입력해 주세요.");
            jQuery("#userPhone").focus();
            return;
        }

        // 우편번호 체크
        if (postcode.length > 0) {

        } else {
            alert("주소입력은 필수 입니다.");
            jQuery("#postcode").focus();
            return;
        }

        // 주소 체크
        if (address.length > 0) {

        } else {
            alert("주소입력은 필수 입니다.");
            jQuery("#address").focus();
            return;
        }

        // 상세주소 체크
        if (detailAddress.length > 0) {

        } else {
            alert("상세주소입력은 필수 입니다.");
            jQuery("#detailAddress").focus();
            return;
        }
        
     	// 생년월일 유효성 검사
        if (!isValidDate(userBirth)) {
            alert("유효하지 않은 생년월일입니다");
            jQuery("#userBirth").focus();
            return;
        }

        // 이메일 형식 검증
        if (!gfncEmailCheck(email)) {
            alert("이메일 형식을 다시 확인해 주세요.");
            jQuery("#email1").focus();
            return;
        }
        
     	// 인증번호 확인 버튼이 비활성화 상태인지 확인
        if (!$("#phoneChk2").prop("disabled")) {
            alert("인증번호 확인을 완료해 주세요");
            return;
        }

        //이메일,아이디 중복체크 여부
        var emailDupChkYn = jQuery("#emailDupChkYn").val();
        var idDupChkYn = jQuery("#idDupChkYn").val();
        
        if (idDupChkYn != 'Y') {
            alert("아이디 중복체크가 필요합니다");
            return;
        }
        
        if (emailDupChkYn != 'Y') {
            alert("이메일 중복체크가 필요합니다");
            return;
        }
        

        if (!registFlag) {

            registFlag = true;

            //회원가입 요청
            var formData = jQuery("#formJoin").serialize();
            jQuery.ajax({
                type: "POST",
                url: "/hotel_prj/user/joinInsert.do",
                cache: false,
                data: formData,
                dataType: "json",
                global: false,
                success: function (data) {
                    if (data.statusR == 200) {
                        //전달받은 멤버십번호가 존재할 경우 완료페이지
                        goJoinComplete();
                    } else {
                        registFlag = false;
                        //alert("관리자에게 문의하세요.");
                        //alert(data.messageR + "(" + data.statusR + " : " + data.codeR + ")");
                        alert(data.statusR + " : " + data.codeR + " : " + data.messageR);
                        return;
                    }
                },
                error: function () {
                    registFlag = false;
                    alert("관리자에게 문의하세요");
                    return;
                }
            });
        }
    }

    //일반 회원가입 완료페이지
    function goJoinComplete() {
        jQuery("#formJoin").attr("action", "joinComplete.do");
        jQuery("#formJoin").attr("method", "post");
        jQuery("#formJoin").submit();
    }
    
  	//한글 이름
    function fncUserNameChk() {

        //전화번호 입력여부 확인alert
        var userName = jQuery.trim(jQuery("#userName").val());
        if (id.length < 1) {
            alert("입력된 이름이 없습니다.");
            return false;
        }
  	}
        
    //아이디 중복체크
    function fncIdDupChk() {

        //아이디 입력여부 확인alert
        var id = jQuery.trim(jQuery("#userId").val());
        if (id.length < 1) {
            alert("입력된 아이디가 없습니다.");
            return false;
        }

        var userId = jQuery.trim(jQuery("#userId").val());// 아이디 입력
        //사용자아이디 소문자변환
        jQuery("#userId").val(userId.toLowerCase());

        //아이디 유효성 체크
        function chkId(userId) {
            var id = userId;
            var num = id.search(/[0-9]/g);
            var eng = id.search(/[a-z]/ig);
            var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            if (id.length < 8 || id.length > 12) {
                alert("아이디는 8자리 ~ 12자리 이내로 입력해주세요.");
                return false;
            } else if (id.search(/\s/) != -1) {
                alert("아이디는 공백 없이 입력해주세요.");
                return false;
            } else if (num < 0 || eng < 0) {
                alert("아이디는 영문,숫자를 혼합하여 입력해주세요.");
                return false;
            } else if (spe > 0) {
                alert("아이디는 특수문자 입력이 불가합니다.");
                return false;
            } else {
                return true;
            }
        }

        //아이디 유효성 체크
        if (!chkId(userId)) {
            jQuery("#userId").focus();
            return;
        }

        var formData = jQuery("#formJoin").serialize();
        jQuery.ajax({
            type: "POST",
            url: "/hotel_prj/user/chk_id.do",
            cache: false,
            data: formData,
            dataType: "json",
            global: false,
            success: function (data) {

                if (data.statusR == 200 && data.codeR == 'S00000') {
                    alert("사용가능한 ID입니다.");
                    //아이디중복체크 확인여부
                    jQuery("#idDupChkYn").val("Y");
                } else if (data.statusR == 400) {
                    alert("이미 사용중인 ID입니다.");
                } else {
                    alert(data.statusR + ": 관리자에게 문의하세요.");
                }
            },
            error: function () {
                alert("관리자에게 문의하세요.");
            }
        });
    }
    
 	// 생년월일 입력 형식 처리
    function formatBirthDate(input) {
        // 숫자와 '-'만 남기기
        var value = input.value.replace(/[^0-9]/g, '');

        // 년도 처리
        if (value.length > 4) {
            value = value.slice(0, 4) + '-' + value.slice(4);
        }

        // 월 처리
        if (value.length > 7) {
            value = value.slice(0, 7) + '-' + value.slice(7);
        }

        // 최대 길이 제한
        if (value.length > 10) {
            value = value.slice(0, 10);
        }

        input.value = value;
    }

    // 생년월일 유효성 검사 함수
    function isValidDate(dateString) {
        // 날짜 형식 확인 (YYYY-MM-DD)
        var regex = /^\d{4}-\d{2}-\d{2}$/;
        if (!regex.test(dateString)) return false;

        var parts = dateString.split("-");
        var year = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10);
        var day = parseInt(parts[2], 10);

        // 년도 범위 확인
        var currentYear = new Date().getFullYear();
        if (year < 1900 || year > currentYear) return false;

        // 월 범위 확인
        if (month < 1 || month > 12) return false;

        // 일 범위 확인
        var monthDays = [31, (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        if (day < 1 || day > monthDays[month - 1]) return false;

        return true;
    }

    // 생년월일 유효성 검사 후 경고 메시지 표시
    function validateBirthDate(input) {
        var value = input.value;
        var alertMessage = input.nextElementSibling; // alertMessage 요소

        if (!isValidDate(value)) {
            alertMessage.style.display = 'block';
            alertMessage.innerText = "유효하지 않은 생년월일입니다.";
        } else {
            alertMessage.style.display = 'none';
        }
    }



 	// 이메일 중복체크
    function fncEmlDupChk() {
        // 이메일 데이터 조합
        var email1 = jQuery.trim(jQuery("#email1").val()); // 이메일1 입력
        var email2 = jQuery.trim(jQuery("#email2").val()); // 이메일2 입력
        var email = email1 + "@" + email2; // 이메일 조합
        jQuery("#email").val(email);

        // 이메일 입력여부 확인
        if (email1.length < 1 || email2.length < 1) {
            alert("입력된 이메일이 없습니다.");
            return false;
        }

        var formData = jQuery("#formJoin").serialize();
        jQuery.ajax({
            type: "POST",
            url: "/hotel_prj/user/chk_email.do",
            cache: false,
            data: { email: email }, // 이메일 파라미터를 명시적으로 포함
            dataType: "json",
            global: false,
            success: function (data) {
                if (data.statusR == 200 && data.codeR == 'S00000') {
                    alert("사용가능한 email입니다.");
                    // 이메일 중복체크 확인여부
                    jQuery("#emailDupChkYn").val("Y");
                } else if (data.statusR == 400) {
                    alert("이미 사용중인 email입니다.");
                }
            },
            error: function () {
                alert("관리자에게 문의하세요.");
            }
        });
    }

    /**
     * 이메일 형식 체크
     * @param str    검증 문자열
     * @returns {Boolean}
     */
    function gfncEmailCheck(str) {
        var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

        //입력을 안했으면
        if (str.lenght == 0) {
            return false;
        }

        //이메일 형식에 맞지않으면
        if (str.match(regExp)) {
            return true;
        }

        return false;
    }

    /*---------------주소검색 시작--------------------------------- */
    var themeObj = {
        bgColor: "#162525", //바탕 배경색
        searchBgColor: "#162525", //검색창 배경색
        contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
        pageBgColor: "#162525", //페이지 배경색
        textColor: "#FFFFFF", //기본 글자색
        queryTextColor: "#FFFFFF", //검색창 글자색
        //postcodeTextColor: "", //우편번호 글자색
        //emphTextColor: "", //강조 글자색
        outlineColor: "#444444" //테두리
    };

    //신주소 입력
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }


    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition() {
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
    }

    /*---------------주소검색 종료--------------------------------- */

    //회원가입 취소버튼 클릭시
    function fncCancel() {
        var result = confirm("회원가입을 취소하시겠습니까?");
        if (result) {

        	jQuery("#formJoin").attr("action", "/hotel_prj/user/index.do");
            jQuery("#formJoin").attr("method", "post");
            jQuery("#formJoin").submit();
        } else {
            return;
        }

    }

    //아이디수정시 중복체크여부 초기화(N)
    function idDupInit() {
        jQuery("#idDupChkYn").val("N");
    }

    //이메일수정시 중복체크여부 초기화(N)
    function emailDupInit() {
        jQuery("#emailDupChkYn").val("N");
    }
 	
    
    //문자인증 관련
	var code2; //인증번호 저장 변수
    
	function isValidPhoneFormat(phone) {
        var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
        return phonePattern.test(phone);
    }

    function removeHyphens(phone) {
        return phone.replace(/-/g, '');
    }

    function gfncNameCert() {
        var phone = $("#userPhone").val();

        if (phone.trim() === "") {
            alert("전화번호를 입력해주세요.");
            return;
        }

        if (isValidPhoneFormat(phone)) {
            var sanitizedPhone = removeHyphens(phone);
            sendSMSToServer(sanitizedPhone);
        } else {
            alert("올바른 전화번호를 입력해 주세요.");
            $('#userPhone').closest('.verifyPhoneFrm').addClass('error');
        }
    }

    function sendSMSToServer(phone) {
        $.ajax({
            type: "POST",
            url: "/hotel_prj/user/sendSMS.do",
            data: { userPhone: phone },
            success: function(response) {
                if (response.status === "success") {
                    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
                    $("#userPhoneVerify").attr("disabled", false);
                    code2 = response.code; // 서버에서 받은 인증번호를 저장
                } else {
                    alert("문자 전송에 실패했습니다. 관리자에게 문의하세요.");
                }
            },
            error: function() {
                alert("문자 전송에 실패했습니다. 관리자에게 문의하세요.");
            }
        });
    }

    function verifyPopup() {
        if ($("#userPhoneVerify").val() == code2) {
            alert("인증번호가 일치합니다.");
            $("#userPhoneVerify").attr("disabled", true);
            $("#phoneChk").attr("disabled", true);
            $("#phoneChk2").attr("disabled", true); // phoneChk2 버튼 비활성화
            $("#userPhone").attr("readonly", true); // userPhone 필드 읽기 전용
        } else {
            alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
            $('#userPhoneVerify').closest('.verifyNumFrm').addClass('error');
        }
    }

	/* 테스트용
    function simulateSMSSuccess(phone) {
        console.log("Simulating SMS success for phone:", phone);
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
        $("#userPhoneVerify").attr("disabled", false);
        code2 = "123456"; // 테스트용 인증번호 설정
    }
	*/
    
</script>

<form id="formJoin" name="formJoin">
	<!-- 이메일 조합용 -->
	<input type="hidden" id="email" name="email" value="">
	<!-- 로그인 방법 설정용 -->
	<input type="hidden" id="loginMethod" name="loginMethod" value="일반">

	<!-- 문자인증 전송 실행여부 -->
	<input type="hidden" id="phoneChkYn" name="phoneChkYn" value="N"/>
	<!-- 문자인증 인증번호 확인여부 -->
	<input type="hidden" id="phoneChk2Yn" name="phoneChk2Yn" value="N"/>

    <!--아이디 중복체크 실행여부  -->
    <input type="hidden" id="idDupChkYn" name="idDupChkYn" value="N"/>
    <!--이메일 중복체크 실행여부  -->
    <input type="hidden" id="emailDupChkYn" name="emailDupChkYn" value="N"/>

    <div id="container" class="container join">
        <!-- 컨텐츠 S -->
        <h1 class="hidden">회원가입</h1>
        <div class="topArea">
            <div class="topInner">
                <h2 class="titDep1">Join Now</h2>
                <div class="stepWrap">
                    <ol>
                        <li class="prev"><em>본인 인증</em></li>
                        <li class="on"><span class="hidden">현재단계</span><em>약관동의 및 회원정보 입력</em></li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="inner">
            <h2 class="titDep2">회원가입 약관</h2>
            <!-- 20200720 수정 -->
            <p class="pageGuide tleft">엘리시안은 체계적인 회원 정보 관리를 위하여 아래와 같이 개인정보를 수집·이용 및 제공하고자 합니다.<br>내용을 자세히 읽으신 후 동의
                여부를 결정하여 주시기 바랍니다.</p>
            <!-- //20200720 수정 -->
            <div class="agreeBox">
                <div class="nonToggle">
                        <span class="frm frmAll">
                            <input type="checkbox" id="frmChk00"><label for="frmChk00">전체동의</label>
                        </span>
                    <ul class="listInfo">
                        <li>아래 동의 항목을 개별 확인 후 동의하실 수 있습니다.</li>
                    </ul>
                    
                </div>
                <!-- 20200720 수정 -->
                <ul class="toggleList agreeCont">
                    <!-- 20200709 수정 : (.toggleList → .toggleList.agreeCont) 약관통합class(추가) -->
                    <li>
							<span class="frm type02">
								<input type="checkbox" id="frmChk01" name="mberAgreChk" value="A0001"><label
                                    for="frmChk01">[필수] 개인정보수집 및 이용에 대한 동의</label>
							</span>
                        <button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
                        <div class="toggleCont">
                            <div class="toggleInner">
                                <p class="notiTxt">엘리시안은 회원가입과 관련하여 아래와 같은 개인정보를 수집 및 이용하고 있습니다.<br>개인정보 처리에 대한
                                    상세한 사항은 엘리시안 홈페이지의 '개인정보처리방침'을 참조하십시오.</p>
                                <p class="notiTxt">본 개인정보 수집 및 이용 동의서의 내용과 상충되는 부분은 본 동의서의 내용이 우선합니다.</p>
                                <table class="tblH">
                                    <colgroup>
                                        <col style="width:33%">
                                        <col style="width:34%">
                                        <col style="width:auto">
                                    </colgroup>
                                    <caption>개인정보수집 및 이용에 대한 동의 목록</caption>
                                    <thead>
                                    <tr>
                                        <th scope="col">수집 항목</th>
                                        <th scope="col">수집 목적</th>
                                        <th scope="col">보유 기간</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="tcenter">회원 ID, 비밀번호, 이름, 생년월일, 국적, 성별, 휴대폰번호, 주소</th>
                                        <td>서비스 이용자 식별 및 본인, 14세 이상 여부 확인</td>
                                        <td class="f18" rowspan="3">회원탈퇴 시 까지</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="tcenter">휴대폰번호, 이메일주소</th>
                                        <td>계약 이행을 위한 연락 및 민원업무 처리 등의 의사소통</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <p class="txtGuide">위의 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으나 동의를 거부하실 경우 회원가입, 엘리시안 호텔 서비스 이용이
                                    불가합니다.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <h2 class="titDep2">필수정보 입력</h2>
            <div class="frmBox">
                <div class="userInfo">
                    <!-- [국문] 휴대폰인증 후, Default -->
                    <dl>
                        <dt>회원정보</dt>
						<!-- 통신사 본인인증 불가
                        <dd>
                            
                            FEMALE
                        </dd>
                        <dd>01039299258</dd>
                        <dd>1992.10.15</dd>
                         -->
                    </dl>
                </div>
                <div class="frmInfo">
                    <ul class="intList">
                        <li class="error"> <!-- 미입력 일 경우 error 클래스 추가 alertMessage 노출 -->
                            <div class="intWrap"><span class="tit"><label for="eName">ENGLISH NAME</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner duobuleInp">
                                <span class="intArea"><input type="text" id="eName1" name="eName1" maxlength="35"
															 placeholder='Family Name (성)' style="width:515px;"
                                                             aria-required="true"
                                                             onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();"><span
                                        class="alertMessage">영문만 입력 가능하며, 띄어쓰기도 문자로 인식됩니다.</span></span>
                                <span class="intArea"><input type="text" id="eName2" name="eName2" maxlength="35"
															 placeholder='First Name (이름)' style="width:515px"
                                                             aria-required="true"
                                                             onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();"></span>
                            </div>
                        </li>
                        
                        
						<!-- 한글이름 -->
						<li id="userNameField"> <!-- 미입력 일 경우 error 클래스 추가 alertMessage 노출 -->
						    <div class="intWrap">
						        <span class="tit"><label for="userName">KOREAN NAME (or English full name)</label><span class="essential">필수</span></span>
						    </div>
						    <div class="intInner">
						        <span class="intArea">
						            <input type="text" id="userName" name="userName" maxlength="35" placeholder="이름" 
						            style="width:515px;" aria-required="true"/>
						            <span class="alertMessage hidden">이름을 입력해 주세요.</span>
						        </span>
						    </div>
						</li>

						
						<!-- 휴대폰 본인 인증 -->
						<li>
						    <div class="intWrap">
						        <span class="tit"><label for="userPhone">PHONE NUMBER</label><span class="essential">필수</span></span>
						    </div>
						    <div class="intInner">
						        <span class="intArea">
						            <input type="text" id="userPhone" name="userPhone" placeholder="(ex) 01012345678" style="width:200px" aria-required="true">
						            <span class="alertMessage" style="display: none;">전화번호를 입력해주세요.</span>
						        </span>
						        <button type="button" class="btnSC btnM" id="phoneChk">문자인증</button>
						    </div>
						</li>
						
						<li>
						    <div class="intWrap">
						        <span class="tit"><label for="userPhoneVerify">Verification</label><span class="essential">필수</span></span>
						    </div>
						    <div class="intInner">
						        <span class="intArea">
						            <input type="text" id="userPhoneVerify" name="userPhoneVerify" placeholder="숫자 6자리" style="width:200px" aria-required="true">
						            <span class="alertMessage" style="display: none;">인증번호를 입력해주세요.</span>
						        </span>
						        <button type="button" class="btnSC btnM active" id="phoneChk2">인증번호 확인</button>
						    </div>
						</li>
						
						<li>
						    <div class="intWrap">
						        <span class="tit"><label for="userId">ID</label><span class="essential">필수</span></span>
						    </div>
						    <div class="intInner">
						        <span class="intArea">
						            <input type="text" id="userId" name="userId" onkeyup="javascript:idDupInit();" placeholder="영문/숫자 조합으로 8 ~ 12자리로만 가능합니다." style="width:515px" aria-required="true">
						            <span class="alertMessage" style="display: none;">아이디를 입력해주세요.</span>
						        </span>
						        <button type="button" class="btnSC btnM" onclick="fncIdDupChk(); return false;">ID 중복 확인</button>
						    </div>
						</li>

                        <li>
                            <div class="intWrap"><span class="tit"><label for="">PASSWORD</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner">
                                <span class="intArea"><input type="password" id="userPw" name="userPw"
                                                             placeholder="영문/숫자/특수문자를 사용하며, 8 ~ 12자리로만 가능합니다."
                                                             style="width:515px" aria-required="true"><span
                                        class="alertMessage">비밀번호를 입력해주세요.</span></span>
                            </div>
                            <p class="txtGuide">비밀번호 내 ID가 포함되거나, 연속되는 문자 또는 숫자는 3자리 이상 사용할 수 없습니다.</p>
                            <p class="txtGuide">특수문자(!@#$%^&+=)중 하나를 선택하시면 됩니다.</p><!-- 2021-02-03 추가 -->
                        </li>
                        <li class="intList-repwd" style="margin-top: -171px !important;">
                            <div class="intWrap"><span class="tit"><label for="">CONFIRM PASSWORD</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner">
                                <span class="intArea"><input type="password" id="userPwRe" name="userPwRe"
                                                             placeholder="영문/숫자/특수문자를 사용하며, 8 ~ 12자리로만 가능합니다."
                                                             style="width:515px" aria-required="true"><span
                                        class="alertMessage">동일한 비밀번호를 입력해주세요.</span></span>
                            </div>
                        </li>
                        <li><!-- 성별 추가 -->
                            <div class="intWrap"><span class="tit"><label for="genderCode">GENDER</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner">
                                <div class="gender selectWrap" style="width:200px !important">
                                    <select id="genderCode" name="genderCode">
                                        
                                            <option value="M"
                                                     >남</option>
                                        
                                            <option value="F"
                                                     >여</option>
                                    </select>
                                </div>
                                <span class="alertMessage">성별을 선택해주세요.</span>
                            </div>
                        </li>
                        
                        
                        <li><!-- 20200528 수정 : 국적정보(추가) -->
                            <div class="intWrap"><span class="tit"><label for="nationCode">NATIONALITY</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner">
                                <div class="intArea selectWrap" style="width:490px">
                                    <select id="nationCode" name="nationCode">
                                        
                                            <option value="GH"
                                                     >가나[GH]</option>
                                        
                                            <option value="GA"
                                                     >가봉[GA]</option>
                                        
                                            <option value="GY"
                                                     >가이아나[GY]</option>
                                        
                                            <option value="GM"
                                                     >감비아[GM]</option>
                                        
                                            <option value="GP"
                                                     >과들루프[GP]</option>
                                        
                                            <option value="GT"
                                                     >과테말라[GT]</option>
                                        
                                            <option value="GU"
                                                     >괌[GU]</option>
                                        
                                            <option value="GD"
                                                     >그레나다[GD]</option>
                                        
                                            <option value="GR"
                                                     >그리스[GR]</option>
                                        
                                            <option value="GL"
                                                     >그린란드[GL]</option>
                                        
                                            <option value="GN"
                                                     >기니[GN]</option>
                                        
                                            <option value="GW"
                                                     >기니비사우[GW]</option>
                                        
                                            <option value="NA"
                                                     >나미비아[NA]</option>
                                        
                                            <option value="NR"
                                                     >나우루[NR]</option>
                                        
                                            <option value="NG"
                                                     >나이지리아[NG]</option>
                                        
                                            <option value="AQ"
                                                     >남극[AQ]</option>
                                        
                                            <option value="ZA"
                                                     >남아프리카 공화국[ZA]</option>
                                        
                                            <option value="NL"
                                                     >네덜란드[NL]</option>
                                        
                                            <option value="AN"
                                                     >네덜란드령 안틸레스[AN]</option>
                                        
                                            <option value="NP"
                                                     >네팔[NP]</option>
                                        
                                            <option value="NO"
                                                     >노르웨이[NO]</option>
                                        
                                            <option value="NF"
                                                     >노퍽 섬[NF]</option>
                                        
                                            <option value="NC"
                                                     >누벨칼레도니[NC]</option>
                                        
                                            <option value="NZ"
                                                     >뉴질랜드[NZ]</option>
                                        
                                            <option value="NU"
                                                     >니우에[NU]</option>
                                        
                                            <option value="NE"
                                                     >니제르[NE]</option>
                                        
                                            <option value="NI"
                                                     >니카라과[NI]</option>
                                        
                                            <option value="KR"
                                                    selected >대한민국[KR]</option>
                                        
                                            <option value="DK"
                                                     >덴마크[DK]</option>
                                        
                                            <option value="DO"
                                                     >도미니카 공화국[DO]</option>
                                        
                                            <option value="DM"
                                                     >도미니카 연방[DM]</option>
                                        
                                            <option value="DE"
                                                     >독일[DE]</option>
                                        
                                            <option value="TP"
                                                     >동티모르[TP]</option>
                                        
                                            <option value="LA"
                                                     >라오스[LA]</option>
                                        
                                            <option value="LR"
                                                     >라이베리아[LR]</option>
                                        
                                            <option value="LV"
                                                     >라트비아[LV]</option>
                                        
                                            <option value="RU"
                                                     >러시아[RU]</option>
                                        
                                            <option value="LB"
                                                     >레바논[LB]</option>
                                        
                                            <option value="LS"
                                                     >레소토[LS]</option>
                                        
                                            <option value="RE"
                                                     >레위니옹[RE]</option>
                                        
                                            <option value="RO"
                                                     >루마니아[RO]</option>
                                        
                                            <option value="LU"
                                                     >룩셈부르크[LU]</option>
                                        
                                            <option value="RW"
                                                     >르완다[RW]</option>
                                        
                                            <option value="LY"
                                                     >리비아[LY]</option>
                                        
                                            <option value="LT"
                                                     >리투아니아[LT]</option>
                                        
                                            <option value="LI"
                                                     >리히텐슈타인[LI]</option>
                                        
                                            <option value="MG"
                                                     >마다가스카르[MG]</option>
                                        
                                            <option value="MQ"
                                                     >마르티니크[MQ]</option>
                                        
                                            <option value="MH"
                                                     >마셜 제도[MH]</option>
                                        
                                            <option value="YT"
                                                     >마요트[YT]</option>
                                        
                                            <option value="YU"
                                                     >마요트[YU]</option>
                                        
                                            <option value="MO"
                                                     >마카오[MO]</option>
                                        
                                            <option value="MW"
                                                     >말라위[MW]</option>
                                        
                                            <option value="MY"
                                                     >말레이시아[MY]</option>
                                        
                                            <option value="ML"
                                                     >말리[ML]</option>
                                        
                                            <option value="MX"
                                                     >멕시코[MX]</option>
                                        
                                            <option value="MC"
                                                     >모나코[MC]</option>
                                        
                                            <option value="MA"
                                                     >모로코[MA]</option>
                                        
                                            <option value="MU"
                                                     >모리셔스[MU]</option>
                                        
                                            <option value="MR"
                                                     >모리타니[MR]</option>
                                        
                                            <option value="MZ"
                                                     >모잠비크[MZ]</option>
                                        
                                            <option value="ME"
                                                     >몬테네그로[ME]</option>
                                        
                                            <option value="MS"
                                                     >몬트세랫[MS]</option>
                                        
                                            <option value="MD"
                                                     >몰도바[MD]</option>
                                        
                                            <option value="MV"
                                                     >몰디브[MV]</option>
                                        
                                            <option value="MT"
                                                     >몰타[MT]</option>
                                        
                                            <option value="MN"
                                                     >몽골[MN]</option>
                                        
                                            <option value="US"
                                                     >미국[US]</option>
                                        
                                            <option value="UV"
                                                     >미국[UV]</option>
                                        
                                            <option value="VI"
                                                     >미국령 버진아일랜드[VI]</option>
                                        
                                            <option value="MM"
                                                     >미얀마[MM]</option>
                                        
                                            <option value="FM"
                                                     >미크로네시아 연방[FM]</option>
                                        
                                            <option value="VU"
                                                     >바누아투[VU]</option>
                                        
                                            <option value="BH"
                                                     >바레인[BH]</option>
                                        
                                            <option value="BB"
                                                     >바베이도스[BB]</option>
                                        
                                            <option value="VA"
                                                     >바티칸 시국[VA]</option>
                                        
                                            <option value="BS"
                                                     >바하마[BS]</option>
                                        
                                            <option value="BD"
                                                     >방글라데시[BD]</option>
                                        
                                            <option value="BM"
                                                     >버뮤다[BM]</option>
                                        
                                            <option value="BJ"
                                                     >베냉[BJ]</option>
                                        
                                            <option value="VE"
                                                     >베네수엘라[VE]</option>
                                        
                                            <option value="VN"
                                                     >베트남[VN]</option>
                                        
                                            <option value="BE"
                                                     >벨기에[BE]</option>
                                        
                                            <option value="BY"
                                                     >벨라루스[BY]</option>
                                        
                                            <option value="BZ"
                                                     >벨리즈[BZ]</option>
                                        
                                            <option value="BA"
                                                     >보스니아 헤르체고비나[BA]</option>
                                        
                                            <option value="BW"
                                                     >보츠와나[BW]</option>
                                        
                                            <option value="BO"
                                                     >볼리비아[BO]</option>
                                        
                                            <option value="BI"
                                                     >부룬디[BI]</option>
                                        
                                            <option value="BF"
                                                     >부르키나파소[BF]</option>
                                        
                                            <option value="BV"
                                                     >부베 섬[BV]</option>
                                        
                                            <option value="BT"
                                                     >부탄[BT]</option>
                                        
                                            <option value="MP"
                                                     >북마리아나 제도[MP]</option>
                                        
                                            <option value="MK"
                                                     >북마케도니아[MK]</option>
                                        
                                            <option value="BG"
                                                     >불가리아[BG]</option>
                                        
                                            <option value="BR"
                                                     >브라질[BR]</option>
                                        
                                            <option value="BN"
                                                     >브루나이[BN]</option>
                                        
                                            <option value="WS"
                                                     >사모아[WS]</option>
                                        
                                            <option value="XA"
                                                     >사모아[XA]</option>
                                        
                                            <option value="XI"
                                                     >사모아[XI]</option>
                                        
                                            <option value="XX"
                                                     >사모아[XX]</option>
                                        
                                            <option value="SA"
                                                     >사우디아라비아[SA]</option>
                                        
                                            <option value="GS"
                                                     >사우스조지아 사우스샌드위치 제도[GS]</option>
                                        
                                            <option value="SM"
                                                     >산마리노[SM]</option>
                                        
                                            <option value="ST"
                                                     >상투메 프린시페[ST]</option>
                                        
                                            <option value="PM"
                                                     >생피에르 미클롱[PM]</option>
                                        
                                            <option value="SN"
                                                     >세네갈[SN]</option>
                                        
                                            <option value="RS"
                                                     >세르비아[RS]</option>
                                        
                                            <option value="SC"
                                                     >세이셸[SC]</option>
                                        
                                            <option value="LC"
                                                     >세인트루시아[LC]</option>
                                        
                                            <option value="VC"
                                                     >세인트빈센트 그레나딘[VC]</option>
                                        
                                            <option value="KN"
                                                     >세인트키츠 네비스[KN]</option>
                                        
                                            <option value="SH"
                                                     >세인트헬레나[SH]</option>
                                        
                                            <option value="SO"
                                                     >소말리아[SO]</option>
                                        
                                            <option value="SB"
                                                     >솔로몬 제도[SB]</option>
                                        
                                            <option value="SD"
                                                     >수단[SD]</option>
                                        
                                            <option value="SR"
                                                     >수리남[SR]</option>
                                        
                                            <option value="LK"
                                                     >스리랑카[LK]</option>
                                        
                                            <option value="SJ"
                                                     >스발바르 얀마옌[SJ]</option>
                                        
                                            <option value="SE"
                                                     >스웨덴[SE]</option>
                                        
                                            <option value="CH"
                                                     >스위스[CH]</option>
                                        
                                            <option value="ES"
                                                     >스페인[ES]</option>
                                        
                                            <option value="SK"
                                                     >슬로바키아[SK]</option>
                                        
                                            <option value="SI"
                                                     >슬로베니아[SI]</option>
                                        
                                            <option value="SY"
                                                     >시리아[SY]</option>
                                        
                                            <option value="SL"
                                                     >시에라리온[SL]</option>
                                        
                                            <option value="SG"
                                                     >싱가포르[SG]</option>
                                        
                                            <option value="AE"
                                                     >아랍에미리트[AE]</option>
                                        
                                            <option value="AW"
                                                     >아루바[AW]</option>
                                        
                                            <option value="AM"
                                                     >아르메니아[AM]</option>
                                        
                                            <option value="AR"
                                                     >아르헨티나[AR]</option>
                                        
                                            <option value="AS"
                                                     >아메리칸사모아[AS]</option>
                                        
                                            <option value="IS"
                                                     >아이슬란드[IS]</option>
                                        
                                            <option value="HT"
                                                     >아이티[HT]</option>
                                        
                                            <option value="IE"
                                                     >아일랜드[IE]</option>
                                        
                                            <option value="AZ"
                                                     >아제르바이잔[AZ]</option>
                                        
                                            <option value="AF"
                                                     >아프가니스탄[AF]</option>
                                        
                                            <option value="AD"
                                                     >안도라[AD]</option>
                                        
                                            <option value="AL"
                                                     >알바니아[AL]</option>
                                        
                                            <option value="DZ"
                                                     >알제리[DZ]</option>
                                        
                                            <option value="AO"
                                                     >앙골라[AO]</option>
                                        
                                            <option value="AG"
                                                     >앤티가 바부다[AG]</option>
                                        
                                            <option value="AI"
                                                     >앵귈라[AI]</option>
                                        
                                            <option value="ER"
                                                     >에리트레아[ER]</option>
                                        
                                            <option value="SZ"
                                                     >에스와티니[SZ]</option>
                                        
                                            <option value="EE"
                                                     >에스토니아[EE]</option>
                                        
                                            <option value="EC"
                                                     >에콰도르[EC]</option>
                                        
                                            <option value="ET"
                                                     >에티오피아[ET]</option>
                                        
                                            <option value="SV"
                                                     >엘살바도르[SV]</option>
                                        
                                            <option value="GB"
                                                     >영국[GB]</option>
                                        
                                            <option value="VG"
                                                     >영국령 버진아일랜드[VG]</option>
                                        
                                            <option value="IO"
                                                     >영국령 인도양 지역[IO]</option>
                                        
                                            <option value="YE"
                                                     >예멘[YE]</option>
                                        
                                            <option value="OM"
                                                     >오만[OM]</option>
                                        
                                            <option value="AU"
                                                     >오스트레일리아[AU]</option>
                                        
                                            <option value="AT"
                                                     >오스트리아[AT]</option>
                                        
                                            <option value="HN"
                                                     >온두라스[HN]</option>
                                        
                                            <option value="WF"
                                                     >왈리스 퓌튀나[WF]</option>
                                        
                                            <option value="JO"
                                                     >요르단[JO]</option>
                                        
                                            <option value="UG"
                                                     >우간다[UG]</option>
                                        
                                            <option value="UY"
                                                     >우루과이[UY]</option>
                                        
                                            <option value="UZ"
                                                     >우즈베키스탄[UZ]</option>
                                        
                                            <option value="UA"
                                                     >우크라이나[UA]</option>
                                        
                                            <option value="IQ"
                                                     >이라크[IQ]</option>
                                        
                                            <option value="IR"
                                                     >이란[IR]</option>
                                        
                                            <option value="IL"
                                                     >이스라엘[IL]</option>
                                        
                                            <option value="EG"
                                                     >이집트[EG]</option>
                                        
                                            <option value="IT"
                                                     >이탈리아[IT]</option>
                                        
                                            <option value="IN"
                                                     >인도[IN]</option>
                                        
                                            <option value="ID"
                                                     >인도네시아[ID]</option>
                                        
                                            <option value="JP"
                                                     >일본[JP]</option>
                                        
                                            <option value="JM"
                                                     >자메이카[JM]</option>
                                        
                                            <option value="ZM"
                                                     >잠비아[ZM]</option>
                                        
                                            <option value="GQ"
                                                     >적도 기니[GQ]</option>
                                        
                                            <option value="KP"
                                                     >조선민주주의인민공화국[KP]</option>
                                        
                                            <option value="GE"
                                                     >조지아[GE]</option>
                                        
                                            <option value="CN"
                                                     >중국[CN]</option>
                                        
                                            <option value="CF"
                                                     >중앙아프리카 공화국[CF]</option>
                                        
                                            <option value="TW"
                                                     >중화민국[TW]</option>
                                        
                                            <option value="DJ"
                                                     >지부티[DJ]</option>
                                        
                                            <option value="GI"
                                                     >지브롤터[GI]</option>
                                        
                                            <option value="ZW"
                                                     >짐바브웨[ZW]</option>
                                        
                                            <option value="TD"
                                                     >차드[TD]</option>
                                        
                                            <option value="CZ"
                                                     >체코[CZ]</option>
                                        
                                            <option value="CL"
                                                     >칠레[CL]</option>
                                        
                                            <option value="CM"
                                                     >카메룬[CM]</option>
                                        
                                            <option value="CV"
                                                     >카보베르데[CV]</option>
                                        
                                            <option value="KZ"
                                                     >카자흐스탄[KZ]</option>
                                        
                                            <option value="QA"
                                                     >카타르[QA]</option>
                                        
                                            <option value="KH"
                                                     >캄보디아[KH]</option>
                                        
                                            <option value="CA"
                                                     >캐나다[CA]</option>
                                        
                                            <option value="KE"
                                                     >케냐[KE]</option>
                                        
                                            <option value="KY"
                                                     >케이맨 제도[KY]</option>
                                        
                                            <option value="KM"
                                                     >코모로[KM]</option>
                                        
                                            <option value="CR"
                                                     >코스타리카[CR]</option>
                                        
                                            <option value="CS"
                                                     >코스타리카[CS]</option>
                                        
                                            <option value="CC"
                                                     >코코스 제도[CC]</option>
                                        
                                            <option value="CI"
                                                     >코트디부아르[CI]</option>
                                        
                                            <option value="CO"
                                                     >콜롬비아[CO]</option>
                                        
                                            <option value="CG"
                                                     >콩고 공화국[CG]</option>
                                        
                                            <option value="CD"
                                                     >콩고 민주 공화국[CD]</option>
                                        
                                            <option value="CU"
                                                     >쿠바[CU]</option>
                                        
                                            <option value="KW"
                                                     >쿠웨이트[KW]</option>
                                        
                                            <option value="CK"
                                                     >쿡 제도[CK]</option>
                                        
                                            <option value="HR"
                                                     >크로아티아[HR]</option>
                                        
                                            <option value="CX"
                                                     >크리스마스 섬[CX]</option>
                                        
                                            <option value="KG"
                                                     >키르기스스탄[KG]</option>
                                        
                                            <option value="KI"
                                                     >키리바시[KI]</option>
                                        
                                            <option value="CY"
                                                     >키프로스[CY]</option>
                                        
                                            <option value="TJ"
                                                     >타지키스탄[TJ]</option>
                                        
                                            <option value="TZ"
                                                     >탄자니아[TZ]</option>
                                        
                                            <option value="TH"
                                                     >태국[TH]</option>
                                        
                                            <option value="TI"
                                                     >태국[TI]</option>
                                        
                                            <option value="TC"
                                                     >터크스 케이커스 제도[TC]</option>
                                        
                                            <option value="TR"
                                                     >터키[TR]</option>
                                        
                                            <option value="TG"
                                                     >토고[TG]</option>
                                        
                                            <option value="TK"
                                                     >토켈라우[TK]</option>
                                        
                                            <option value="TO"
                                                     >통가[TO]</option>
                                        
                                            <option value="TM"
                                                     >투르크메니스탄[TM]</option>
                                        
                                            <option value="TV"
                                                     >투발루[TV]</option>
                                        
                                            <option value="TN"
                                                     >튀니지[TN]</option>
                                        
                                            <option value="TT"
                                                     >트리니다드 토바고[TT]</option>
                                        
                                            <option value="PA"
                                                     >파나마[PA]</option>
                                        
                                            <option value="PY"
                                                     >파라과이[PY]</option>
                                        
                                            <option value="PK"
                                                     >파키스탄[PK]</option>
                                        
                                            <option value="PG"
                                                     >파푸아뉴기니[PG]</option>
                                        
                                            <option value="PW"
                                                     >팔라우[PW]</option>
                                        
                                            <option value="FO"
                                                     >페로 제도[FO]</option>
                                        
                                            <option value="PE"
                                                     >페루[PE]</option>
                                        
                                            <option value="PT"
                                                     >포르투갈[PT]</option>
                                        
                                            <option value="FK"
                                                     >포클랜드 제도[FK]</option>
                                        
                                            <option value="PL"
                                                     >폴란드[PL]</option>
                                        
                                            <option value="PR"
                                                     >푸에르토리코[PR]</option>
                                        
                                            <option value="PS"
                                                     >푸에르토리코[PS]</option>
                                        
                                            <option value="FR"
                                                     >프랑스[FR]</option>
                                        
                                            <option value="GF"
                                                     >프랑스령 기아나[GF]</option>
                                        
                                            <option value="TF"
                                                     >프랑스령 남방 및 남극[TF]</option>
                                        
                                            <option value="PF"
                                                     >프랑스령 폴리네시아[PF]</option>
                                        
                                            <option value="FJ"
                                                     >피지[FJ]</option>
                                        
                                            <option value="FI"
                                                     >핀란드[FI]</option>
                                        
                                            <option value="PH"
                                                     >필리핀[PH]</option>
                                        
                                            <option value="PN"
                                                     >핏케언 제도[PN]</option>
                                        
                                            <option value="HM"
                                                     >허드 맥도널드 제도[HM]</option>
                                        
                                            <option value="HU"
                                                     >헝가리[HU]</option>
                                        
                                            <option value="HK"
                                                     >홍콩[HK]</option>
                                        
                                    </select>
                                </div>
                                <span class="alertMessage">국적을 선택해주세요.</span>
                            </div>
                        </li>
                        
                        
                       <!-- 생년월일 --> 
                        <li>
                            <div class="intWrap"><span class="tit"><label for="userBirth">생년월일</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner">
                                <span class="intArea"><input type="text" id="userBirth" name="userBirth"
                                                             placeholder="(ex) 19900101"
                                                             style="width:490px; margin-bottom: 20px;" 
                                                             aria-required="true"
                                                             oninput="formatBirthDate(this)" 
                                                             onblur="validateBirthDate(this)">
                                <span class="alertMessage">생년월일을 입력해주세요.</span></span>
                            </div>
                        </li>
                        
                        
                        
                        <li class="intList-address">
                            <div class="intWrap"><span class="tit"><label for="address">Address</label><span
                                    class="essential">필수</span></span></div>
                            <!-- //20200528 수정 : 주소옵션(추가) -->
                            <div class="intInner">
                                <span class="intArea"><input type="text" id="postcode" name="postcode"
                                                             style="width:328px" aria-required="true" readonly></span>
                                <button type="button" class="btnSC btnM" onclick="execDaumPostcode();">우편번호 검색</button>
                            </div>
                            <div class="intInner duobuleInp">
                                <span class="intArea"><input type="text" id="address" name="address" style="width:513px"
                                                             title="주소" aria-required="true" readonly></span>
                                <span class="intArea"><input type="text" id="detailAddress" name="detailAddress"
                                                             style="width:513px" title="상세주소"
                                                             placeholder="상세주소를 입력해주세요." aria-required="true"></span>
                                <!-- 20200528 수정 : 경고문구case(추가1) -->
                                <span class="alertMessage">주소를 입력해주세요.</span><!-- 20200528 수정 : 경고문구case(추가2) -->
                                <span class="alertMessage">상세주소를 입력해주세요.</span>
                            </div>
                        </li>

                        <li>
                            <div class="intWrap"><span class="tit"><label for="eMail0">E-MAIL</label><span
                                    class="essential">필수</span></span></div>
                            <div class="intInner emailInp">
                                <span class="intArea"><input type="text" id="email1" name="email1"
                                                             onkeyup="javascript:emailDupInit();" style="width:261px"
                                                             aria-required="true"><span class="alertMessage">이메일을 입력해주세요.</span></span>
                                <span class="dash">@</span>
                                <span class="intArea"><input type="text" id="email2" name="email2"
                                                             onkeyup="javascript:emailDupInit();" style="width:261px"
                                                             aria-required="true" title="이메일주소직접입력"></span>
                                <div class="intArea selectWrap" style="width:261px">
                                    
                                    <select name="emailType" id="emailType" class="form-control"    ><option value="">직접 입력</option><option value="naver.com" >naver.com</option><option value="hanmail.net" >hanmail.net</option><option value="hotmail.com" >hotmail.com</option><option value="nate.com" >nate.com</option><option value="gmail.com" >gmail.com</option></select>
                                </div>
                                <button type="button" class="btnSC btnM" onclick="fncEmlDupChk(); return false;">중복 확인
                                </button>
                            </div>
                        </li>
                        <!-- //20200528 수정 : 버튼추가(중복 확인) + input(style="width:261px") -->
                        <!-- <li>
                            <div class="intWrap"><span class="tit"><label for="eName">REFERRER ID</label></span></div>
                            <div class="intInner duobuleInp">
                                <span class="intArea"><input type="text" id="recomdrId" name="recomdrId" maxlength="30" placeholder="추천인 아이디를 입력해주세요." style="width:515px;" onkeyup="this.value=this.value.replace(/[^a-z0-9]/gi, '');" ></span>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </div>

            <div class="btnArea">
                <button type="button" class="btnSC btnL" onclick="fncCancel(); return false;">취소</button>
                <button type="button" id="join_complete" class="btnSC btnL active" onclick="fncRegist(); return false;">회원가입</button>
            </div>
        </div>
        <!-- //inner -->
        <!-- 컨텐츠 E -->
    </div>
</form>



		<!-- //container -->
       
       
       <!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
       
       
       
       
	</div>
	<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>

