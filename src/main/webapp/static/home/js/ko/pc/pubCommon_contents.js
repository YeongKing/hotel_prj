var commonJs = {};
this.commonJs = commonJs;
var ANIMATION_EASING = 'easeOutExpo';
var headerFixH = 80;

$(document).ready(function () {
    commonJs.initFromToCalendar($('#datepickerFrom'), $('#datepickerTo'));
    commonJs.initResvCalendar($(".calContainer"), 30);
    commonJs.initPopSingleCalendar($('.calPopSingle'));
    commonJs.initPrintBtn('.btnPrint02');
    commonJs.initAllCheckForm('.frmAll', '.allCheck');
    commonJs.initAllCheckForm('.listAllChk', '.allCheck');
    commonJs.setFileTooltip('.file');
    commonJs.setFileUpload('.fileUpload');
    commonJs.setDropdownList('.dropdown_list');
    commonJs.setTurnEnableChkbox('.chkPoint');
    commonJs.setSelboxToggle('.termsTop>.selectWrap>select', '.terms');
    commonJs.setObList('.obList');
    commonJs.setSortWrap('.sortWrap');
    commonJs.setMainBanner('.mainBanner');
    //commonJs.setDeviceCheck($('.deviceCheck'));
    commonJs.setLangArea('.langArea');

    // commonJs.setHotelSelectArea('.checkDate .hotelSel');  예약- 호텔선택시 투숙기간 선택 아코디언
    // open. 개발측 요청으로 주석처리. commonJs.initShowHideForm();
})

$(window).on('load', function () {
    /**
     * 직접호출 스크립트
     *
     * commonJs.scrollingTo($('li:eq(0)'));
     * commonJs.popShow($('#layerPop3'));
     * commonJs.popClose($('#layerPop3'))
     * setTimeout(function () {
     * commonJs.focusAlert();
     * }, 1000)
     *
     * commonJs.goNextStep($('.btnSC .btnL'));
     */

    commonJs.initAccordion($('.toggleList'));
    commonJs.initComparison($('.comparison'));
    commonJs.initLayerPopup($('.layerPop'));
    commonJs.thumbFocusEvent($('.thum'));
    commonJs.initTab('.tabToggle');
    commonJs.initSwipe($('.swipeWrap'));
    commonJs.initDesignScroll($('.scrollWrap'));
    commonJs.setScrollTransitionBtn($('.topViewCont'));
    commonJs.setWidthTranstionBtn(
        '.promInt',
        '.btnPromo',
        '.promInt .btnLine',
        '.selectWrap button'
    );
    commonJs.initFloatingContainer($('.rCont.floating'));
    commonJs.setParallax($('.parallaxUp'));
    commonJs.setKeywordBtnMore($('.keywordList .btnMore02'));
    commonJs.setHeadArea($('.header'));
    commonJs.setRevArea('.revArea');
    commonJs.initLayerSync($('.layerSync'));
    commonJs.setFixedBarArea($('.rsvInfor'));
    commonJs.attachRoomRsvClickEvent($('.roomRsv'));
    commonJs.setDataParallax();
    commonJs.setLoginFrm($('.loginFrm2'));
    commonJs.setDiningLoginFrm($('.loginFrm3'));

})

/***********************************************************************************************************
 * document.Ready 시 호출
 **********************************************************************************************************/

/**
 * HUMY4200T.html
 * 기간조회 캘린더
 *
 * @param from (Element)
 * @param to (Element)
 */
commonJs.initFromToCalendar = function (_from, _to) {
    // var currentDate = new Date(); var tommorowDate = new Date(currentDate);
    // tommorowDate.setDate(tommorowDate.getDate() + 1);
    // _from.val(currentDate.getFullYear() + '.' + lpad((currentDate.getMonth() +
    // 1), 2, 0) + '.' + currentDate.getDate()); _to.val(tommorowDate.getFullYear()
    // + '.' + lpad((tommorowDate.getMonth() + 1), 2, 0) + '.' +
    // tommorowDate.getDate());

    var nowDate = new Date();
    var monthOfYear = nowDate.getMonth();
    var minDate = new Date();
    var maxDate = new Date();

    //1년전
    minDate.setMonth(monthOfYear - 12);
    //1년후
    maxDate.setMonth(monthOfYear + 12);
    from = _from
        .datepicker({
            // defaultDate: "+1w",
            numberOfMonths: 1,
            showMonthAfterYear: true,
            monthNames: [
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
            ],
            dayNamesMin: [
                "S",
                "M",
                "T",
                "W",
                "T",
                "F",
                "S"
            ],
            dateFormat: 'yy.mm.dd',
            minDate: minDate,
            maxDate: maxDate,
            beforeShow: function () {
                $(this)
                    .datepicker("widget")
                    .addClass("datepickerFrom");
            },
            onClose: function () {
                $(this)
                    .datepicker("widget")
                    .removeClass("datepickerFrom");
            }
        })
        .on("change", function () {
            to.datepicker("option", "minDate", getDate(this));
        }),
        to = _to
            .datepicker({
                // defaultDate: "+1w",
                numberOfMonths: 1,
                showMonthAfterYear: true,
                monthNames: [
                    "01",
                    "02",
                    "03",
                    "04",
                    "05",
                    "06",
                    "07",
                    "08",
                    "09",
                    "10",
                    "11",
                    "12"
                ],
                dayNamesMin: [
                    "S",
                    "M",
                    "T",
                    "W",
                    "T",
                    "F",
                    "S"
                ],
                dateFormat: 'yy.mm.dd',
                minDate: minDate,
                maxDate: maxDate,
                beforeShow: function () {
                    $(this)
                        .datepicker("widget")
                        .addClass("datepickerTo");
                },
                onClose: function () {
                    $(this)
                        .datepicker("widget")
                        .removeClass("datepickerTo");
                }
            })
            .on("change", function () {
                from.datepicker("option", "maxDate", getDate(this));
            });
    $('#ui-datepicker-div').wrap('<div class="datepicker-wrapper"/>');

    function getDate(element) {
        var date;
        var dateFormat = 'yy.mm.dd';
        try {
            date = $
                .datepicker
                .parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }
        return date;
    }
}

//메인 예약캘린더 날짜관련 매니징함수
commonJs.calendarMgr = {
    chkInDate: '',
    chkOutDate: '',
    _getChkInDate: function () {
        return this.chkInDate;
    },
    _getChkOutDate: function () {
        return this.chkOutDate;
    },
    _setChkInDate: function (date) {
        this.chkInDate = date;
    },
    _setChkOutDate: function (date) {
        this.chkOutDate = date;
    },
    _resetDate: function (calendarEl, startDate, endDate) {
        commonJs.setCalendarChkInOutDate(calendarEl, startDate, endDate);
        this.chkInDate = '';
        this.chkOutDate = '';

        commonJs.gotoDate(calendarEl, startDate.getMonth(), startDate.getFullYear());
        calendarEl.datepicker('refresh');
        calendarEl.trigger('refresh');

    }
}

/**
 * HURE1000M.html
 * 예약 캘린더
 * https://api.jqueryui.com/datepicker/
 *
 * @param calendarEl (Element)
 */
