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
		<script type="text/javascript">

    $(document).ready(function() {
        // 예약 가능일 조회
        fncSearchAvailTimesWeekly();
    });

    // 예약 가능 시간 데이터를 하드코딩
    function fncAvailTimesWeekly(visitDateTime) {
        return new Promise(function (resolve, reject) {
            let data = {
                result: {
                    data: [
                        {
                            date: "2024-06-14",
                            slots: [
                                { availDateTime: "2024-07-01 12:00", isAvailable: true },
                                { availDateTime: "2024-07-01 13:00", isAvailable: true },
                                { availDateTime: "2024-07-01 18:00", isAvailable: false },
                                { availDateTime: "2024-07-01 19:00", isAvailable: true }
                            ]
                        },
                        {
                            date: "2024-07-02",
                            slots: [
                                { availDateTime: "2024-07-02 12:00", isAvailable: true },
                                { availDateTime: "2024-07-02 13:00", isAvailable: false },
                                { availDateTime: "2024-07-02 18:00", isAvailable: true },
                                { availDateTime: "2024-07-02 19:00", isAvailable: false }
                            ]
                        }
                    ]
                }
            };
            resolve(data);
        });
    }

    // 예약 시작 가능일 조회 화면
    async function fncSearchAvailTimesWeekly() {
        let availCheck = false;
        let openDate = "";
        let week = 0;
        let maxWeek = 2; // 최대 검색 주 수 (해당 주 수 만큼 검색해서 없으면 오늘날짜 선택)

        function fncWeeklyDate(week) {
            let date = new Date();
            date.setDate(date.getDate()+(week*7));
            let YY = date.getFullYear();
            let mm = date.getMonth() >= 9 ? (date.getMonth()+1) : "0"+(date.getMonth()+1);
            let dd = date.getDate() >= 10 ? date.getDate() : "0"+date.getDate();
            let visitDateTime = YY+"-"+mm+"-"+dd;
            return visitDateTime;
        }

        while (!availCheck) {

            // 최대 검색 주 수 안에 없으면 오늘날짜로 선택
            if (week == maxWeek) {
                openDate = fncWeeklyDate(0);
                break;
            }

            let visitDateTime = fncWeeklyDate(week);

            let data = await fncAvailTimesWeekly(visitDateTime);

            if (typeof data.result.data != 'undefined') {
                let dateList = data.result.data;

                for (let i = 0; i < dateList.length; i++) {
                    let slots = dateList[i].slots;
                    for (let j = 0; j < slots.length; j++) {
                        let isAvailable = slots[j].isAvailable;
                            if (isAvailable) {
                                availCheck = true;
                                break;
                            }
                    }
                    if (availCheck) {
                        openDate = dateList[i].date;
                        break;
                    }
                }
            }
            week++;
        }
        openDate = openDate.replaceAll("-", ".");
        // 달력 그리기
        commonJs.initResvCalendar(jQuery("#diningCal"), openDate);
        // 해당 날짜로 예약가능일 조회
        await fncSearchAvailTimes();

    }

    // 달력 그리기
    commonJs.initResvCalendar = function (calendarEl, selectableDay){

        if (!calendarEl.length) {
            return;
        }

        // 예약 가능일 조회해서 받았을때 달력 그림
        // 30은 js때문에 추가
        if (selectableDay == 30 || selectableDay == '' || typeof selectableDay == 'undefined') {
            return;
        } else {
            var option = {};

            if (calendarEl.hasClass('calSingle')) {
                let selectedDate = selectableDay;
                var promotionDate = [];

                option = {
                    chkInTitle: '선택 됨',
                    numberOfMonths: 1,
                    showMonthAfterYear: true,
                    monthNames: [
                        "01", "02", "03", "04", "05", "06",
                        "07", "08", "09", "10", "11", "12"
                    ],
                    dayNamesMin: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
                    // minDate: 0,
                    minDate: selectedDate,
                    dateFormat: 'yy.mm.dd',
                    // onChangeMonthYear: function (year, month, inst) {
                    //     setPromotionDate(year, month);
                    // },
                    beforeShowDay: function (date) {
                        var calDate = dUtils.getToDate(date);
                        // select
                        if (selectedDate == calDate) {
                            // $('.calNotiCont').hide();
                            if (promotionDate.indexOf(calDate) != -1) {
                                // $('.calNotiCont').show();
                                return [true, 'sel revOn promotion'];
                            }
                            return [true, 'sel revOn'];
                        }
                        //promotion
                        if (promotionDate.indexOf(calDate) != -1) {
                            return [true, 'promotion'];
                        }

                        return [true];
                    },
                    onSelect: function (date, inst) {
                        selectedDate = date;
                        //다이닝 경우 선택 시 default 클래스 삭제
                        $('.default').removeClass('default');
                        fncSearchAvailTimes();

                    }
                };
                // function setPromotionDate(year, month) {
                //     //date push
                //     promotionDate = [];
                //     //test dummy
                //     var i = 20;
                //     while (i < 30) {
                //         promotionDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                //         i++;
                //     }
                // }
                calendarEl.datepicker(option);
                //초기 프로모션 데이트 설정
                // setPromotionDate(
                //     calendarEl.datepicker('getDate').getFullYear(),
                //     calendarEl.datepicker('getDate').getMonth() + 1
                // );
                calendarEl.datepicker('refresh');
            }
        }
    }

    // 예약 가능 시간 리스트 조회 api
    function fncAvailTimes() {
        return new Promise(function (resolve, reject) {
            let shopId = $("#shopId").val();
            let personCount = $("#personCountSelect").val();
            let visitDateTime = $("#diningCal").val().replaceAll(".", "-");

            if (personCount != '' && visitDateTime != '') {
                if (personCount != 'callResve') {
                    jQuery.ajax({
                        type : "GET",
                        url : "/resve/dining/time.json",
                        cache : false,
                        dataType : "json",
                        async : true,
                        data : {
                            "shopId" : shopId,
                            "personCount" : personCount,
                            "visitDateTime" : visitDateTime
                        },
                        global : false,
                        beforeSend: function() {
                            commonJs.showLoadingBar(); //로딩바 show
                        },
                        complete: function() {
                            commonJs.closeLoadingBar(); //로딩바 hide
                        },
                        success : function(data){
                            if (typeof data.result != 'undefined') {
                                if (typeof data.result.slotStatusMsg != 'undefined') {
                                    alert(data.result.slotStatusMsg);
                                } else if (typeof data.result.resultMsg != 'undefined'){
                                    alert(data.result.resultMsg);
                                }
                            } else {
                                alert(data.resultMsg);
                            }
                            resolve(data);
                        }
                    });
                } else if (personCount == 'callResve') {
                    resolve("callResve");
                }

            }
        });
    }

    // 예약 가능 시간 리스트 조회 화면
    async function fncSearchAvailTimes() {
        $("#selectInfoWrap").hide();
        $("#availSlotToken").val("");
        $("#visitTime").val("");
        $("#selectInfoWrap").children().remove();
        $('#allTimeSwitch').prop("checked", false);
        //화면 로딩시 예약가능한 시간만 보여줌
        $('.frmRadio').each(function() {
            if ($(this).find("input").is(":disabled")) {
                $(this).hide();
            }
        });
        let data = await fncAvailTimes();

        if (data != "callResve") {
            $(".timeWrap").show();
            $("#groupPerson").hide();
            if (typeof data.result.data != 'undefined') {
                let dateList = data.result.data.slots;
                $("#confirmReservationUseYn").val(data.result.data.confirmReservationUseYn);

                let amCount = 0;
                let pmCount = 0;
                let amNoCount = 0;
                let pmNoCount = 0;

                $("#timeUlAm").html("");
                $("#timeUlPm").html("");
                var liAmHtml = '';
                var liPmHtml = '';

                let visitDateTime = data.result.data.visitDateTime;
                let periodGroups = data.result.data.periodGroups;

                let allTimeList = []; // 전체 시간
                let availTimeList = []; // 예약 가능 시간
                let sortedAllTimeList = []; // 전체시간 + 예약가능시간 + 중복제거, 정렬 완료 리스트

                // 운영시간 시간 순차정렬
                periodGroups.sort(function(a, b) {
                    let dateA = new Date(visitDateTime.substring(0, 11)+a.startTime+visitDateTime.substring(16, visitDateTime.length));
                    let dateB = new Date(visitDateTime.substring(0, 11)+b.startTime+visitDateTime.substring(16, visitDateTime.length));
                    return dateA - dateB;
                });

                // 운영시간 리스트 생성
                periodGroups.forEach(function (item, idx) {
                    let endTime = new Date(visitDateTime.substring(0, 11)+item.endTime+visitDateTime.substring(16, visitDateTime.length));
                    let startTime = new Date(visitDateTime.substring(0, 11)+item.startTime+visitDateTime.substring(16, visitDateTime.length));
                    const timeCnt = parseInt(((endTime - startTime) / (60 * 1000)) / Number(item.minuteTerm));

                    for (let i = 0; i <= timeCnt; i++) {
                        if (i > 0) {
                            startTime.setMinutes(startTime.getMinutes() + item.minuteTerm);
                        }
                        allTimeList.push(new Date(startTime));
                    }
                });

                // periodGroup 기준 전체 시간에 availDateTime 추가
                if (dateList.length > 0) {
                    dateList.forEach(function (item, idx) {
                        allTimeList.push(new Date(item.availDateTime));
                    });
                };

                // 정렬
                allTimeList.sort(function (a, b) {
                    return a - b;
                });

                // 비교를 위해 String 변환
                allTimeList.forEach(function (item) {
                    sortedAllTimeList.push(item.toString());
                });

                // 중복제거
                sortedAllTimeList = Array.from(new Set(sortedAllTimeList));

                // 예약 가능 시간 (비교를 위한 리스트)
                if (dateList.length > 0) {
                    dateList.forEach(function (item, idx) {
                        availTimeList.push(new Date(item.availDateTime).toString());
                    });
                };

                sortedAllTimeList.forEach(function(timeItem) {

                    if (dateList.length > 0) {
                        dateList.forEach(function (item, idx) {

                            if (availTimeList.includes(timeItem)) {

                                let date = new Date(item.availDateTime);
                                let hh = date.getHours();
                                hh = hh % 12;
                                hh = hh ? hh : 12;
                                let mm = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();

                                if (timeItem == date.toString()) {

                                    let time = "";
                                    let ampm = "";
                                    if (date.getHours() != 0 && date.getHours() < 12) {
                                        ampm = "am";
                                        time = '오전'+" "+hh+":"+mm;
                                    }else {
                                        ampm = "pm";
                                        time = '오후'+" "+hh+":"+mm;
                                    }
                                    let html = `<li class="frmRadio"><input type="radio" id="time${idx}" name="frmRdo" data-ampm="${ampm}"  data-token="${item.availSlotToken}" onclick="fncSelectTime(this);"><label for="time${idx}">${time }</label></li>`;

                                    // 예약 가능한 시간
	                                //2023-04-10 점심 / 저녁 으로 변경에 따라 기준시간 17시로 변경
                                    if(date.getHours() != 0 && date.getHours() < 17){
                                        liAmHtml += html;
                                        amCount++;
                                    } else {
                                        liPmHtml += html;
                                        pmCount++;
                                    }
                                }
                            }

                            if (!availTimeList.includes(timeItem)) {
                                let date = new Date(timeItem);

                                let hh = date.getHours();
                                hh = hh % 12;
                                hh = hh ? hh : 12;
                                let mm = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();

                                if (idx == 0) {

                                    let time = "";
                                    let ampm = "";
                                    if (date.getHours() != 0 && date.getHours() < 12) {
                                        ampm = "am";
                                        time = '오전'+" "+hh+":"+mm;
                                    }else {
                                        ampm = "pm";
                                        time = '오후'+" "+hh+":"+mm;
                                    }
                                    let html = `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${time }</label></li>`;

                                    // 예약 가능한 시간
	                                //2023-04-10 점심 / 저녁 으로 변경에 따라 기준시간 17시로 변경
                                    if(date.getHours() != 0 && date.getHours() < 17){
                                        liAmHtml += html;
                                        amNoCount++;
                                    } else {
                                        liPmHtml += html;
                                        pmNoCount++;
                                    }

/*
                                    if(date.getHours() != 0 && date.getHours() < 12){
                                        liAmHtml += `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${hh}:${mm}</label></li>`;
                                        amNoCount++;
                                    } else {
                                        liPmHtml += `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${hh}:${mm}</label></li>`;
                                        pmNoCount++;
                                    }
*/
                                }
                            }
                        });
                    }

                });

                // 예약 가능한 시간 없는경우
                // 비활성화된 슬롯 있는 경우
                if (amCount == 0 && amNoCount > 0) {
                    liAmHtml += '<li class="emptyTime emptyDesc">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                // 비활성화된 슬롯 없는경우
                } else if (amCount == 0 && amNoCount == 0) {
                    liAmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                // 비활성화된 슬롯 있는 경우
                if (pmCount == 0 && pmNoCount > 0) {
                    liPmHtml += '<li class="emptyTime emptyDesc">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                // 비활성화된 술롯 없는 경우
                } else if (pmCount == 0 && pmNoCount == 0) {
                    liPmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                // 시간 slot 비어있는 경우
                if (dateList.length <= 0) {
                    liAmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                    liPmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                $("#timeUlAm").append(liAmHtml);
                $("#timeUlPm").append(liPmHtml);

            }
        }
        // 유선문의
        if (data == "callResve") {
            $("#groupPerson").html("");
            let callResveDiv = `<div class="txt">11명 이상 단체예약은 해당 업장에 유선문의 부탁 드립니다.</div>`;<!-- 11명 이상 단체예약은 해당 업장에 유선문의 부탁 드립니다. -->
            // $(".timeWrap").after(callResveDiv);
            $("#groupPerson").html(callResveDiv);
            $("#groupPerson").show();
            $(".timeWrap").hide();
        }
    }

    // 모든 시간보기
    function fncShowAllTimes() {
        if ($('#allTimeSwitch').prop("checked")) {
            $(".frmRadio").show(); // 모든 시간을 처음에 숨깁니다.
            $(".emptyDesc").hide(); // 빈 설명을 숨깁니다.
            $(".emptyAll").show(); // 필요한 경우 모든 빈 슬롯을 표시합니다.
        } else {
        	$(".frmRadio").hide();
      	  	$(".frmRadio").each(function() {
              	if ($(this).find("input").is(":disabled")) {
              	    $(this).hide(); // 예약 불가능한 시간만 숨깁니다.
             	 } else {
              	    $(this).show(); // 예약 가능한 시간은 표시합니다.
             	 }
         	 });
          	$(".emptyDesc").show(); // 빈 설명을 표시합니다.
          	$(".emptyAll").show(); // 필요한 경우 모든 빈 슬롯을 표시합니다.
        }
    }

    // 선택 정보 화면
    function fncSelectTime(timeHtml) {
        $("#selectInfoWrap").hide();
        $("#selectInfoWrap").children().remove();
        let date = $("#diningCal").val()
        let week = ['일', '월', '화', '수', '목', '금', '토']; // '일', '월', '화', '수', '목', '금', '토'
        let day = week[new Date(date.replaceAll('.', '/')).getDay()]; // ios에서 날짜형식 YYYY/MM/DD (모두가능)
        let ampm = $(timeHtml).attr("data-ampm") == 'am' ? '오전' : '오후'; // 오전 : 오후
        let time = $(timeHtml).next().html();
        let personCount = $("#personCountSelect").val();
        let availSlotToken = $(timeHtml).attr("data-token");
        let visitTime = time;
        let visitDate = date + "(" + day + ")";

        console.log("인원 수 : " + personCount);
        console.log("availSlotToken : " + availSlotToken);
        console.log("방문시간 : " + visitTime);
        console.log("방문날짜 : " + visitDate);

        
        let confirmReservationUseYn = $("#confirmReservationUseYn").val();
       
        console.log("confirmReservationUseYn : " + confirmReservationUseYn);

        $("#availSlotToken").val(availSlotToken);
        $("#visitTime").val(visitTime);
        $("#visitDate").val(visitDate);

        let infoHtml = ` <p class="tit">예약 정보</p><!-- 예약 정보 -->
                    <div class="colorBox">
                        <div class="selectInfo">
                            <div>
                                <p>날짜</p><!-- 날짜 -->
                                <em>visitTime<span></span></em>
                            </div>
                            <div>
                                <p>시간</p><!-- 시간 -->
                                <em>${visitTime}</em>
                            </div>
                            <div>
                            <p>인원수</p><!-- 인원수 -->
                            <em>${"방문인원 총 {1}명".replace('{1}', personCount != null ? personCount : "0")}</em><!-- 방문인원 총 2명 -->
                            </div>
                        </div>
                        <div class="manualInfoWrap" id="manualInfoWrap"></div>
                    </div>`;

        let confirmHtml = `<div class="txtWrap">
                                <strong>선택하신 예약일시는 다이닝 업장의 좌석 확인이 필요한 예약입니다.<br/>예약확정까지 다소 시간이 소요됩니다.</strong><!-- 선택하신 예약일시는 다이닝 업장의 좌석 확인이 필요한 예약입니다.<br/>예약확정까지 다소 시간이 소요됩니다. -->
                                <div class="order_txt">① 예약신청 > ② 업장 예약 가능 여부 확인 > ③ 예약확정</div><!-- ① 예약신청 > ② 업장 예약 가능 여부 확인 > ③ 예약확정 -->
                                <p class="txtGuide">예약 진행 과정은 알림톡/SMS로 안내해 드립니다.</p><!-- 예약 진행 과정은 알림톡/SMS로 안내해 드립니다. -->
                            </div>`;
		alert(infoHtml);
        $("#selectInfoWrap").append(infoHtml);
        $("#selectInfoWrap").show();

        if (confirmReservationUseYn == "Y") {
            $("#manualInfoWrap").children().remove();
            $("#manualInfoWrap").append(confirmHtml);
        } else {
            $("#manualInfoWrap").remove();
        }
    }

    // availSlotToken 세션에 저장
    function fncSetSessionAvailToken() {
        return new Promise(function (resolve, reject) {
            let visitDate = $("#diningCal").val();
            let personCount = $("#personCountSelect").val();
            let availSlotToken = $("#availSlotToken").val();
            let hotelCode = $("#searchSysCode").val();

            if (visitDate == '' || visitDate == null) {
                alert("방문(예약)일을 선택해 주세요.") // 방문일은 필수 입니다.
            } else if (personCount == '' || personCount == null) {
                alert("총 방문인원을 선택해 주세요.") // 인원은 필수 입니다.
            } else if (availSlotToken == '' || availSlotToken == null) {
                alert("방문(예약) 시간을 선택해 주세요.") // 방문시간은 필수 입니다.
            } else {
                $("#personCount").val(personCount);

                jQuery.ajax({
                    type : "GET",
                    url : "/resve/dining/token.json",
                    cache : false,
                    dataType : "json",
                    async : true,
                    global : false,
                    data : {
                        "personCount": personCount,
                        "availSlotToken": availSlotToken,
                        "hotelCode" : hotelCode
                    },
                    beforeSend: function() {
                        commonJs.showLoadingBar(); //로딩바 show
                    },
                    complete: function() {
                        commonJs.closeLoadingBar(); //로딩바 hide
                    },
                    success : function(data){
                        resolve(data);
                    }});
            }
        });
    }

    async function fncGoStep2() {
        //let data = await fncSetSessionAvailToken();
        
         $("#form").attr("action", "dining_step1.do");
         $("#form").attr("method", "post");
         $("#form").submit();
        
    }

    function fncGoStep0() {
        let searchSysCode = $("#searchSysCode").val();
        let diningCode = $("#diningCode").val();
        location.href = "resve/dining/step0";
    }

</script>
		
		

        <form id="form" name="form">
            <input type="hidden" id="searchSysCode" name="searchSysCode" value='TWC'/>
            <input type="hidden" id="diningCode" name="diningCode" value='003'/>
            <input type="hidden" id="searchLangCode" name="searchLangCode" value=""/>
            <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ"/>
            <input type="hidden" id="personCount" name="personCount" value=''/>
            <input type="hidden" id="availSlotToken" name="availSlotToken" value=''/>
            <input type="hidden" id="visitTime" name="visitTime" value=''/>
            <input type="hidden" id="visitDate" name="visitDate" value=''/>
            <input type="hidden" id="confirmReservationUseYn" name="confirmReservationUseYn" value=''/>

            <div id="container" class="container">
                <!-- 컨텐츠 S -->
                <h1 class="hidden">날짜, 시간, 인원 선택</h1>
                <!-- 예약-날짜 및 인원체크 -->
                <div class="topArea">
                    <div class="topInner">
                        <h2 class="titDep1">Booking</h2>
                        <p class="pageGuide">조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p>
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
                        <div class="chkValue"><span>웨스틴 조선 서울<!--  그랜드 조선 부산 --></span><span>ARIA <!-- The Ninth Gate --></span></div>
                        <div class="diningSelectCont calCont">
                            <div class="lCont" id="calDiv">
                                <!-- 달력 한개 짜리 -->
                                <div class="calContainer calSingle calInner" id="diningCal"></div>
                                <!-- //달력 한개 짜리 -->
                            </div>
                            <div class="rCont">
                                <div class="tit">방문인원</div>
                                <!-- 방문인원 -->
                                <div class="intArea selectWrap" style="width:385px">
                                    <select id="personCountSelect" data-height="150px" data-direction="down" aria-required="true" onchange="fncSearchAvailTimes();">
                                        <option value="1">1명</option>
                                        <!-- 명 -->
                                        <option value="2" selected='selected'>2명</option>
                                        <!-- 명 -->
                                        <option value="3">3명</option>
                                        <!-- 명 -->
                                        <option value="4">4명</option>
                                        <!-- 명 -->
                                        <option value="5">5명</option>
                                        <!-- 명 -->
                                        <option value="6">6명</option>
                                        <!-- 명 -->
                                        <option value="7">7명</option>
                                        <!-- 명 -->
                                        <option value="8">8명</option>
                                        <!-- 명 -->
                                        <option value="9">9명</option>
                                        <!-- 명 -->
                                        <option value="10">10명</option>
                                        <!-- 명 -->
                                        <option value="callResve">11명 이상</option>
                                        <!-- 11명 이상 -->
                                    </select>
                                </div>
                                <div class="allTimeWrap" id="timeListDiv">
                                    <!-- 221130 allTimeWrap 클래스추가 : 날짜 인원 선택후 나옴 -->
                                    <div class="tit">시간 선택
                                        <!-- 시간 선택 -->
                                        <div class="allTimeSwitch">
                                            <fieldset>
                                                <label>
                                                    <span>모든 시간 보기</span>
                                                    <!-- 모든 시간 보기 -->
                                                    <input role="switch" type="checkbox" id="allTimeSwitch" onchange="fncShowAllTimes();"/>
                                                </label>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="timeWrap"><!-- 221221 div 넣음 / 단체일때 display:none  -->
                                <strong class="timeTit">점심</strong><!-- 점심 -->
                                <div class="timeSel morning"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlAm"><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 6:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 6:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 7:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 7:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 8:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 8:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 9:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 9:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 10:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 10:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 11:00</label></li><li class="frmRadio"><input type="radio" class="test1" id="time0" name="frmRdo" data-ampm="am" data-token="H4sIAAAAAAAA_wEYAef-QvL05tkzx0dfR9LSmbbJQ6ZwJhPJeuFciJ5aOhG5aiLBeOGYUxBNKa1DP-wHLJ0-xjgZruWGWpZUt1PaKqQuTjS0KlVf7E8ohjXKiL554sulKR3aiyy2RuK2cEtQUgQYhsde23jfIL2nOCJ58Zu1PkLszUfpyCanCBe080mFQkMu0zcK5179cQDy4hn6eoQl9d_oD69XLjl9WGiJrLdXN3n6SCU3AZdE4tMtJgZpUwrNgDMNufs_qn6FN49Tz0_Q3mmc6Wjfsl0zNqLISbMuVRFYhka64db9ukWXl9rATf1ICxv5H8OY4T_r1fGW8qwbFn9tFTkhFrwKtxytNVmIuapIpdmaZPFu7RYr5p1i6YtjdCBPH7PXlU-g_icYAQAA" onclick="fncSelectTime(this);"><label for="time0">오전 11:30</label></li><li class="frmRadio"><input type="radio" id="time1" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-gfosQgSLhI3K1U327C5eNIinp4gXLe_K9sHHQadmf67BjnwSenLy3BhbT_o7n886kk5l50L_JSddaBQX5GMOE798RNaX0lxqXHkWQ_hLrAWjwoNSQEoEWQpMdKAti_4tC7H1rVYzXx5_rJYdZh2U7vwJmEYyVhZokuijq_y2IA1v4-KBnYwUlHyA2Cm9W_bPuMwoWIf2OsypuCgQo48sjxOxbWAsxQmvSGipwrf2aC6Kb_PHRbwb4JKH-IukBmYNzVu-PWaTssrSxALZrj2NsDjroq0JhEQmYk7iUK5ODStVlbBQ7k7liuvcLU_CVEql5DTFn1VpX5jjA_kQbp_jQdbOJc5Ntxt-dj5ovM4L1DH56MYv98yH7f-wlxoYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="0"><label for="time1">오후 12:00</label></li><li class="frmRadio"><input type="radio" id="time2" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-d35vNDpZLC1dHjRM4dwDAkQhHp6WOMLc2loMZu7h7roX2WeeuZOMf1N2lr1lqAVOXVu-QHIV0q0vAPrYziIysu-icOJkZGB_NPq_79vK7zWFBUf6IUhuIivjQHcr4bco4saGco98mpGcQYVMmHR5Y29dZk2BoUymbsiF3S17vkXXH7WCDgVY1YsQylWbsidt5LTP4y1XboYR4B0Eup3ti9bIbZSMsGHfeNszIY9stQXwcWZbG0aavdqxRCdSOD2EU2jHewAJM_5Nso951NLYUsC3UnloT31utumTVRhYwGxtpNK-M8uPMt0MFF1H7MxHCTu5chVJj26w0uKLXExhLppKVMkYAdHWcvT1yaE8SMzM48ARgrYgwzxNG5AYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="1"><label for="time2">오후 12:30</label></li><li class="frmRadio"><input type="radio" id="time3" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-P1o8UdYm3u14hoyhqe5EvdtEdTtXH7HuCCcTFsQhlllk3a3vX2feGKKDZK_g3fQN0LagdqC6nwbV0flZ80TiGlX6xshI4lYbbvrIycOU2YERPe7K2e_BGH-DmAaNLsmm2ypJArnTLTm4f75q17_DFgqAAtqXd42MyIiiMfwEoUUbq9jr9kNlbD__S2HDbwKsZf_2IlvnwDEFppRBkmClX7GUioYHvzB_hVyo04b3mqBvrdNc8UnlK99n27-aZiSH-Bgf9fNQNpTX_pHISKu6BH1iGbJHCy0lzBGh8_5MhtRb8gssDFfzjLydQaw9Tmrn95BfvTFIXGiITAqy8HRta9tetbllpQIyr1Wl5nH95O54f7r512bkFzH1aKwYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="3"><label for="time3">오후 1:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 1:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 2:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 2:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 3:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 3:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 4:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 4:30</label></li></ul>
                                </div>
                                <strong class="timeTit">저녁</strong><!-- 저녁 -->
                                <div class="timeSel afternoon"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlPm"><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 5:00</label></li><li class="frmRadio"><input type="radio" id="time4" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-Iz__zh1UlVirrKdR9NBcypXEtgvq21WWxEQnMSydzz9pT7_kwuuHZa1_g9Y1r5HZFmkNnphH8OlNO5nKjFlG_Q1o0r9EfGpp9sUH2iKbwcBQK42BOiFflYts_QFEk772XQoi7JT0yGMfIv0wrNJr92MoBpSbuLg5Q3uLheok2KnvqUr-xX5kSvH8tNsiXAZ6Me9JNyKYN3iyHkvL-rGJvy0HyCD9hv8xi6Z1eZkrhU2xXOfpnrevl-l5uISVPlVYjjd_v9Zj1j8EtIYxj96LQz65gn2r7mkunDyE-SzKH0ZEtfgzcFyJ6Tm-CqNnYtBKOiK9s5iqzmFDkPavQVyKPQwTlOMJ1TgrapDpSTCvSgQHumxwTCObT_K27JEYAQAA" onclick="fncSelectTime(this);"><label for="time4">오후 5:20</label></li><li class="frmRadio"><input type="radio" id="time5" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-jgCtmJ71z68DXrK-OZYASYU72_kjbPi4xFbOXi6UkG7-MZC5z2KPmdMdz6Bw7gSMbm-iywkkI_1g6Hfp4JBX79n9yvaMxtlhsh00paBH6sH8ZYMLWCKEnYNcQy31x1-4JiFE9Pn1M_XndH70hYP12tHRZD6PycRj-nGFpHa5zJTupYC62LJNco4daxPIHIbYNlHYX9jhx1uzFZIVzbQfxPfucEkB9OvIhPQRM9adVOvT661774NADJ3DUEVm7dgdNjfXUifNGTObvyf8Ng7TC5OmOnUrTqxePbA4nol51t9rYgpHuVSd49PLp6ooQAnpL7SNANCqD6qyjrF7DWo_UAx-oxrZewl8IaaRX6sEkUZrmp8tdcqvqpkqXIIYAQAA" onclick="fncSelectTime(this);"><label for="time5">오후 5:30</label></li><li class="frmRadio"><input type="radio" id="time6" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-A9fgcTrUsfuPOQcNm80BHxMDZMk4FzZ-gf2gRW3KzZhyeVMefFRFwfhAOOFAUuBpTtPjFbYctuwwW1gYEfCtjoz5VvG0W_26L7iVI3OHkTo59lHctYXdjj2NLWo1591N9TJzeci9eQGiRNo7-LSXks14SyginUBA-fe6-cAVn1J41_H4fo5T7-2HZS-Qbvn7UhGBpj_5yae3iB66mH3d2mWbikFItreMnG2Oe-bIUxrVeqFzMNqfEj_4k0xgwQUWNwuqrXOabHVW2A9u7QqeyhtaodlDCuTMj4meNFj7uQS4BGaMcAAI1lzDmGC2IJgjZxTCtdgiYAJC_I2L9qNVvdAmE6q5ugJxKXfewp8ik1Y7QcfEz-P2pUMJAC4YAQAA" onclick="fncSelectTime(this);"><label for="time6">오후 7:50</label></li><li class="frmRadio"><input type="radio" id="time7" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-seOMtZ8srrDj0nPolTE96UjsEFtOqVCUoY9U5GBnndHbR07enSVdP0Z2urD0CSVX3XQrq4RaNl-Kp7dIyT41Ii88WVfFRk8YTL651QPo1OiWm47wGYRZk6-2GMNbW3NHq2Za-rOGSBoOKZ5G5zmvYDKaIARFLUhIjn5PBk3e6TillrM3lwLcMh1YXhVWK4mb8I70dhnn8GMXHygJNhVoEURJ8k7JP5y8NbRQLKqUJshR6UevRswejVJbYUjh3rJa32LNSbUBJ9rtjD6lWQTvIwfc3H6PzZQ6mg1Ppavm4AWrnv4Z8U6omqYvmvXziED3WTYbO8Sf4tOmclPIbmUvYjalCIB4DcRpdMNeQnDJ8yyfHUoRaim9mLSICo0YAQAA" onclick="fncSelectTime(this);"><label for="time7">오후 8:00</label></li></ul>
                                </div>
                            </div>
                                    <!-- 221221 단체일때 보여짐 -->
                                    <div class="groupPerson" id="groupPerson"></div>
                                    <div class="timeGuideWrap">
                                        <ul>
                                            <li class="tg01">선택</li>
                                            <!-- 선택 -->
                                            <li class="tg02">선택불가</li>
                                            <!-- 선택불가 -->
                                            <li class="tg03">선택가능</li>
                                            <!-- 선택가능 -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- // rCont -->
                        </div>

                        <!-- 선택힌 예약 정보 -->
                        <div class="selectInfoWrap" id="selectInfoWrap" style="display: none"></div>
                        <!-- // 선택힌 예약 정보 -->
                        <div class="btnArea">
                            <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();">이전</a>
                            <!-- 이전 -->
                            <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncGoStep2();">다음</a>
                            <!-- 다음 -->
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
