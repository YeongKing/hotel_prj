<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="다이닝 예약 step0" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
                alert(value); // Debugging log
            });
            
        });
        
        var maxCount = ${personCount}; // 최대 인원 수
        var totalPersonCount = 0;
		var totalPrice = 0;
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
                    if (menuType !== 'infant') {
                    	totalPrice += personPrice;
                    }
                    $("#popTotalPrice").text(totalPrice);
                }
                if (count >= maxCount) {
                    count = maxCount;
                    $btnUp.prop('disabled', true);
                }
            } else if ($(button).data('prop') === 'down') {
                if (count > 0) {
                    count--;
                    if (menuType !== 'infant') {
                   		 totalPrice -= personPrice;
                    }
                    $("#popTotalPrice").text(totalPrice);
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
          
        });
        
        테
        function fncCompleteMenuSelect() {
        	if(totalPersonCount != maxCount){
            	alert("정원에 맞게 인원을 추가해주시길 바랍니다");
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
    </script>
</head>
 <body style="overflow: hidden; position: fixed; width: 100%;">
 <!-- Google Tag Manager (noscript) -->
 <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP"
 height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
 <!-- End Google Tag Manager (noscript) -->

	<div class="skip"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
        <!--S header  -->
        <jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
        <!--E header  -->
<script type="text/javascript">

    let langCode = 'ko';
    let emptyTableType = false; // 모든 테이블이 비어있을경우 true
    let emptyMenuSet = false;
    let snsValidation = false; // 전화번호 인증

    $(document).ready(function () {
        fncBrowserBtn(); // 브라우저 버튼
        fncTranceText();
        
        fncDrawReady(); // 예약 준비 화면
        fncBtnNoPay(); // 예약, 결제 버튼 구분
	    //메뉴 선택 없는 업장 정보 호출 용
        fncCatchDiningInfo(); // 업장정보(취소규정)
        
    });


    // 브라우저 버튼 이벤트
    function fncBrowserBtn() {
        // 뒤로가기 버튼 이벤트
        window.history.pushState(null, null, '');
        window.onpopstate = () => {
            window.history.pushState(null, null, '');
            window.onbeforeunload = null;
            history.go(1);
            fncGoStep0();
        };
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

    // 업장정보(취소규정)
    function fncCatchDiningInfo() {
        let shopId = $("#shopId").val();
        jQuery.ajax({
            type: "GET",
            url: "/resve/dining/info.json",
            cache: false,
            dataType: "json",
            async: false,
            global: false,
            data: {
                "shopId": shopId
            },
            beforeSend: function () {
                commonJs.showLoadingBar(); //로딩바 show
            },
            complete: function () {
                commonJs.closeLoadingBar(); //로딩바 hide
            },
            success: function (data) {
                let refundPolicy = data.result.data.refundPolicy;
                let totalAmount = Number($("#totalAmount").val());

                refundPolicy.sort(function(a, b) {
                    return a.baseDay - b.baseDay;
                });

                $("#refundUl").html('');

                refundPolicy.forEach(function (item, idx){
                    let baseDay = item.baseDay;
                    let refundRate = item.refundRate;
                    let dayNm = "";
                    let rateNm = "";
                    switch (baseDay) {
                        case -1:
                            dayNm = "노쇼 시"; // 노쇼 시
                            break;
                        case 0:
                            dayNm = "당일 취소"; // 당일 취소
                            break;
                        default:
                            dayNm = "{1}일 전 취소".replace('{1}', baseDay); // 1일 전 취소
                            break;
                    }

                    if (refundRate > 0) {
                        rateNm = "{1}% 환불".replace('{1}', (refundRate * 100)); // 10% 환불
                    } else if (refundRate == 0) {
                        rateNm = "환불 불가"; // 환불 불가
                    }

                    let refundLi = `<li>`+dayNm+` : `+rateNm+`</li>`;
                    $("#refundUl").append(refundLi);

                    if (baseDay > -1 && refundRate > 0 && idx == refundPolicy.length -1 && refundRate == 1 && totalAmount > 0) {
                        let refundDate = new Date($("#visitDate").val());
                        refundDate.setDate(refundDate.getDate() - Number(baseDay));
                        if (refundDate >= new Date()) {
                            let mm = refundDate.getMonth() >= 9 ? (refundDate.getMonth()+1) : "0"+(refundDate.getMonth()+1);
                            let dd = refundDate.getDate() >= 10 ? refundDate.getDate() : "0"+refundDate.getDate();
                            let refundDesc = "{1}월 {2}일 23시 59분까지 취소 시 예약금 100% 환불".replace('{1}', mm).replace('{2}', dd);
                            $("#refundDesc").show();
                            $("#refundDesc").text(refundDesc);
                        }
                    }
                });
            }
        });
    }

    // 예약 준비 api
    function resveReady() {
        return new Promise(function (resolve, reject) {
            jQuery.ajax({
                type: "GET",
                url: "/resve/dining/prepare.json",
                cache: false,
                dataType: "json",
                async: false,
                global: false,
                beforeSend: function () {
                    commonJs.showLoadingBar(); //로딩바 show
                },
                complete: function () {
                    commonJs.closeLoadingBar(); //로딩바 hide
                },
                success: function (data) {
                    resolve(data);
                }
            });
        });

    }

    // 예약 준비 화면
    async function fncDrawReady() {
        let data = await resveReady();

        if (typeof data.result.data == "undefined") {
            alert(data.resultMsg);
            return;
        }

        if (typeof data.result.data != "undefined") {

            let tables = data.result.data.tables;
            let sourceTableTypes = data.result.data.sourceTableTypes;
            let tableTypes = data.result.data.tableTypes;
            let notAvailableTableTypes = data.result.data.notAvailableTableTypes;
            let useTableTypeYn = data.result.data.useTableTypeYn;
            let useTableTypeMenuSet = data.result.data.useTableTypeMenuSet;
            let sourceTableTypeNames = data.result.data.sourceTableTypeNames; // {테이블 코드 : 테이블 명}

            $("#reservationToken").val(data.result.data.reservationToken);
            $("#holdingToken").val(data.result.data.holdingToken);
            $("#holdingExpiresAt").val(data.result.data.holdingExpiresAt);
            $("#useTableTypeYn").val(useTableTypeYn);
            $("#useTableTypeMenuSet").val(useTableTypeMenuSet);

            let personCount = $("#personCount").val();
            let confirmReservationUseYn = $("#confirmUseYn").val();

            let tableTypeIsAll = useTableTypeYn == "N" && useTableTypeMenuSet == "Y"; // 전체 테이블을 사용하는 경우
            let useNTableType = useTableTypeYn == "Y" && useTableTypeMenuSet == "Y"; // 미지정 메뉴 구분을 사용하는 경우

            if (tables.length > 0) {

                if (useTableTypeMenuSet == "Y") {
                    fncSelectMenuSet();
                    fncSelectTableType();
                    fncSelectMenuItem();
                } else {
                    fncSelectTableType();
                    fncSelectMenuSet();
                    fncSelectMenuItem();
                }

            }


    }


    // 예약
    function fncReservation() {
        let useTableTypeYn = nvl($("#useTableTypeYn").val());
        let useTableTypeMenuSet = nvl($("#useTableTypeMenuSet").val());

        if (useTableTypeYn == 'N' && useTableTypeMenuSet == 'N') {
            $("#selectedTableType").val('');
        }

        
        let bookerLastName = $("#bookerLastName").val();
        let bookerFirstName = $("#bookerFirstName").val();
        let bookerName = "";

        // 인증받은 번호
        let moblphonTelnoCkd = $("#moblphonTelno").val();
        let moblphonTelnoCkd1 = $("#moblphonTelno1").val();
        let moblphonTelnoCkd2 = $("#moblphonTelno2").val();
        // 현재 입력되어있는 번호
        let moblphoneTelno = $("#inp_moblphonTelno").val();
        let moblphoneTelno1 = $("#inp_moblphonTelno1").val();
        let moblphoneTelno2 = $("#inp_moblphonTelno2").val();

        // 국가코드
        let bookerNationality = $("#bookerNationality").val();

        // 인증받은 이메일
        let bookerEmailCkd = nvl($("#bookerEmail").val());
        // 현재 입력되어있는 이메일
        let bookerEmail = $("#inp_bookerEmail").val() != '' && $("#inp_bookerEmail1").val() != '' ? $("#inp_bookerEmail").val() + "@" + $("#inp_bookerEmail1").val() : '';

        if (langCode == "ko") {
            bookerName = $("#inp_bookerName").val();

            if (moblphonTelnoCkd != moblphoneTelno || moblphonTelnoCkd1 != moblphoneTelno1 || moblphonTelnoCkd2 != moblphoneTelno2) {
                snsValidation = false;
            } else if (typeof moblphonTelnoCkd != 'undefined' && typeof moblphonTelnoCkd1 != 'undefined' && typeof moblphonTelnoCkd2 != 'undefined') {
                if (moblphonTelnoCkd == moblphoneTelno && moblphonTelnoCkd1 == moblphoneTelno1 && moblphonTelnoCkd2 == moblphoneTelno2) {
                    snsValidation = true;
                }
            }
        } else if (langCode != "ko") {
            bookerName = bookerLastName + " " + bookerFirstName;
            moblphoneTelno = bookerNationality + moblphoneTelno;

            if (bookerEmailCkd != bookerEmail) {
                snsValidation = false;
            } else if (typeof bookerEmailCkd != 'undefined') {
                if (bookerEmailCkd == bookerEmail) {
                    snsValidation = true;
                }
            }
        }

        

        let requests = $("#inp_requests").val();
        let isDiffVisitorBooker = $("#inp_isDiffVisitorBooker").closest("li").hasClass("toggleOn");
        let notice = $("#frmA02");
        let refund = $("#frmA04");
        let personal = $("#frmA03");

        let visitorPhone = "";
        let visitorName = "";
        let visitorEmail = "";
        if (langCode == 'ko') {
            visitorPhone = $("#inp_phone").val()+$("#inp_phone1").val()+$("#inp_phone2").val();
            visitorName = $("#inp_visitorName").val();
        } else {
            visitorEmail = $("#inp_visitorEmail").val() != '' && $("#inp_visitorEmail1").val() != '' ? $("#inp_visitorEmail").val() + "@" + $("#inp_visitorEmail1").val() : '';
            visitorPhone = $("#visitorNationality").val()+$("#inp_phone").val()+$("#inp_phone1").val()+$("#inp_phone2").val();
            visitorName = $("#visitorLastName").val() + " " + $("#visitorFirstName").val();
        }

        

        if (langCode == "ko") {
            // 예약자 명 입력 검증
            if (bookerName == '') {
                alert("예약자명을 입력해 주세요."); // 예약자명은 필수 입니다
                $("#inp_bookerName").focus();
                return ;
            }

            // 전화번호 입력 검증
            if (moblphoneTelno == '' || moblphoneTelno1 == '' || moblphoneTelno2 == '') {
                alert("예약자 전화번호를 입력해 주세요."); // 예약자 전화번호는 필수 입니다
                $("#inp_moblphonTelno").focus();
                return ;
            }

            // 전화번호 인증 검증
            if (!snsValidation) {
                alert("인증번호 요청 버튼을 누르고 전화번호 인증을 해주세요."); // 전화번호 인증을 해주세요
                $("#inp_moblphonTelno").focus();
                return ;
            }

            // 이메일 입력 검증
            if (($("#inp_bookerEmail").val() != '' && $("#inp_bookerEmail1").val() == '') ||
                ($("#inp_bookerEmail").val() == '' && $("#inp_bookerEmail1").val() != '')) {
                alert("이메일 형식이 맞지 않습니다. 이메일 주소를 확인해 주세요."); // 이메일 형식이 잘못되었습니다
                $("#inp_bookerEmail").focus();
                return ;
            }

        } else if (langCode != "ko") {
            // 예약자 명 입력 검증
            if (bookerLastName == '' || bookerFirstName == '') {
                alert("이름을 정확히 입력해주세요."); // 이름을 정확히 입력해주세요.
                $("#bookerLastName").focus();
                return ;
            }

            // 전화번호 입력 검증
            if (bookerNationality == '' && (moblphoneTelno != '' || moblphoneTelno1 != '' || moblphoneTelno2 != '')) {
                alert("국가코드를 선택해 주세요."); // 국가코드를 선택해주세요.
                $("#inp_moblphonTelno").focus();
                return ;
            }

            // 전화번호 입력 검증
            if (bookerNationality != '' && (moblphoneTelno == '' || moblphoneTelno1 == '' || moblphoneTelno2 == '')) {
                alert("전화번호를 올바르게 입력해 주세요."); // 전화번호를 올바르게 입력해 주세요.
                $("#inp_moblphonTelno").focus();
                return ;
            }

            // 이메일 입력 검증
            if ($("#inp_bookerEmail").val() == '' || $("#inp_bookerEmail1").val() == '') {
                alert("예약자 이메일은 필수입니다."); // 예약자 이메일은 필수입니다.
                $("#inp_bookerEmail").focus();
                return ;
            }

            // 이메일 인증 검증
            if (!snsValidation) {
                alert("이메일 검증을 해주세요"); // 이메일 검증을 해주세요
                $("#inp_bookerEmail").focus();
                return ;
            }
        }

        //이메일 형식 검증
        if(bookerEmail != '' && !gfncVaildateEmail(bookerEmail)){
            alert("이메일 형식이 맞지 않습니다. 이메일 주소를 확인해 주세요."); // 이메일 형식이 잘못되었습니다
            $("#inp_bookerEmail").focus();
            return ;
        }

        $("#bookerName").val(bookerName);
        $("#moblphonTelno").val(moblphoneTelno);
        $("#moblphonTelno1").val(moblphoneTelno1);
        $("#moblphonTelno2").val(moblphoneTelno2);
        $("#bookerEmail").val(bookerEmail);

        

        // 예약자 방문자 다른경우
        if (isDiffVisitorBooker) {

            if (langCode == 'ko') {
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

            } else if (langCode != 'ko') {

                let visitorNationality = $("#visitorNationality").val();

                // 방문자 명 입력 검증 (필수)
                if ($("#visitorLastName").val() == '' || $("#visitorFirstName").val() == '') {
                    alert("방문자명을 입력해 주세요."); // 방문자명은 필수 입니다
                    $("#visitorLastName").focus();
                    return ;
                }

                // 방문자 이메일 검증 (필수)
                if ($("#inp_visitorEmail").val() == '' || $("#inp_visitorEmail1").val() == '') {
                    alert("방문자 이메일을 입력해 주세요."); // 방문자 이메일은 필수입니다.
                    $("#inp_visitorEmail").focus();
                    return;
                }

                //이메일 형식 검증 (필수)
                if(visitorEmail != '' && !gfncVaildateEmail(visitorEmail)){
                    alert("이메일 형식이 맞지 않습니다. 이메일 주소를 확인해 주세요."); // 이메일 형식이 잘못되었습니다
                    $("#inp_visitorEmail").focus();
                    return ;
                }

                // 전화번호 입력 검증 (비필수)
                if (visitorNationality == '' && ($("#inp_phone").val() != '' || $("#inp_phone1").val() != '' || $("#inp_phone2").val() != '')) {
                    alert("국가코드를 선택해 주세요."); // 국가코드를 선택해주세요.
                    $("#inp_phone").focus();
                    return ;
                }
                // 전화번호 입력 검증 (비필수)
                if (visitorNationality != '' && ($("#inp_phone").val() == '' || $("#inp_phone1").val() == '' || $("#inp_phone2").val() == '')) {
                    alert("전화번호를 올바르게 입력해 주세요."); // 전화번호를 올바르게 입력해 주세요.
                    $("#inp_phone").focus();
                    return;
                }

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

        $("#requests").val(requests);
        $("#isDiffVisitorBooker").val(isDiffVisitorBooker);
        $("#visitorName").val(visitorName);
        $("#visitorPhone").val(visitorPhone);
        $("#visitorEmail").val(visitorEmail);
        paymentPopup();

    }

    // 결제 팝업 validation alert
    function fncViewAlert(resultMsg) {
        alert(resultMsg);
    }

    // 결제 팝업
    function paymentPopup() {

        let options = 'top=10, left=10, width=375, height=812, status=no, menubar=no, toolbar=no, resizable=no';
        let popup = window.open("", "reserve", options);
        if (!popup || popup.closed || typeof popup.closed == "undefined") {
	        alert("팝업이 차단되었습니다. 팝업 차단 해제 후 다시 시도해주세요.");
            return false;
        }
        $("#form").attr("action", "/resve/dining.do");
        $("#form").attr("target", "reserve");
        $("#form").attr("method", "POST");
        $("#form").submit();
    }


    // 예약, 결제 구분
    function fncBtnNoPay() {
        let totalAmount = Number($("#totalAmount").val());

        if (totalAmount == 0) {
            $("#btnResve").html("예약"); // 예약
            $("#refundDesc").hide();
        } else if (totalAmount > 0) {
            $("#btnResve").html("결제하기"); // 결제하기
        }
    }



    //예약 팝업에서 성공시 실행되는 함수
    function fncGoComplete(reservationId) {
        location.href = "/resve/dining/complete.do?reservationId="+reservationId;
    }

    function fncTranceText() {
        $("#personCntTitle").html('방문인원 총 {1}명'.replace('{1}', $("#personCount").val()));
        $("#nTypeGide").html('{1}표시가 있는 메뉴는 단독으로 선택이 되지 않습니다.'.replace('{1}', `<strong class="ico_ampersand"></strong>`));
    }
    
</script>
<form id="form" name="form">
    <input type="hidden" id="searchSysCode" name="searchSysCode" value="TWC">
    <input type="hidden" id="diningCode" name="diningCode" value="003">
    <input type="hidden" id="searchLangCode" name="searchLangCode" value="">

    <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ">
    <input type="hidden" id="holdingExpiresAt" name="holdingExpiresAt" value="2024-06-17T12:22:16.605423953+09:00">
    <input type="hidden" id="confirmUseYn" name="confirmUseYn" value="N">
    <input type="hidden" id="personCount" name="personCount" value="2">
    <input type="hidden" id="visitDate" value="2024.06.17(월)">

    <input type="hidden" id="holdingToken" name="holdingToken" value="4BtLblwlv--hiGwdrZYAJw">
    <input type="hidden" id="reservationToken" name="reservationToken" value="H4sIAAAAAAAA_wFQAa_-UTAJq207djnjOl75wJAxxgoDJUf6_uNK9zBqk4rnsij1QbxbjyfJIU1nHBhGNvWAUm6Yc6HxwPwYFKih993-g9JKCPI9zSeiXPYlpiHzf1CUyL7VOZ-y_G-NGcECouABMXNmJqKXHHqxSevtWAvSr8Fi3ovZ5XJbi9-lxW6Zxc2ZazEkWY6sYLRL2cMknLUbACvHSb5-JsCx5RC9EqzWhKFabh6I4XhnyPnogZQEeX3RULecyXkAS-fhVlU61AMd7Ns_mjLQHhR7jjswI0z-3VwNByymy6Sg6bE1DKjrFfAEf1OXNqmjzZ8kKKqQ7QcuarA0g8BWA-GkcuOpW8PkHbGY9Th5CERFqAba81X2Lfg7T5X3bBT01yFl2M7aOZXko0IvfGfrebX5YOt1Tr0DFrFN0E7FM2dvLwfqhvzYDyM1FGlLormJ88vt_scKahSZHLvePVABAAA=">
    <input type="hidden" id="bookerName" name="bookerName" value="">
    <input type="hidden" id="bookerEmail" name="bookerEmail" value="">
    <input type="hidden" id="bookerNationalCode" name="bookerNationalCode" value="">
    <input type="hidden" id="moblphonTelno" name="moblphonTelno" value="">
    <input type="hidden" id="moblphonTelno1" name="moblphonTelno1" value="">
    <input type="hidden" id="moblphonTelno2" name="moblphonTelno2" value="">
    <input type="hidden" id="isDiffVisitorBooker" name="isDiffVisitorBooker" value="">
    <input type="hidden" id="requests" name="requests" value="">
    <input type="hidden" id="visitorName" name="visitorName" value="">
    <input type="hidden" id="visitorNationalCode" name="visitorNationalCode" value="">
    <input type="hidden" id="visitorPhone" name="visitorPhone" value="">
    <input type="hidden" id="visitorEmail" name="visitorEmail" value="">
    <input type="hidden" id="selectedMenus" name="selectedMenus" value="">
    <input type="hidden" id="selectedTableType" name="selectedTableType" value="">

    <input type="hidden" id="selectedMenuSetId" name="selectedMenuSetId" value="BBg9ONqfJAzE-wJ6TxdRBA">
    <input type="hidden" id="sellType" name="sellType" value="C">
    <input type="hidden" id="menuSelectType" name="menuSelectType" value="B">
    <input type="hidden" id="useTableTypeYn" name="useTableTypeYn" value="N">
    <input type="hidden" id="useTableTypeMenuSet" name="useTableTypeMenuSet" value="N">
    <input type="hidden" id="additionalType" name="additionalType" value="">
    <input type="hidden" id="maxAmount" name="maxAmount" value="">
    <input type="hidden" id="totalAmount" name="totalAmount" value="0">
    <div id="container" class="container" style="margin-top: 0px;">
        <!-- 컨텐츠 S -->
        <h1 class="hidden">예약정보 상세</h1><!-- 예약정보 상세 -->
        <div class="topArea">
            <div class="topInner">
                <h2 class="titDep1">Booking</h2>
                <p class="pageGuide">조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p><!-- 조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
                <div class="stepWrap">
                    <ol>
                        <li class="prev"><em>날짜, 시간, 인원 선택</em></li><!-- 날짜, 시간, 인원 선택 -->
                        <li class="on"><span class="hidden">현재단계</span><em>예약정보 상세</em></li><!-- 예약정보 상세 -->
                    </ol>
                </div>
            </div>
        </div>
        <!-- //topArea -->
        <div class="inner">
            <div class="drDining_st03">
                <div class="chkValue"><span>웨스틴 조선 서울<!--  그랜드 조선 부산 --></span><span>ARIA <!-- The Ninth Gate --></span></div>
                <div class="chkValue_prev">
                    <div class="leftInfo">
                        <span>${visitDate}</span>
                        <span>${visitTime} <!-- 오전 10:00 --></span>
                        <span id="personCntTitle">방문인원 총 2명</span>
                    </div>
                </div>
                <!-- rsvRoomWrap -->
                <div class="rsvRoomWrap">
                    <div class="lCont">
                        <div class="rsvDingList">
                            <strong class="listTit">예약자 정보 입력</strong><!-- 예약자 정보 입력 -->
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
												<input type="text" id="inp_bookerName" placeholder="성함(국문)을 입력해주세요." style="width:437px" aria-required="true" onkeyup="this.value=this.value.replace(/\s/g, '');" maxlength="20"><!-- 이름 -->
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
                                        <span class="intArea"><input type="text" class="bookerPhone" id="inp_moblphonTelno" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="3"></span>
                                        <span class="dash"></span>
                                        <span class="intArea"><input type="text" class="bookerPhone" id="inp_moblphonTelno1" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4"></span>
                                        <span class="dash"></span>
                                        <span class="intArea"><input type="text" class="bookerPhone" id="inp_moblphonTelno2" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4"></span>
                                        <span class="btnArea"><a href="javascript:void(0)" class="btnSC btnL verifiCodeBtn" onclick="fncAllimTalkSendPhone();">인증번호 요청</a></span><!-- 인증번호 요청 -->
                                    </div>
                                    <!-- 인증번호 확인창  -->
                                    <div class="verifiCode" id="checkPhoneNum" style="display: none">
											<span class="intArea">
												<input id="allimTalkVerifyPhone" type="text" style="width:349px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" maxlength="4">
												<span class="vertifiTime" name="allimTalkTimer">0:00</span>
											</span>
                                        <span class="btnArea"><a href="javascript:void(0)" class="btnSC btnL active verifiCodeBtn" onclick="fncAllimTalkVerifyPhone();">인증번호 확인</a></span><!-- 인증번호 확인 -->
                                    </div>
                                    <!-- // 인증번호 확인창  -->
                                    <p class="txtGuide">예약을 하시려면 휴대폰 번호 인증이 필요합니다.</p><!-- 예약을 하시려면 휴대폰 번호 인증이 필요합니다. -->
                                    <p class="txtGuide">휴대폰 번호는 예약번호 전송에 사용됩니다.</p><!-- 휴대폰 번호는 예약번호 전송에 사용됩니다. -->
                                    <p class="txtGuide">비회원의 경우 휴대폰 번호 인증을 통해 예약이 진행되며, 휴대폰 인증이 불가할 경우 유선 예약 부탁드립니다.</p><!-- 비회원의 경우 휴대폰 번호 인증을 통해 예약이 진행되며, 휴대폰 인증이 불가할 경우 유선 예약 부탁드립니다. -->
                                </li>
                                <li>
                                    <div class="intWrap">
											<span class="tit">
												<label for="inp_bookerEmail">E-MAIL</label><!-- 221209 필수삭제 -->
											</span>
                                    </div>
                                    <div class="intInner emailInp">
                                        <span><input type="text" id="inp_bookerEmail" style="width:273px" aria-required="true" maxlength="50"></span>
                                        <span class="dash">@</span>
                                        <span><input type="text" id="inp_bookerEmail1" inp_bookeremail1="" style="width:273px" aria-required="true" maxlength="50"></span>
                                        <div class="intArea selectWrap" style="width:241px" first="true">
                                            <!-- 직접 선택 -->
                                            <select name="emailType" id="emailType" class="form-control" title="booker" style="display: none;"><option value="">직접 선택</option><option value="naver.com">naver.com</option><option value="hanmail.net">hanmail.net</option><option value="hotmail.com">hotmail.com</option><option value="nate.com">nate.com</option><option value="gmail.com">gmail.com</option></select><button tabindex="0" id="emailType-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="emailType-menu" aria-haspopup="true" title="booker" class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget" type="button"><span class="ui-selectmenu-text">직접 선택</span></button>
                                        <div class="ui-selectmenu-menu ui-front"><div class="tweenDiv"><ul aria-hidden="true" aria-labelledby="emailType-button" id="emailType-menu" role="listbox" tabindex="0" class="ui-menu ui-corner-bottom ui-widget ui-widget-content" style="max-height: 200px;"></ul></div></div></div>
                                    </div>
                                </li>
                            

                            
                            

                            
                                <!-- 230104 request 위치재변경 -->
                                <!-- 221202 request 위치변경 -->
                                <li>
                                    <div class="intWrap">
                                        <span class="tit">
                                            <label for="inp_requests">REQUEST</label><!-- 221209 필수삭제 -->
                                        </span>
                                    </div>
                                    <div class="intInner requestArea">
                                        <!-- 알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오. -->
                                        <input id="inp_requests" maxlength="100" type="text" placeholder="알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오.">
                                    </div>
                                    <!-- 요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br/>다만, 호텔의 사정으로 부득이 반영되지 않을 수도 있으니 이 점 양해 부탁드립니다. -->
                                    <p class="txtGuide">요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br>다만, 호텔의 사정으로 부득이 반영되지 않을 수도 있으니 이 점 양해 부탁드립니다.</p>
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
												<span class="frm type03 btnToggle" onclick="fncDiffVisitorRefresh();">
													<input type="checkbox" id="inp_isDiffVisitorBooker" class="type03Chk"><label class="label" for="">[선택] 예약자와 방문자가 다릅니다.</label><!-- [선택] 예약자와 방문자가 다릅니다. -->
												</span>
                                        </div>
                                        <!-- 예약자와 실제 방문자가 다를 경우에만 체크 후 추가 입력해 주세요. -->
                                        <p class="txtGuide">예약자와 실제 방문자가 다를 경우에만 체크 후 추가 입력해 주세요.</p>
                                        <div class="toggleCont" style="display: none;">
                                            <div class="visitorWrap">
                                                <strong class="listTit">방문자 정보 입력</strong><!-- 방문자 정보 입력 -->
                                                
                                                    
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
																	<input type="text" id="inp_visitorName" placeholder="성함(국문)을 입력해주세요." style="width:437px" aria-required="true" onkeyup="this.value=this.value.replace(/\s/g, '');" maxlength="20"><!-- 이름 -->
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
                                                                    <span class="intArea"><input type="text" id="inp_phone" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="3"></span>
                                                                    <span class="dash"></span>
                                                                    <span class="intArea"><input type="text" id="inp_phone1" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4"></span>
                                                                    <span class="dash"></span>
                                                                    <span class="intArea"><input type="text" id="inp_phone2" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]|\s/g, '');" maxlength="4"></span>
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
                                <h3 class="titDep3" id="noticeTitle">매장 이용규정</h3><!-- 매장 이용규정 -->
                                <ul class="toggleList agreeCont" id="noticeArea">
                                    <li class="toggleOn">
											<span class="frm type02">
												<input type="checkbox" id="frmA02"><label for="frmA02">[필수] 매장 이용규정에 동의 합니다.</label><!-- [필수] 매장 이용규정에 동의 합니다. -->
											</span>
                                        <button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
                                        <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                        <div class="toggleCont" style="display: block;">
                                            <div class="toggleInner">
                                                <div class="designScroll"><div class="scrollWrap" style=""><div class="customScrollBox">
                                                    <ul class="listDep1" id="noticeUl"><li>당일 취소 및 노쇼(예약 시간 기준 30분 경과) 시 추후 예약이 제한됩니다.</li><li>예약 시간 30분 경과 시 자동 예약 취소됩니다.</li><li>예약금에 대한 환불 규정 확인 후 결제 진행 부탁 드립니다.</li><li>예약금은 서비스 이용 후 전액 자동 환불됩니다.</li><li>좌석 지정은 어려우며 예약하신 순서대로 자동 배정됩니다.</li><li>예약인원 외 현장에서 영유아, 어린이 동반 방문 시, 좌석 배치가 어려울 수 있습니다.</li><li>방문 전 주류 및 콜키지 규정 확인 부탁드립니다.</li></ul>
                                                </div></div></div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <h3 class="titDep3">취소 환불 규정</h3><!-- 221209 타이틀 추가 -->
                                <!--  221207 취소규정 추가 -->
                                <ul class="toggleList agreeCont"><!-- 221209 style 삭제 -->
                                    <li class="toggleOn">
											<span class="frm type02">
												<input type="checkbox" id="frmA04"><label for="frmA04">[필수] 취소 및 환불 규정에 동의합니다</label><!-- [필수] 취소 및 환불 규정에 동의합니다. -->
											</span>
                                        <button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
                                        <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                        <div class="toggleCont" style="display: block;">
                                            <div class="toggleInner">
                                                <div class="designScroll"><div class="scrollWrap" style=""><div class="customScrollBox">
                                                    <ul class="listDep1" id="refundUl"><li>노쇼 시 : 환불 불가</li><li>당일 취소 : 환불 불가</li><li>1일 전 취소 : 50% 환불</li><li>2일 전 취소 : 100% 환불</li></ul>
                                                </div></div></div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <!-- // 221207 취소규정 추가 -->
                            </div>
                            <div>
                                <h3 class="titDep3">개인정보 수집 · 이용 동의</h3><!-- 개인정보 수집 &middot; 이용 동의 -->
                                <ul class="toggleList agreeCont">
                                    <li class="toggleOn">
											<span class="frm type02">
                                                <input type="checkbox" id="frmA03"><label for="frmA03">[필수] 개인정보 수집 · 이용에 동의합니다.</label><!-- [필수]  개인정보 수집 &middot; 이용에 동의합니다. -->
											</span>
                                        <button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
                                        <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
                                        <div class="toggleCont" style="display: block;">
                                            <div class="toggleInner">
                                                <!-- 221207 정보방침 수정 -->
                                                <pg message="">
                                                    </pg><table class="tblH">
                                                    <colgroup>
                                                        <col style="width:30%">
                                                        <col style="width:auto">
                                                        <col style="width:30%">
                                                    </colgroup>
                                                    <caption>개인정보 수집 이용 목록</caption><!-- 개인정보 수집 이용 목록 -->
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">수집 항목</th><!-- 수집 항목 -->
                                                        <th scope="col">수집 목적</th><!-- 수집 목적 -->
                                                        <th scope="col">보유 기간</th><!-- 보유 기간 -->
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>이름, 휴대폰번호, 이메일주소</td><!-- 이름, 휴대폰번호, 이메일주소 -->
                                                        <td>서비스 이용자 식별, 서비스 이행을 위한 연락 및 안내, 고지사항 전달, 불만처리 등의 의사소통</td><!-- 서비스 이용자 식별, 서비스 이행을 위한 연락 및 안내, 고지사항 전달, 불만처리 등의 의사소통 -->
                                                        <td class="f18">최종 이용일부터 1년</td><!-- 최종 이용일부터 1년 -->
                                                    </tr></tbody>
                                                </table>
                                                <!-- // 221207 정보방침 수정 -->
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <!-- 221207 가이드변경 및 위치변경 -->
                                <!-- 위 개인정보 수집/이용에 대한 동의를 거부할 수 있으나 동의 거부 시 영업장 예약이 제한됩니다. -->
                                <p class="txtGuide">위 개인정보 수집/이용에 대한 동의를 거부할 수 있으나 동의 거부 시 영업장 예약이 제한됩니다.</p>
                                <!-- //221207 가이드변경 및 위치변경 -->
                            </div>
                            <div id="descDiv">
                                <div class="boxNotice">
                                    <h3 class="titDep3">유의사항</h3><!-- 유의 사항 -->
                                    <ul id="descUl"><li>* 클럽 조선 멤버십,제휴 카드 등 제휴사 할인 혜택은 내부 정책에 따라 이용이 제한될 수 있으며 방문 전 관련 상세 안내 및 이용 약관을 확인해 주시기 바랍니다.</li><li>[할인 혜택 공통 제외일 : 5/5, 12/24, 12/25,12/31]</li></ul>
                                </div>
                            </div>
                        </div><!-- // notiContainer -->
                    </div>
                    <div class="rCont floating" style="transition: margin-top 0.3s ease-out 0s;">
                        <ul class="rsvList">
                            <li>
                                <strong class="listTit">
                                    총 예약금액<!-- 총 예약금액 -->
                                    <span class="price"><em name="totalPrice">0</em>KRW</span>
                                </strong>
                                <div class="toggleCont">
                                    <div class="toggleInner">
                                        <div class="optionTotal">
                                            <ul class="infoData" id="calcUl"><li class="menuList" id="OnfHDUAzSnW_9cpfS9jRpA" data-id="OnfHDUAzSnW_9cpfS9jRpA" style="display: none;"><span class="lfData">성인 x </span><span class="amount">0</span><span class="rtData menuPrice">0</span></li><li class="menuList" id="l0ljPCWyuLp73646rTZU3w" data-id="l0ljPCWyuLp73646rTZU3w" style="display: none;"><span class="lfData">어린이 x </span><span class="amount">0</span><span class="rtData menuPrice">0</span></li><li class="menuList" id="kvUt09mqm8fXUfrdeA_1wA" data-id="kvUt09mqm8fXUfrdeA_1wA" style="display: none;"><span class="lfData">36개월 이하 x </span><span class="amount">0</span><span class="rtData menuPrice">0</span></li></ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="totalCont">
                            <div class="totalPrice">
                                <span class="txt">총 예약금액</span><!-- 총 예약금액 -->
                                <span class="price"><em name="totalPrice">0</em>KRW</span>
                            </div>
                            <div class="btnArea">
                                <a href="javascript:void(0)" class="btnSC btnL active" id="btnResve" onclick="fncReservation();">예약</a><!-- 결제하기 -->
                            </div>
                        </div>
                        <p class="txtReference" id="refundDesc" style="display: none;"></p>
                    </div>
                </div><!-- //rsvRoomWrap -->
                <div class="btnArea">
                    <a href="javascript:void(0);" class="btnSC btnL" onclick="fncGoStep0();">이전</a><!-- 이전 -->
                </div>

            </div><!--  // drDining_st03 -->
        </div>
        <!-- //inner -->
        <!-- 컨텐츠 E -->
    </div>
    <!-- //container -->
</form>

<!-- 메뉴선택 Layer -->
<div id="menuPop" class="layerPop diningSelectPop" style="display: block;">
    <div class="layerCont" tabindex="0" style="top: 50%; left: 50%; margin-top: -473.429px; margin-left: -540px;" data-gtm-vis-recent-on-screen36519946_61="135" data-gtm-vis-first-on-screen36519946_61="135" data-gtm-vis-total-visible-time36519946_61="100" >
        <div class="compTit" >
            <span id="menuTitle" >테이블 타입 &amp; 인원 상세 선택</span>
        </div>
        <div class="compLayer dnSelectScroll" >
            
            <!--  선택타입 15 - 테이블선택  -->
            <div class="dnSelectBox" id="tableTypeDiv1" >
                <h2 class="boxTit" >테이블 선택</h2><!-- 테이블 선택 -->
                <div class="txtSelectBox" >
                    <ul class="frmList" id="tableTypeUl1" >
                    <li class="frmRadio" ><input type="radio" id="table0" value="Hall" name="tableType" data-tabletype="H" checked="checked" ><label for="table0" >홀</label></li>
                    <li class="frmRadio" ><input type="radio" id="table1" value="Room" name="tableType" data-tabletype="R" ><label for="table1" >룸</label></li>
                    </ul>
                </div>
            </div>
           
            <div class="dnSelectBox" id="menuItemDiv" >
                <!-- 230112 &메뉴 가이드설명 -->
                <!-- 메뉴 선택 --><!-- 표시가 있는 메뉴는 단독으로 선택이 되지 않습니다. -->
                <h2 class="boxTit" >인원 선택<span class="smallTxt" id="nTypeGide" style="display: none;" ><strong class="ico_ampersand" ></strong>표시가 있는 메뉴는 단독으로 선택이 되지 않습니다.</span><span class="hidden" >타입02</span></h2>
                <!-- // 230112 &메뉴 가이드설명 -->
                <div class="txtSelectBox" >
                    <ul class="menuSelcet type02 badge_all" id="popMenuUl" ><li data-menuitemid="NRuSo1ddONc859L-uFQ53w" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="adult" >
                                                                <div class="menuSelcet_li" >
                                                                    <span class="txt" ><span class="badge_txt" >위 결제 금액은 예약금 입니다.</span>            성인</span>
                                                                    <span class="price" >${diningDetail.deposit} KRW</span>
                                                                    <div class="numPeople type02" >
                                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" >인원 수 감소</button>
                                                                        <span class="personNum" data-count="0" >0</span>
                                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" >인원 수 증가</button>
                                                                    </div>
                                                                </div></li><li data-menuitemid="-eke34LaldD_Ei456jGWow" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="child" >
                                                                <div class="menuSelcet_li" >
                                                                    <span class="txt" ><span class="badge_txt" >위 결제 금액은 예약금 입니다.</span>            어린이</span>
                                                                    <span class="price" >${diningDetail.deposit} KRW</span>
                                                                    <div class="numPeople type02" >
                                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" >인원 수 감소</button>
                                                                        <span class="personNum" data-count="0" >0</span>
                                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" >인원 수 증가</button>
                                                                    </div>
                                                                </div></li><li data-menuitemid="fpz49GgkhnLcr5VOGEy64Q" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="infant" >
                                                                <div class="menuSelcet_li" >
                                                                    <span class="txt" ><span class="badge_txt" >위 결제 금액은 예약금 입니다.</span>            유아</span>
                                                                    <span class="price" >0 KRW</span>
                                                                    <div class="numPeople type02" >
                                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" >인원 수 감소</button>
                                                                        <span class="personNum" data-count="0" >0</span>
                                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" >인원 수 증가</button>
                                                                    </div>
                                                                </div></li></ul>
                    <p class="txtGuide" id="menuDesc" >인원별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요.</p><!-- 메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요. -->
                </div>
            </div>
            <div class="dnSelectBox" id="amountDiv" >
                <h2 class="boxTit" >예약금액</h2><!-- 예약금액 -->
                <div class="txtSelectBox" >
                    <div class="total noMember" >
                        <div class="totalWrap type02" >
                            <span class="tit" >총 예약금액</span><strong class="pay" ><em name="popTotalPrice" id="popTotalPrice" >0</em>KRW</strong><!-- 총 예약 금액 -->
                        </div>
                    </div>
                    <div >
                        <p class="txtGuide" id="priceDesc" >메뉴별 예약금 x 총 예약인원</p><!-- 메뉴별 예약금 x 총 예약인원 -->
                        <p class="txtGuide" >예약확정에 필요한 인원당 예약금 안내 입니다.</p><!-- 예약확정에 필요한 인원당 예약금 안내 입니다. -->
                    </div>
                </div>
            </div>
        </div>
        <div class="btnArea" >
            <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();" >이전</a><!-- 이전 -->
            <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncCompleteMenuSelect();" >다음</a><!-- 다음 -->
        </div>
    </div>
</div>

      <!-- footer S -->
    <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
    <!-- footer E -->
	</div>
	<!-- //wrapper -->
<div class="dimmed" style="display: block;"></div>



</body></html>