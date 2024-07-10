<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="다이닝 예약 step0"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar, java.util.ArrayList, java.util.List"%>

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
    <style type="text/css">
        .ui-state-default default .btnSC btnL .frmRadio .ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget {
            cursor: pointer;
        }
        .selected-time {
            background-color: #ffeb3b; /* 선택된 시간 슬롯 강조 */
            border: 1px solid #fbc02d;
        }
    </style>
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

        var diningJson = '${diningJson}';
        var diningData = JSON.parse(diningJson);

        $(function() {
            // 모델 데이터를 JavaScript 변수로 저장
            function updateDiningInfo(diningData) {
                $("#diningName").text(diningData.diningName);
            }
            updateDiningInfo(diningData);
        })
    </script>
</head>
<body>
    <div class="wrapper">
        <!--S header  -->
        <jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
        <!--E header  -->
        <script type="text/javascript">
            var commonJs = {};
            commonJs.initResvCalendar = function (calendarEl, selectableDay) {
                if (!calendarEl.length) {
                    return;
                }

                if (selectableDay == 30 || selectableDay == '' || typeof selectableDay == 'undefined') {
                    return;
                } else {
                    var option = {};

                    if (calendarEl.hasClass('calSingle')) {
                        let selectedDate = selectableDay;
                        var promotionDate = [];

                        // 오늘 날짜 가져오기
                        let today = new Date();
                        // 오늘 날짜로부터 30일 이후의 날짜
                        let maxDate = new Date();
                        maxDate.setDate(today.getDate() + 30);

                        option = {
                            chkInTitle: '선택 됨',
                            numberOfMonths: 1,
                            showMonthAfterYear: true,
                            monthNames: [
                                "01", "02", "03", "04", "05", "06",
                                "07", "08", "09", "10", "11", "12"
                            ],
                            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                            minDate: today,
                            maxDate: maxDate,
                            dateFormat: 'yy.mm.dd',
                            beforeShowDay: function (date) {
                                var calDate = $.datepicker.formatDate('yy.mm.dd', date);
                                // select
                                if (selectedDate == calDate) {
                                    if (promotionDate.indexOf(calDate) != -1) {
                                        return [true, 'sel revOn promotion'];
                                    }
                                    return [true, 'sel revOn'];
                                }
                                if (promotionDate.indexOf(calDate) != -1) {
                                    return [true, 'promotion'];
                                }
                                return [true];
                            },
                            onSelect: function (date, inst) {
                                selectedDate = date;
                                $('.default').removeClass('default');
                                fncSelectTime();
                            }
                        };

                        calendarEl.datepicker(option);
                        calendarEl.datepicker('refresh');
                    }
                }
            }

            $(function() {
                // 달력 초기화
                commonJs.initResvCalendar($("#diningCal"), $.datepicker.formatDate('yy.mm.dd', new Date()));
            });

            var selectedTime;
            var selectedPart;

            // 선택 정보 화면 함수및, 달력 클릭시 함수
            function fncSelectTime(timeHtml) {
                // 필요한 데이터 추출
                var date = $("#diningCal").val();
                var week = ['일', '월', '화', '수', '목', '금', '토'];
                var day = week[new Date(date.replaceAll('.', '/')).getDay()];
                var time = $(timeHtml).next().html();
                var visitTime = $.trim(time);
                var visitDate = date + "(" + day + ")";

                selectedTime = visitTime;  //방문시간
                partValue  = $(timeHtml).closest('li').data('value'); // 1부, 2부, 3부인지

                if(partValue === 'timeOne'){
                    selectedPart = 1;
                } else if(partValue === 'timeTwo'){
                    selectedPart = 2;
                } else if(partValue === 'timeThree'){
                    selectedPart = 3;
                }

                var table;
                var personCount = $("#personCountSelect").val();
                var diningId = "${drVO.diningId}";

                if($("#roomhall").text() == "ROOM"){
                    table  = "AVAILABLE_ROOM_TABLE";
                } else {
                    table  = "AVAILABLE_HALL_TABLE";
                }

                var personCnt = ("방문인원 총 " + personCount + "명");

                // visitTime과 visitDate 설정
                $("#visitTimeSpan").text(visitTime);
                $("#visitDateSpan").text(visitDate);
                $("#personCountSpan").text(personCnt);

                //hidden에 값넣기
                $("#diningId").val(diningId);
                $("#visitPeople").val(personCount);
                $("#visitTime").val(visitTime);
                $("#visitDate").val(date);
                $("#diningTime").val(selectedPart);

                // selectInfoWrap 표시
                $("#selectInfoWrap").show();

                //달력에따른 ajax요청
                $.ajax({
                    type : 'POST',
                    url : "getTimeSlots.do",
                    async : true,
                    dataType : 'JSON',
                    data : {
                        "selectedDate" : date,
                        "table" : table,
                        "personCnt": personCount
                    },
                    success : function(response){
                        console.log(response);
                        var partOneSeat = response.partSeatMap.partOneSeat;
                        var timeSlots1 = response.timeSlots1;
                        var partTwoSeat = response.partSeatMap.partTwoSeat;
                        var timeSlots2 = response.timeSlots2;
                        var partThreeSeat = response.partSeatMap.partThreeSeat;
                        var timeSlots3 = response.timeSlots3;
                        var requiredTables = response.requiredTables;

                        $(".timeWrap").empty();

                        // 1부 시간대 생성
                        createTimeSlotSection("1부 시간", partOneSeat, timeSlots1, requiredTables, "timeUlAm1", "timeOne", date);
                        // 2부 시간대 생성
                        createTimeSlotSection("2부 시간", partTwoSeat, timeSlots2, requiredTables, "timeUlAm2", "timeTwo", date);
                        // 3부 시간대 생성
                        createTimeSlotSection("3부 시간", partThreeSeat, timeSlots3, requiredTables, "timeUlAm3", "timeThree", date);
                    },
                    error : function(error){
                        console.log(error);
                    }
                });
            }

            // ROOM , HALL 스위치버튼클릭시 이벤트및 AJAX
            function ShowRoomHallTimes(){
                var table;
                if($("#roomhall").text() == "ROOM"){
                    $("#roomhall").text("HALL");
                    table = "AVAILABLE_HALL_TABLE";
                } else if($("#roomhall").text() == "HALL"){
                    $("#roomhall").text("ROOM");
                    table = "AVAILABLE_ROOM_TABLE";
                }
                var selectedDate = $("#diningCal").val();
                var personCnt =  $("#personCountSelect").val();
                var diningId = "${drVO.diningId}";

                $.ajax({
                    type : 'POST',
                    url : "getTimeSlots.do",
                    async : true,
                    dataType : 'JSON',
                    data : {
                        "diningId" : diningId,
                        "selectedDate" : selectedDate,
                        "table" : table,
                        "personCnt": personCnt
                    },
                    success : function(response){
                        console.log(response);
                        var partOneSeat = response.partSeatMap.partOneSeat;
                        var timeSlots1 = response.timeSlots1;
                        var partTwoSeat = response.partSeatMap.partTwoSeat;
                        var timeSlots2 = response.timeSlots2;
                        var partThreeSeat = response.partSeatMap.partThreeSeat;
                        var timeSlots3 = response.timeSlots3;
                        var requiredTables = response.requiredTables;

                        $(".timeWrap").empty();

                        // 1부 시간대 생성
                        createTimeSlotSection("1부 시간", partOneSeat, timeSlots1, requiredTables, "timeUlAm1", "One");
                        // 2부 시간대 생성
                        createTimeSlotSection("2부 시간", partTwoSeat, timeSlots2, requiredTables, "timeUlAm2", "Two");
                        // 3부 시간대 생성
                        createTimeSlotSection("3부 시간", partThreeSeat, timeSlots3, requiredTables, "timeUlAm3", "Three");
                    },
                    error : function(error){
                        console.log(error);
                    }
                });
            }

            function createTimeSlotSection(title, partSeat, timeSlots, requiredTables, ulId, inputIdPrefix, selectedDate) {
                var sectionHtml = '<strong class="timeTit">' + title + '</strong>';
                sectionHtml += '<div class="timeSel ' + inputIdPrefix + '">';
                sectionHtml += '<ul class="frmList" id="' + ulId + '">';

                var currentTime = new Date();
                var currentDate = $.datepicker.formatDate('yy.mm.dd', currentTime);
                var currentHour = currentTime.getHours();
                var currentMinutes = currentTime.getMinutes();

                $.each(timeSlots, function (index, time) {
                    var [timeHour, timeMinutes] = time.split(':');
                    timeHour = parseInt(timeHour);
                    timeMinutes = parseInt(timeMinutes);
                    var isDisabled = false;

                    // 현재 날짜와 선택된 날짜가 동일한 경우
                    if (currentDate === selectedDate) {
                        if (timeHour < currentHour || (timeHour === currentHour && timeMinutes <= currentMinutes)) {
                            isDisabled = true;
                        }
                    }

                    sectionHtml += '<li class="frmRadio" data-value="' + inputIdPrefix + '">';
                    if (partSeat < requiredTables || isDisabled) {
                        sectionHtml += '<input type="radio" id="' + inputIdPrefix + index + '" name="frmRdo" data-ampm="am" disabled="disabled">';
                    } else {
                        sectionHtml += '<input type="radio" id="' + inputIdPrefix + index + '" name="frmRdo" data-ampm="am" onclick="fncSelectTime(this);">';
                    }
                    sectionHtml += '<label for="' + inputIdPrefix + index + '">' + time + '</label>';
                    sectionHtml += '</li>';
                });

                sectionHtml += '</ul>';
                sectionHtml += '</div>';

                $(".timeWrap").append(sectionHtml);
            }

            async function fncGoStep2() {
                // 방문 시간 선택이 되었는지 확인
                if ($("#visitTimeSpan").text().trim() === '') {
                    alert("시간을 선택해주세요");
                    return;  // 시간 선택이 안된 경우 함수를 종료합니다.
                }

                if($("#selectInfoWrap").is(':visible')){
                    $("#form").attr("action", "dining_step1.do");
                    $("#form").attr("method", "post");
                    $("#form").submit();
                }
                else{
                    alert("시간을 선택해주세요");
                }
            }

            function fncGoStep0(){
                location.href = "http://localhost/hotel_prj/user/dining.do";
            }
        </script>

        <form id="form" name="form">
            <input type="hidden" id="visitPeople" name="visitPeople" value="" />
            <input type="hidden" id="visitTime" name="visitTime" value="" />
            <input type="hidden" id="visitDate" name="visitDate" value="" />
            <input type="hidden" id="diningTime" name="diningTime" value="" />

            <div id="container" class="container">
                <!-- 컨텐츠 S -->
                <h1 class="hidden">날짜, 시간, 인원 선택</h1>
                <!-- 예약-날짜 및 인원체크 -->
                <div class="topArea">
                    <div class="topInner">
                        <h2 class="titDep1">Booking</h2>
                        <p class="pageGuide">엘리시안의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p>
                        <!-- 조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
                        <div class="stepWrap">
                            <ol>
                                <li class="on"><span class="hidden">현재단계</span><em>날짜, 시간, 인원 선택</em></li>
                                <!-- 날짜, 시간, 인원 선택 -->
                                <li><em>예약정보 상세</em></li>
                                <!-- 예약정보 상세 -->
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- //topArea -->
                <div class="inner">
                    <div class="diningContainer drDining_st02">
                        <div class="chkValue">
                            <span>엘리시안 호텔<!-- 그랜드 조선 부산 --></span><span id="diningName"></span>
                        </div>
                        <div class="diningSelectCont calCont">
                            <div class="lCont" id="calDiv">
                                <!-- 달력 한개 짜리 -->
                                <div class="calContainer calSingle calInner" id="diningCal"></div>
                                <!-- //달력 한개 짜리 -->
                            </div>
                            <div class="rCont">
                                <div class="tit">방문인원</div>
                                <!-- 방문인원 -->
                                <div class="intArea selectWrap" style="width: 385px">
                                    <select id="personCountSelect" data-height="150px" data-direction="down" aria-required="true" onchange="fncSelectTime()">
                                        <option value="1">1명</option>
                                        <option value="2" selected='selected'>2명</option>
                                        <option value="3">3명</option>
                                        <option value="4">4명</option>
                                        <option value="5">5명</option>
                                        <option value="6">6명</option>
                                        <option value="7">7명</option>
                                        <option value="8">8명</option>
                                        <option value="9">9명</option>
                                        <option value="10">10명</option>
                                        <!-- 11명 이상 -->
                                    </select>
                                    <div style="font-size: 15px; opacity: 0.5">
                                        *11명 이상의 예약은 호텔 측으로 연락 부탁드립니다.
                                    </div>
                                </div>
                                <div class="allTimeSwitch">
                                    <fieldset>
                                        <label>
                                            <span id="roomhall">HALL</span>
                                            <input role="switch" type="checkbox" id="seatsSwitch" onchange="ShowRoomHallTimes();">
                                        </label>
                                    </fieldset>
                                </div>
                                <div class="allTimeWrap" id="timeListDiv">
                                    <div class="tit">
                                        시간 선택
                                        <div class="allTimeSwitch"></div>
                                    </div>
                                    <div class="timeWrap">
                                        <strong class="timeTit">1부 시간</strong>
                                        <div class="timeSel timeOne">
                                            <ul class="frmList" id="timeUlAm1">
                                                <c:set var="partOneSeat" value="${diningSeatsData.partSeatMap.partOneSeat}" />
                                                <c:forEach var="time" items="${diningSeatsData.timeSlots1}" varStatus="i">
                                                    <li class="frmRadio" data-value="timeOne">
                                                        <c:choose>
                                                            <c:when test="${partOneSeat < diningSeatsData.requiredTables}">
                                                                <input type="radio" id="timeOne${i.index}" name="frmRdo" disabled="disabled">
                                                                <label for="timeOne${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="radio" id="timeOne${i.index}" name="frmRdo" onclick="fncSelectTime(this);">
                                                                <label for="timeOne${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <strong class="timeTit">2부 시간</strong>
                                        <div class="timeSel timeTwo">
                                            <ul class="frmList" id="timeUlAm2">
                                                <c:set var="partTwoSeat" value="${diningSeatsData.partSeatMap.partTwoSeat}" />
                                                <c:forEach var="time" items="${diningSeatsData.timeSlots2}" varStatus="i">
                                                    <li class="frmRadio" data-value="timeTwo">
                                                        <c:choose>
                                                            <c:when test="${partTwoSeat < diningSeatsData.requiredTables}">
                                                                <input type="radio" id="timeTwo${i.index}" name="frmRdo" disabled="disabled">
                                                                <label for="timeTwo${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="radio" id="timeTwo${i.index}" name="frmRdo" onclick="fncSelectTime(this);">
                                                                <label for="timeTwo${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <strong class="timeTit">3부 시간</strong>
                                        <div class="timeSel timeThree">
                                            <ul class="frmList" id="timeUlAm3">
                                                <c:set var="partThreeSeat" value="${diningSeatsData.partSeatMap.partThreeSeat}" />
                                                <c:forEach var="time" items="${diningSeatsData.timeSlots3}" varStatus="i">
                                                    <li class="frmRadio" data-value="timeThree">
                                                        <c:choose>
                                                            <c:when test="${partThreeSeat < diningSeatsData.requiredTables}">
                                                                <input type="radio" id="timeThree${i.index}" name="frmRdo" disabled="disabled">
                                                                <label for="timeThree${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="radio" id="timeThree${i.index}" name="frmRdo" onclick="fncSelectTime(this);">
                                                                <label for="timeThree${i.index}">
                                                                    <c:out value="${time}" />
                                                                </label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- // rCont -->
                        </div>
                        <script>
                            function disablePastTimes() {
                                const currentTime = new Date();
                                const timeLists = [
                                    document.getElementById('timeUlAm1'),
                                    document.getElementById('timeUlAm2'),
                                    document.getElementById('timeUlAm3')
                                ];

                                timeLists.forEach(list => {
                                    if (list) {
                                        const timeItems = list.querySelectorAll('li');
                                        timeItems.forEach(item => {
                                            const timeText = item.querySelector('label').innerText.trim();
                                            const timeParts = timeText.split(':');
                                            if (timeParts.length === 2) {
                                                const itemTime = new Date();
                                                itemTime.setHours(parseInt(timeParts[0]));
                                                itemTime.setMinutes(parseInt(timeParts[1]));

                                                if (itemTime < currentTime) {
                                                    const input = item.querySelector('input');
                                                    input.disabled = true;
                                                    input.parentElement.classList.add('disabled');
                                                }
                                            }
                                        });
                                    }
                                });
                            }

                            document.addEventListener('DOMContentLoaded', disablePastTimes);
                        </script>

                        <div class="selectInfoWrap" id="selectInfoWrap" style="display: none;">
                            <p class="tit">예약 정보</p>
                            <!-- 예약 정보 -->
                            <div class="colorBox">
                                <div class="selectInfo">
                                    <div>
                                        <p>날짜</p>
                                        <em><span id="visitDateSpan"></span></em>
                                    </div>
                                    <div>
                                        <p>시간</p>
                                        <em id="visitTimeSpan"></em>
                                    </div>
                                    <div>
                                        <p>인원수</p>
                                        <em id="personCountSpan"></em>
                                    </div>
                                </div>
                                <div class="manualInfoWrap" id="manualInfoWrap"></div>
                            </div>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();">이전</a>
                            <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncGoStep2();">다음</a>
                        </div>
                    </div>
                </div>
                <!-- //inner -->
                <!-- 컨텐츠 E -->
            </div>
            <!-- //container -->
        </form>

        <!-- footer S -->
        <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
        <!-- footer E -->
    </div>
    <!-- //wrapper -->
</body>
</html>
