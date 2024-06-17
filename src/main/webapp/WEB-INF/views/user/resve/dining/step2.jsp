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
    </script>
</head>
<body>
    <div class="wrapper">
        <!--S header  -->
        <jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
        <!--E header  -->
        <form id="form" name="form">
            <input type="hidden" id="searchSysCode" name="searchSysCode" value="TWC">
            <input type="hidden" id="diningCode" name="diningCode" value="003">
            <input type="hidden" id="searchLangCode" name="searchLangCode" value="">
            <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ">
            <input type="hidden" id="holdingExpiresAt" name="holdingExpiresAt" value="2024-06-15T23:47:55.039130695+09:00">
            <input type="hidden" id="confirmUseYn" name="confirmUseYn" value="N">
            <input type="hidden" id="personCount" name="personCount" value="3">
            <input type="hidden" id="visitDate" value="2024.06.21(금)">
            <input type="hidden" id="holdingToken" name="holdingToken" value="Q1VkuLLkyMxjgrS5CTi29g">
            <input type="hidden" id="reservationToken" name="reservationToken" value="H4sIAAAAAAAA_wFQAa_-X972XazmaJkRQFsN-eJ7kXjHfmvZIKHgB7pZhvfyrVB6A-dEAOsuYR0A5CAetFkE7Q9fnM0i-YHoVDnCrwVLQMrW0qcsnlqthDW6kJRcL4Igtx4fA3LEi_XcJhLbk32xXGb5eXDkYhP9BkhfNrv2BeY2dGV3K19PifgU937swWrGOGcPfWPokNSEerMfYOIM4TQBDdGC_hrpZo199nIiXRWqhXfeKvOgcphOqG_FyoKdcA6bptDGumt0w0fosO3_3bGM_B6h7kOAG8D3X3u-KIQVhZf1DfWYU8t9bZ-B9XifuCSuf2__Ipg7suu7-WLbLEhhsaHkaE1A9MDwgIKpfmAfyqbCQvYPQc67HO6Nrhy8tr9P3FjNqaf_sWOkbvR3uyGTFIdGaPKUAIzSQPuzvO5lYmioiy_AtnCgg6WNiFFC5Y_w3EYFEjJRHeYPuDjMP17w3VABAAA=">
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
            <input type="hidden" id="selectedMenus" name="selectedMenus" value="[{&quot;menuSetId&quot;:&quot;BBg9ONqfJAzE-wJ6TxdRBA&quot;,&quot;menuItemId&quot;:&quot;OnfHDUAzSnW_9cpfS9jRpA&quot;,&quot;amount&quot;:3}]">
            <input type="hidden" id="selectedTableType" name="selectedTableType" value="">
            <input type="hidden" id="selectedMenuSetId" name="selectedMenuSetId" value="BBg9ONqfJAzE-wJ6TxdRBA">
            <input type="hidden" id="sellType" name="sellType" value="C">
            <input type="hidden" id="menuSelectType" name="menuSelectType" value="B">
            <input type="hidden" id="useTableTypeYn" name="useTableTypeYn" value="N">
            <input type="hidden" id="useTableTypeMenuSet" name="useTableTypeMenuSet" value="N">
            <input type="hidden" id="additionalType" name="additionalType" value="">
            <input type="hidden" id="maxAmount" name="maxAmount" value="">
            <input type="hidden" id="totalAmount" name="totalAmount" value="60000">

            <div id="container" class="container">
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
                                <span>2024.06.21(금) <!-- 2022.10.27(금) --></span>
                                <span>오후 12:30 <!-- 오전 10:00 --></span>
                                <span id="personCntTitle">방문인원 총 3명</span>
                            </div>
                            <div class="rightInfo">
                                <strong name="timerText">시간만료, 좌석상황에 따라 예약이 어려울 수 있습니다.</strong><!-- 시간 내 예약을 완료해 주세요 -->
                                <span class="chkTime" id="holdingTimer" name="holdingTimer">0:00</span>
                            </div>
                        </div>
                        <!-- rsvRoomWrap -->
                        <div class="rsvRoomWrap">
                            <div class="lCont">
                                <div class="dnSelectBox" id="menuItemDiv" data-gtm-vis-has-fired36519946_61="1">
                                    <!-- 230112 &메뉴 가이드설명 -->
                                    <!-- 메뉴 선택 --><!-- 표시가 있는 메뉴는 단독으로 선택이 되지 않습니다. -->
                                    <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">메뉴 선택<span class="smallTxt" id="nTypeGide" style="display: none;" data-gtm-vis-has-fired36519946_61="1"><strong class="ico_ampersand" data-gtm-vis-has-fired36519946_61="1"></strong>표시가 있는 메뉴는 단독으로 선택이 되지 않습니다.</span><span class="hidden" data-gtm-vis-has-fired36519946_61="1">타입02</span></h2>
                                    <!-- // 230112 &메뉴 가이드설명 -->
                                    <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                                        <ul class="intList">
                                            <li data-menuitemid="OnfHDUAzSnW_9cpfS9jRpA" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                                <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                                    <span class="txt" data-gtm-vis-has-fired36519946_61="1"><span class="badge_txt" data-gtm-vis-has-fired36519946_61="1">위 결제금액은 예약금입니다.</span>성인</span>
                                                    <span class="price" data-gtm-vis-has-fired36519946_61="1">20,000 KRW</span>
                                                    <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                                        <span class="personNum" data-count="0" data-gtm-vis-has-fired36519946_61="1">0</span>
                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1">인원 수 증가</button>
                                                    </div>
                                                </div>
                                            </li>
                                            <li data-menuitemid="l0ljPCWyuLp73646rTZU3w" data-price="0" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                                <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                                    <span class="txt" data-gtm-vis-has-fired36519946_61="1">어린이</span>
                                                    <span class="price" data-gtm-vis-has-fired36519946_61="1">0 KRW</span>
                                                    <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                                        <span class="personNum" data-count="0" data-gtm-vis-has-fired36519946_61="1">0</span>
                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1">인원 수 증가</button>
                                                    </div>
                                                </div>
                                                <div class="add_Description" data-gtm-vis-has-fired36519946_61="1">37개월 이상 12세 이하(초등학생)</div>
                                            </li>
                                            <li data-menuitemid="kvUt09mqm8fXUfrdeA_1wA" data-price="0" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                                <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                                    <span class="txt" data-gtm-vis-has-fired36519946_61="1">36개월 이하</span>
                                                    <span class="price" data-gtm-vis-has-fired36519946_61="1">0 KRW</span>
                                                    <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                                        <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                                        <span class="personNum" data-count="0" data-gtm-vis-has-fired36519946_61="1">0</span>
                                                        <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1">인원 수 증가</button>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <p class="txtGuide" id="menuDesc" data-gtm-vis-has-fired36519946_61="1">메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요.</p><!-- 메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요. -->
                                    </div>
                                </div>
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
                                                    <label for="inp_bookerEmail">E-MAIL</label><!-- 221209 필수삭제 -->
                                                </span>
                                            </div>
                                            <div class="intInner emailInp">
                                                <span><input type="text" id="inp_bookerEmail" style="width:273px" aria-required="true" maxlength="50"></span>
                                                <span class="dash">@</span>
                                                <span><input type="text" id="inp_bookerEmail1" inp_bookeremail1="" style="width:273px" aria-required="true" maxlength="50"></span>
                                                <div class="intArea selectWrap" style="width:241px" first="true">
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
                                                        </pg>
                                                        <table class="tblH">
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
                                        <!-- //221207 가이드변경 및 위치변경 -->
                                    </div>
                                    <div id="descDiv">
                                        <div class="boxNotice">
                                            <h3 class="titDep3">유의사항</h3><!-- 유의 사항 -->
                                            <ul id="descUl">
                                                <li>* 클럽 조선 멤버십,제휴 카드 등 제휴사 할인 혜택은 내부 정책에 따라 이용이 제한될 수 있으며 방문 전 관련 상세 안내 및 이용 약관을 확인해 주시기 바랍니다.</li>
                                                <li>[할인 혜택 공통 제외일 : 5/5, 12/24, 12/25,12/31]</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- // notiContainer -->
                            </div>
                            <div class="rCont floating" style="transition: margin-top 0.3s ease-out 0s;">
                                <ul class="rsvList">
                                    <li>
                                        <strong class="listTit">
                                            총 예약금액<!-- 총 예약금액 -->
                                            <span class="price"><em name="totalPrice">60,000</em>KRW</span>
                                        </strong>
                                        <div class="toggleCont">
                                            <div class="toggleInner">
                                                <div class="optionTotal">
                                                    <ul class="infoData" id="calcUl">
                                                        <li class="menuList" id="OnfHDUAzSnW_9cpfS9jRpA" data-id="OnfHDUAzSnW_9cpfS9jRpA" style=""><span class="lfData">성인 x </span><span class="amount">3</span><span class="rtData menuPrice">60,000</span></li>
                                                        <li class="menuList" id="l0ljPCWyuLp73646rTZU3w" data-id="l0ljPCWyuLp73646rTZU3w" style="display: none;"><span class="lfData">어린이 x </span><span class="amount">0</span><span class="rtData menuPrice">0</span></li>
                                                        <li class="menuList" id="kvUt09mqm8fXUfrdeA_1wA" data-id="kvUt09mqm8fXUfrdeA_1wA" style="display: none;"><span class="lfData">36개월 이하 x </span><span class="amount">0</span><span class="rtData menuPrice">0</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="totalCont">
                                    <div class="totalPrice">
                                        <span class="txt">총 예약금액</span><!-- 총 예약금액 -->
                                        <span class="price"><em name="totalPrice">60,000</em>KRW</span>
                                    </div>
                                    <div class="btnArea">
                                        <a href="javascript:void(0)" class="btnSC btnL active" id="btnResve" onclick="fncReservation();">결제하기</a><!-- 결제하기 -->
                                    </div>
                                </div>
                                <p class="txtReference" id="refundDesc" style="">06월 19일 23시 59분까지 취소 시 예약금 100% 환불</p>
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
        <div id="menuPop" class="layerPop diningSelectPop" style="display: none;">
            <div class="layerCont" tabindex="" style="top: 50%; left: 50%; margin-top: -428.235px; margin-left: -540px;" data-gtm-vis-recent-on-screen36519946_61="104" data-gtm-vis-first-on-screen36519946_61="104" data-gtm-vis-total-visible-time36519946_61="100" data-gtm-vis-has-fired36519946_61="1">
                <div class="compTit" data-gtm-vis-has-fired36519946_61="1">
                    <span id="menuTitle" data-gtm-vis-has-fired36519946_61="1">메뉴 선택</span>
                    <div class="rightInfo" data-gtm-vis-has-fired36519946_61="1">
                        <strong name="timerText" data-gtm-vis-has-fired36519946_61="1">시간만료, 좌석상황에 따라 예약이 어려울 수 있습니다.</strong><!-- 시간 내 예약을 완료해 주세요 -->
                        <span class="chkTime" name="holdingTimer" data-gtm-vis-has-fired36519946_61="1">0:00</span>
                    </div>
                </div>
                <div class="compLayer dnSelectScroll" data-gtm-vis-has-fired36519946_61="1">
                    <!-- 221230 수동예약 인벤토리일 경우 문구 출력 -->
                    <div class="manualInfoWrap" id="manualInfoWrap" style="display:none;" data-gtm-vis-has-fired36519946_61="1">
                        <div class="txtWrap" data-gtm-vis-has-fired36519946_61="1">
                            <strong data-gtm-vis-has-fired36519946_61="1">다이닝 업장의 좌석 확인이 필요한 예약이며, 예약확정까지 다소 시간이 소요됩니다.</strong><!-- 다이닝 업장의 좌석 확인이 필요한 예약이며, 예약확정까지 다소 시간이 소요됩니다. -->
                            <div class="order_txt" data-gtm-vis-has-fired36519946_61="1">① 예약신청 &gt; ② 업장 예약 가능 여부 확인 &gt; ③ 예약확정</div><!-- ① 예약신청 > ② 예약 가능 여부 확인 > ③ 예약확정 -->
                            <p class="txtGuide" data-gtm-vis-has-fired36519946_61="1">예약 진행 과정은 알림톡/SMS로 안내해 드립니다.</p><!-- 예약 진행 과정은 알림톡/SMS로 안내 드립니다. -->
                        </div>
                    </div>
                    <!-- // 221230 수동예약 인벤토리일 경우 문구 출력 -->
                    <!--  선택타입 15 - 테이블선택  -->
                    <div class="dnSelectBox" id="tableTypeDiv1" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                        <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">테이블 선택</h2><!-- 테이블 선택 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <ul class="frmList" id="tableTypeUl1" data-gtm-vis-has-fired36519946_61="1"></ul>
                        </div>
                    </div>
                    <!-- //  선택타입 15 - 테이블선택  -->
                    <div class="dnSelectBox" name="menuListDiv" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                        <h2 class="boxTit sSelects" data-gtm-vis-has-fired36519946_61="1">세트 선택</h2><!-- 세트 선택 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <div class="selectWrap" style="width:487px" first="true" data-gtm-vis-has-fired36519946_61="1">
                                <select id="menuListSelect" data-height="150px" data-direction="down" aria-required="true" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                                    <option name="menuSet" value="BBg9ONqfJAzE-wJ6TxdRBA" data-gtm-vis-has-fired36519946_61="1">일반 예약</option>
                                </select>
                                <button tabindex="0" id="menuListSelect-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="menuListSelect-menu" aria-haspopup="true" class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget" type="button" data-gtm-vis-has-fired36519946_61="1">
                                    <span class="ui-selectmenu-text" data-gtm-vis-has-fired36519946_61="1">일반 예약</span>
                                </button>
                                <div class="ui-selectmenu-menu ui-front" data-gtm-vis-has-fired36519946_61="1">
                                    <div class="tweenDiv" data-gtm-vis-has-fired36519946_61="1">
                                        <ul aria-hidden="true" aria-labelledby="menuListSelect-button" id="menuListSelect-menu" role="listbox" tabindex="0" class="ui-menu ui-corner-bottom ui-widget ui-widget-content" style="max-height: 150px;" data-gtm-vis-has-fired36519946_61="1"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dnSelectBox" id="tableTypeDiv2" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                        <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">테이블 선택</h2><!-- 테이블 선택 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <ul class="frmList" id="tableTypeUl2" data-gtm-vis-has-fired36519946_61="1"></ul>
                        </div>
                    </div>
                    <div class="dnSelectBox" id="menuItemDiv" data-gtm-vis-has-fired36519946_61="1">
                        <!-- 230112 &메뉴 가이드설명 -->
                        <!-- 메뉴 선택 --><!-- 표시가 있는 메뉴는 단독으로 선택이 되지 않습니다. -->
                        <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">메뉴 선택<span class="smallTxt" id="nTypeGide" style="display: none;" data-gtm-vis-has-fired36519946_61="1"><strong class="ico_ampersand" data-gtm-vis-has-fired36519946_61="1"></strong>표시가 있는 메뉴는 단독으로 선택이 되지 않습니다.</span><span class="hidden" data-gtm-vis-has-fired36519946_61="1">타입02</span></h2>
                        <!-- // 230112 &메뉴 가이드설명 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <ul class="menuSelcet type02 badge_all" id="popMenuUl" data-gtm-vis-has-fired36519946_61="1">
                                <li data-menuitemid="OnfHDUAzSnW_9cpfS9jRpA" data-price="20000" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                    <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                        <span class="txt" data-gtm-vis-has-fired36519946_61="1"><span class="badge_txt" data-gtm-vis-has-fired36519946_61="1">위 결제금액은 예약금입니다.</span>성인</span>
                                        <span class="price" data-gtm-vis-has-fired36519946_61="1">20,000 KRW</span>
                                        <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                            <span class="personNum" data-count="3" data-gtm-vis-has-fired36519946_61="1">3</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1" disabled="disabled">인원 수 증가</button>
                                        </div>
                                    </div>
                                </li>
                                <li data-menuitemid="l0ljPCWyuLp73646rTZU3w" data-price="0" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                    <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                        <span class="txt" data-gtm-vis-has-fired36519946_61="1">어린이</span>
                                        <span class="price" data-gtm-vis-has-fired36519946_61="1">0 KRW</span>
                                        <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                            <span class="personNum" data-count="0" data-gtm-vis-has-fired36519946_61="1">0</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1" disabled="disabled">인원 수 증가</button>
                                        </div>
                                    </div>
                                    <div class="add_Description" data-gtm-vis-has-fired36519946_61="1">37개월 이상 12세 이하(초등학생)</div>
                                </li>
                                <li data-menuitemid="kvUt09mqm8fXUfrdeA_1wA" data-price="0" data-tabletype="N" data-fixedperson="1" data-menutype="main" data-gtm-vis-has-fired36519946_61="1">
                                    <div class="menuSelcet_li" data-gtm-vis-has-fired36519946_61="1">
                                        <span class="txt" data-gtm-vis-has-fired36519946_61="1">36개월 이하</span>
                                        <span class="price" data-gtm-vis-has-fired36519946_61="1">0 KRW</span>
                                        <div class="numPeople type02" data-gtm-vis-has-fired36519946_61="1">
                                            <button type="button" class="btnDown count" data-prop="down" onclick="fncBtnUpDown(this);" disabled="disabled" data-gtm-vis-has-fired36519946_61="1">인원 수 감소</button>
                                            <span class="personNum" data-count="0" data-gtm-vis-has-fired36519946_61="1">0</span>
                                            <button type="button" class="btnUp count" data-prop="up" onclick="fncBtnUpDown(this)" data-gtm-vis-has-fired36519946_61="1" disabled="disabled">인원 수 증가</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <p class="txtGuide" id="menuDesc" data-gtm-vis-has-fired36519946_61="1">메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요.</p><!-- 메뉴명(메뉴가격) 메뉴별 예약금 확인 후 총 방문인원 수만큼 입력해 주세요. -->
                        </div>
                    </div>
                    <div class="dnSelectBox addMenu" id="optionMenuItemDiv" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                        <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">추가메뉴</h2><!-- 추가메뉴 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <ul class="menuSelcet type02" id="popOptionMenuUl" data-gtm-vis-has-fired36519946_61="1"></ul>
                            <p class="txtGuide" data-gtm-vis-has-fired36519946_61="1">옵션 메뉴를 추가할 수 있습니다.</p><!-- 옵션 메뉴를 추가할 수 있습니다. -->
                        </div>
                    </div>
                    <div class="dnSelectBox" id="amountDiv" data-gtm-vis-has-fired36519946_61="1">
                        <h2 class="boxTit" data-gtm-vis-has-fired36519946_61="1">예약금액</h2><!-- 예약금액 -->
                        <div class="txtSelectBox" data-gtm-vis-has-fired36519946_61="1">
                            <table class="tblV" data-gtm-vis-has-fired36519946_61="1">
                                <colgroup data-gtm-vis-has-fired36519946_61="1">
                                    <col style="width:33.3%" data-gtm-vis-has-fired36519946_61="1">
                                    <col style="width:33.3%" data-gtm-vis-has-fired36519946_61="1">
                                    <col style="width:33.3%" data-gtm-vis-has-fired36519946_61="1">
                                </colgroup>
                                <tbody id="popCalcUl" data-gtm-vis-has-fired36519946_61="1">
                                    <tr class="popMenuList" id="pop_OnfHDUAzSnW_9cpfS9jRpA" data-id="OnfHDUAzSnW_9cpfS9jRpA" data-tabletype="N" data-menutype="main" style="" data-gtm-vis-has-fired36519946_61="1">
                                        <th data-gtm-vis-has-fired36519946_61="1">성인</th>
                                        <td class="person" data-gtm-vis-has-fired36519946_61="1">20,000 x <span class="amount" data-gtm-vis-has-fired36519946_61="1">3</span>명</td> <!-- 2명 -->
                                        <td class="price" data-gtm-vis-has-fired36519946_61="1">KRW <span class="popMenuPrice" data-gtm-vis-has-fired36519946_61="1">60,000</span></td>
                                    </tr>
                                    <tr class="popMenuList" id="pop_l0ljPCWyuLp73646rTZU3w" data-id="l0ljPCWyuLp73646rTZU3w" data-tabletype="N" data-menutype="main" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                                        <th data-gtm-vis-has-fired36519946_61="1">어린이</th>
                                        <td class="person" data-gtm-vis-has-fired36519946_61="1">0 x <span class="amount" data-gtm-vis-has-fired36519946_61="1">0</span>명</td> <!-- 2명 -->
                                        <td class="price" data-gtm-vis-has-fired36519946_61="1">KRW <span class="popMenuPrice" data-gtm-vis-has-fired36519946_61="1">0</span></td>
                                    </tr>
                                    <tr class="popMenuList" id="pop_kvUt09mqm8fXUfrdeA_1wA" data-id="kvUt09mqm8fXUfrdeA_1wA" data-tabletype="N" data-menutype="main" style="display: none;" data-gtm-vis-has-fired36519946_61="1">
                                        <th data-gtm-vis-has-fired36519946_61="1">36개월 이하</th>
                                        <td class="person" data-gtm-vis-has-fired36519946_61="1">0 x <span class="amount" data-gtm-vis-has-fired36519946_61="1">0</span>명</td> <!-- 2명 -->
                                        <td class="price" data-gtm-vis-has-fired36519946_61="1">KRW <span class="popMenuPrice" data-gtm-vis-has-fired36519946_61="1">0</span></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="total noMember" data-gtm-vis-has-fired36519946_61="1">
                                <div class="totalWrap type02" data-gtm-vis-has-fired36519946_61="1">
                                    <span class="tit" data-gtm-vis-has-fired36519946_61="1">총 예약금액</span><strong class="pay" data-gtm-vis-has-fired36519946_61="1"><em name="popTotalPrice" data-gtm-vis-has-fired36519946_61="1">60,000</em>KRW</strong><!-- 총 예약 금액 -->
                                </div>
                            </div>
                            <div data-gtm-vis-has-fired36519946_61="1">
                                <p class="txtGuide" id="priceDesc" data-gtm-vis-has-fired36519946_61="1">메뉴별 예약금 x 총 예약인원</p><!-- 메뉴별 예약금 x 총 예약인원 -->
                                <p class="txtGuide" data-gtm-vis-has-fired36519946_61="1">예약확정에 필요한 인원당 예약금 안내 입니다.</p><!-- 예약확정에 필요한 인원당 예약금 안내 입니다. -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnArea" data-gtm-vis-has-fired36519946_61="1">
                    <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();" data-gtm-vis-has-fired36519946_61="1">이전</a><!-- 이전 -->
                    <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncCompleteMenuSelect();" data-gtm-vis-has-fired36519946_61="1">다음</a><!-- 다음 -->
                </div>
            </div>
        </div>
        <!-- //메뉴선택 Layer -->
        <!-- //container -->
        <!-- footer S -->
        <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
        <!-- footer E -->
    </div>
</body>
</html>