commonJs.initResvCalendar = function (calendarEl) {
    if (!calendarEl.length) {
        return;
    }
    
    var today = new Date();
    var maxDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 30); // 오늘로부터 30일 후

    var option = {};
    calendarEl.empty();

    if (calendarEl.hasClass('calSingle')) {
        var selectedDate = '';
        var promotionDate = [];

        option = {
            defaultDate: today,  // 오늘 날짜로 설정
            tDay: today,  // 오늘 날짜로 설정
            chkInTitle: '선택 됨',
            numberOfMonths: 1,
            showMonthAfterYear: true,
            monthNames: [
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
            ],
            dayNamesMin: [
                "SUN",
                "MON",
                "TUE",
                "WED",
                "THU",
                "FRI",
                "SAT"
            ],
            dateFormat: 'yy.mm.dd',
            beforeShowDay: function (date) {
                var calDate = dUtils.getToDate(date);
                // select
                if (selectedDate == calDate) {
                    $('.calNotiCont').hide();
                    if (promotionDate.indexOf(calDate) != -1) {
                        $('.calNotiCont').show();
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
            }
        };

        function setPromotionDate(year, month) {
            //date push
            promotionDate = [];
            //test dummy
            var i = 20;
            while (i < 30) {
                promotionDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                i++;
            }
        }

        calendarEl.datepicker(option);

        // 달력의 날짜 범위 설정
        commonJs.setCalendarChkInOutDate(calendarEl, today, maxDate); // 이 부분 추가

        // 초기 프로모션 데이트 설정
        setPromotionDate(
            calendarEl.datepicker('getDate').getFullYear(),
            calendarEl.datepicker('getDate').getMonth() + 1
        );
        calendarEl.datepicker('refresh');
    } else {
        var chkInDate = commonJs.calendarMgr._getChkInDate();
        var chkOutDate = commonJs.calendarMgr._getChkOutDate();
        var clickCnt = 0;
        var resved = false;
        var isOneday = calendarEl.hasClass('oneDay');
        var unSelectableDate = [];

        var startDate = today;

        // 강남 [오픈날짜 하드코딩]
        if (jQuery("#hotlSysCode").length > 0 && jQuery("#hotlSysCode").val() == "JPY") {
            var jpyOpenDate = new Date(2021, 04, 25);
            if (jpyOpenDate > startDate) {
                startDate = jpyOpenDate;
            }
        }

        var endDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 30); // 이 부분 추가

        calendarEl.on('refresh', function () {
            clickCnt = 0;
            resved = false;
        });
        //checkInOut calendar
        option = {
            defaultDate: startDate,
            tDay: startDate, // .ui-datepicker-today 적용 날짜
            chkInTitle: '체크인',
            chkOutTitle: '체크아웃',
            numberOfMonths: 2,
            showMonthAfterYear: true,
            monthNames: [
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
            ],
            dayNamesMin: (calendarEl.hasClass('calendarS'))
                ? [
                    "S",
                    "M",
                    "T",
                    "W",
                    "T",
                    "F",
                    "S"
                ]
                : [
                    "SUN",
                    "MON",
                    "TUE",
                    "WED",
                    "THU",
                    "FRI",
                    "SAT"
                ],
            // minDate: 0, maxDate : '+11m',
            minDate: startDate,
            maxDate: endDate,
            dateFormat: 'yy.mm.dd',
            onChangeMonthYear: function (year, month, inst) {
                //날짜선택 및 달력 월 이동시 호출 setUnselectableDate(year, month);
            },
            beforeShowDay: function (date) {

                var calDate = dUtils.getToDate(date);
                chkInDate = commonJs
                    .calendarMgr
                    ._getChkInDate();
                chkOutDate = commonJs
                    .calendarMgr
                    ._getChkOutDate();
                // 체크인
                if (chkInDate == calDate) {
                    return [true, 'sel revOn ui-datepicker-unselectable ui-state-disabled'];
                }

                // 체크아웃
                if (chkOutDate == calDate) {
                    return [true, 'sel revOff'];
                }

                // 선택제한 날짜
                if (unSelectableDate.indexOf(calDate) != -1) {
                    if (clickCnt == 0 || resved) {
                        return [true, 'tdDefault'];
                    }
                    if (clickCnt == 1 && chkInDate > calDate) {
                        return [true, 'tdDefault'];
                    }
                }

                // 중간 날짜 선택
                return [
                    true,
                    (calDate > chkInDate && calDate < chkOutDate)
                        ? 'sel revIng'
                        : ''
                ];

            },
            onSelect: function (date, inst) {

                var mon = inst.selectedMonth,
                    year = inst.selectedYear,
                    drawMonth = inst.drawMonth;

                var selectPrevChkIn = false;
                var dateSplit = date.split('.');

                if (chkInDate != '' && date < chkInDate) {
                    selectPrevChkIn = true;
                }
                if (resved || (chkInDate != '' && date < chkInDate)) {
                    resved = false;
                    clickCnt = 0;
                    chkInDate = '';
                    chkOutDate = '';
                    commonJs
                        .calendarMgr
                        ._setChkInDate('');
                    commonJs
                        .calendarMgr
                        ._setChkOutDate('');
                }

                clickCnt++;
                if (clickCnt > 1) {

                    chkOutDate = date;
                    commonJs
                        .calendarMgr
                        ._setChkOutDate(date);
                    var ckinDay = dUtils.getDateToDay(chkInDate);
                    var ckoutDay = dUtils.getDateToDay(chkOutDate);
                    var nightCnt = dUtils.dateDiff(chkInDate, chkOutDate);
                    $("#dateArea").html(
                        chkInDate + " " + ckinDay + " - " + chkOutDate + " " + ckoutDay + "<span>" +
                        nightCnt + "박</span>"
                    );
                    $("#dateText").html(
                        chkInDate + " " + ckinDay + " - " + chkOutDate + " " + ckoutDay + "<span>" +
                        nightCnt + "박</span>"
                    );
                    $("#dateTextHub").html(
                        chkInDate + "&nbsp;<em>" + ckinDay + "</em>&nbsp;<span>-</span>&nbsp;" +
                        chkOutDate + "&nbsp;<em>" + ckoutDay.substring(0, 1) + "</em>"
                    );
                    $("#dateTextProp").html(
                        chkInDate + "&nbsp;<em>" + ckinDay + "</em>&nbsp;-&nbsp;" + chkOutDate + "&nbsp" +
                        ";<em>" + ckoutDay + "</em><span>" + nightCnt + "<em>박</em></span>"
                    );
                    $("#marriottDateTextProp").html(
                        '<strong class="tit">CHECK IN</strong><span class="date chkIn">' + chkInDate +
                        '&nbsp;<em>' + ckinDay + '</em></span><strong class="tit">CHECK OUT</strong><sp' +
                        'an class="date">' + chkOutDate + '&nbsp;<em>' + ckoutDay + '</em></span><stron' +
                        'g class="tit chkNights">NIGHTS</strong><span class="date">' + nightCnt + "</sp" +
                        "an>"
                    );
                    if ($("#night").length) {
                        $("#night").val(nightCnt); // 체크인 날짜
                        $("#ckinDate").val(chkInDate); // 체크인 날짜
                        $("#ckoutDate").val(chkOutDate); // 체크아웃 날짜
                    }
                    var daysDiff = dUtils.dateDiff(chkInDate, chkOutDate);
                    // var startDate = new Date(); var endDate = new Date(startDate.getFullYear(),
                    // startDate.getMonth() + 12, 0);
                    if (daysDiff > 0) {
                        calendarEl.datepicker('setDate', chkOutDate);

                        calendarEl.datepicker(
                            'option',
                            'minDate',
                            new Date(calendarEl.datepicker('option', 'minDate'))
                        );
                        calendarEl.datepicker(
                            'option',
                            'maxDate',
                            new Date(calendarEl.datepicker('option', 'maxDate'))
                        );
                        //객실 및 인원선택 아코디언 open
                        if (calendarEl.closest('.checkDate').length) {
                            calendarEl
                                .closest('li')
                                .next('li')
                                .find('.btnToggle')
                                .trigger('click_checkDate');
                        }

                    }
                } else {
                    chkInDate = date;
                    commonJs
                        .calendarMgr
                        ._setChkInDate(date);

                    var _cid = new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]);
                    if (isOneday) {
                        _cid.setDate(_cid.getDate() + 1);
                    } else {
                        _cid.setDate(_cid.getDate() + 30);
                    }

                    calendarEl.datepicker('setDate', chkInDate);
                    // calendarEl.datepicker('option' , 'minDate', 0);
                    calendarEl.datepicker(
                        'option',
                        'minDate',
                        calendarEl.datepicker('option', 'minDate')
                    );
                    if (_cid > endDate) {
                        calendarEl.datepicker(
                            'option',
                            'maxDate',
                            calendarEl.datepicker('option', 'maxDate')
                        );
                    } else {
                        calendarEl.datepicker('option', 'maxDate', _cid);
                    }
                }
                if (drawMonth == new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]).getMonth()) {
                    commonJs.gotoDate(calendarEl, mon, year);
                } else {
                    commonJs.gotoDate(calendarEl, mon - 1, year);
                }
                if (chkInDate != '' && chkOutDate != '') {
                    resved = true;
                }
            }
        };

        calendarEl.datepicker(option);
        /**
         * 선택제한 더미데이터
         */
        function setUnselectableDate(year, month) {
            //date push
            unSelectableDate = [];
            //test dummy
            var i = 20;
            while (i < 25) {
                unSelectableDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                i++;
            }
        }
        if (calendarEl.hasClass('oneDay')) {
            setUnselectableDate(
                calendarEl.datepicker('getDate').getFullYear(),
                calendarEl.datepicker('getDate').getMonth() + 2
            );
            calendarEl.datepicker('refresh');
        }
        $(document).on(
            'mouseover',
            '.calendar tbody td:not(".ui-datepicker-unselectable")',
            function (e) {

                if (chkInDate != '') {
                    var chkInCalendarIdx = $('.revOn')
                        .closest('.calInner')
                        .index();

                    var calendarIdx = $(e.currentTarget)
                        .closest('.calInner')
                        .index();
                    var currentTr = $(e.currentTarget).closest('tr');
                    var currentTd = $(e.currentTarget);
                    var startTr = $('.revOn').closest('tr');
                    var startTd = $('.revOn');
                    var chkInRightCalendar = false;

                    if (chkOutDate != '') {
                        return;
                    }
                    if ((chkInCalendarIdx == calendarIdx && currentTd.index() <= startTd.index()) || (chkInCalendarIdx == calendarIdx && currentTr.index() < startTr.index())) {
                        calendarEl
                            .find('.calInner:eq(' + calendarIdx + ') tbody tr td')
                            .each(function (idx, itm) {
                                $(this).removeClass('sel revIng revIngEnd');
                            })
                        startTd.addClass('sel');
                    }
                } else {
                    return;
                }

                if (chkOutDate != '') {
                    return;
                }
                if (chkInCalendarIdx == 1) {
                    chkInRightCalendar = true;
                } else if (currentTr.closest('.calRight').length && chkInCalendarIdx == 0) {
                    calendarEl
                        .find('.calLeft tbody tr')
                        .each(function (idx, itm) {
                            if (idx == startTr.index()) {
                                setTdState(startTr, startTd.index(), 6);
                            } else if (idx > startTr.index()) {
                                setTdState($(itm), 0, 6);
                            }
                        })

                    chkInRightCalendar = true;
                    startTr = $('.calRight tbody tr:eq(0)');
                    startTd = startTr
                        .find('td[data-handler="selectDay"]')
                        .eq(0);

                } else if (currentTr.closest('.calLeft').length && chkInCalendarIdx == 0) {
                    calendarEl
                        .find('.calRight tbody tr td')
                        .removeClass('revIng revIngEnd sel');
                } else {
                    return;
                }

                if (chkInRightCalendar) {

                    calendarEl
                        .find('.calRight .calendar tbody tr')
                        .each(function () {
                            var _this = $(this);

                            if (_this.index() < startTr.index() || _this.index() > currentTr.index() || calendarIdx == 0) {
                                return;
                            }

                            if (_this.index() == startTr.index() && _this.index() == currentTr.index()) {
                                //start1
                                if (currentTd.index() < startTd.index() || currentTr.index() < startTr.index()) {
                                    tdIdx = -1;
                                } else {
                                    tdIdx = currentTd.index()
                                };
                                setTdState(startTr, startTd.index(), tdIdx, true);
                                return;
                            } else if (_this.index() == startTr.index() && _this.index() != currentTr.index()) {
                                //start2
                                setTdState(startTr, startTd.index(), startTr.find('td').length - 1);
                                return;
                            }

                            if (_this.index() >= startTr.index() && _this.index() < currentTr.index()) {
                                //ing
                                setTdState(
                                    calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                    0,
                                    6
                                );
                                return;
                            }

                            if (_this.index() > startTr.index() && _this.index() == currentTr.index()) {
                                //end
                                setTdState(
                                    calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                    0,
                                    currentTd.index(),
                                    true
                                );
                                return;
                            }

                        })
                } else {
                    calendarEl
                        .find('.calLeft .calendar tbody tr')
                        .each(function () {
                            var _this = $(this);

                            if (_this.index() < startTr.index() || _this.index() > currentTr.index()) {
                                return;
                            }

                            if (_this.index() == startTr.index() && _this.index() == currentTr.index()) {
                                if (currentTd.index() < startTd.index() || currentTr.index() < startTr.index()) {
                                    tdIdx = -1;
                                } else {
                                    tdIdx = currentTd.index()
                                };
                                setTdState(startTr, startTd.index(), tdIdx, true);
                                return;
                            } else if (_this.index() == startTr.index() && _this.index() != currentTr.index()) {
                                setTdState(startTr, startTd.index(), startTr.find('td').length - 1);
                                return;
                            }

                            if (_this.index() >= startTr.index() && _this.index() < currentTr.index()) {
                                setTdState(
                                    calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                    0,
                                    _this.find('td').length - 1
                                );
                                return;
                            }

                            if (_this.index() > startTr.index() && _this.index() == currentTr.index()) {
                                setTdState(
                                    calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                    0,
                                    currentTd.index(),
                                    true
                                );

                                return;
                            }

                        })
                }
            }
        )
        function setTdState(trEl, start, end, _round) {
            var round = _round || false;
            trEl
                .find('td')
                .filter(function () {
                    var idx = $(this).index();
                    if (end == -1) {
                        $(this).removeClass('revIngEnd');
                        return;
                    }
                    if (idx >= start && idx < end) {
                        $(this).removeClass('revIngEnd');
                        $(this).addClass('sel revIng');
                    } else {
                        $(this).removeClass('sel revIng revIngEnd');
                    }
                    if (idx == end) {
                        $(this).addClass('sel revIng revIngEnd');
                    }
                    if (idx == 6 && !round) {
                        $(this).removeClass('revIngEnd');
                    }
                })
            trEl
                .nextAll('tr')
                .find('td')
                .removeClass('sel revIng revIngEnd');
        }

        $('.calWrap').css('width', '');
    }
}
commonJs.gotoDate = function ($j, month, year) {
    $j.each(function (i, el) {
        var inst = $
            .datepicker
            ._getInst(el);
        inst.drawMonth = inst.selectedMonth = month;
        inst.drawYear = inst.selectedYear = year;
        $
            .datepicker
            ._notifyChange(inst);
        $
            .datepicker
            ._adjustDate(el);
    });
}

/**
 * 달력 날짜 세팅
 *
 * @param calendarEl (요소)
 * @param minDate (시작일)
 * @param maxDate (종료일)
 *
 */
commonJs.setCalendarChkInOutDate = function (calendarEl, minDate, maxDate) {
    calendarEl.datepicker('option', 'minDate', minDate);
    calendarEl.datepicker('option', 'maxDate', maxDate);
    calendarEl.datepicker('option', 'tDay', minDate);
    calendarEl.datepicker('setDate', minDate);
}

/**
 * 팝업 싱글캘린더
 * BSBM1100T.html
 *
 * @param calendarEl (Element)
 */
commonJs.initPopSingleCalendar = function (calendarEl) {
    calendarEl.datepicker({
        numberOfMonths: 1,
        showMonthAfterYear: true,
        monthNames: [
            "01",
            "02",
            "03",
            "04",
            "05",
            "06",
            "07",
            "08",
            "09",
            "10",
            "11",
            "12"
        ],
        dayNamesMin: [
            "SUN",
            "MON",
            "TUE",
            "WED",
            "THU",
            "FRI",
            "SAT"
        ],
        dateFormat: 'yy.mm.dd',

        beforeShow: function (input) {},
        onClose: function () {},
        onChangeMonthYear: function () {}
    });
    $('#ui-datepicker-div').wrap('<div class="datepicker-wrapper"/>');
}

/**
 * HURE1000M.html
 * 프로모션코드 입력 영역 show/hide
 *
 * @param shNode (String)
 * @param openBtn (String)
 * @param closeBtn (String)
 */
commonJs.initShowHideForm = function (shNode, openBtn, closeBtn) {
    $(document).on('click', openBtn, function () {
        $(this)
            .siblings(shNode)
            .show();
    })
    $(document).on('click', closeBtn, function () {
        $(this)
            .closest(shNode)
            .hide();
    })
}

/**
 * HURE2400M.html
 * 인쇄버튼
 *
 * @param node (String)
 */
commonJs.initPrintBtn = function (node) {
    $(document).on('click', node, function () {
        var printContent = ($('.printCont:visible').children('.designScroll').length)
            ? $('.printCont:visible').find('.scrollWrap')
            : $('.printCont:visible');

        printContent.printThis({removeInline: false})
    })

}

/**
 * HUJO0030M.html
 * HUMY7100M.html
 * 전체동의 버튼
 *
 * @param btnNode (String)
 * @param containerNode (String)
 */
commonJs.initAllCheckForm = function (btnNode, containerNode) {
    if (!$(btnNode).length) {
        return;
    }
    $(document)
        .off('click.allCheck')
        .on('click.allCheck', btnNode + ' input', function () {
            var btnEl = $(this).closest(btnNode);
            if (btnEl.hasClass('allChecked')) {
                btnEl.removeClass('allChecked');
                $(this)
                    .closest(containerNode)
                    .find('input')
                    .prop('checked', false);
            } else {
                btnEl
                    .addClass('allChecked')
                    .closest(containerNode)
                    .find('input')
                    .prop('checked', true);
            }
        })

    $(document)
        .off('click.unCheck')
        .on('click.unCheck', containerNode + ' .frm input', function () {
            if ($(this).closest('.frmAll').length) {
                return;
            }
            var allCheckEl = $(this)
                .closest(containerNode)
                .find(btnNode);
            if (allCheckEl.hasClass('allChecked')) {
                allCheckEl
                    .find('input')
                    .prop('checked', false);
            }

        })
}

/**
 * HUME4220T.html
 * 파일네임 툴팁 show/hide
 *
 * @param tooltipNode (String)
 */
commonJs.setFileTooltip = function (tooltipNode) {
    $(document)
        .off('click.fileTooltip')
        .on('click.fileTooltip', tooltipNode + ' button', function () {
            var tooltip = $(this).closest(tooltipNode);
            if (tooltip.hasClass('on')) {
                tooltip.removeClass('on');
            } else {
                tooltip.addClass('on');
            }
        })
}

/**
 * 파일 업로드
 * HUMY2100M.html
 * HUFO1100M.html
 *
 * @param uploadNode(String)
 */
commonJs.setFileUpload = function (uploadNode) {

    /** 파일 선택 */
    $(document).on('change', uploadNode + ' .uploadBtn', function (e) {

        if (window.FileReader) {
            if (this.files.length < 1) {
                $(this)
                    .closest(uploadNode)
                    .find('.intDel .btnDel')
                    .hide();
                $(this)
                    .closest(uploadNode)
                    .find('.intDel')
                    .eq(0)
                    .find('.fileName')
                    .val('');
                $(this)
                    .get(0)
                    .value = "";
                return;
            }

            var filename = this
                .files[0]
                .name;
            $(this)
                .closest(uploadNode)
                .find('.intDel .fileName')
                .val(filename);

        } else {
            var filename = $(this)
                .val()
                .split('/')
                .pop()
                .split('\\')
                .pop();
            $(this)
                .closest(uploadNode)
                .find('.intDel:last .fileName')
                .val(filename);
        }
        $(this)
            .closest(uploadNode)
            .find('.btnDel')
            .show();

    })

    /** 파일 삭제 */
    $(document).on('click', uploadNode + ' .btnDel', function () {
        var _t = $(this);
        _t.hide();

        if (window.FileReader) {
            _t
                .closest(uploadNode)
                .find('.uploadBtn')
                .get(0)
                .files[0]
                .value = '';
            if (_t.closest(uploadNode).find('.intDel:visible').length > 1) {
                _t
                    .closest('.intDel')
                    .hide();
            } else {
                _t
                    .siblings('.fileName')
                    .val('');
                _t
                    .closest(uploadNode)
                    .find('.uploadBtn')
                    .get(0)
                    .value = "";
            }
        } else {
            _t
                .siblings('.fileName')
                .get(0)
                .value = '';
            var uploadNodeClone = _t
                .closest(uploadNode)
                .find('.uploadBtn')
                .clone(true);
            _t
                .closest(uploadNode)
                .find('.uploadBtn')
                .replaceWith(uploadNodeClone);
        }
    })
}

