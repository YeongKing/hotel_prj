<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>객실 예약 - 고객 정보 입력 | 엘리시안호텔</title>

<!-- iam port 결제 등록 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


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



<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const moblphonTelno = document.getElementById("moblphonTelno");
    const moblphonTelno1 = document.getElementById("moblphonTelno1");
    const moblphonTelno2 = document.getElementById("moblphonTelno2");

    function moveFocus(nextField) {
        nextField.focus();
    }

    function limitInputLength(input, maxLength) {
        if (input.value.length > maxLength) {
            input.value = input.value.slice(0, maxLength);
        }
    }

    moblphonTelno.addEventListener("input", function() {
        if (this.value.length >= 3) {
            moveFocus(moblphonTelno1);
        }
        limitInputLength(this, 3);
    });

    moblphonTelno1.addEventListener("input", function() {
        if (this.value.length >= 4) {
            moveFocus(moblphonTelno2);
        }
        limitInputLength(this, 4);
    });

    moblphonTelno2.addEventListener("input", function() {
        limitInputLength(this, 4);
    });
});
</script>



<script>
$(document).ready(function() {
    var flag = true; // flag 변수 선언 및 초기화

    // 초기 설정 함수 호출
    handleEmailTypeChange();

    // 이메일 타입 변경 시 이벤트 핸들러
    $('#emailType').change(function() {
        handleEmailTypeChange();
    });

    // 이메일 타입에 따라 #email2 필드 상태 제어하는 함수
    function handleEmailTypeChange() {
        var emailType = $('#emailType').val();
        var email2 = $('#email2');

        // 최초 상태에서 emailType이 ''이고 email2에 값이 있는 경우에만 flag를 alert하고 flag를 false로 변경한다.
        if (emailType === '' && email2.val() !== '' && flag) {
            flag = false;
            return;
        }

        // emailType 값에 따라 #email2 필드 제어
        if (emailType === '') {
            email2.prop('disabled', false).val('');
        } else {
            email2.prop('disabled', true).val(emailType);
        }
    }
});
</script>







		<script type="text/javascript">


function getTokenAndPayment(pg, pay_method){
    $.ajax({
        url: "http://localhost/hotel_prj/user/getToken.do",
        method: 'GET',
        success: function(response) {
            payment(pg, pay_method, response); // 토큰을 받은 후 결제 호출
        },
        error: function() {
        	alert("토큰 받기 실패")
        }
    });
}

function payment(pg, pay_method, token){
    IMP.init('imp25425801');
    IMP.request_pay({
        pg: pg,
        pay_method: pay_method,
        amount: ${rrVO.payPrice * rrVO.night}, // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_name: '${umd.name}', // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_email: jQuery("#email").val(),
        buyer_tel: jQuery("#phone").val(),
        name: '객실예약'
    }, function(response) {
        // 결제 후 호출되는 callback함수
        if (response.success) { // 결제 성공
            //console.log(response);
        	commonJs.showLoadingBar();
            sendPaymentData(response, token);
        } else {
            alert('결제실패 : ' + response.error_msg);

			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			
			commonJs.closeLoadingBar();
        }
    });
}

function sendPaymentData(paymentData, token) {
    const impUid = paymentData.imp_uid;
    $.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/payment.do",
        data: JSON.stringify({
            imp_uid: impUid,
            payment_data: paymentData,
            token: token
        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            insertPaymentInfo(data); // 결제 정보 DB저장
        },
        error: function(err) {
            let errorMessage = "결제 데이터 전송 오류: " + err.status + " " + err.statusText + " - " + err.responseText;
            alert(errorMessage);
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			
			commonJs.closeLoadingBar();

        }
    });
}


