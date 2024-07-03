<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="다이닝 예약 step0"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>다이닝 - 다이닝 예약 | 엘리시안호텔</title>
<link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script> <!-- I'mport library -->
<script>
    
        // 헤더 메뉴 버튼 클릭 이벤트
        jQuery(document).on("click", ".headArea .btnMenu", function() {
            // 메뉴 펼쳐질 때 라운지 리스트 3가지 무작위 노출
            if (jQuery(this).hasClass("menuOn")) {
                var expsrCount = 3;
                var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
                var randomArray = generateRandomNumberArray(expsrCount, $loungeList.length);

                $loungeList.addClass("hidden");
                $loungeList.each(function(index) {
                    if (randomArray.indexOf(index) > -1) {
                        jQuery(this).removeClass("hidden");
                    }
                });
            }
        });
        
        $(document).ready(function() {
        	console.log($(".personNum").val());
            // 라디오 버튼 변경 이벤트 처리
            $('input[name="tableType"]').on('change', function() {
                // 선택된 라디오 버튼에 checked 속성 부여
                $(this).prop('checked', true);

                // 다른 라디오 버튼의 checked 속성 해제
                $('input[name="tableType"]').not(this).prop('checked', false);
                var value = $(":input:radio[name=tableType]:checked").val()
                // 선택된 값 가져오기
                var selectedTableType = $(this).val();
                $("#tableType").val(selectedTableType);
            });
        });
        
        var maxCount = "${drVO.visitPeople}"; // 최대 인원 수
        var totalPersonCount = 0;
		var totalPrice = 0;
		var adult = 0;
		var child = 0;
		var infant = 0;
		personPrice = parseInt(${diningDetail.deposit});
        // 인원 수 증가 및 감소 함수
        function fncBtnUpDown(button) {
            var $span = $(button).siblings('.personNum');
            var count = parseInt($span.attr('data-count'));
            var $btnDown = $(button).siblings('.btnDown');
            var $btnUp = $(button).siblings('.btnUp');
            var $parentLi = $(button).closest('li');
            var menuType = $parentLi.data('menutype');
            
            if ($(button).data('prop') === 'up') {
                if (totalPersonCount < maxCount) {
                    count++;
                    if (menuType === 'adult') {
                        adult ++;
                    } else if (menuType === 'child') {
                        child++;
                    } else if (menuType === 'infant') {
                    	infant++;
                    }
                    if (menuType !== 'infant') {
                    	totalPrice += personPrice;
                    	
                    }
                    $("#popTotalPrice").text(totalPrice);
                    $(".price em[name='totalPrice']").text(totalPrice);
                }
                if (count >= maxCount) {
                    count = maxCount;
                    $btnUp.prop('disabled', true);
                }
            } else if ($(button).data('prop') === 'down') {
                if (count > 0) {
                    count--;
                    if (menuType === 'adult') {
                        adult--;
                    } else if (menuType === 'child') {
                        child--;
                    } else if (menuType === 'infant') {
                    	infant--;
                    }
                    if (menuType !== 'infant') {
                   		 totalPrice -= personPrice;
                    }
                    $("#popTotalPrice").text(totalPrice);
                    $(".price em[name='totalPrice']").text(totalPrice);
                }
                if (count <= 0) {
                    count = 0;
                    $btnDown.prop('disabled', true);
                }
            }

            // 인원 수 업데이트
            $span.attr('data-count', count);
            $span.text(count);

            // 총 인원 수 업데이트
            updateTotalPersonCount();

            if (totalPersonCount <= 0) {
                $('.btnDown').prop('disabled', true);
            } else {
            	$('.btnDown').prop('disabled', false);
            }

            if (totalPersonCount >= maxCount) {
                $('.btnUp').prop('disabled', true);
            } else {
                $('.btnUp').prop('disabled', false);
            }
        }

        // 총 인원 수 계산 및 업데이트 함수
        function updateTotalPersonCount() {
            totalPersonCount = 0;

            $('.personNum').each(function() {
                totalPersonCount += parseInt($(this).attr('data-count'));
            });
        }

        $(document).ready(function() {
            // 초기 상태 설정
            $('.personNum').each(function() {
                var count = parseInt($(this).attr('data-count'));
                var $btnDown = $(this).siblings('.btnDown');
                var $btnUp = $(this).siblings('.btnUp');

                if (count <= 0) {
                    $btnDown.prop('disabled', true);
                } else {
                    $btnDown.prop('disabled', false);
                }

                if (count >= maxCount) {
                    $btnUp.prop('disabled', true);
                } else {
                    $btnUp.prop('disabled', false);
                }
            });

            // 총 인원 수 초기화
            updateTotalPersonCount();
          	
          	//휴대폰 입력에 값 설정
          	var phone = "${drVO.phone}";
            $("#inp_moblphonTelno").val(phone.substring(0, 3));
            $("#inp_moblphonTelno1").val(phone.substring(4, 8));
            $("#inp_moblphonTelno2").val(phone.substring(9));
            
            //이메일 입력에 값 설정
            var email = "${drVO.email}";
            if (email) {
                var emailParts = email.split('@');
                if (emailParts.length === 2) {
                    $("#inp_bookerEmail").val(emailParts[0]);
                    $("#inp_bookerEmail1").val(emailParts[1]);
                } else {
                    console.error("Invalid email format.");
                }
            } else {
                console.error("Email is undefined.");
            }
            
        });
        
        
        function fncCompleteMenuSelect() {
        	if(totalPrice == 0 ){
        		alert("유아만으로 예약이 불가능합니다.");
        		return;
        	}
        	
        	if(totalPersonCount != maxCount){
            	alert("정원에 맞게 인원을 추가해주시길 바랍니다");
            	return;
        	}
        	else{
                $('#menuPop').hide();
                $('.dimmed').hide();
                
                // body 스타일 변경하여 스크롤 가능하게 만들기
                $('body').css({
                    'overflow': '',
                    'position': '',
                    'width': ''
                });
        	}
        }                                        



    // 이메일 셀렉트 박스 텍스트 입력
    $(function(){
        /*
             이메일 도메인 정보 수정 시
             직접입력인 경우 email2 input disabled 제거
             도메인 선택 시 도메인 email2 input에 주입 후 disabled
         */
        jQuery("[name='emailType']").on("change", function(){
            var value = jQuery(this).val();
            let title = jQuery(this).prop("title");
            let id = "inp_"+title+"Email1";
            if(value == ""){
                jQuery('['+id+']').val("");
                jQuery('['+id+']').prop("readonly", false);
            }else{
                jQuery('['+id+']').val(value);
                jQuery('['+id+']').prop("readonly", true);
            }
        });
    });
  

    // 예약
    function fncReservation() {

        // 현재 입력되어있는 번호
        var moblphoneTelno = $("#inp_moblphonTelno").val();
        var moblphoneTelno1 = $("#inp_moblphonTelno1").val();
        var moblphoneTelno2 = $("#inp_moblphonTelno2").val();
        var bookerPhone = moblphoneTelno +"-"+ moblphoneTelno1 +"-"+ moblphoneTelno2;
		var bookerName = $("#inp_bookerName").val();
        // 현재 입력되어있는 이메일
        var bookerEmail = $("#inp_bookerEmail").val() != '' && $("#inp_bookerEmail1").val() != '' ? $("#inp_bookerEmail").val() + "@" + $("#inp_bookerEmail1").val() : '';
        // 가져온 이메일
        var email = "${drVO.email}";
        var requests = $("#inp_requests").val();
        var isDiffVisitorBooker = $("#inp_isDiffVisitorBooker").closest("li").hasClass("toggleOn");
        
        var notice = $("#frmA02");
        var refund = $("#frmA04");
        var personal = $("#frmA03");
        var visitorPhone = "";
        var visitorName = "";
        var visitorEmail = "";
        visitorPhone = $("#inp_phone").val()+"-"+$("#inp_phone1").val()+"-"+$("#inp_phone2").val();
        visitorName = $("#inp_visitorName").val();
        alert("isDiffVisitorBooker : " +  isDiffVisitorBooker);
        alert("bookerEmail : " + bookerEmail);
        alert("bookerName : " + bookerName);
        alert("visitorName : " + visitorName);
		alert("bookerPhone  :" + bookerPhone );
        alert("visitorPhone : " + visitorPhone);
		alert("email : " +email);
            // 전화번호 입력 검증
            if (moblphoneTelno == '' || moblphoneTelno1 == '' || moblphoneTelno2 == '') {
                alert("예약자 전화번호를 입력해 주세요."); // 예약자 전화번호는 필수 입니다
                $("#inp_moblphonTelno").focus();
                return ;
            }

  

            // 이메일 입력 검증
            if ($("#inp_bookerEmail").val() === "" || $("#inp_bookerEmail1").val() === "") {
                alert("이메일을 모두 입력해 주세요.");
                $("#inp_bookerEmail").focus();
                return;
            }
        

        // 예약자 방문자 다른경우
        if (isDiffVisitorBooker) {
				
                // 방문자 명 입력 검증 (필수)
                if (visitorName == '') {
                    alert("방문자명을 입력해 주세요."); // 방문자명은 필수 입니다
                    $("#inp_visitorName").focus();
                    return ;
                }

                // 방문자 전화번호 입력 검증 (필수)
                if ($("#inp_phone").val() == '' || $("#inp_phone1").val() == '' || $("#inp_phone2").val() == '') {
                    alert("방문자 전화번호를 입력해 주세요."); // 방문자 전화번호는 필수 입니다
                    $("#inp_phone").focus();
                    return ;
                }
                
        }

        // 유의사항 체크 검증
        if (!notice.is(":checked")) {
            alert("매장 이용규정에 동의해 주세요."); // 매장 이용규정에 동의해 주세요
            notice.focus();
            return ;
        }

        // 환불규정 체크 검증
        if (!refund.is(":checked")) {
            alert("취소 및 환불 규정에 동의해 주세요."); // 취소 및 환불 규정에 동의해 주세요
            refund.focus();
            return ;
        }

        // 개인정보 동의 체크 검증
        if (!personal.is(":checked")) {
            alert("예약에 필요한 개인정보의 수집과 이용에 동의해 주세요.") // 개인정보 수집 · 이용에 동의해 주세요
            personal.focus();
            return ;
        }

        if (bookerEmail !== email) {
            $("#bookerEmail").val(bookerEmail);
        } else {
            $("#bookerEmail").val(email);
        }
        
        //히든에 값넣기
        $("#bookerPhone").val(bookerPhone);
        $("#bookerEmail").val(email);
        $("#bookerName").val(bookerName);
        $("#requests").val(requests);
        $("#visitorName").val(visitorName);
        $("#visitorPhone").val(visitorPhone);
        $("#visitorEmail").val(visitorEmail);
        $("#tableType").val($(":input:radio[name=tableType]:checked").val());
        $("#adultCount").val(adult);
        $("#childCount").val(child);
        $("#infantCount").val(infant);
        $("#totalPrice").val(totalPrice); 
  		if(isDiffVisitorBooker){
  			 $("#visitorName").val(visitorName);
  	        $("#visitorPhone").val(visitorPhone);
  		}else{
  			 $("#visitorName").val(bookerName);
  	        $("#visitorPhone").val(bookerPhone);
  		}
    
        let RESV_STATUS = false;
      
        diningReservation();
    }
 	 //다이닝 예약 메서드
    function diningReservation(){
        var pay_type = $('input[name="payType2"]:checked').val();
        if(pay_type == "kakaopay"){
            getTokenAndPayment('kakaopay.TC0ONETIME', 'kakaopay'); // 카카오페이
        } else if(pay_type == "inicis"){
            getTokenAndPayment('html5_inicis', 'card'); // KG 이니시스
        }
    } 
 	 
    function getTokenAndPayment(pg, pay_method){
        $.ajax({
            url: "http://localhost/hotel_prj/user/getToken.do",
            method: 'GET',
            success: function(response) {
                payment(pg, pay_method, response); // 토큰을 받은 후 결제 호출
            },
            error: function() {
            	alert("결제중 오류가 발생하였습니다")
            }
        });
    }
        
    
    //결제 함수
    function payment(pg, pay_method, token){
    var totalPrice = $("#totalPrice").val(); // 총 결제 금액을 가져옴
    alert("totalPrice : " + totalPrice);
    IMP.init('imp25425801');
    IMP.request_pay({
        pg: pg,
        pay_method: pay_method,
        amount: totalPrice, // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_name: '${drVO.visitorName}', // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_email: jQuery("#bookerEmail").val(),
        buyer_tel: jQuery("#phone").val(),
        name: "다이닝 예약"
    }, function(response) {
        // 결제 후 호출되는 callback함수
        if (response.success) { // 결제 성공
            //console.log(response);
        	commonJs.showLoadingBar();
            sendPaymentData(response, token);
        } else {
            alert('결제실패 : ' + response.error_msg);
            commonJs.closeLoadingBar();
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			
            
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
            console.log("에러 상세: ", err);
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
        url: "http://localhost/hotel_prj/user/insertDiningPayInfo.do",
        data: JSON.stringify({
        	cardNum : cardNum,
        	payPrice : totalPrice,
        	payStatus : payStatus,
        	payTime : payTime,
        	impUid : impUid

        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
			insertDiningRes(data.payNum);

            
        }
    });
}

//랜덤 숫자 생성 함수
function generateRandomNumber(length) {
 let result = '';
 const characters = '0123456789';
 const charactersLength = characters.length;
 
 for (let i = 0; i < length; i++) {
     result += characters.charAt(Math.floor(Math.random() * charactersLength));
 }
 
 return result;
}

//다이닝 예약 함수
function insertDiningRes(payNumber) {
 var payNum = payNumber;
 var roomId = 0;
 var diningResStatus = 'CONFRIMED';
 var guestName = jQuery("#visitorName").val();
 var guestPhone =  jQuery("#visitorPhone").val();
 var bookerName =  jQuery("#bookerName").val();
 var bookerEmail =  jQuery("#bookerEmail").val();
 var bookerPhone =  jQuery("#bookerPhone").val();
 var requests =  jQuery("#requests").val();
 var table = $("#tableType").val();

 jQuery.ajax({
     type: "POST",
     url: "diningResveValid.do",
     cache: false,
     dataType: "json",
     global: false,
     data : {
    	 table : table
     },
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
         diningId = response; //
         if (diningId != 0) {
             $.ajax({
                 type: "POST",
                 url: "http://localhost/hotel_prj/user/insertDiningRes.do",
                 data: JSON.stringify({
                     payNum: payNumber,
                     diningResStatus: diningResStatus,
                     guestName : guestName,
                     guestPhone: guestPhone,
                     bookerName : bookerName,
                     bookerEmail : bookerEmail,
                     bookerPhone : bookerPhone,
                     totalPrice : totalPrice,
                     requests : requests
                 }),
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                 success: function(response) {
                	alert(response.result)
                	location.href="http://localhost/hotel_prj/user/complete.do";
                 },
                 error: function(xhr, status, error) {
                     alert("다이닝 예약에 실패했습니다: " + error);/////////////////////////////
                     
                 }
             });
         } else {
             // 예약 가능한 객실이 없을 경우
             $(".btnArea").find("a").css({
                 'pointer-events': '',
                 'cursor': '',
                 'opacity': ''
             });
             alert("예약 가능한 다이닝이 존재하지 않습니다.");
         }
     },
     error: function(xhr, status, error) {
         alert("다이닝 예약 유효성 체크 중 오류가 발생했습니다: " + error);
         $(".btnArea").find("a").css({
             'pointer-events': '',
             'cursor': '',
             'opacity': ''
         });
     }
 });
}

	function fncGoStep0(){
		location.href = "http://localhost/hotel_prj/user/dining.do";
	}

</script>
</head>
<body style="overflow: hidden; position: fixed; width: 100%;">
    <div class="wrapper ">
        <!--S header  -->
        <jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
        <!--E header  -->

        <form id="form" name="form">
            <input type="hidden" id="bookerName" name="bookerName" value="">
            <input type="hidden" id="bookerPhone" name="bookerPhone" value="">
            <input type="hidden" id="bookerEmail" name="bookerEmail" value="">
            <input type="hidden" id="visitorName" name="visitorName" value="">
            <input type="hidden" id="visitorPhone" name="visitorPhone" value="">
            <input type="hidden" id="visitorEmail" name="visitorEmail" value="">
        	<input type="hidden" id="tableType" name="tableType" value="">
            <input type="hidden" id="requests" name="requests" value="">
   			<input type="hidden" id="adultCount" name="adultCount" value="">
    		<input type="hidden" id="childCount" name="childCount" value="">
    		<input type="hidden" id="infantCount" name="infantCount" value="">
    		<input type="hidden" id="totalPrice" name="totalPrice" value="">
            <input type="hidden" id="personCount" name="personCount" value="">
            <input type="hidden" id="visitDate" value="">
            <input type="hidden" id="moblphonTelno" name="moblphonTelno" value="">
            <input type="hidden" id="moblphonTelno1" name="moblphonTelno1" value="">
            <input type="hidden" id="moblphonTelno2" name="moblphonTelno2" value="">
            <input type="hidden" id="isDiffVisitorBooker" name="isDiffVisitorBooker" value="">
            <div id="container" class="container" style="margin-top: 0px;">
                <!-- 컨텐츠 S -->
                <h1 class="hidden">예약정보 상세</h1>
                <!-- 예약정보 상세 -->
                <div class="topArea">
                    <div class="topInner">
                        <h2 class="titDep1">Booking</h2>
                        <p class="pageGuide">엘리시안호텔앤의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p>
                        <!-- 엘리시안호텔앤의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
                        <div class="stepWrap">
                            <ol>
                                <li class="prev"><em>날짜, 시간, 인원 선택</em></li>
                                <!-- 날짜, 시간, 인원 선택 -->
                                <li class="on"><span class="hidden">현재단계</span><em>예약정보 상세</em></li>
                                <!-- 예약정보 상세 -->
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- //topArea -->
                <div class="inner">
                    <div class="drDining_st03">
                        <div class="chkValue">
                            <span> 엘리시안 <!--  그랜드 엘리시안 부산 --></span><span>ARIA <!-- The Ninth Gate --></span>
                        </div>
                        <div class="chkValue_prev">
                            <div class="leftInfo">
                                <span>${drVO.visitDate}</span>
                                <span>${drVO.visitTime} <!-- 오전 10:00 --></span>
                                <span id="personCntTitle">방문인원 총 ${drVO.visitPeople}명</span>
                            </div>
                        </div>
                        <!-- rsvRoomWrap -->
                        <div class="rsvRoomWrap">
                            <div class="lCont">
                                <div class="rsvDingList">
                                    <strong class="listTit">예약자 정보 입력</strong>
                                    <!-- 예약자 정보 입력 -->
                                    <ul class="intList">
                                        <li>
                                            <div class="intWrap top">
                                                <span class="tit">
                                                    <label for="inp_bookerName">RESERVATION NAME</label>
                                                    <span class="essential">필수</span>
                                                </span>
                                            </div>
                                            <div class="intInner">
                                                <span>
                                                    <input type="text" id="inp_bookerName" value="${drVO.visitorName}" readonly="readonly" style="width: 437px" aria-required="true" onkeyup="this.value=this.value.replace(/\s/g, '');" maxlength="20">
                                                    <!-- 이름 -->
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="intWrap">
                                                <span class="tit">
                                                    <label for="inp_moblphonTelno">PHONE NUMBER</label>
                                                    <span class="essential">필수</span>
                                                </span>
                                            </div>
                                            <div class="intInner phoneInp verifiCode">
                                                <span class="intArea">
                                                    <input type="text" class="bookerPhone" id="inp_moblphonTelno" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="3">
                                                </span>
                                                <span class="dash"></span>
                                                <span class="intArea">
                                                    <input type="text" class="bookerPhone" id="inp_moblphonTelno1" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4">
                                                </span>
                                                <span class="dash"></span>
                                                <span class="intArea">
                                                    <input type="text" class="bookerPhone" id="inp_moblphonTelno2" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4">
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="intWrap">
                                                <span class="tit">
                                                    <label for="inp_bookerEmail">E-MAIL</label>
                                                    <!-- 221209 필수삭제 -->
                                                </span>
                                            </div>
                                            <div class="intInner emailInp">
                                                <span>
                                                    <input type="text" id="inp_bookerEmail" style="width: 273px" aria-required="true" maxlength="50">
                                                </span>
                                                <span class="dash">@</span>
                                                <span>
                                                    <input type="text" id="inp_bookerEmail1" inp_bookeremail1="" style="width: 273px" aria-required="true" maxlength="50">
                                                </span>
                                                <div class="intArea selectWrap" style="width: 241px" first="true">
                                                    <!-- 직접 선택 -->
                                                    <select name="emailType" id="emailType" class="form-control" title="booker" style="display: none;">
                                                        <option value="">직접 선택</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="hanmail.net">hanmail.net</option>
                                                        <option value="hotmail.com">hotmail.com</option>
                                                        <option value="nate.com">nate.com</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                    </select>
                                                    <div class="ui-selectmenu-menu ui-front">
                                                        <div class="tweenDiv">
                                                            <ul aria-hidden="true" aria-labelledby="emailType-button" id="emailType-menu" role="listbox" tabindex="0" class="ui-menu ui-corner-bottom ui-widget ui-widget-content" style="max-height: 200px;"></ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- 230104 request 위치재변경 -->
                                        <!-- 221202 request 위치변경 -->
                                        <li>
                                            <div class="intWrap">
                                                <span class="tit">
                                                    <label for="inp_requests">REQUEST</label>
                                                    <!-- 221209 필수삭제 -->
                                                </span>
                                            </div>
                                            <div class="intInner requestArea">
                                                <!-- 알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오. -->
                                                <input id="inp_requests" maxlength="100" type="text" placeholder="알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오.">
                                            </div>
                                            <!-- 요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br/>다만, 호텔의 사정으로 부득이 반영되지 않을 수도 있으니 이 점 양해 부탁드립니다. -->
                                            <p class="txtGuide">
                                                요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br>다만, 호텔의 사정으로 부득이 반영되지 않을 수도 있으니 이 점 양해 부탁드립니다.
                                            </p>
                                        </li>
                                        <!-- // 221202 request 위치변경 -->
                                        <!--//  230104 request 위치재변경 -->
                                    </ul>
                                </div>

                                <div class="notiContainer">
                                    <div>
                                        <ul class="toggleList agreeCont toggleListAll">
                                            <li>
                                                <div class="clickBtn">
                                                    <span class="frm type03 btnToggle">
                                                        <input type="checkbox" id="inp_isDiffVisitorBooker" class="type03Chk">
                                                        <label class="label" for="">[선택] 예약자와 방문자가 다릅니다.</label>
                                                        <!-- [선택] 예약자와 방문자가 다릅니다. -->
                                                    </span>
                                                </div>
                                                <!-- 예약자와 실제 방문자가 다를 경우에만 체크 후 추가 입력해 주세요. -->
                                                <p class="txtGuide">예약자와 실제 방문자가 다를 경우에만 체크 후 추가 입력해 주세요.</p>
                                                <div class="toggleCont" style="display: none;">
                                                    <div class="visitorWrap">
                                                        <strong class="listTit">방문자 정보 입력</strong>
                                                        <!-- 방문자 정보 입력 -->

                                                        <ul class="intList">
                                                            <li>
                                                                <div class="intWrap top">
                                                                    <span class="tit">
                                                                        <label for="inp_visitorName">NAME</label>
                                                                        <span class="essential">필수</span>
                                                                    </span>
                                                                </div>
                                                                <div class="intInner">
                                                                    <span>
                                                                        <input type="text" id="inp_visitorName" placeholder="성함(국문)을 입력해주세요." style="width: 437px" aria-required="true" onkeyup="this.value=this.value.replace(/\s/g, '');" maxlength="20">
                                                                        <!-- 이름 -->
                                                                    </span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="intWrap">
                                                                    <span class="tit">
                                                                        <label for="inp_phone">PHONE NUMBER</label>
                                                                        <span class="essential">필수</span>
                                                                    </span>
                                                                </div>
                                                                <div class="intInner phoneInp">
                                                                    <span class="intArea">
                                                                        <input type="text" id="inp_phone" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="3">
                                                                    </span>
                                                                    <span class="dash"></span>
                                                                    <span class="intArea">
                                                                        <input type="text" id="inp_phone1" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4">
                                                                    </span>
                                                                    <span class="dash"></span>
                                                                    <span class="intArea">
                                                                        <input type="text" id="inp_phone2" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4">
                                                                    </span>
                                                                </div>
                                                            </li>
                                                            <!-- 221209 방문자 이메일 삭제 -->
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h3 class="titDep3" id="noticeTitle">매장 이용규정</h3>
                                        <!-- 매장 이용규정 -->
                                        <ul class="toggleList agreeCont" id="noticeArea">
                                            <li class="toggleOn">
                                                <span class="frm type02">
                                                    <input type="checkbox" id="frmA02">
                                                    <label for="frmA02">[필수] 매장 이용규정에 동의 합니다.</label>
                                                    <!-- [필수] 매장 이용규정에 동의 합니다. -->
                                                </span>
                                                <button type="button" class="btnToggle">
                                                    <span class="hidden">상세내용 보기</span>
                                                </button>
                                                <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                                <div class="toggleCont" style="display: block;">
                                                    <div class="toggleInner">
                                                        <div class="designScroll">
                                                            <div class="scrollWrap" style="">
                                                                <div class="customScrollBox">
                                                                    <ul class="listDep1" id="noticeUl">
                                                                        <li>당일 취소 및 노쇼(예약 시간 기준 30분 경과) 시 추후 예약이 제한됩니다.</li>
                                                                        <li>예약 시간 30분 경과 시 자동 예약 취소됩니다.</li>
                                                                        <li>예약금에 대한 환불 규정 확인 후 결제 진행 부탁 드립니다.</li>
                                                                        <li>예약금은 서비스 이용 후 전액 자동 환불됩니다.</li>
                                                                        <li>좌석 지정은 어려우며 예약하신 순서대로 자동 배정됩니다.</li>
                                                                        <li>예약인원 외 현장에서 영유아, 어린이 동반 방문 시, 좌석 배치가 어려울 수 있습니다.</li>
                                                                        <li>방문 전 주류 및 콜키지 규정 확인 부탁드립니다.</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <h3 class="titDep3">취소 환불 규정</h3>
                                        <!-- 221209 타이틀 추가 -->
                                        <!--  221207 취소규정 추가 -->
                                        <ul class="toggleList agreeCont">
                                            <!-- 221209 style 삭제 -->
                                            <li class="toggleOn">
                                                <span class="frm type02">
                                                    <input type="checkbox" id="frmA04">
                                                    <label for="frmA04">[필수] 취소 및 환불 규정에 동의합니다</label>
                                                    <!-- [필수] 취소 및 환불 규정에 동의합니다. -->
                                                </span>
                                                <button type="button" class="btnToggle">
                                                    <span class="hidden">상세내용 보기</span>
                                                </button>
                                                <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                                <div class="toggleCont" style="display: block;">
                                                    <div class="toggleInner">
                                                        <div class="designScroll">
                                                            <div class="scrollWrap" style="">
                                                                <div class="customScrollBox">
                                                                    <ul class="listDep1" id="refundUl">
                                                                        <li>노쇼 시 : 환불 불가</li>
                                                                        <li>당일 취소 : 환불 불가</li>
                                                                        <li>1일 전 취소 : 50% 환불</li>
                                                                        <li>2일 전 취소 : 100% 환불</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- // 221207 취소규정 추가 -->
                                    </div>
                                    <div>
                                        <h3 class="titDep3">개인정보 수집 · 이용 동의</h3>
                                        <!-- 개인정보 수집 &middot; 이용 동의 -->
                                        <ul class="toggleList agreeCont">
                                            <li class="toggleOn">
                                                <span class="frm type02">
                                                    <input type="checkbox" id="frmA03">
                                                    <label for="frmA03">[필수] 개인정보 수집 · 이용에 동의합니다.</label>
                                                    <!-- [필수]  개인정보 수집 &middot; 이용에 동의합니다. -->
                                                </span>
                                                <button type="button" class="btnToggle">
                                                    <span class="hidden">상세내용 보기</span>
                                                </button>
                                                <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                                <div class="toggleCont" style="display: block;">
                                                    <div class="toggleInner">
                                                        <!-- 221207 정보방침 수정 -->
                                                        <pg message=""></pg>
                                                        <table class="tblH">
                                                            <colgroup>
                                                                <col style="width: 30%">
                                                                <col style="width: auto">
                                                                <col style="width: 30%">
                                                            </colgroup>
                                                            <caption>개인정보 수집 이용 목록</caption>
                                                            <!-- 개인정보 수집 이용 목록 -->
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">수집 항목</th>
                                                                    <!-- 수집 항목 -->
                                                                    <th scope="col">수집 목적</th>
                                                                    <!-- 수집 목적 -->
                                                                    <th scope="col">보유 기간</th>
                                                                    <!-- 보유 기간 -->
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>이름, 휴대폰번호, 이메일주소</td>
                                                                    <!-- 이름, 휴대폰번호, 이메일주소 -->
                                                                    <td>서비스 이용자 식별, 서비스 이행을 위한 연락 및 안내, 고지사항 전달, 불만처리 등의 의사소통</td>
                                                                    <!-- 서비스 이용자 식별, 서비스 이행을 위한 연락 및 안내, 고지사항 전달, 불만처리 등의 의사소통 -->
                                                                    <td class="f18">최종 이용일부터 1년</td>
                                                                    <!-- 최종 이용일부터 1년 -->
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <!-- // 221207 정보방침 수정 -->
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- 221207 가이드변경 및 위치변경 -->
                                        <!-- 위 개인정보 수집/이용에 대한 동의를 거부할 수 있으나 동의 거부 시 영업장 예약이 제한됩니다. -->
                                        <p class="txtGuide">위 개인정보 수집/이용에 대한 동의를 거부할 수 있으나 동의 거부 시 영업장 예약이 제한됩니다.</p>
                                    </div>
                                    <div>
                                        <h3 class="titDep3">결제 수단 선택</h3>
                                        <ul class="toggleList agreeCont">
                                            <li class="toggleOn">
                                                <button type="button" class="btnToggle">
                                                    <span class="hidden">상세내용 보기</span>
                                                </button>
                                                <div class="toggleCont" style="display: block;">
                                                    <div class="toggleInner">
                                                        <div class="intInner">
                                                            <div class="intArea">
                                                                <div class="intBox">
                                                                    <span class="frm">
                                                                        <input type="radio" id="payType01" name="payType2" value="kakaopay" checked="checked">
                                                                        <label for="payType01">카카오페이</label>
                                                                        <input type="radio" id="payType02" name="payType2" value="inicis">
                                                                        <label for="payType02">KG이니시스</label>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <p class="txtGuide">결제 수단을 선택해주세요.</p>
                                    </div>

                                    <div id="descDiv">
                                        <div class="boxNotice">
                                            <h3 class="titDep3">유의사항</h3>
                                            <!-- 유의 사항 -->
                                            <ul id="descUl">
                                                <li>*엘리시안의 다이닝 내부 정책에 따라 이용이 제한될 수 있으며 방문 전 관련 상세 안내 및 이용 약관을 확인해 주시기 바랍니다.</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- // notiContainer -->
                            </div>
                            <div class="rCont floating" style="transition: margin-top 0.3s ease-out 0s;">
                                <ul class="rsvList">
                                    <li>
                                        <strong class="listTit"> 총 예약금액<!-- 총 예약금액 -->
                                            <span class="price"><em name="totalPrice">0</em>KRW</span>
                                        </strong>
                                        <div class="toggleCont">
                                            <div class="toggleInner">
                                                <div class="optionTotal">
                                                    <ul class="infoData" id="calcUl">
                                                        <li class="menuList" id="OnfHDUAzSnW_9cpfS9jRpA" data-id="OnfHDUAzSnW_9cpfS9jRpA" style="display: none;">
                                                            <span class="lfData">성인 x </span>
                                                            <span class="amount">0</span>
                                                            <span class="rtData menuPrice">0</span>
                                                        </li>
                                                        <li class="menuList" id="l0ljPCWyuLp73646rTZU3w" data-id="l0ljPCWyuLp73646rTZU3w" style="display: none;">
                                                            <span class="lfData">어린이 x </span>
                                                            <span class="amount">0</span>
                                                            <span class="rtData menuPrice">0</span>
                                                        </li>
                                                        <li class="menuList" id="kvUt09mqm8fXUfrdeA_1wA" data-id="kvUt09mqm8fXUfrdeA_1wA" style="display: none;">
                                                            <span class="lfData">36개월 이하 x </span>
                                                            <span class="amount">0</span>
                                                            <span class="rtData menuPrice">0</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="totalCont">
                                    <div class="totalPrice">
                                        <span class="txt">총 예약금액</span>
                                        <!-- 총 예약금액 -->
                                        <span class="price"><em name="totalPrice">0</em>KRW</span>
                                    </div>
                                    <div class="btnArea">
                                        <a href="javascript:void(0)" class="btnSC btnL active" id="btnResve" onclick="fncReservation()">결제</a>
                                        <!-- 결제하기 -->
                                    </div>
                                </div>
                                <p class="txtReference" id="refundDesc" style="display: none;"></p>
                            </div>
                        </div>
                        <!-- //rsvRoomWrap -->
                        <div class="btnArea">
                            <a href="javascript:void(0);" class="btnSC btnL" onclick="fncGoStep0();">이전</a>
                            <!-- 이전 -->
                        </div>
                    </div>
                    <!--  // drDining_st03 -->
                </div>
                <!-- //inner -->
                <!-- 컨텐츠 E -->
            </div>
            <!-- //container -->
        </form>

        <!-- 메뉴선택 Layer -->
        <div id="menuPop" class="layerPop diningSelectPop" style="display: block;">
            <div class="layerCont" tabindex="0" style="top: 50%; left: 50%; margin-top: -473.429px; margin-left: -540px;" data-gtm-vis-recent-on-screen36519946_61="135" data-gtm-vis-first-on-screen36519946_61="135" data-gtm-vis-total-visible-time36519946_61="100">
                <div class="compTit">
                    <span id="menuTitle">테이블 타입 &amp; 인원 상세 선택</span>
                </div>
                <div class="compLayer dnSelectScroll">
                    <!--  선택타입 15 - 테이블선택  -->
                    <div class="dnSelectBox" id="tableTypeDiv1">
                        <h2 class="boxTit">테이블 선택</h2>
                        <!-- 테이블 선택 -->
                        <div class="txtSelectBox">
                            <ul class="frmList" id="tableTypeUl1">
                                <li class="frmRadio">
                                    <input type="radio" id="table0" value="AVAILABLE_HALL_TABLE" name="tableType" data-tabletype="H" checked="checked">
                                    <label for="table0">홀</label>
                                </li>
                                <li class="frmRadio">
                                    <input type="radio" id="table1" value="AVAILABLE_ROOM_TABLE" name="tableType" data-tabletype="R">
                                    <label for="table1">룸</label>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="dnSelectBox" id="menuItemDiv">
                        <!-- 230112 &메뉴 가이드설명 -->
                        <!-- 메뉴 선택 -->
                        <!-- 표시가 있는 메뉴는 단독으로 선택이 되지 않습니다. -->
                        <h2 class="boxTit">
                            인원 선택<span class="smallTxt" id="nTypeGide" style="display: none;"><strong class="ico_ampersand"></strong>표시가 있는 메뉴는 단독으로 선택이 되지 않습니다.</span><span class="hidden">타입02</span>
                        </h2>
                        <!-- // 230112 &메뉴 가이드설명 -->
                        <div class="txtSelectBox">
                            <ul class="menuSelcet type02 badge_all" id="popMenuUl">
                                <li data-menuitemid="NRuSo1ddONc859L-uFQ53w" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="adult">
                                    <div class="menuSelcet_li">
                                        <span class="txt">
                                            <span class="badge_txt">위 결제 금액은 예약금 입니다.</span> 성인
                                        </span>
                                        <span class="price">${diningDetail.deposit} KRW</span>
                                        <div class="numPeople type02">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled">인원 수 감소</button>
                                            <span class="personNum" data-count="0">0</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)">인원 수 증가</button>
                                        </div>
                                    </div>
                                </li>
                                <li data-menuitemid="-eke34LaldD_Ei456jGWow" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="child">
                                    <div class="menuSelcet_li">
                                        <span class="txt">
                                            <span class="badge_txt">위 결제 금액은 예약금 입니다.</span> 어린이
                                        </span>
                                        <span class="price">${diningDetail.deposit} KRW</span>
                                        <div class="numPeople type02">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled">인원 수 감소</button>
                                            <span class="personNum" data-count="0">0</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)">인원 수 증가</button>
                                        </div>
                                    </div>
                                </li>
                                <li data-menuitemid="fpz49GgkhnLcr5VOGEy64Q" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="infant">
                                    <div class="menuSelcet_li">
                                        <span class="txt">
                                            <span class="badge_txt">위 결제 금액은 예약금 입니다.</span> 유아
                                        </span>
                                        <span class="price">0 KRW</span>
                                        <div class="numPeople type02">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled">인원 수 감소</button>
                                            <span class="personNum" data-count="0">0</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)">인원 수 증가</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <p class="txtGuide" id="menuDesc">인원별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요.</p>
                            <!-- 메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요. -->
                        </div>
                    </div>
                    <div class="dnSelectBox" id="amountDiv">
                        <h2 class="boxTit">예약금액</h2>
                        <!-- 예약금액 -->
                        <div class="txtSelectBox">
                            <div class="total noMember">
                                <div class="totalWrap type02">
                                    <span class="tit">총 예약금액</span>
                                    <strong class="pay"><em name="popTotalPrice" id="popTotalPrice">0</em>KRW</strong>
                                    <!-- 총 예약 금액 -->
                                </div>
                            </div>
                            <div>
                                <p class="txtGuide" id="priceDesc">메뉴별 예약금 x 총 예약인원</p>
                                <!-- 메뉴별 예약금 x 총 예약인원 -->
                                <p class="txtGuide">예약확정에 필요한 인원당 예약금 안내 입니다.</p>
                                <!-- 예약확정에 필요한 인원당 예약금 안내 입니다. -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnArea">
                    <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();">이전</a>
                    <!-- 이전 -->
                    <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncCompleteMenuSelect();">다음</a>
                    <!-- 다음 -->
                </div>
            </div>
        </div>

        <div id="loginLayerPop" class="layerPop login" style="display:none;">
            <div class="layerCont" style="top: 50%; left: 50%; margin-top: -319.5px; margin-left: -520px;">
                <div class="compLayer">
                    <h2 class="compTit">로그인<!-- 로그인 --></h2>
                    <div class="compCont">
                        <!-- 20200528 수정 : width(삭제) -->
                        <div class="loginBox">
                            <div class="membersLogin">
                                <p class="loginFrm">
                                    <!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                                    <span class="alertMessage" style="display:none;">아이디를 입력해주세요.<!-- 아이디를 입력해주세요. --></span>
                                    <label class="hidden" for="frm_userid">아이디</label>
                                    <input type="text" id="frm_userid" placeholder="아이디" aria-required="true" />
                                </p>
                                <p class="loginFrm">
                                    <!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                                    <span class="alertMessage" style="display:none">비밀번호를 입력해주세요.</span><!-- 비밀번호를 입력해주세요. -->
                                    <label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 -->
                                    <input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" />
                                </p>
                                <!-- 20200528 수정 : 아이디저장(추가) -->
                                <span class="frm">
                                    <input type="checkbox" id="idSaveCheck"><label for="idSaveCheck">아이디 저장</label><!-- 아이디 저장 -->
                                </span>
                                <!-- //20200528 수정 : 아이디저장(추가) -->
                                <button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID'); return false;">로그인<!-- 로그인 --></button>
                                <div class="loginLink">
                                    <a href="/identify/identifyIntro.do" class="btnS icoArr">회원가입<!-- 회원가입 --></a>
                                    <a href="/identify/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기<!-- 아이디 / 비밀번호 찾기 --></a>
                                </div>
                            </div>
                            <div class="snsLogin">
                                <a href="javascript:void(0);" class="google">구글 로그인<!-- 구글 로그인 --></a>
                                <a href="javascript:void(0);" class="facebook">페이스북 로그인<!-- 페이스북 로그인 --></a>

                                <a href="javascript:void(0);" class="naver">네이버 로그인<!-- 네이버 로그인 --></a>
                                <a href="javascript:void(0);" class="kakao">카카오톡 로그인<!-- 카카오톡 로그인 --></a>

                                <a href="javascript:void(0);" class="apple">애플 로그인<!-- 애플 로그인 --></a><!-- 20200528 수정 : 애플로그인(추가) -->
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btnClose" onclick="commonJs.popClose($('#loginLayerPop'));">닫기</button>
            </div>
        </div>

        <!-- footer S -->
        <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
        <!-- footer E -->
    </div>
    <!-- //wrapper -->
    <div class="dimmed" style="display: block;"></div>
</body>

</html>