/**
 * 드롭다운 리스트 정의
 * BSMA1000M.html
 *
 * @param dropdownList(String)
 */
commonJs.setDropdownList = function (dropdownList) {

    if (!$(dropdownList).length) {
        return;
    }
    $(document).on('click', dropdownList, function (e) {
        if (!$(e.target).closest('.item_list')) {
            e.preventDefault();
        }
        if ($(this).hasClass('active')) {
            $(this)
                .removeClass('active')
                .attr('aria-expanded', false);
        } else {
            $(this)
                .addClass('active')
                .attr('aria-expanded', true);
        }
    })

    $('html').on('click', function (e) {
        if ($(e.target).closest('.sGnb01').length) {
            return;
        }
        if (!$(e.target).closest(dropdownList).length) {
            $(dropdownList)
                .removeClass('active')
                .attr('aria-expanded', false);
        }
    });
}

/**
 * 셀렉박스 선택시 div 토글
 * HUFO2400M.html
 * HUFO2100M.html
 *
 * @param {String} selbox
 * @param {String} cont
 */
commonJs.setSelboxToggle = function (selbox, cont) {
    if (!$(selbox).length) {
        return;
    }

    var orgIdx = $(selbox)
        .find('option:selected')
        .index();
    $(selbox)
        .find('option')
        .each(function () {
            if ($(this).text() === $(selbox).attr('data-msg')) {
                orgIdx = $(this).index();
                return;
            }
        })

    $(cont)
        .eq(orgIdx)
        .show()
        .siblings(cont)
        .hide();

    $(document).on('change', selbox, function () {
        $(cont)
            .eq(this.selectedIndex)
            .show()
            .siblings(cont)
            .hide();
    })

}

/**
 * 체크박스 선택시 비활성화 영역 활성화
 * HUMY6200M.html
 *
 * @param {String} chkPoint
 */
commonJs.setTurnEnableChkbox = function (chkPoint) {
    $(chkPoint).each(function () {
        $(this).data('disabledArea', $('.disabled'));
        if ($(this).is(':checked')) {
            $(this)
                .data('disabledArea')
                .removeClass('disabled');
        } else {
            $(chkPoint)
                .data('disabledArea')
                .addClass('disabled');
        }
    })
    $(document).on('change', chkPoint, function () {
        if ($(this).is(':checked')) {
            $(chkPoint)
                .data('disabledArea')
                .removeClass('disabled');
        } else {
            $(chkPoint)
                .data('disabledArea')
                .addClass('disabled');
        }
    })
}

/**
 * obList 의 li 에 마우스 오버 또는 focus 가 가면 on 클래스 추가
 * obList 의 li 와 obBg 매칭 되는 li에 on 클래스 추가
 * HUMA1000M.html
 *
 * @param {String} obList
 */
commonJs.setObList = function (obList) {
    $(document).on('focus mouseover', obList + ' li', function () {
        $(this)
            .addClass('on')
            .siblings('li')
            .removeClass('on');
        $('.obBg li')
            .eq($(this).index())
            .addClass('on')
            .siblings('li')
            .removeClass('on');
    })
    $(document).on('blur mouseleave', obList + ' li', function () {
        $(this).removeClass('on');
        $('.obBg li')
            .eq($(this).index())
            .removeClass('on');
        $('.obBg li')
            .eq(0)
            .addClass('on');
    })
}

/**
 * 정렬버튼 선택시 해당 카테고리만 show/hide
 * BSRO1000M.html
 *
 * @param sortWrap (String)
 */
commonJs.setSortWrap = function (sortWrap) {
    $(document).on('click', sortWrap + ' .sortBtn>li', function () {
        var searchTxt = $(this)
            .find('a')
            .text();
        var propertyList = $(this)
            .closest('.sortWrap')
            .find('.propertyList');
        var liList = propertyList.children('li');
        var cont;
        $(this)
            .addClass('on')
            .siblings('li')
            .removeClass('on');

        if ($(this).children('a').text() === 'ALL') {
            cont = liList.show();
        } else {
            liList.hide();
            cont = liList
                .find('.category>span').map(function (i, s) { if (s.innerText == searchTxt) return s; })
                .closest('li')
                .show();
        }

        if (!cont.length) {
            propertyList
                .find('.noData')
                .show();
        } else {
            propertyList
                .find('.noData')
                .hide();
        }

    })
}

/**
 * 메인배너 적용
 * BSMA2000M.html
 * HUMA1000M.html
 *
 * @param {String} mainBanner
 */
commonJs.setMainBanner = function (mainBanner) {
    var bannerCss = {
        'transition': 'top .5s',
        '-webkit-transition': 'top .5s',
        '-moz-transition': 'top .5s',
        '-ms-transition': 'top .5s',
        '-o-transition': 'top .5s'
    };

    var banner = $(mainBanner);
    if (banner.length) {
        //배너 등록시
        banner
            .css(bannerCss)
            .show();
        $('.header').css(bannerCss);
    }

    $(document).on('click', mainBanner + ' .bannerClose', function () {
        // if
        // ($(this).siblings('.frm.todayClose').find('input:checkbox').is(':checked')) {
        // 오늘 하루 열지 않기  var ck = commonJs.getCookie("bannerExpire");    if (ck == null ||
        // ck == undefined || ck == '') {       commonJs.setCookie("bannerExpire", "on");   }
        // }
        banner.data('topBannerClosed', true);
        $('.mainWrapper').removeClass('topBanner');
    })

    $(mainBanner)
        .off('hideTopBanner')
        .on('hideTopBanner', function () {
            $('.mainWrapper').removeClass('topBanner');
        })
        .off('showTopBanner')
        .on('showTopBanner', function () {
            $('.mainWrapper').addClass('topBanner');
        })
}

/**
 * 언어 체크 및 .langArea영역 현재언어 셋팅
 * @param {String} langArea
 *
 * HUMA1000M.html
 */
commonJs.setLangArea = function (langArea) {
    var langArr = ['ko', 'en', 'zh'];
    var langTxtArr = ['KR', 'EN', 'CN'];

    var langIdx = $.inArray($('html').attr('lang'), langArr);
    var langAreaEl = $(langArea);

    langAreaEl
        .find('.dropdown_value>input')
        .attr('value', langTxtArr[langIdx]);
    langAreaEl
        .find(
            '.item_list li[role=option] a:contains(' + langTxtArr[langIdx] + ')'
        )
        .hide();
}

/**
 * 예약 - 호텔 선택시 투숙기간 선택 아코디언 open
 * @param {String} hotelSel
 *
 * HURE1000M.html
 */
commonJs.setHotelSelectArea = function (hotelSel) {
    $(document).on('click', hotelSel + ' ul.frmList >li', function () {
        $(this)
            .closest('li.toggleOn')
            .next('li')
            .find('.btnToggle')
            .trigger('click_checkDate');
    })
}

/*********************************************************************************************************
 *  window.onLoad 시 호출
 *********************************************************************************************************/

/**
 * HURE1000M.html
 * 아코디언
 * @param AccordionEl (Element)
 */
commonJs.initAccordion = function (AccordionEl) {
    var speed = 800;
    var GuidanceText = ['상세내용 보기', '상세내용 닫기'];
    AccordionEl.each(function () {
        var accordionItm = $(this);
        var ofsTop = [];
        accordionItm
            .children('li')
            .each(function (idx, itm) {
                var toggleCont = $(itm).find('.toggleCont');
                var btnToggle = $(itm).find('.btnToggle');

                toggleCont.hide();

                ofsTop.push(
                    (!$(itm).is(':visible') && $(itm).hasClass('noData'))
                        ? 0
                        : ($(itm).find('.roomIntro').outerHeight() === undefined)
                            ? $(itm).outerHeight()
                            : $(itm).find('.roomIntro').outerHeight() + parseInt($(itm).css('paddingTop')) +
                            parseInt($(itm).css('paddingBottom'))
                );

                ofsTop[idx] = ofsTop[idx] + (
                    (ofsTop[idx - 1] === undefined)
                        ? 0
                        : ofsTop[idx - 1]
                );

                if ($(itm).hasClass('toggleOn')) {
                    toggleCont.show();
                } else {
                    toggleCont.hide();
                }

                btnToggle
                    .off('click')
                    .on('click', function () {
                        if (toggleCont.is(':animated')) {
                            return;
                        }
                        $('.comparison').trigger('docHeightChange');

                        if (toggleCont.is(':visible')) {
                            //hide
                            $(itm).removeClass('toggleOn');
                            // accordionText.show();
                            toggleCont
                                .css({'overflow': 'hidden'})
                                .stop()
                                .animate({
                                    height: 0
                                }, speed, ANIMATION_EASING, function () {
                                    btnToggle
                                        .find('span.hidden')
                                        .text(GuidanceText[0]);
                                    toggleCont.removeAttr('style');
                                })
                           //HUDI3000L.html / HUDI3000M.html - 예약자와 방문자가 다를때
                           $(itm).children(".clickBtn").find(".type03Chk").prop('checked', false);

                        } else {
                            $(itm)
                                .siblings('li')
                                .find('.btnToggle')
                                .trigger('accordion_close');

                            if ($(itm).prev('li').hasClass('noData')) {
                                scrollOffset = accordionItm
                                    .offset()
                                    .top + (
                                    ofsTop[idx - 1] === undefined
                                        ? 0
                                        : ofsTop[idx - 1]
                                ) - headerFixH;
                            } else if ($(itm).prev('li').length) {
                                scrollOffset = accordionItm
                                    .offset()
                                    .top + ofsTop[idx - 1] - headerFixH;
                            } else {
                                scrollOffset = $(itm)
                                    .offset()
                                    .top - headerFixH;
                            }

                            //멤버십 상세페이지 띠배너 height 적용
                            if ($('.membershipView').length) {
                                scrollOffset -= $('.rsvInfor').outerHeight();
                            }

                            //show
                            $(itm).addClass('toggleOn');
                            // accordionText.hide();
                            toggleCont.css({'display': 'block', 'overflow': 'hidden'})

                            if ($(itm).closest('.lCont').length) {
                                $('.rCont').trigger('setPosition');
                                $('html, body').animate({
                                    scrollTop: scrollOffset
                                }, 800, ANIMATION_EASING);
                            } else if ($(itm).closest('.layerCont').length) {} else if (!$(itm).closest('.floating').length && $(itm).siblings('li').length) {
                                $('html, body').animate({
                                    scrollTop: scrollOffset
                                }, 800, ANIMATION_EASING);
                            }
                            var h = toggleCont.outerHeight();
                            toggleCont
                                .css({'height': '0'})
                                .stop()
                                .animate({
                                    height: h
                                }, speed, ANIMATION_EASING, function () {
                                    btnToggle
                                        .find('span.hidden')
                                        .text(GuidanceText[1]);
                                    toggleCont.css({'height': '', 'overflow': ''})
                                    $('.comparison').trigger('docHeightChange');
                                })
                            //HUDI3000L.html / HUDI3000M.html - 예약자와 방문자가 다를때
                           $(itm).children(".clickBtn").find(".type03Chk").prop('checked', true);
                        }

                    })

                btnToggle.on('click_checkDate', function () {
                    $(itm)
                        .siblings('li')
                        .find('.btnToggle')
                        .trigger('accordion_close');

                    if ($(itm).prev('li').hasClass('noData')) {
                        scrollOffset = accordionItm
                            .offset()
                            .top + (
                            ofsTop[idx - 1] === undefined
                                ? 0
                                : ofsTop[idx - 1]
                        ) - headerFixH;
                    } else if ($(itm).prev('li').length) {
                        scrollOffset = accordionItm
                            .offset()
                            .top + ofsTop[idx - 1] - headerFixH;
                    } else {
                        scrollOffset = $(itm)
                            .offset()
                            .top - headerFixH;
                    }

                    //show
                    $(itm).addClass('toggleOn');
                    toggleCont.css({'display': 'block', 'overflow': 'hidden'})

                    if ($(itm).closest('.lCont').length) {
                        $('.rCont').trigger('setPosition');
                        $(window).scrollTop(scrollOffset);
                    } else if ($(itm).closest('.layerCont').length) {} else if (!$(itm).closest('.floating').length && $(itm).siblings('li').length) {
                        $(window).scrollTop(
                            $(itm).closest('ul').offset().top - $('.header').outerHeight()
                        );
                    }
                    var h = toggleCont.outerHeight();
                    toggleCont
                        .css({'height': '0'})
                        .stop()
                        .animate({
                            height: h
                        }, speed, ANIMATION_EASING, function () {
                            btnToggle
                                .find('span.hidden')
                                .text(GuidanceText[1]);
                            toggleCont.css({'height': '', 'overflow': ''})
                            $('.comparison').trigger('docHeightChange');
                        })
                })

                btnToggle.on('accordion_close', function (e) {
                    e.preventDefault();
                    if (toggleCont.is(':visible')) {
                        //hide
                        $(itm).removeClass('toggleOn');
                        toggleCont.removeAttr('style');
                        $('.comparison').trigger('docHeightChange');
                    }
                })
            });
    })
}

/**
 * HURE1200T.html
 * 객실, 요금 선택페이지 비교함 모션 스크립트
 * !! initAccordion과 같은 페이지인 경우 initAccordion먼저 실행되어야합니다.
 * @param comparisonEl (Element : 비교함 영역 엘리먼트)
 */