// 결제 정보를 DB에 저장하는 함수
function insertPaymentInfo(paymentInfo) {
	var cardNum = paymentInfo.buyer_card_num
	
	
    if (!cardNum || cardNum.length !== 16) {
    	
    	var random16Digits = generateRandomNumber(16);
    	
         cardNum = random16Digits.substring(0, 6) + '*********' + random16Digits.substring(15);
    	
    }//end if
	
	
    var payPrice = ${rrVO.payPrice * rrVO.night};

    
    var payStatus = 'Y';
    var payTime = paymentInfo.paid_at;
    var impUid = paymentInfo.buyer_buyid;

    $.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/insertPayInfo.do",
        data: JSON.stringify({
        	cardNum : cardNum,
        	payPrice : payPrice,
        	payStatus : payStatus,
        	payTime : payTime,
        	impUid : impUid

        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
			insertRoomRes(data.payNum);

            
        },
        error: function(err) {
            let errorMessage = "결제 데이터 전송 오류: " + err.status + " " + err.statusText + " - " + err.responseText;
            alert(errorMessage);
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			
			commonJs.closeLoadingBar();
        }
    });
}

// 랜덤 숫자 생성 함수
function generateRandomNumber(length) {
    let result = '';
    const characters = '0123456789';
    const charactersLength = characters.length;
    
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    
    return result;
}

//객실예약 함수
function insertRoomRes(payNumber) {
	//alert("객실예약 함수 진입");
    var payNum = payNumber;
    var roomId = 0;
    var roomResStatus = 'RESERVED';
    var guestEmail = jQuery("#email").val();
    var guestPhone = jQuery("#phone").val();
    var guestBirthday = "${umd.birthday}"; 

   
    
    jQuery.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/resveValid.do",
        cache: false,
        dataType: "json",
        global: false,
        beforeSend: function(xhr, opts) {
            RESV_STATUS = true;
            $(".btnArea").find("a").css({
                'pointer-events': 'none',
                'cursor': 'default',
                'opacity': '0.6'
            });
        },
        complete: function() {
            RESV_STATUS = false;
        },
        success: function(response) {
            // 여기서 roomid 값을 받아오는 부분을 정확히 처리해야 합니다.
            roomId = response; // 예약 가능한 객실의 ID를 받아온다고 가정합니다. 실제로는 서버 응답에 따라 수정 필요
            if (roomId != 0) {
                // 예약 가능한 객실이 있을 경우
                $.ajax({
                    type: "POST",
                    url: "http://localhost/hotel_prj/user/insertRoomRes.do",
                    data: JSON.stringify({
                        payNum: payNum,
                        roomId: roomId,
                        roomResStatus: roomResStatus,
                        guestEmail: guestEmail,
                        guestPhone: guestPhone,
                        guestBirthday: guestBirthday
                    }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result) {
                		jQuery("#step3Form").attr("action", "http://localhost/hotel_prj/user/room4.do");
                		jQuery("#step3Form").submit();
                        
                        
                    },
                    error: function(xhr, status, error) {
                        alert("객실 등록에 실패했습니다: " + error);
                    }
                });
            } else {
                // 예약 가능한 객실이 없을 경우
                $(".btnArea").find("a").css({
                    'pointer-events': '',
                    'cursor': '',
                    'opacity': ''
                });
                alert("입실 가능한 객실이 존재하지 않습니다.");
            }
        },
        error: function(xhr, status, error) {
            alert("객실 예약 유효성 체크 중 오류가 발생했습니다: " + error);
            $(".btnArea").find("a").css({
                'pointer-events': '',
                'cursor': '',
                'opacity': ''
            });
        }
    });
}





jQuery(function(){
	jQuery(document).ready(function(){
		
		//체크인 체크아웃 날짜 html 주입
		jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")

	});
});




</script>




		<!--S header  -->
		<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
		<!--E header  -->



		<!--(페이지 URL)-->











		<script type="text/javascript">



/**
객실 재검색 이동
*/
function fncResvReset(){
	if(confirm("다시 검색하시겠습니까?")){ 
		location.href = "http://localhost/hotel_prj/resve/room/step0.do";
		return false;
	}
}

function checkInputValid(){



    if($(".error").length != 0){
        $(".error").first().attr("tabindex" , -1 ).focus();
        return false;
    }else {
        return true;
    }


}