commonJs.initComparison = function (comparisonEl) {

    if (!comparisonEl.length) {
        return;
    }
    var btnComparison = $('.btnComparison');
    var btnComp = comparisonEl.find('.btnComp');
    var compCont = comparisonEl.find('.compCont');
    var footerOffsetTop = $('.footer')
        .offset()
        .top + btnComp.height();
    var compContH = comparisonEl.outerHeight() - btnComp.height();
    var contIsOpen = false;
    var speed = 500;
    var guideText = ['비교함 담기', '비교함 빼기'];

    //비교함 보이기
    btnComparison.on('click', function (e) {
        e.preventDefault();

        if ($(this).hasClass('on')) {
            $(this).removeClass('on');
        } else {
            $(this).addClass('on');

            contIsOpen = true;
            comparisonEl.show();
            compCont.css({'display': 'block', 'height': compContH});
            btnComp.addClass('on');
        }

    })

    //비교함 열기/닫기
    btnComp.on('click', function (e) {
        if (compCont.is(':visible')) {
            compCont
                .css({'display': 'block', 'overflow': 'hidden'})
                .stop()
                .animate({
                    'height': 0
                }, speed, ANIMATION_EASING, function () {
                    compCont.css({'display': 'none', 'overflow': '', 'height': ''})
                })
            btnComp.removeClass('on');
            contIsOpen = false;
        } else {
            //open
            compCont
                .css({'display': 'block', 'overflow': 'hidden', 'height': '0'})
                .stop()
                .animate({
                    'height': compContH
                }, speed, ANIMATION_EASING, function () {
                    compCont.removeAttr('style');
                })
            btnComp.addClass('on');
            contIsOpen = true;
        }
    })

    var footerH = $('.footer').outerHeight();
    var compOffsetTop = footerOffsetTop;

    $('.comparison').on('docHeightChange', function () {

        if ($(this).is(':visible')) {
            compOffsetTop = $('.footer')
                .offset()
                .top;
        } else {
            compOffsetTop = $('.footer')
                .offset()
                .top + btnComp.height();
        }

        if ($(this).css('position') == 'fixed' && $(this).is(':visible')) {
            compOffsetTop = $('.footer')
                .offset()
                .top + btnComp.height();
        }

        var sb = $(window).scrollTop() + $(window).height();

        if (sb <= compOffsetTop) {
            comparisonEl.css({'position': ''})
        } else {
            comparisonEl.css({'position': 'relative'})
        }
    });

    $(window)
        .off('.comparison')
        .on('scroll.comparison', function () {
            var sb = $(this).scrollTop() + $(window).height();
            //open상태
            if (contIsOpen) {
                if (sb <= $(document).outerHeight() - footerH) {
                    //close
                    compCont
                        .css({'overflow': 'hidden'})
                        .stop()
                        .animate({
                            'height': 0
                        }, speed, ANIMATION_EASING, function () {
                            compCont.css({'display': 'none', 'overflow': '', 'height': ''})
                        })
                    btnComp.removeClass('on');
                    contIsOpen = false;
                }
            }

            if (!comparisonEl.is(':visible')) {
                return;
            }
            if (sb <= compOffsetTop) {
                comparisonEl.css({'position': ''})
            } else {
                comparisonEl.css({'position': 'relative'})
            }
        })
}

/**
 * 레이어팝업 웹접근성관련 tab키 스크립트
 */
commonJs.initLayerPopup = function (layerPopEl) {
    layerPopEl.each(function (idx, itm) {
        $(itm)
            .find('.btnClose')
            .on('keydown', function (e) {
                // tab keydown
                if (e.shiftKey === false && e.keyCode === 9) {
                    $(itm)
                        .find('.layerCont')
                        .focus();
                    return false;
                }
            });
    })
}

/**
 * 팝업창 open
 * HURE1200T.html
 * @param popupElement (Element)
 */
commonJs.popShow = function (popupElement) {

    commonJs.initLayerPopup(popupElement);

    $('.container').trigger('dimmedOn');

    var st = $(window).scrollTop();
    $('.header').trigger('stopHeadAreaEvt');
    $('.floating').trigger('floatingPrevent');

    commonJs.preventBodyScroll(function () {
        if ($('.mainWrapper').length) {
            return;
        }
        $('#container').css('margin-top', -st);
    });

    $('.dimmed').show();
    popupElement.css({'display': 'block', 'visibility': 'hidden'})

    setTimeout(function () {
        popupElement.css('visibility', '');
        var layerCont = popupElement.find('.layerCont');
        layerCont
            .attr('tabindex', 0)
            .focus();

        layerCont.css({
            'top': '50%',
            'left': '50%',
            'margin-top': -(layerCont.outerHeight() / 2),
            'margin-left': -(layerCont.outerWidth() / 2)
        })

        $('body').css({'overflow': 'hidden'})
    }, 50)
}

/**
 * 팝업창 close
 * HURE1200T.html
 * @param popupElement (Element)
 */
commonJs.popClose = function (popupElement) {
    if (!popupElement.is(':visible')) {
        return;
    }

    var mt = parseInt($('#container').css('margin-top'));

    popupElement.hide();
    popupElement
        .find('.layerCont')
        .attr('tabindex', '');

    $('body').css({'overflow': ''})

    commonJs.allowBodyScroll(function () {
        if ($('body').children('.dimmed').is(':visible')) {
            $('.header').trigger('setHeadAreaEvt');
            $('.floating').trigger('floatingAllow');

            if ($('.mainWrapper').length) {
                return;
            }
            $('#container').css('margin-top', '');
            $(window).scrollTop(Math.abs(mt));
        }
    });

    $('.dimmed').hide();

    setTimeout(function () {
        $('.container').trigger('dimmedOff');
        $('[class*=mainArea]').css('top', 0);
    }, 100)

}

/**
 * 로딩이미지 show
 */
commonJs.showLoadingBar = function () {
    var st = $(window).scrollTop();
    var loadingImgUri = "/static/home/images/ko/pc/common/img_loadingbar.gif";
    var html = '<div class="loadingBar"><div class="img"><img src=' +
        loadingImgUri + ' alt=""></div><div class="dimmed" style="display:block;"></div' +
        '></div>';
    var topDimmed = $('body').children('.dimmed');

    if (!topDimmed.is(':visible')) {
        commonJs.preventBodyScroll(function () {
            $('#container').css('margin-top', -st);
        });
    }
    topDimmed.hide();

    $('body').append(html);
}

/**
 * 로딩이미지 close
 */
commonJs.closeLoadingBar = function () {
    var mt = parseInt($('#container').css('margin-top'));

    commonJs.allowBodyScroll(function () {
        $('#container').css('margin-top', '');
        $(window).scrollTop(Math.abs(mt));
    });

    $('.loadingBar').remove();
}

/**
 * 부모화면 스크롤 prevent
 */
commonJs.preventBodyScroll = function (callback) {

    var isMain = $('.mainWrapper').length;
    var cssCode = (isMain)
        ? {
            'overflow-y': 'hidden'
        }
        : {
            'overflow-y': 'hidden',
            'position': 'fixed',
            'width': '100%'
        }

    $('body').css(cssCode);

    if (callback != undefined) {
        callback();
    }
}

/**
 * 부모화면 스크롤 allow
 */
commonJs.allowBodyScroll = function (callback) {
    var isMain = $('.mainWrapper').length;
    var cssCode = (isMain)
        ? {
            'overflow-y': ''
        }
        : {
            'overflow-y': '',
            'position': '',
            'width': ''
        }

    $('body').css(cssCode);

    if (callback != undefined) {
        callback();
    }
}

/**
 * 썸네일 마우스 오버 or 포커스시 viewMore show
 * HURE1200T.html#
 * @param thumbEl (Element)
 */
commonJs.thumbFocusEvent = function (thumbEl) {
    var hoverConts = thumbEl.find('.hoverCont');
    hoverConts.each(function (idx, itm) {
        var _itm = $(itm);
        _itm
            .mouseover(function () {
                hoverConts
                    .removeClass('on')
                    .attr('tabindex', '');
                _itm
                    .addClass('on')
                    .attr('tabindex', 0);
            })
            .mouseleave(function () {
                _itm
                    .removeClass('on')
                    .attr('tabindex', '');
            })

        _itm
            .find('a')
            .focus(function () {
                hoverConts.attr('tabindex', '');
                _itm
                    .addClass('on')
                    .attr('tabindex', 0);

            })
            .blur(function () {
                _itm
                    .removeClass('on')
                    .attr('tabindex', '');
            })
    })
}

/**
 * 탭
 * HURE1200T.html
 * @param tabToggle (string) .tabToggle 클래스가 존재해야만 토글 스크립트 작동.
 */
commonJs.initTab = function (tabToggle) {
    $(tabToggle).each(function (idx, itm) {
        var _itm = $(itm);
        if (!_itm.hasClass('tabToggle')) {
            return;
        }
        var contList = _itm.nextUntil($('.tabToggle'), '.tabCont');
        _itm
            .find('li>a')
            .on('click', function (e) {
                e.preventDefault();

                $(this)
                    .closest('li')
                    .addClass('on')
                    .siblings('li')
                    .removeClass('on');
                contList.hide();

                if ($(this).attr('href') != '#') {
                    $('.tabCont' + $(this).attr('href')).show();
                }

            })

    })
}

/**
 * 스와이프 영역 init
 * HURE1300M.html
 * @param swipeEl (El)
 */
commonJs.initSwipe = function (swipeEl) {
    var speed = 400;
    swipeEl.each(function (idx, itm) {
        var _itm = $(itm);
        var pageNow = _itm.find('.numPaging .num.now');
        var pageNum = _itm
            .find('.numPaging .num')
            .not('.now');
        var slideLi = _itm.find('.swipeSlide');
        var slidesLength = _itm
            .find('.swipeSlide')
            .length;
        var indicatorWrap = _itm
            .closest('.swipeWrapArea')
            .find('.indicator');
        var indicator = _itm
            .closest('.swipeWrapArea')
            .find('.indicator>button');
        var wrapContents = false;
        var wrapper = (_itm.closest('.swipeWrapArea').length)
            ? _itm.closest('.swipeWrapArea')
            : _itm;

        if (!wrapper.is(':visible')) {
            if (_itm.closest('.layerPop').length) {
                _itm
                    .closest('.layerPop')
                    .show();
                wrapContents = 'layerPop';
            } else if (_itm.closest('.tabCont').length) {
                _itm
                    .closest('.tabCont')
                    .show();
                wrapContents = 'tabCont';
            }
        }

        if (slidesLength < 2) {
            _itm
                .find('.btnSwipe')
                .remove();
            _itm
                .siblings('.indicator')
                .remove();
        }

        if (indicator.length) {
            indicator.remove();
            for (var i = 0; i < slidesLength; i++) {
                if (i == 0) {
                    indicatorWrap.append(
                        "<button type='button' class='num on'><em class='hidden'>현재 이미지</em>" + lpad(
                            i + 1,
                            2,
                            0
                        ) + "</button>"
                    );
                } else {
                    indicatorWrap.append(
                        "<button type='button' class='num'>" + lpad(i + 1, 2, 0) + "</button>"
                    );
                }
            }
            indicator = wrapper.find('.indicator>button');
        }
        if (_itm.closest('.mainArea02').length && _itm.closest('.contents02').length) {
            //josun 메인

            var mainData = _itm.data('swiper');
            if (mainData != undefined) {
                //destroy
                mainData
                    .get(0)
                    .destroy();
            }
            //메인페이지 페이드형식 오토 슬라이드
            _itm
                .find('.swipeCont')
                .css('position', 'absolute');
            var mainInner = _itm.closest('.contents02');
            var btnAuto = mainInner.find('.btnAuto button');

            var mySlider = _itm.touchSlider({
                mode: 'fade',
                roll: false,
                useMouse: false,
                btn_prev: mainInner.find('.btnSwipe.btnPrev'),
                btn_next: mainInner.find('.btnSwipe.btnNext'),
                controls: false,
                paging: false,
                speed: speed,
                initComplete: function (e) {
                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        }
                    })
                    slideLi.each(function () {
                        $(this).css({
                            'width': $(this)
                                .find('.homeBox')
                                .outerWidth()
                        })
                    })
                },
                counter: function (e) {
                    var idx = e.current - 1;

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }

                    if (idx == 0) {
                        mainInner
                            .find('.btnSwipe')
                            .hide();
                        mainInner
                            .find('.btnSwipe.btnNext')
                            .show();

                    } else if (idx == slidesLength - 1) {
                        mainInner
                            .find('.btnSwipe')
                            .hide();
                        mainInner
                            .find('.btnSwipe.btnPrev')
                            .show();
                    }

                    mainInner
                        .find('.homeboxBg li')
                        .eq(idx)
                        .addClass('on')
                        .siblings('li')
                        .removeClass('on');
                    slideLi
                        .eq(idx)
                        .addClass('on')
                        .siblings('li')
                        .removeClass('on');
                },
                destroyComplete: function () {}
            })

            _itm.data('swiper', mySlider);
        } else if (_itm.closest('.mainArea01').length && !_itm.closest('.contents02').length && !_itm.closest('.palace').length) {
            //gjb 메인
            var mainData = _itm.data('swiper');

            if (mainData != undefined) {
                //destroy
                mainData
                    .get(0)
                    .destroy();
            }
            //메인페이지 페이드형식 오토 슬라이드
            _itm
                .find('.swipeCont')
                .css({'position':'absolute'});


            var autoTimer = null;
            var mainInner = _itm.closest('.mainInner');
            var btnAuto = mainInner.find('.btnAuto button');

            var mySlider = _itm.touchSlider({
                mode: 'fade',
                btn_prev: mainInner.find('.btnSwipe.btnPrev'),
                btn_next: mainInner.find('.btnSwipe.btnNext'),
                controls: false,
                paging: false,
                speed: speed,
                initComplete: function (e) {
                    btnAuto.on('click', function () {
                        if (!$(this).hasClass('btnPlay')) {
                            $(this).addClass('btnPlay');

                            //STOP: timer clear
                            clearTimeout(autoTimer);
                        } else {
                            $(this).removeClass('btnPlay');

                            //PLAY: timer set
                            var crtSlide = _itm.find('.swipeSlide[aria-hidden=false]');
                            var crtIdx = crtSlide.index();
                            var isVideo = (crtSlide.find('.mainVideo').length)
                                ? true
                                : false;
                            var videoNode = null;
                            if (autoTimer != null) {
                                clearTimeout(autoTimer);
                            }

                            if (isVideo) {
                                videoNode = crtSlide
                                    .find('.mainVideo video')
                                    .get(0);
                            }

                            var delay = (isVideo)
                                ? videoNode.duration * 1000
                                : 5000;

                            autoTimer = setTimeout(function () {

                                if (!btnAuto.hasClass('btnPlay')) {
                                    if (isVideo) {
                                        videoNode.pause();
                                    }
                                    _itm
                                        .get(0)
                                        .go_page(
                                            (crtIdx + 1 > slideLi.length)
                                                ? 0
                                                : crtIdx + 1
                                        );
                                }
                            }, delay);
                        }
                    })

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        }
                    })

                },
                counter: function (e) {
                    var idx = e.current - 1;
                    var isVideo = (slideLi.eq(idx).find('.mainVideo').length)
                        ? true
                        : false;

                    var delay = (isVideo)
                        ? slideLi
                        .eq(idx)
                        .find('.mainVideo video')
                        .get(0)
                        .duration * 1000
                        : 5000;
                    var videoNode = null;
                    if (autoTimer != null) {
                        clearTimeout(autoTimer);
                    }

                    if (isVideo) {
                        videoNode = slideLi
                            .eq(idx)
                            .find('.mainVideo video')
                            .get(0);
                        if (videoNode.currentTime != 0) {
                            videoNode.currentTime = 0;
                        }
                        videoNode.play();
                    }

                    autoTimer = setTimeout(function () {
                        if (!btnAuto.hasClass('btnPlay')) {
                            if (isVideo) {
                                videoNode.pause();
                            }
                            _itm
                                .get(0)
                                .go_page(
                                    (idx + 1 > slideLi.length)
                                        ? 0
                                        : idx + 1
                                );
                        }
                    }, delay);

                    //슬라이드 1 이하시 자동롤링 disable
                    if (slideLi.length < 2) {
                        clearTimeout(autoTimer);
                    }

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                },
                destroyComplete: function () {
                    clearTimeout(autoTimer);
                }
            })

            _itm.data('swiper', mySlider);



            // window resize 가로값 적용
            function handleMainSwipeResize() {
                var mainSwipe = document.querySelector(".mainArea01 .swipeCont");
                var sliderItems = document.querySelectorAll(".mainArea01 .swipeCont, .mainArea01 .swipeCont .swipeSlide");
                var bodyWidth = document.body.clientWidth;

                if(mainSwipe.offsetWidth !== bodyWidth){
                    Array.prototype.forEach.call(sliderItems, function(item) {
                        item.style.width = bodyWidth + 'px';
                    })
                }
            }
            window.addEventListener("resize", handleMainSwipeResize);

            var jess = new Jessture(_itm);

            jess.on('jsLeft jsRight', function (e) {
                e.stopPropagation();
                btnAuto.addClass('btnPlay');
                return false;
            })

        } else if(_itm.closest('.mainArea01').length && _itm.closest('.palace').length) {

            // josun palce 메인
            var mainData = _itm.data('swiper');

            if (mainData != undefined) {
                //destroy
                mainData
                    .get(0)
                    .destroy();
            }
            //메인페이지 페이드형식 오토 슬라이드
            _itm
                .find('.swipeCont')
                .css('position', 'absolute');
            var autoTimer = null;
            var mainInner = _itm.closest('.mainInner');
            var btnAuto = mainInner.find('.btnAuto button');

            var mySlider = _itm.touchSlider({
                mode: 'fade',
                //btn_prev: mainInner.find('.btnSwipe.btnPrev'),
                //btn_next: mainInner.find('.btnSwipe.btnNext'),
                controls: false,
                paging: false,
                speed: 850,
                useMouse : false,
                initComplete: function (e) {
                    btnAuto.on('click', function () {
                        if (!$(this).hasClass('btnPlay')) {
                            $(this).addClass('btnPlay');

                            //STOP: timer clear
                            clearTimeout(autoTimer);
                        } else {
                            $(this).removeClass('btnPlay');

                            //PLAY: timer set
                            var crtSlide = _itm.find('.swipeSlide[aria-hidden=false]');
                            var crtIdx = crtSlide.index();
                            var isVideo = (crtSlide.find('.mainVideo').length)
                                ? true
                                : false;
                            var videoNode = null;
                            if (autoTimer != null) {
                                clearTimeout(autoTimer);
                            }

                            if (isVideo) {
                                videoNode = crtSlide
                                    .find('.mainVideo video')
                                    .get(0);
                            }

                            var delay = (isVideo)
                                ? videoNode.duration * 1000
                                : 5000;

                            autoTimer = setTimeout(function () {

                                if (!btnAuto.hasClass('btnPlay')) {
                                    if (isVideo) {
                                        videoNode.pause();
                                    }
                                    _itm
                                        .get(0)
                                        .go_page(
                                            (crtIdx + 1 > slideLi.length)
                                                ? 0
                                                : crtIdx + 1
                                        );
                                }
                            }, delay);
                        }
                    })

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        }
                    })

                },
                counter: function (e) {
                    var idx = e.current - 1;
                    var isVideo = (slideLi.eq(idx).find('.mainVideo').length)
                        ? true
                        : false;

                    var delay = (isVideo)
                        ? slideLi
                        .eq(idx)
                        .find('.mainVideo video')
                        .get(0)
                        .duration * 1000
                        : 4000;
                    var videoNode = null;
                    if (autoTimer != null) {
                        clearTimeout(autoTimer);
                    }

                    if (isVideo) {
                        videoNode = slideLi
                            .eq(idx)
                            .find('.mainVideo video')
                            .get(0);
                        if (videoNode.currentTime != 0) {
                            videoNode.currentTime = 0;
                        }
                        videoNode.play();
                    }

                    autoTimer = setTimeout(function () {
                        if (!btnAuto.hasClass('btnPlay')) {
                            if (isVideo) {
                                videoNode.pause();
                            }
                            _itm
                                .get(0)
                                .go_page(
                                    (idx + 1 > slideLi.length)
                                        ? 0
                                        : idx + 1
                                );
                        }
                    }, delay);

                    //슬라이드 1 이하시 || 마지막 슬라이드자동롤링 disable
                    if (slideLi.length < 2 || slideLi.length === e.current) {
                        clearTimeout(autoTimer);
                    }

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                },
                destroyComplete: function () {
                    clearTimeout(autoTimer);
                }
            })

            _itm.data('swiper', mySlider);

            var jess = new Jessture(_itm);

            jess.on('jsLeft jsRight', function (e) {
                e.stopPropagation();
                btnAuto.addClass('btnPlay');
                return false;
            })



        } else if (_itm.closest('.mainArea04').length && _itm.not('.swipeGroup').length) {

            _itm
                .find('.inSwipe')
                .each(function () {
                    var _inSwipe = $(this);
                    var cn = 0;
                    var inSlidesLength = _inSwipe
                        .find('.inSwipeSlide')
                        .length;

                    var jess = new Jessture(_inSwipe);

                    jess.on('jsRight', function (e) {
                        e.stopPropagation();

                        if (cn > 0) {
                            cn--;
                        } else {
                            //prev
                            _itm
                                .get(0)
                                .animate(1, true);
                        }
                        _inSwipe
                            .find('.inSwipeCont')
                            .css('margin-left', -$('.inSwipeSlide').outerWidth() * cn);

                        return false;
                    })

                    jess.on('jsLeft', function (e) {
                        e.stopPropagation();

                        if (cn < (inSlidesLength - 1)) {
                            cn++;
                        } else {
                            //next
                            cn = 0;
                            _itm
                                .find('.swipeSlide.on .inSwipeCont')
                                .css('margin-left', '');
                            if (_itm.find('.swipeSlide.on').index() >= slidesLength - 1) {
                                _itm
                                    .get(0)
                                    .go_page(0);
                            } else {
                                _itm
                                    .get(0)
                                    .animate(-1, true);
                            }

                        }
                        _inSwipe
                            .find('.inSwipeCont')
                            .css('margin-left', -$('.inSwipeSlide').outerWidth() * cn);

                        return false;
                    })
                    _inSwipe.data('inSwipe', jess);
                })

            wrapper
                .find('.btnPrev')
                .on('click', function () {
                    $(_itm.find('.swipeSlide.on .inSwipe').data('inSwipe')).trigger('jsRight');
                });

            wrapper
                .find('.btnNext')
                .on('click', function () {
                    $(_itm.find('.swipeSlide.on .inSwipe').data('inSwipe')).trigger('jsLeft');
                });

            _itm
                .find('.swipeCont')
                .css('position', 'absolute');

            var slideBtn = _itm
                .closest('.mainArea04')
                .find('.slideBtn li');
            var mySlider = _itm.touchSlider({
                roll: true,
                // sidePage: true,
                range: 0.5,
                controls: false,
                paging: false,
                speed: speed,
                useMouse: false,
                initComplete: function (e) {
                    var _this = this;

                    _itm
                        .find('.inSwipeSlide')
                        .css({
                            'width': _itm
                                .find('.swipeSlide')
                                .eq(0)
                                .outerWidth()
                        })

                    slideBtn.on('click', function (e) {
                        e.preventDefault();

                        $(this)
                            .addClass('on')
                            .siblings('li')
                            .removeClass('on');
                        var idx = $(this).index();
                        _this.go_page(idx);

                    })

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        } else if (wrapContents === 'tabCont') {
                            _itm
                                .closest('.tabCont')
                                .hide();
                        }
                    })

                },
                counter: function (e) {
                    var idx = e.current - 1;
                    slideLi
                        .eq(idx)
                        .addClass('on')
                        .siblings('li')
                        .removeClass('on');
                    slideBtn
                        .eq(idx)
                        .addClass('on')
                        .siblings('li')
                        .removeClass('on');
                }
            })

            _itm.data('swiper', mySlider);



            //////////////////////////////////////////////////////////////////////////////////////////////////////////

            } else if (_itm.hasClass('swipeGroup js-lounge-slide')) {
                
//              var item = $(item);
//                var carouselOption = {};
//                var slidesLength;
//                if(!item.length){return}
//
//                slidesLength = $(".swiperGroup.js-lounge-slide .swiper-slide").length;
//                                
//                carouselOption = {
//                      loop: true,
//                      slidePerView: 2
//                }
//                
                
           _itm
               .find('.swipeCont')
               .css('position', 'absolute');
           var mainInner = _itm.closest('.swipeWrapArea');
           var swipeBtnFlVisible = (_itm.closest('.mainArea07').length)
               ? true
               : false;
           var carouselOption = {};
           var slidesLength;
           var mySlider = _itm.touchSlider({

               btn_prev: wrapper.find('.btnPrev'),
               btn_next: wrapper.find('.btnNext'),

               //loop: true,
               //loopAdditionalSlides :1,

               controls: false,
               paging: false,
               view: 3,

               speed: speed,
               // autoplay: {
               //     enable: true,
               //     pauseHover: false,
               //     addHoverTarget: '',
               //     interval: 3000
               // },

                
               // useMouse: (slidesLength <= 3)
               //     ? false
               //     : true,
               slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
//              spaceBetween : 30, // 슬라이드간 간격
              slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
              //loopFillGroupWithBlank :true,
             
           })
 

           _itm.data('swiper', _itm.get(0));

            //////////////////////////////////////////////////////////////////////////////////////////////////////////
        } 
            else if (_itm.hasClass('auto')) {
            /**
             * 자동롤링 swipe
             * HURE2000M.html
             */

            var btnAuto = _itm.find('.btnAuto button');
            _itm
                .find('.swipeCont')
                .css('position', 'absolute');

            var mySlider = _itm.touchSlider({
                btn_prev: _itm.find('.btnSwipe.btnPrev'),
                btn_next: _itm.find('.btnSwipe.btnNext'),
                autoplay: {
                    enable: true,
                    pauseHover: false,
                    addHoverTarget: '',
                    interval: 3000
                },
                controls: false,
                paging: false,
                speed: speed,
                initComplete: function (e) {
                    var _this = this;
                    indicator.on('click', function (e) {
                        e.preventDefault();
                        var idx = $(this).index();
                        _this.go_page(idx);
                    });

                    btnAuto.on('click', function () {
                        if (!$(this).hasClass('btnPlay')) {
                            //pause
                            _this.autoStop();
                            $(this).addClass('btnPlay');
                        } else {
                            //play
                            _this.autoPlay();
                            $(this).removeClass('btnPlay');

                        }
                    })

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        }
                    })

                },
                counter: function (e) {
                    var idx = e.current - 1;
                    btnAuto.removeClass('btnPlay');
                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                }
            })

            _itm.data('swiper', mySlider);
        } else if (_itm.hasClass('gallery')) {
            /**
             * gallery swipe
             * /BSAC/BSAC1100M.html
             */

            _itm
                .find('.swipeCont')
                .css('position', 'absolute');
            var mySlider = _itm.touchSlider({
                btn_prev: wrapper.find('.btnPrev'),
                btn_next: wrapper.find('.btnNext'),
                controls: false,
                paging: false,
                speed: speed,
                useMouse: false,
                initComplete: function (e) {
                    var _this = this;

                    pageNum.text(lpad(_itm.find('.swipeSlide').length, 2, 0));
                    pageNow.text(lpad(this.activeIndex + 1, 2, 0));

                    slidesLength = _itm
                        .find('.swipeSlide')
                        .length;

                    indicator.on('click', function (e) {
                        e.preventDefault();
                        var idx = $(this).index();
                        _this.go_page(idx);
                    });

                    if (slidesLength == 1) {
                        _itm
                            .closest('.swipeWrapArea')
                            .find('.btnSwipe')
                            .hide();
                        _itm
                            .closest('.swipeWrapArea')
                            .find('.indicator')
                            .hide();
                    }

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        } else if (wrapContents === 'tabCont') {
                            _itm
                                .closest('.tabCont')
                                .hide();
                        }
                    })
                },
                counter: function (e) {
                    var idx = e.current - 1;
                    pageNum.text(lpad(slidesLength, 2, 0));
                    pageNow.text(lpad(idx + 1, 2, 0));

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                }
            })

            _itm.data('swiper', mySlider);
        } else if (_itm.hasClass('swipeGroup')) {
            _itm
                .find('.swipeCont')
                .css('position', 'absolute');
            var mainInner = _itm.closest('.swipeWrapArea');
            var swipeBtnFlVisible = (_itm.closest('.mainArea04').length)
                ? true
                : false;
            var mySlider = _itm.touchSlider({
                btn_prev: wrapper.find('.btnPrev'),
                btn_next: wrapper.find('.btnNext'),
                controls: false,
                paging: false,
                view: 3,
                roll: false,
                speed: speed,
                useMouse: (slidesLength <= 3)
                    ? false
                    : true,
                initComplete: function (e) {

                    var _this = this;

                    if (indicator.length) {
                        indicator.remove();
                        for (var i = 0; i < e.get_page().total; i++) {
                            if (i == 0) {
                                indicatorWrap.append(
                                    "<button type='button' class='num on'><em class='hidden'>현재 이미지</em>" + lpad(
                                        i + 1,
                                        2,
                                        0
                                    ) + "</button>"
                                );
                            } else {
                                indicatorWrap.append(
                                    "<button type='button' class='num'>" + lpad(i + 1, 2, 0) + "</button>"
                                );
                            }
                        }
                        indicator = wrapper.find('.indicator>button');
                    }
                    if (e.get_page().total == 1) {
                        indicator.hide();
                        wrapper
                            .find('.btnSwipe')
                            .hide();
                        wrapper
                            .find('.indicator')
                            .hide();
                    }

                    indicator.on('click', function (e) {
                        e.preventDefault();
                        var idx = $(this).index();
                        _this.go_page(idx);
                    });

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        } else if (wrapContents === 'tabCont') {
                            _itm
                                .closest('.tabCont')
                                .hide();
                        }
                    })
                },
                counter: function (e) {
                    var idx = e.current - 1;
                    pageNum.text(lpad(slidesLength, 2, 0));
                    pageNow.text(lpad(idx + 1, 2, 0));

                    if (swipeBtnFlVisible && e.total != 1) {
                        if (idx == 0) {
                            mainInner
                                .find('.btnSwipe')
                                .hide();
                            mainInner
                                .find('.btnSwipe.btnNext')
                                .show();

                        } else if (e.current == e.total) {
                            mainInner
                                .find('.btnSwipe')
                                .hide();
                            mainInner
                                .find('.btnSwipe.btnPrev')
                                .show();
                        } else {
                          mainInner
                            .find('.btnSwipe')
                            .show()
                        }
                    }

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                }
            })

            _itm.data('swiper', _itm.get(0));
        } else {
            //HURE1300M.html BSSO1120M.html
            _itm
                .find('.swipeCont')
                .css('position', 'absolute');
            var mySlider = _itm.touchSlider({
                btn_prev: wrapper.find('.btnPrev'),
                btn_next: wrapper.find('.btnNext'),
                controls: false,
                paging: false,
                speed: speed,
                useMouse: false,
                initComplete: function (e) {
                    var _this = this;
                    slidesLength = _itm
                        .find('.swipeSlide')
                        .length;

                    indicator.on('click', function (e) {
                        e.preventDefault();
                        var idx = $(this).index();
                        _this.go_page(idx);
                    });

                    if (slidesLength == 1) {
                        _itm
                            .closest('.swipeWrapArea')
                            .find('.btnSwipe')
                            .hide();
                        _itm
                            .closest('.swipeWrapArea')
                            .find('.indicator')
                            .hide();
                    }

                    setTimeout(function () {
                        if (wrapContents === 'layerPop') {
                            _itm
                                .closest('.layerPop')
                                .hide();
                        } else if (wrapContents === 'tabCont') {
                            _itm
                                .closest('.tabCont')
                                .hide();
                        }
                    })

                },
                counter: function (e) {
                    var idx = e.current - 1;
                    pageNum.text(lpad(slidesLength, 2, 0));
                    pageNow.text(lpad(idx + 1, 2, 0));

                    if (indicator.length) {
                        indicator
                            .find('em')
                            .remove();
                        indicator
                            .eq(idx)
                            .prepend('<em class="hidden">현재 이미지</em>')
                            .addClass('on')
                            .siblings()
                            .removeClass('on');
                    }
                }
            })

            _itm.data('swiper', _itm.get(0));
        }
    })
}