/**
	예약!		
*/
let RESV_STATUS = false;
function fncGoPay(){

    if (RESV_STATUS == true) {
        alert("이미 처리중입니다. 잠시만 기다려 주세요. ");
        return false;
    }

	

    //입력 폼 검증
    if(!checkInputValid()){
        return false;
    }
	
	
		if(!jQuery("#cancelAgree").is(":checked")){
			alert("취소 규정 항목 동의는 필수 입니다."); 
			jQuery("#cancelAgree").focus();
			return false;
		}

        if(!jQuery("#policyAgree").is(":checked")){
            alert("개인정보 수집 및 이용 약관에 동의해주세요."); 
            jQuery("#policyAgree").focus();
            return false;
        }
       
		
     // 휴대폰 유효성 검사
        var phonePart1 = jQuery("#moblphonTelno").val().trim();
        var phonePart2 = jQuery("#moblphonTelno1").val().trim();
        var phonePart3 = jQuery("#moblphonTelno2").val().trim();
        var phone = phonePart1 + "-" + phonePart2 + "-" + phonePart3;

        if (phonePart1 === "") {
            alert("전화번호는 필수 입력입니다.");
            jQuery("#moblphonTelno").focus();
            return false;
        } else if (phonePart2 === "") {
            alert("전화번호는 필수 입력입니다.");
            jQuery("#moblphonTelno1").focus();
            return false;
        } else if (phonePart3 === "") {
            alert("전화번호는 필수 입력입니다.");
            jQuery("#moblphonTelno2").focus();
            return false;
        }

        jQuery("#phone").val(phone);

        // 이메일 유효성 검사
        var emailPart1 = jQuery("#email1").val().trim();
        var emailPart2 = jQuery("#email2").val().trim();
        var emailType = jQuery("#emailType").val().trim();
        var email;

        if (emailPart1 === "") {
            alert("이메일은 필수 입력입니다.");
            jQuery("#email1").focus();
            return false;
        }

        if (emailType === "") {
            if (emailPart2 === "") {
                alert("이메일은 필수 입력입니다.");
                jQuery("#email2").focus();
                return false;
            }
            email = emailPart1 + "@" + emailPart2;
        } else {
            email = emailPart1 + "@" + emailType;
        }

        // 이메일 길이 유효성 검사
        if (email.length > 100) {
            alert("이메일 주소가 너무 깁니다. 다시 입력해주세요.");
            jQuery("#email1").val("");
            jQuery("#email2").val("");
            jQuery("#email1").focus();
            return false;
        }

        jQuery("#email").val(email);


	/*
		예약 유효성 검사
	*/
	
	$(".btnArea").find("a").css({
	    'pointer-events': 'none',
	    'cursor': 'default',
	    'opacity': '0.6'
	});
	
	jQuery.ajax({
		type : "POST",
		url : "http://localhost/hotel_prj/user/resveValid.do",
		cache : false,
		dataType : "json",
		global : false,
		beforeSend : function(xhr, opts) {
            RESV_STATUS = true;
			$(".btnArea").find("a").css({
			    'pointer-events': 'none',
			    'cursor': 'default',
			    'opacity': '0.6'
			});
	    },
		complete : function(){
          RESV_STATUS = false;
		},
		success : function(roomId){
			

			
			if(roomId!=0){
				
				var pay_type = $('input[name="payType2"]:checked').val()
				
				if(pay_type=="kakaopay"){
					
					
					getTokenAndPayment('kakaopay.TC0ONETIME', 'kakaopay'); // 카카오페이
					
					
				}else if(pay_type=="inicis"){
					
					
					getTokenAndPayment('html5_inicis', 'card'); // KG 이니시스
					
				}
				
				

				
			}else{
				
				$(".btnArea").find("a").css({
				    'pointer-events': '',
				    'cursor': '',
				    'opacity': ''
				});
				
				alert("입실가능한 객실이 존재하지않습니다.");
			}
		},
		error:function(r, s, e){
			alert("실패");
			
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText)); 
		}
	});
	
}
</script>

	<form action="" name="step3Form" id="step3Form" method="post">
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS" /> 
	<input type="hidden" name="ckinDate" id="ckinDate" value="${rrVO.ckinDate}" /> 			
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="${rrVO.ckoutDate}" /> 		
	<input type="hidden" name="night" id="night" value="${rrVO.night}" /> 					
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />			
	<input type="hidden" name="adltCntArr" value="${rrVO.adultsNum}"/>						
	<input type="hidden" name="chldCntArr" value="${rrVO.kidsNum}"/>						
	<input type="hidden" name="adltSum" id="adltSum" value="${rrVO.adultsNum}"/>				
	<input type="hidden" name="chldSum" id="chldSum" value="${rrVO.kidsNum}"/>				
	<input type="hidden" name="email" id="email" value="" />												
	<input type="hidden" name="phone" id="phone" value="" />												
	<input type="hidden" name="contArr" value=""/>								
	<input type="hidden" name="gender" value="${ umd.gender}" />
	<input type="hidden" name="korNm" value="${ umd.name}" />
	<input type="hidden" name="countryCode" value="${ umd.nationalCode}" />
	<input type="hidden" name="lastName" value="${ umd.engLname}">
	<input type="hidden" name="firstName" value="${umd.engFname}">

	<div id="container" class="container">
		<!-- 컨텐츠 S -->
		<h1 class="hidden">예약</h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<div class="stepWrap">
					<ol>
						<li class="prev">
							<em>객실, 요금 선택</em>
						</li>	
						<li class="prev">
							<em>옵션 선택</em>
						</li>
						<li class="on">
							<span class="hidden">
								현재단계
							</span>
							<em>예약자 정보 입력</em>
						</li> 
					</ol>
				</div>
			</div>
		</div>
		<!-- //topArea -->
		<div class="selResult">
			<div class="inner">
				<div class="infoArea">
					<dl class="dlType01">
						<dt>HOTEL</dt>
						<dd>엘리시안 서울</dd>
					</dl>
					<dl class="dlType02">
						<dt>DATE</dt>
						<dd id="dateText"></dd>
					</dl>
					<dl class="dlType03">
						<dt>ROOMS</dt>
						<dd>1</dd>
					</dl>
					<dl class="dlType03">
						<dt>ADULTS</dt>
						<dd>${rrVO.adultsNum}</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>${rrVO.kidsNum}</dd>
					</dl>
				</div>
				<a href="#none" class="btnSC btnM icoArr" onclick="fncResvReset();">객실 다시 검색</a>
			</div>
		</div>
		<!-- //selResult -->
				<div class="inner">
					<!-- rsvRoomWrap -->
					<div class="rsvRoomWrap">
						<div class="lCont">
							<h2 class="titDep2">ROOM ONLY</h2>
							<p class="categoryTxt">${rrVO.roomRankName} / ${rrVO.bedName}
								/ ${rrVO.viewName}</p>
							<ul class="intList">


								<li>
									<!-- 미입력 일 경우 error 클래스 추가 alertMessage 노출 -->
									<div class="intWrap">
										<span class="tit"> <label for="kName">RESERVATION
												NAME</label> <span class="essential">필수</span>
										</span>
									</div>
									<div class="intInner">
										<span class="intArea"> <input type="text"
											class="readOn" data-valid="Y" style="width: 440px"
											aria-required="true"
											value="${umd.name} (${umd.engFname } ${umd.engLname }) / ${umd.gender} / ${umd.nationalCode } "
											readonly>


										</span>
									</div>
								</li>


								<li>
									<div class="intWrap">
										<span class="tit"> <label for="phone">PHONE
												NUMBER</label> <span class="essential">필수</span>
										</span>
									</div>
									<div class="intInner phoneInp">
										<div class="intArea selectWrap">
											<select id="cntryPhNbr" name="cntryPhNbr"
												style="width: 319px;">
												<!--  국가 코드 -->


												<option value="82" selected="selected">대한민국(82)</option>

											</select>
										</div>
										<span class="intArea"> <c:set var="phone"
												value="${umd.phone}" /> <%-- 첫 번째 부분: "010" --%> <c:set
												var="phonePart1"
												value="${fn:substring(phone, 0, fn:indexOf(phone, '-'))}" />

											<%-- 나머지 부분 추출 --%> <c:set var="remainingPhone"
												value="${fn:substring(phone, fn:indexOf(phone, '-') + 1, fn:length(phone))}" />

											<%-- 두 번째 부분: "7427" --%> <c:set var="phonePart2"
												value="${fn:substring(remainingPhone, 0, fn:indexOf(remainingPhone, '-'))}" />

											<%-- 세 번째 부분: "0406" --%> <c:set var="phonePart3"
												value="${fn:substring(remainingPhone, fn:indexOf(remainingPhone, '-') + 1, fn:length(remainingPhone))}" />




											<input type="text" id="moblphonTelno" name="moblphonTelno"
											data-valid="Y" style="width: 145px" aria-required="true"
											onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"
											value="${phonePart1}">
										</span> <span class="dash"></span> <span class="intArea"> <input
											type="text" id="moblphonTelno1" name="moblphonTelno1"
											data-valid="Y" style="width: 145px" aria-required="true"
											onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"
											value="${phonePart2}">
										</span> <span class="dash"></span> <span class="intArea"> <input
											type="text" id="moblphonTelno2" name="moblphonTelno2"
											data-valid="Y" style="width: 145px" aria-required="true"
											onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"
											role="last" value="${phonePart3}">
										</span> <span class="alertMessage">휴대폰 번호를 입력해주세요.</span>
									</div>
								</li>
								<li>
									<div class="intWrap">
										<span class="tit"> <label for="eMail">E-MAIL</label> <span
											class="essential">필수</span>
										</span>
									</div>
									<div class="intInner emailInp">

										<c:set var="email" value="${umd.email}" />

										<%-- 첫 번째 부분: "아이디" --%>
										<c:set var="emailPart1"
											value="${fn:substring(email, 0, fn:indexOf(email, '@'))}" />

										<%-- 나머지 부분 추출 : "이메일"--%>
										<c:set var="emailPart2"
											value="${fn:substring(email, fn:indexOf(email, '@') + 1, fn:length(email))}" />


										<span class="intArea"><input type="text" id="email1"
											style="width: 273px" data-valid="Y" aria-required="true"
											onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');"
											value="${emailPart1}"></span> <span class="dash">@</span> <span
											class="intArea"><input type="text" id="email2"
											style="width: 273px" data-valid="Y" aria-required="true"
											onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');"
											value="${emailPart2}" /></span>
										<div class="intArea selectWrap" style="width: 273px">
											<select name="emailType" id="emailType" class="form-control">
												<option value="">직접 입력</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="sist.co.kr">sist.co.kr</option>
											</select>
										</div>
										<span class="alertMessage">이메일을 입력해주세요.</span>
									</div>
								</li>

								<li>
									<div class="intWrap">
										<span class="tit"><label for="payType2">PAY
												TYPE</label><span class="essential">필수</span></span>
									</div>
									<div class="intInner">
										<div class="intArea">
											<div class="intBox">
												<span class="frm"> <input type="radio" id="payType01"
													name="payType2" value="kakaopay" checked="checked">
													<label for="payType01">카카오페이</label> <input type="radio"
													id="payType02" name="payType2" value="inicis"> <label
													for="payType02">KG이니시스</label>
												</span>
											</div>
										</div>
										<span class="alertMessage">결제 타입을 선택해 주세요.</span>
									</div>
								</li>


							</ul>
							<p class="txtGuide">객실 재판매 행위는 법적 제재를 받을 수 있습니다.</p>

							<div class="notiContainer">

								<h3 class="titDep3">개인정보 수집 &middot; 이용 동의</h3>
								<ul class="toggleList agreeCont">
									<li class="toggleOn"><span class="frm type02"> <input
											type="checkbox" id="policyAgree" name="policyAgree">
											<label for="policyAgree">[필수] 개인정보 수집 · 이용에 동의합니다.</label>
									</span>
										<button type="button" class="btnToggle">
											<span class="hidden">상세내용 닫기</span>
										</button> <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->

										<div class="toggleCont">
											<div class="toggleInner">
												<table class="tblH">
													<colgroup>
														<col style="width: auto">
														<col style="width: 33%" span="2">
													</colgroup>
													<caption>개인정보 수집 이용 목록</caption>
													<thead>
														<tr>
															<th scope="col">수집 항목</th>
															<th scope="col">수집 목적</th>
															<th scope="col">보유 기간</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>이름(국문/영문),<br>휴대폰 번호, 이메일 주소, 성별
															</td>
															<td>서비스 이용자 식별 및 의사소통</td>
															<td rowspan="2"><strong class="f18">객실예약 후
																	5년</strong></td>
														</tr>
														<tr>
															<td>신용카드 종류, 번호, 유효기간, 비밀번호(앞2자리), 생년월일</td>
															<td>객실 및 부대시설<br>이용요금에 대한 보증
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div></li>

								</ul>

								<h3 class="titDep3">취소 규정</h3>
								<ul class="toggleList agreeCont">
									<li class="toggleOn"><span class="frm type02"> <input
											type="checkbox" id="cancelAgree" name="cancelAgree" /> <label
											for="cancelAgree"> [필수] 취소 및 노쇼(No-show) 규정에 동의합니다. </label>
									</span>
										<button type="button" class="btnToggle">
											<span class="hidden"> 상세내용 보기 </span>
										</button>
										<div class="toggleCont">
											<div class="toggleInner">
												<div class="scrollWrap">
													<ul class="listDep1">
														<li>체크인 7일 전 오후 6시 이전 : 위약금 없이 변경 및 취소 가능</li>
														<li>체크인 7일 전 오후 6시 이후 ~ 1일 전 오후 6시 이전 : 최초 1박 요금의 20%
															부과</li>
														<li>체크인 1일 전 오후 6시 이후 : 취소 및 No-show 위약금 발생
															<ul class="listDep2">
																<li>1박 투숙 : 객실료의 80% 위약금 부과</li>
																<li>2박 이상 투숙 : 최초 1박 요금의 100% 부과</li>
															</ul>
													</ul>
												</div>
											</div>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="rCont floating">
							<ul class="toggleList rsvList">

								<li class="toggleOn">
									<!-- 기본으로 펼쳐진 경우 toggleOn  추가 --> <strong class="listTit">
										객실 <span class="price" id="roomAmount0"><em> <fmt:formatNumber
													value="${rrVO.payPrice}" pattern="#,##0" />
										</em>KRW</span>
								</strong>
									<button type="button" class="btnToggle">
										<span class="hidden">상세내용 보기</span>
									</button>
									<div class="toggleCont" style="display: block;">
										<div class="toggleInner">
											<div class="optionTotal scrollWrap">
												<ul class="infoData">


													<li><span class="lfData"><fmt:formatNumber
																value="${rrVO.payPrice}" pattern="#,##0" /> KRW *
															${rrVO.night} 박</span></li>

												</ul>


											</div>
										</div>
									</div>
								</li>

							</ul>
							<div class="totalCont">
								<!-- 20200420 수정 -->
								<div class="totalPrice">
									<!-- saleTxt가 있을땐 type02 -->
									<span class="txt">총 예약금액</span> <span class="price"><em>
											<fmt:formatNumber value="${rrVO.payPrice * rrVO.night}"
												pattern="#,##0"></fmt:formatNumber>
									</em>KRW</span>
								</div>
								<div class="btnArea">
									<div>
										<a href="#none" class="btnSC btnL active"
											onclick="fncGoPay();">결제</a>
									</div>
									<!-- 결제 -->
								</div>
							</div>
						</div>
					</div>
					<!-- //rsvRoomWrap -->
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