/**
 * 스와이프 영역 init complete (개발단 ajax 데이터 로드 후 호출)
 * BSAB1100M.html
 *
 * @param swipeEl (Element)
 */
commonJs.initCompleteSwipe = function (swipeEl) {
    swipeEl.each(function (idx, itm) {
        var _itm = $(itm);
        var slidesLength = _itm
            .find('.swipeSlide')
            .length;
        var swipeCont = _itm.find('.swipeCont');

        var swipePrevBtnTag = '<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span><' +
            '/button>';
        var swipeNextBtnTag = '<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span><' +
            '/button>';

        if (slidesLength < 2) {
            _itm
                .find('.btnSwipe')
                .remove();
            _itm
                .siblings('.indicator')
                .remove();
        } else if (!_itm.find('.btnSwipe').length) {
            swipeCont.before(swipePrevBtnTag);
            swipeCont.after(swipeNextBtnTag);

            //.btnSwipe 초기화
            _itm
                .data('swiper')
                .opts
                .btn_prev = _itm.find('.btnPrev');
            _itm
                .data('swiper')
                .opts
                .btn_next = _itm.find('.btnNext');
            _itm
                .data('swiper')
                .init();
        }

    })
}

/**
 * 로그인 버튼 클릭시 미입력 서식에 focus및 서식 입력 감지
 * HULO1000T.html
 */
commonJs.focusAlert = function () {
    var marginTop = 300;
    $('.error').each(function () {
        var _error = $(this);
        var input = $(this).find('.intArea');
        var isRadioType = input[0].type == 'radio';

        var errorInp = input
            .filter(function () {
                return $(this)
                    .find('input')
                    .val() == ''
            })
            .first();

        var alertMsg = errorInp.find('.alertMessage , .alertMessage2');

        if (errorInp.length) {
            $(window).scrollTop(errorInp.offset().top - marginTop);
            alertMsg.show();
        }

        if (!isRadioType) {
            errorInp.addClass('errorFocus');
        } else {
            _error.attr('tabindex', 0);
        }

        errorInp
            .find('input')
            .off('keyup.focusAlert')
            .on('keyup.focusAlert', function () {
                if ($(this).val() != '') {
                    _error.removeClass('error');
                    errorInp.removeClass('errorFocus');
                    $(this)
                        .closest('.intInner')
                        .find('.alertMessage')
                        .hide();
                }
            })
    })
}

/**
 * 디자인 스크롤 적용
 * HURE1400M.html
 *
 * @param scrollEl (Element)
 */
commonJs.initDesignScroll = function (scrollEl) {

    scrollEl.each(function (idx, itm) {
        var scrollWrap = $(this);
        var menuPanArea = scrollWrap.closest('.menuPanArea');
        var type = (scrollWrap.parents('.toggleCont , .layerPop').length == 2)
            ? 'both'
            : (scrollWrap.parents('.toggleCont').eq(0).length)
                ? 'accordion'
                : 'layer';
        var isTab = (scrollWrap.parents('.tabCont').length)
            ? true
            : false;

        if (!scrollWrap.parent('.designScroll').length) {
            scrollWrap.wrap('<div class="designScroll"></div>');
        }
        scrollWrap.css(
            {'margin-right': '-25px', 'overflow-y': 'scroll', 'width': '100%', 'padding-right': '40px', 'box-sizing': 'border-box'}
        );

        if (!scrollWrap.find('.customScrollBox').length) {
            scrollWrap.wrapInner('<div class="customScrollBox"></div>');
            scrollWrap.append(
                '<div class="scrollbar-wrap"><div class="scrollbar"></div></div>'
            )
        }
        var contentH = 0,
            screenH = 0;
        if (!scrollWrap.is(':visible')) {
            if (type === 'both') {
                var contParent = scrollWrap.parents('.toggleCont , .layerPop');
            } else if (type === 'layer') {
                var contParent = scrollWrap.closest('.layerPop');
            } else {
                var contParent = scrollWrap.closest('.toggleCont');
            }
            if (isTab) {
                scrollWrap
                    .closest('.tabCont')
                    .data('default', scrollWrap.closest('.tabCont').css('display'))
                    .css({'display': 'block', 'visibility': 'hidden', 'height': '0'})
            }
            contParent.each(function () {
                var _cp = $(this);
                _cp
                    .data('default', _cp.css('display'))
                    .css({'display': 'block', 'visibility': 'hidden', 'height': '0'})
            })

            contentH = scrollWrap
                .get(0)
                .scrollHeight;
            screenH = scrollWrap.outerHeight();

            //menuPanArea 내의 탭메뉴+마진값 scrollbar-wrap 에 top적용
            if (menuPanArea.length) {
                scrollWrap
                    .children('.scrollbar-wrap')
                    .css({
                        'top': 130 + menuPanArea
                            .children('.tabToggle')
                            .outerHeight()
                    })
            }

            if (isTab) {
                scrollWrap
                    .closest('.tabCont')
                    .css({
                        'display': scrollWrap
                            .closest('.tabCont')
                            .data('default'),
                        'visibility': '',
                        'height': ''
                    })
            }
            contParent.each(function () {
                if ($(this).closest('.toggleOn').length) {
                    $(this).css({'visibility': '', 'height': ''})
                } else {

                    $(this).css(
                        {'display': $(this).data('default'), 'visibility': '', 'height': ''}
                    )
                }
            })

        } else {
            if (menuPanArea.length) {
                scrollWrap
                    .children('.scrollbar-wrap')
                    .css({
                        'top': 130 + menuPanArea
                            .children('.tabToggle')
                            .outerHeight()
                    })
            }
            contentH = scrollWrap
                .get(0)
                .scrollHeight;
            screenH = scrollWrap.outerHeight();
        }
        var cScrollH = contentH - screenH;
        if (cScrollH < 1) {
            scrollWrap
                .find('div.scrollbar-wrap')
                .remove();
            scrollWrap.css(
                {'margin-right': '', 'overflow-y': '', 'width': '', 'padding-right': '', 'box-sizing': ''}
            );
            return;
        }
        $('.designScroll')
            .eq(idx)
            .css({'height': screenH, 'width': '100%', 'overflow': 'hidden'})

        scrollWrap
            .css('width', '')
            .attr('tabindex', 0);
        scrollWrap
            .find('div.scrollbar-wrap')
            .css('height', screenH);

        var bar = scrollWrap.find('div.scrollbar');
        var bgH = scrollWrap
            .find('div.scrollbar-wrap')
            .height();
        bar.height(bgH / 3);
        var barH = bar.height();
        var n = bgH - barH;
        scrollWrap
            .off("mousewheel DOMMouseScroll")
            .on("mousewheel DOMMouseScroll", function (e, delta) {
                e.stopPropagation();
                var E = e.originalEvent;
                delta = 0;
                if (E.detail) {
                    delta = E.detail * -40;
                } else {
                    delta = E.wheelDelta;
                };
                var scrollTop = $(this).scrollTop() + (Math.round(delta * -1)) / 2;

                $(this).scrollTop(scrollTop);
                if (scrollTop < 0) {
                    scrollTop = 0;
                } else if (scrollTop > cScrollH) {
                    scrollTop = cScrollH;
                }
                var m = (scrollTop / cScrollH) * n;
                bar.css({
                    'top': m + 'px'
                });
                e.preventDefault();
            });
        var scrollTop = 0;
        scrollWrap
            .off('scroll')
            .on('scroll', function () {

                if (scrollWrap.prop('scrollHeight') != contentH) {
                    cScrollH = scrollWrap.prop('scrollHeight') - screenH;
                }
                scrollTop = ($(this).scrollTop() / cScrollH) * n;
                bar.css({
                    'top': scrollTop + 'px'
                })
            });
        var y1 = 0;
        bar
            .off('mousedown')
            .on('mousedown', function (e) {
                y1 = e.pageY - parseInt(bar.css('top'));
                $(document).on('mousemove', moveHandler);
                $(document).on('mouseleave , mouseup', mouseLeave);
            });
        function mouseLeave() {
            $(document).off('mousemove', moveHandler);
            $(document).off('mouseleave , mouseup , mouseout', mouseLeave);
        }
        function moveHandler(e) {
            var y2 = e.pageY - y1;
            if (y2 < 0) {
                y2 = 0;
            } else if (y2 >= n) {
                y2 = n;
            }
            bar.css('top', y2);
            var cc = (y2 / n) * (cScrollH);
            scrollWrap.scrollTop(cc);
        }
    })
}

/**
 * 스크롤 트랜지션 애니메이션 버튼
 * /BSAC/BSAC1100M.html
 *
 * @param topEl(Element)
 */
commonJs.setScrollTransitionBtn = function (topEl) {
    if (!topEl.length) {
        return;
    }

    topEl
        .find('button')
        .off('click')
        .on('click', function () {

            $('.container').addClass('topContainer');

            var h = topEl
                .next()
                .offset()
                .top - $('.header')
                .addClass('on')
                .outerHeight();
            $('html, body').animate({
                scrollTop: h
            }, 800, ANIMATION_EASING, function () {})
        })

    $(window)
        .off('.scrollTransition')
        .on('scroll.scrollTransition', function () {
            if ($(this).scrollTop() <= 0) {
                $('.container').removeClass('topContainer');
            }
        })
}

/**
 * 가로사이즈 트랜지션 버튼
 * HURE1000M.html
 * @param inner (String)
 * @param openBtn (String)
 * @param closeBtn (String)
 * @param focus (String)
 */
commonJs.setWidthTranstionBtn = function (inner, openBtn, closeBtn, focus) {

    if (!$(openBtn).length) {
        return;
    }
    var speed = 300;

    //open
    $(openBtn).on('click', function () {
        var innerW = $(this)
            .siblings(inner)
            .width();
        var LastEl = $(this)
            .siblings(inner)
            .find('input,button')
            .last();

        $(this).css('visibility', 'hidden');
        $(this)
            .siblings(inner)
            .css({'overflow': 'hidden', 'display': 'block', 'width': 0})
            .animate({
                'width': innerW
            }, speed, function () {
                $(this).css({'overflow': ''})
                $(this)
                    .find(focus)
                    .focus();
            })

        LastEl
            .off('.widthTransition')
            .on('keydown.widthTransition', function (e) {
                if (e.keyCode === 9 && !e.shiftKey) {
                    $(this).trigger('click');
                }
            })

        $(this)
            .siblings(inner)
            .find('input,button')
            .first()
            .off('.widthTransition')
            .on('keydown.widthTransition', function (e) {
                if (e.keyCode == 9 && e.shiftKey) {
                    LastEl.trigger('click');
                    return;
                }
            })
    })

    //close
    $(closeBtn).on('click.setWidthTranstionBtn', function () {
        var openBtn = $(this)
            .closest(inner)
            .siblings(openBtn);
        $(this)
            .closest(inner)
            .animate({
                'width': openBtn.outerWidth()
            }, speed, function () {
                $(this).css({'width': '', 'display': 'none'})
                openBtn.css('visibility', 'visible');
            })
    })

    $('html').on('click', function (e) {
        if ($(e.target).hasClass(openBtn.substring(1, openBtn.length))) {
            return;
        }

        if (!$(e.target).closest(inner).length) {
            if ($(inner).is(':visible')) {
                $(closeBtn).trigger('click.setWidthTranstionBtn');
            }
        }
    })

}

/**
 * 스크롤시 해당영역 플로팅
 * HURE1300M.html
 * @param floatingEl(Element)
 */
commonJs.initFloatingContainer = function (floatingEl) {

    if (!floatingEl.length) {
        return;
    }

    var blocked = false;
    var originalMarinTop = floatingEl
        .css('margin-top', '')
        .offset()
        .top;
    var offset = 0;
    var headerH = $('.header').outerHeight() + offset || offset;
    var isTriggered = false;
    var cssScript = {
        floatingMarginTop: {
            'transition': 'margin-top .3s ease-out',
            '-webkit-transition': 'margin-top .3s ease-out',
            '-moz-transition': 'margin-top .3s ease-out',
            '-ms-transition': 'margin-top .3s ease-out',
            '-o-transition': 'margin-top .3s ease-out'
        }
    }
    var _ = throttleAndDebounce();
    floatingEl.css(cssScript.floatingMarginTop);

    var floatingEvt = _.throttle(function () {
        var st = $(window).scrollTop();
        var elH = floatingEl.height();
        var lContBottom = $('.lCont')
            .offset()
            .top + $('.lCont').height();

        if (blocked) {
            return;
        }

        if (isTriggered && elH + st + headerH <= lContBottom) {

            var st = $(window).scrollTop();
            floatingEl.css({
                'margin-top': st + headerH - originalMarinTop
            })
            return;
        }
        //start
        if (st < originalMarinTop - headerH) {
            floatingEl.css({'margin-top': ''})
            return;
        }
        //end
        if (elH + st + headerH >= lContBottom) {
            if (isTriggered) {
                return;
            }

            floatingEl.css({
                'margin-top': lContBottom - originalMarinTop - elH
            })
            return;
        }

        //ing
        if (st >= originalMarinTop - headerH) {

            floatingEl.css({
                'margin-top': st - (originalMarinTop - headerH)
            })
        }
    }, 300);

    $(window)
        .off('scroll.floating')
        .on('scroll.floating', function () {
            floatingEvt();
        });

    $(floatingEl).on('floatingPrevent', function () {
        blocked = true;
    });
    $(floatingEl).on('floatingAllow', function () {
        blocked = false;
    });

    $(floatingEl).on('setPosition', function () {

        isTriggered = true;
        setTimeout(function () {
            isTriggered = false;
        }, 500);
    })
}

/**
 * 패럴렉스 정의
 * @param parallaxContainer (Element)
 * BSAC1000M.html
 */
commonJs.setParallax = function (parallaxContainer) {
    if (!parallaxContainer.length) {
        return;
    }
    var ctl = new ScrollMagic.Controller();
    var speed = 400;
    var direction;
    if (parallaxContainer.hasClass('parallaxUp')) {
        direction = 'up';
    } else if (parallaxContainer.hasClass('parallaxDown')) {
        direction = 'down';
    }

    parallaxContainer
        .find('>li')
        .each(function (idx, itm) {
            if ($(itm).hasClass('noData') || $(itm).hasClass('on')) {
                return;
            }

            $(itm).addClass('on');
            var tl = new TimelineMax();
            if (direction === 'up') {
                tl
                    .fromTo(itm, 1.2, {
                        opacity: 0,
                        y: "+50px"
                    }, {
                        opacity: 1,
                        y: "0px"
                    });
            } else if (direction === 'down') {
                tl
                    .delay(0.2 * idx)
                    .fromTo(itm, 1.2, {
                        opacity: 0,
                        y: "-50px"
                    }, {
                        opacity: 1,
                        y: "0px"
                    });
            }
            var scene = new ScrollMagic
                .Scene(
                    {triggerElement: itm, offset: 0, triggerHook: '1', reverse: false}
                )
                .setTween(tl)
                .addTo(ctl);
        })
}

/**
 * 키워드리스트 더보기 버튼 정의
 * BSAC1110M.html
 *
 * @param moreBtn (Element)
 */
commonJs.setKeywordBtnMore = function (moreBtn) {
    moreBtn.each(function () {
        var keywordListH = $(this).closest('.keywordList');
        keywordListH.data('orgH', parseInt(keywordListH.css('height')));
        $(this).on('click', function () {
            var frmList = keywordListH.find('.frmList');
            if ($(this).hasClass('open')) {
                //close
                $(this).removeClass('open');
                keywordListH
                    .stop()
                    .animate({
                        height: keywordListH.data('orgH')
                    }, 400, ANIMATION_EASING, function () {
                        keywordListH.removeAttr('style');
                    })
            } else {
                //open
                $(this).addClass('open');
                keywordListH
                    .stop()
                    .animate({
                        height: frmList.outerHeight() + 32
                    }, 400, ANIMATION_EASING)
            }
        })
    })
}

/**
 * 스크롤시 on클래스 add
 * BSMA1000M.html
 *
 * @param header(Element)
 */
commonJs.setHeadArea = function (headerEl) {
    if (!headerEl.length) {
        return;
    }
    var pauseScrlEvt = false;

    var stCheck = function () {
        if (pauseScrlEvt) {
            return;
        }
        if ($(window).scrollTop() < 1) {
            headerEl.removeClass('on');
        } else {
            headerEl.addClass('on');
        }
    }
    stCheck();

    $(window).on('scroll', stCheck);
    headerEl
        .off('stopHeadAreaEvt')
        .on('stopHeadAreaEvt', function () {
            pauseScrlEvt = true;
        })
        .off('setHeadAreaEvt')
        .on('setHeadAreaEvt', function () {
            pauseScrlEvt = false;
        })
}

/**
 * 메인 예약영역
 * BSMA1000M.html
 *
 * @param revArea(String)
 */
commonJs.setRevArea = function (revArea) {
    var revAreaEl = $(revArea);
    if (!revAreaEl.length) {
        return;
    }

    var previousIdx = 0;

    revAreaEl
        .find('.selectGroup .selectWrap')
        .on('change', function (e) {
            var opIdx = revAreaEl
                .find('.selectWrap select option')
                .index(revAreaEl.find('.selectWrap select option:selected'));
            $('.selectInner div[role="area"]')
                .eq(opIdx)
                .show();
            $('.selectInner div[role="area"]')
                .not(":eq(" + opIdx + ")")
                .hide();

            revAreaEl
                .find(
                    '.selectInner div[role="area"]:eq(' + previousIdx + ') .clearCont .btnClose'
                )
                .trigger('click.setRevArea');

            revAreaEl
                .find(
                    '.selectInner div[role="area"]:eq(' + opIdx + ') .clearCont:eq(0)'
                )
                .removeAttr('style')
                .addClass('opened')
                .show();
            revAreaEl.css({'margin-top': 210, 'z-index': 999999})
            $('.revArea')
                .next('.dimmed')
                .show();
            previousIdx = opIdx;
        })

    //open
    var openRevArea = function (e) {
        if ($(this).siblings('.clearCont').is(':animated')) {
            return;
        }

        $(this)
            .closest(revArea)
            .next('.dimmed')
            .show();
        $(this)
            .closest(revArea)
            .find('.clearCont')
            .hide();

        var con = $(this).siblings('.clearCont');
        var h = con.outerHeight();

        $('.header').css('opacity', '.4');

        $(this)
            .closest(revArea)
            .css({'margin-top': 210, 'z-index': 999999})

        con.addClass('opened');
        con
            .show()
            .css({'overflow': 'hidden', 'height': 0})
            .stop()
            .animate({
                height: h
            }, 800, ANIMATION_EASING, function () {
                con.css({'overflow': '', 'height': ''})
            })
    }

    $(document).on(
        'click',
        revArea + ' .selectInner .selectRoom>.selectHotel>a',
        openRevArea
    );
    $(document).on(
        'click',
        revArea + ' .selectInner .selectRoom>.chkInout>a',
        openRevArea
    );
    $(document).on(
        'click',
        revArea + ' .selectInner .selectRoom>.roomWrap>a',
        openRevArea
    );
    $(document).on(
        'click',
        revArea + ' .selectInner .selectDining>.diningBar>a',
        openRevArea
    );

    //close
    $(document).on(
        'click.setRevArea',
        revArea + ' .clearCont .btnClose,.btnSC',
        function (e) {
            $(this).closeRevArea(e);
        }
    )

    $.fn.closeRevArea = function (e) {
        if ($(this).closest(revArea).find('.mainCalendar , .mainRoom').is(':animated')) {
            return;
        }
        if ($(this).hasClass('btnPromo')) {
            return;
        }
        if ($(this).closest(revArea).length && $(this).hasClass('btnSC')) {
            return;
        }
        $('.header').css('opacity', '');
        $(this)
            .closest(revArea)
            .next('.dimmed')
            .hide();
        $(this)
            .closest('.clearCont')
            .removeClass('opened');
        $(this)
            .closest(revArea)
            .css({'margin-top': '', 'z-index': ''});
        $(this)
            .closest('.clearCont')
            .css({'overflow': 'hidden'})
            .stop()
            .animate({
                'height': 0,
                'padding-top': 0,
                'padding-bottom': 0
            }, 400, ANIMATION_EASING, function () {
                $(this)
                    .closest('.clearCont')
                    .css({'height': '', 'padding-top': '', 'padding-bottom': ''})
                    .hide();
            })
    }

    $('html').on('click', function (e) {
        if ($(e.target).hasClass('btnMonth')) {
            return;
        }
        if (!$(e.target).closest('.revArea').length && !$(e.target).closest('.chkInout , .roomWrap').length) {
            revAreaEl
                .find('.clearCont.opened .btnClose:visible')
                .each(function () {
                    $(this).trigger('click.setRevArea');
                })
        }
    });
}

/**
 * 갤러리 레이어팝업 적용
 * 갤러리 선택 시 마크업속성 pop에 정의되어있는 팝업 open 및 해당 갤러리 인덱스로 이동.
 * BSAB1100M.html
 *
 * @param layerSync(Element)
 */
commonJs.initLayerSync = function (layerSync) {
    layerSync.each(function () {

        var popupId = $(this).attr('pop');
        var swiper = $('#' + popupId + ' .swipeWrap').data('swiper');
        $(this)
            .find('.thum button')
            .on('click', function () {
                var _this = $(this);
                swiper.go_page(_this.closest('li').index());

                setTimeout(function () {
                    commonJs.popShow($('#' + popupId));
                }, 160)
            })
    })
}

/**
 * 스크롤시 고정영역 적용
 * BSAC1100M.html
 *
 * @param fixedArea(Element)
 */
commonJs.setFixedBarArea = function (fixedArea) {
    fixedArea.each(function () {
        var itm = $(this);
        var itmNext = itm.next('div');
        var orgOffset = itm
            .offset()
            .top;
        var itmH = itm.outerHeight();
        var itmBottom = parseInt(itm.css('marginBottom'));

        $(window).on('scroll', function () {
            var st = $(this).scrollTop();
            var headerH = $('.header').outerHeight();

            if (st > 5 && st < 50) {
                orgOffset = itm
                    .offset()
                    .top;
            }

            if (st >= (orgOffset - headerH)) {
                itm.css({'position': 'fixed', 'z-index': 99, 'top': headerH})
                itmNext.css('marginTop', itmBottom + itmH);
                itm.css('marginBottom', 0);
            } else {
                itm.css({'position': '', 'z-index': '', 'top': ''})
                itmNext.css('marginTop', '');
                itm.css('marginBottom', '');
            }
        });

    })
}

/**
 * 윈도우 스크롤 이동 스크립트
 *
 * @param scrollToEl (Element)
 */
commonJs.scrollingTo = function (scrollToEl) {
    if (scrollToEl.length) {
        var headArea = $('.headArea');
        $('html, body')
            .stop()
            .animate({
                'scrollTop': scrollToEl
                    .offset()
                    .top - (headArea.length ? headArea.outerHeight() : 0)
            }, 300, ANIMATION_EASING);
    }
}

/**
 * 예약자 정보입력 페이지의 객실 아코디언 선택시 해당 객실의 요금아코디언 show
 * HURE1300M.html
 *
 * @param roomRsvAcdEl(Element)
 */
commonJs.attachRoomRsvClickEvent = function (roomRsvAcdEl) {
    roomRsvAcdEl
        .children('li')
        .find('.btnToggle')
        .on('click', function () {
            var idx = $(this)
                .closest('li')
                .index();
            var rContFloatEl = $(this)
                .closest('.lCont')
                .next('.rCont')
                .find('.toggleList');
            var rLi = rContFloatEl.children('li:eq(' + idx + ')');
            var isrLiToggledOn = rLi.hasClass('toggleOn');

            if (!$(this).closest('.roomRsv').find('li').hasClass('toggleOn')) {
                rContFloatEl
                    .children('li.toggleOn')
                    .find('button.btnToggle')
                    .trigger('click');
            }
            if (isrLiToggledOn && !$(this).closest('li').hasClass('toggleOn')) {
                rLi
                    .find('button.btnToggle')
                    .trigger('click');
            }
            if (!isrLiToggledOn && $(this).closest('li').hasClass('toggleOn')) {
                rLi
                    .find('button.btnToggle')
                    .trigger('click');
            }
        })
}

/**
 * 해상도 100% 이상일시 해당 Element show
 * @param {Element} deviceCheckEl
 *
 * HUMA1000M.html
 */
commonJs.setDeviceCheck = function (deviceCheckEl) {
    var mainWrapper = $('.mainWrapper');
    if (!mainWrapper.length) {
        return;
    }

    var transitionCss = {
        'transition': 'top .5s',
        '-webkit-transition': 'top .5s',
        '-moz-transition': 'top .5s',
        '-ms-transition': 'top .5s',
        '-o-transition': 'top .5s'
    };

    var txt = Math.round(window.devicePixelRatio * 100) + '%';
    var visible = false;
    deviceCheckEl.css(transitionCss);
    if (window.devicePixelRatio > 1) {
        deviceCheckEl
            .find('.checkTxt .fBold')
            .text(txt);
        mainWrapper.addClass('topDevice');
        deviceCheckEl.show();
        visible = true;
    } else {
        mainWrapper.removeClass('topDevice');
        deviceCheckEl.hide();
    }

    deviceCheckEl
        .find('.bannerClose')
        .on('click', function () {
            deviceCheckEl.data('deviceCheckClosed', true);
            mainWrapper.removeClass('topDevice');
        })

    deviceCheckEl
        .off('hideDeviceCheck')
        .on('hideDeviceCheck', function () {
            mainWrapper.removeClass('topDevice');
        })
        .off('showDeviceCheck')
        .on('showDeviceCheck', function () {
            if (visible) {
                mainWrapper.addClass('topDevice');
            }
        })
}

/******************************************************************************************
 * 정식오픈 스크립트
 *******************************************************************************************/

/**
 * 데이터 패럴렉스 적용
 * BSMA2000M.html
 *
 * data-parallax="self-left"    왼쪽에서 fadeIn
 * data-parallax="self-right"   오른쪽에서 fadeIn
 * data-parallax="self-down"    아래쪽에서 fadeIn
 *
 */
commonJs.setDataParallax = function () {
    if (!$('*[data-parallax]').length) {
        return;
    }
    var ctl = new ScrollMagic.Controller();

    $('[data-parallax=self-left]').each(function () {
        var tl = new TimelineMax();
        tl
            .delay(0.5)
            .fromTo($(this), 1.5, {
                opacity: 0,
                x: "-80px"
            }, {
                opacity: 1,
                x: "0px"
            })

        new ScrollMagic
            .Scene({triggerElement: this, triggerHook: '1', reverse: true})
            .setTween(tl)
            .addTo(ctl);
    })

    $('[data-parallax=self-right]').each(function () {
        var tl = new TimelineMax();
        tl
            .delay(0.3)
            .fromTo($(this), 1.5, {
                opacity: 0,
                x: "+80px"
            }, {
                opacity: 1,
                x: "0px"
            })

        new ScrollMagic
            .Scene({triggerElement: this, triggerHook: '1'})
            .setTween(tl)
            .addTo(ctl);
    })
    $('[data-parallax=self-down]').each(function () {
        var tl = new TimelineMax();
        tl
            .delay(0.3)
            .fromTo($(this), 1, {
                opacity: 0,
                y: "+50px"
            }, {
                opacity: 1,
                y: "0px"
            })

        new ScrollMagic
            .Scene({triggerElement: this, triggerHook: '1'})
            .setTween(tl)
            .addTo(ctl);
    })
    $('[data-parallax=self-up]').each(function () {
        var tl = new TimelineMax();
        tl
            .delay(0.3)
            .fromTo($(this), 1, {
                opacity: 0,
                y: "-50px"
            }, {
                opacity: 1,
                y: "0px"
            })

        new ScrollMagic
            .Scene({triggerElement: this, triggerHook: '1'})
            .setTween(tl)
            .addTo(ctl);
    })
}

var throttleAndDebounce = function () {
    var throttleCheck,
        debounceCheck;
    return {
        throttle: function (callback, milliseconds) {
            return function () {
                if (!throttleCheck) {
                    throttleCheck = setTimeout(function () {
                        callback();
                        throttleCheck = false;
                    }, milliseconds);
                }
            }
        },
        debounce: function (callback, milliseconds) {
            return function () {
                clearTimeout(debounceCheck);
                debounceCheck = setTimeout(function () {
                    callback();
                }, milliseconds);
            }
        }
    }
}

/**
 * 다이닝 다음 스텝 넘어가기
 * HURE2000M.html
 *
 * @param {Element} nextBtnEl
 */
commonJs.goNextStep = function (nextBtnEl) {
    nextBtnEl
        .closest('li.toggleOn')
        .next('li')
        .find('.btnToggle')
        .trigger('click');
}

/**
 * 로그인 폼 탭 리스트
 * 객실/다이닝/액티비티 타입으로 고정.
 * APAB2400M.html
 *
 * @param loginFrmEl (Element)
 */
commonJs.setLoginFrm = function (loginFrmEl) {
    if (!loginFrmEl.length) {
        return;
    }

    loginFrmEl
        .find('.frm input:radio')
        .on('click', function () {
            var idx = $(this).index();
            if (idx == 0) {
                //객실 show
                $('.loginFrm.roomchk').show();
                $('.loginFrm.dinigchk').hide();
            } else {
                //다이닝, 액티비티 show
                $('.loginFrm.dinigchk').show();
                $('.loginFrm.roomchk').hide();
            }
        })
}

/**
 * 로그인 폼 탭 리스트 
 * 객실/다이닝/액티비티 타입으로 고정.
 * HUDI5030L.html 식음예약페이지 추가
 *
 * @param loginFrmEl (Element)
 */
commonJs.setDiningLoginFrm = function (loginFrmEl) {
    if (!loginFrmEl.length) {
        return;
    }

    loginFrmEl
        .find('.frm input:radio')
        .on('click', function () {
            var idx = $(this).index();
            //.roomactchk 객실/액티비티 동일하게 나오는 클래스
            if (idx == 0) {
                //객실 show
                $('.loginFrm.roomchk').show();
                $('.loginFrm.dinigchk').hide();
                $('.loginFrm.activitychk').hide();                
                $('.roomactchk').show();
                $('.drLoginCode').removeClass("ok");
            }else if (idx == 2) {
                //다이닝 show
                $('.loginFrm.roomchk').hide();
                $('.loginFrm.dinigchk').show();
                $('.loginFrm.activitychk').hide();                
                $('.roomactchk').hide();
                $('.drLoginCode').removeClass("ok");                
            } else {
                //액티비티 show
                $('.loginFrm.roomchk').hide();
                $('.loginFrm.dinigchk').hide();
                $('.loginFrm.activitychk').show();                
                $('.roomactchk').show();
                $('.drLoginCode').removeClass("ok");
            }
        })
}

commonJs.setCookie = function (name, value) {
    var date = new Date();
    date.setHours(24, 0, 0, 0);
    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';pat' +
        'h=/';
};

commonJs.deleteCookie = function (name) {
    commonJs.setCookie(name, '', -1);
}

commonJs.getCookie = function (name) {
    var value = document
        .cookie
        .match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value
        ? value[2]
        : null;
};

/**
 * 셀렉트박스 밸류값 업데이트
 *
 * @param selectEl (Element select)
 * @param idx (Number)
 */
commonJs.menuUpdate = function (selectEl, idx) {
    selectEl
        .prop('selectedIndex', idx)
        .seletMenuUpdate();
}

/**
 * 좌측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 */
function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen
        ? str.substring(0, padLen)
        : str;
    return str;
}

var dUtils = {
    sep: '.', //구분자
    format: 'yy.mm.dd', //포맷

    /**
     * 현재 조회년월 가져오기 (YYYYMM)
     * @returns {number}
     */
    getToYearMonth: function () {
        var varDate = new Date();

        var varYear = varDate.getFullYear();
        var varMonth = varDate.getMonth() + 1;

        if (varMonth < 10) {
            varMonth = '0' + varMonth;
        }

        return varYear + '' + varMonth;
    },

    /**
     * yyyy-mm-dd 형식 변환
     * @param date (Date)
     * @return {string}
     */
    getToDate: function (date) {
        var varDate = date
            ? date
            : new Date();

        var varYear = varDate.getFullYear();
        var varMonth = (varDate.getMonth() + 1) < 10
            ? '0' + (
            varDate.getMonth() + 1
        )
            : (varDate.getMonth() + 1);
        var varDay = varDate.getDate() < 10
            ? '0' + varDate.getDate()
            : varDate.getDate();
        var varFullDate = varYear + this.sep + varMonth + this.sep + varDay;

        return varFullDate;
    },

    /**
     * 날짜사이 간격 (1, 2, 3일)
     * @param startDate
     * @param endDate
     * @returns {number}
     */
    dateDiff: function (startDate, endDate) {
        var d1 = dUtils.parseDate(startDate);
        var d2 = dUtils.parseDate(endDate);
        var count = d2 - d1;
        return Math.floor(count / (24 * 3600 * 1000));
    },

    /**
     * 날 더하기
     * @param strDate (string)
     * @param days (number)
     * @returns {string}
     */
    addDays: function (strDate, days) {
        var tempDate = new Date(strDate);
        return tempDate.setDate(tempDate.getDate() + days);
        //return this.getToDate(tempDate);
    },

    /**
     * Date 변환
     * @param format
     * @param date
     * @returns {Date}
     */
    parseDate: function (date, format) {
        var newDate = new Date();
        if (/*'yy-mm-dd' === format && */
            date !== '') {
            var parts = date.split(this.sep);
            newDate = new Date(parts[0], parts[1] - 1, parts[2]);
        }
        return newDate;
    },

    /**
     * 요일 구하기
     * @param date
     * @returns (string)
     */
    	getDateToDay : function (dateStr) {
/*		var date = new Date(dateStr.replace(/\./gi,"-"));*/
		var week = ['일', '월', '화', '수', '목', '금', '토'];

        var [year, month, day] = dateStr.match(/\d+/g);

        // 현지 시간으로 생성
        var date = new Date(year, month - 1, day);

		var dayOfWeek = week[date.getDay()];
		return dayOfWeek;
	},

    /**
     * 소숫점 지정자리 반올림 (값, 자릿수)
     */
    Round: function (n, pos) {
        var digits = Math.pow(10, pos);
        var sign = 1;
        if (n < 0) {
            sign = -1;
        }
        n = n * sign;
        var num = Math.round(n * digits) / digits;
        num = num * sign;
        return num.toFixed(pos);
    }
};

function Jessture(target) {
    var startX = 0;
    var startY = 0;
    var _this = $(this);
    var UP = this.UP = 'jsUp';
    var DOWN = this.DOWN = 'jsDown';
    var RIGHT = this.RIGHT = 'jsRight';
    var LEFT = this.LEFT = 'jsLeft';
    var MOUSEDOWN = this.MOUSEDOWN = 'jsMouseDown'

    target.on('touchstart , mousedown', function (e) {
        if (e.type == 'mousedown') {
            // input 필드 체크
            if ($(e.target).filter('input').length == 0) {
                e.preventDefault();
            }
            startX = e.pageX;
            startY = e.pageY;
        } else {
            startX = e
                .originalEvent
                .touches[0]
                .pageX;
            startY = e
                .originalEvent
                .touches[0]
                .pageY;
        }
    });

    target.on('touchmove , mousemove', function (e) {
        var endX = 0;
        var endY = 0;
        e.preventDefault();
        if (e.type != 'mousemove') {}
    });
    target.on('touchend , mouseup', function (e) {
        var endX = 0;
        var endY = 0;
        if (e.type == 'mouseup') {
            endX = Number(e.pageX);
            endY = Number(e.pageY);
            e.preventDefault();
        } else {
            endX = Number(e.originalEvent.changedTouches[0].pageX);
            endY = Number(e.originalEvent.changedTouches[0].pageY);
        }
        var disX = Math.abs((startX * startX) - (endX * endX));
        var disY = Math.abs((startY * startY) - (endY * endY));

        if (disX > disY) {
            if (Math.abs(startX - endX) > 70) {
                if (startX < endX) {
                    _this.trigger(RIGHT);
                } else {
                    _this.trigger(LEFT);
                }
            }
        } else {
            if (disY > 70) {
                if (startY < endY) {
                    _this.trigger(DOWN);
                } else {
                    _this.trigger(UP);
                }
            }
        }
        startX = 0;
        startY = 0;
    });

    target.on('mousedown', function (e) {
        e.preventDefault();
    })

    this.on = function (evt, func) {
        _this.on(evt, func);
    };
};

/**
 * 2022-01-20 ADD
 * 메인화면 Video Controls
 * m_HUMA1000M.html
 *
 * @param String
 */
function videoControlsToggle(control) {

  var PLAY_BTN_CLASS = "btn-toggle--play",
    SOUND_BTN_CLASS = "btn-toggle--sound",
    ON_CLASS = "is-on",
    OFF_CLASS = "is-off";

  var videoEl = document.querySelector(".mainVideo video");
  var videoCon = document.querySelector(".video-controls");

  var btnPlay = videoCon.querySelector("." + PLAY_BTN_CLASS);
  var btnMute = videoCon.querySelector("." + SOUND_BTN_CLASS);

  var videoMuted = videoEl.muted;
  var videoPaused = videoEl.paused;

  if (control === "muted") {

    if(videoMuted) {
      btnMute.className = SOUND_BTN_CLASS + " " + ON_CLASS;
      videoEl.muted = false;
    } else{
      btnMute.className = SOUND_BTN_CLASS + " " + OFF_CLASS;
      videoEl.muted = true;
    }

  } else if ( control === "paused" ) {

    if(!videoPaused) {
      btnPlay.className = PLAY_BTN_CLASS + " " + OFF_CLASS;
      videoEl.pause();
    } else {
      btnPlay.className = PLAY_BTN_CLASS + " " + ON_CLASS;
      videoEl.play();
    }
  }
}