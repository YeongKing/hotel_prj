<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="다이닝 예약 step0" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>다이닝 - 다이닝 목록 | 엘리시안호텔</title>
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

    <div id="container" class="container">
        <input type="hidden" id="prevSysCode" value='TWC'/>
        <input type="hidden" id="searchLangCode" name="searchLangCode" value="ko"/>
        <input type="hidden" id="diningNm" name="diningNm" value="ARIA"/>
        <form id="form" name="form">
            <input type="hidden" id="searchSysCode" name="searchSysCode" value='TWC'/>
            <input type="hidden" id="diningCode" name="diningCode" value='003'/>
            <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ"/>
        </form>
        <form name="loginForm" id="loginForm">
            <input type="hidden" name="nextURL" id="nextURL"/>
        </form>
        <!-- 컨텐츠 S -->
        <h1 class="hidden">예약<!-- 예약 --></h1>
        <div class="topArea">
            <div class="topInner">
                <h2 class="titDep1">Booking</h2>
                <p class="pageGuide">엘리시안 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p><!-- 조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
            </div>
        </div>
        <!-- //topArea -->
        <div class="inner">
            <div class="diningContainer drDining_st01">
                <strong class="listTit">다이닝 선택<!-- 호텔 &amp; 다이닝 선택 --></strong>
                <div class="diningSelectCont">
                    <div class="lCont">
                        <div class="intInner duobuleSelect">
                            <div class="intArea selectWrap" style="width:508px">
                                <select id="diningSel" name="diningCode" data-height="150px" data-direction="down" aria-required="true" onchange="fncSelectDining();">
                                    <option value="001">THE NINTH GATE</option>
                                    <option value="003" selected="selected">ARIA</option>
                                    <option value="004">RUBRICA</option>
                                    <option value="011">SUSHI CHO</option>
                                    <option value="015">HONGYUAN</option>
                                    <option value="099">LOUNGE &amp; BAR</option>
                                    <option value="100">JOSUN DELI</option>
                                </select>
                            </div>
                        </div>
                        <div class="swipeWrapArea">
                            <div class="swipeWrap gallery">
                                <ul class="swipeCont">
                                    <li class="swipeSlide"><img src="http://localhost/hotel_prj/util/dining_img/라세느.png" alt="다이닝 이미지"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- //lCont -->
                    <div class="rCont">
                        <div class="roomIntro">
                            <dl>
                                <dt class="name">ARIA</dt>
                                <dd class="txt">
                                    오페라의 영혼을 셰프와 함께 실시간으로 느낄 수 있는 뷔페 레스토랑<br><br>
                                    <div class="mainDiningHidden">
                                        <p style="font-weight: bold;">가격 안내</p>
                                        <p>[아침]</p>
                                        <p>성인 70,000 KRW / 어린이 35,000 KRW</p>
                                        <p>[주중 점심]</p>
                                        <p>성인 165,000 KRW / 어린이 80,000 KRW</p>
                                        <p>[주중 저녁]</p>
                                        <p>성인 190,000 KRW / 어린이 80,000 KRW</p>
                                        <p>[주말/공휴일]</p>
                                        <p>성인 190,000 KRW / 어린이 80,000 KRW</p>
                                        <p>*어린이: 37개월 이상 ~ 12세 이하 (초등학생까지)</p><br><br>
                                    </div>
                                    <div class="mainDiningHidden">
                                        <p style="font-weight: bold;">콜키지 안내</p>
                                        <p>- 테이블 당 1병 10만원 (와인 750ml 기준)</p>
                                        <p>※ 규정 외 주류는 업장에 문의 부탁드립니다.</p><br><br>
                                    </div>
                                    <div class="mainDiningHidden">
                                        <p style="font-weight: bold;">뷔페 상품권 안내</p>
                                        <p>웨스틴 조선 서울 아리아에서 준비한 뷔페 상품권으로 소중한 분께 감사의 마음을 전하시기 바랍니다.</p>
                                        <p>- 아리아 뷔페 1인 식사권</p>
                                        <p>- 아리아 뷔페 2인 식사권</p>
                                        <p>※ 갈라디너 등 이벤트일 및 12월 사용 시 추가 요금이 발생될 수 있습니다.</p>
                                    </div>
                                </dd>
                                <dd class="info">
                                    <ul>
                                        <li>
                                            <em>위치<!-- 위치 --></em>
                                            <span>웨스틴 조선 서울 저층 로비</span>
                                        </li>
                                        <li>
                                            <em>문의<!-- 문의 --></em>
                                            <span>02-317-0357</span>
                                        </li>
                                        <li>
                                            <em>좌석수<!-- 좌석수 --></em>
                                            <span>총 240석 별실 3개(최대 10명 수용 가능) <br> * 별실 이용 시 룸 차지(50,000원) 부과</span>
                                        </li>
                                    </ul>
                                </dd>
                            </dl>
                        </div>
                        <form>
                        <a href="http://localhost/hotel_prj/user/dining_step0.do"><button id="btnResve" type="button" class="btnSC btnL active" >예약하기</button></a>
                        </form>
                    </div>
                    <!-- //rCont -->
                </div>
                <!-- //diningSelectCont -->
            </div>
        </div>
        <!-- //inner -->
        <!-- 컨텐츠 E -->
    </div>
    <!-- //container -->

    <!-- <script type="text/javascript" src="/revolution/js/bw.lab.alphanumeric-1.0.js"></script>
    <script type="text/javascript" src="/revolution/js/bw.lab.money-1.0.js"></script>
    <script>
        jQuery(function() {
            jQuery("#menuTab > li").on("click", function() {
                jQuery("#menuTab > li").removeClass("on");
                jQuery(this).addClass("on");
            });
        });

        function fncMenuShow(searchSysCode, diningCode) {
            jQuery("#menuPopDiningCode").val(diningCode);
            jQuery("#menuPopSysCode").val(searchSysCode);
            fncTabListJson(searchSysCode, diningCode);
        }

        function fncTabListJson(searchSysCode, diningCode) {
            jQuery.ajax({
                type: "GET",
                url: "/rstrntMenu/tabListJson.json",
                cache: false,
                dataType: "json",
                data: {
                    "diningCode": diningCode,
                    "searchSysCode": searchSysCode
                },
                global: false,
                async: false,
                success: function(data) {
                    var _list = data.tabList;
                    var rstrntLclas = "";
                    var tabHtml = "";

                    //다이닝 이름
                    jQuery("#menuPopup .compTit").text(data.diningNm);
                    jQuery("#popDiningNm").val(data.diningNm);

                    if (_list != null && _list.length > 0) {
                        for (var i = 0; i < _list.length; i++) {
                            if (i == 0) {
                                rstrntLclas = _list[i].lclasCode;
                            }
                            tabHtml += '<li><a href="#' + _list[i].lclasCode + '" onclick="fncSelectMenuTab(\'' + _list[i].lclasCode + '\')">' + _list[i].lclasNm + '</a></li>';
                        }
                    }
                    jQuery("#menuTab").html(tabHtml);
                    jQuery("#menuTab > li").first().addClass("on");
                    fncMenuListJson(searchSysCode, diningCode);
                },
                error: function(r, s, e) {
                    alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
                }
            });
        }

        function fncMenuListJson(searchSysCode, diningCode) {
            jQuery.ajax({
                type: "GET",
                url: "/rstrntMenu/menuListJson.json",
                cache: false,
                dataType: "json",
                data: {
                    "diningCode": diningCode,
                    "searchSysCode": searchSysCode
                },
                global: false,
                async: false,
                success: function(data) {
                    var _menuMapList = data;

                    //등록된 메뉴가 있을때만 출력
                    if (_menuMapList.length == 0 || _menuMapList == null) {
                        alert("등록된 메뉴가 없습니다."); //등록된 메뉴가 없습니다.
                        return false;
                    }

                    jQuery(".menuCont").each(function() {
                        jQuery(this).remove();
                    });

                    //첫번째 탭 value 세팅
                    jQuery("#lclasCode").val(_menuMapList[0].lclasCode);

                    for (var k = 0; k < _menuMapList.length; k++) {
                        var _singleMenu = _menuMapList[k].singleMenu; // 단품 메뉴
                        var _lclasCode = _menuMapList[k].lclasCode; // 대분류 코드
                        var _lclasNm = _menuMapList[k].lclasNm; // 대분류 명

                        var _singleLclasMenuList = null;
                        var _singleMenuOrigin = null;

                        if (_singleMenu != null) {
                            _singleLclasMenuList = _singleMenu.lclasMenuList; // 단품 대분류
                            _singleMenuOrigin = _singleMenu.origin.originCn; // 단품 원산지
                        }

                        var _setMenu = _menuMapList[k].setMenu; // 세트 메뉴
                        var _setLclasMenuList = null;
                        var _setMenuOrigin = null;
                        if (_setMenu != null) {
                            _setLclasMenuList = _setMenu.lclasMenuList; // 세트 대분류
                            _setMenuOrigin = _setMenu.origin.originCn; // 세트 원산지
                        }

                        var menuHtml = "";
                        if (k == 0) {
                            menuHtml += '<div id=' + _lclasCode + ' class="tabCont printCont menuCont" style="display:block">';
                        } else {
                            menuHtml += '<div id=' + _lclasCode + ' class="tabCont printCont menuCont" style="display:none">';
                        }
                        menuHtml += '    <h3 class="hidden">' + _lclasNm + '</h3>';
                        menuHtml += '    <div class="scrollWrap menuPanView">';

                        //세트 메뉴 세팅
                        if (_setLclasMenuList != null && _setLclasMenuList.length > 0) {
                            for (var i = 0; i < _setLclasMenuList.length; i++) {
                                var _setDetailMenu = _setLclasMenuList[i].detailMenuList[0]; //상세 메뉴

                                menuHtml += '            <div class="menuPan type02">';
                                menuHtml += '                <p class="tit">' + _setDetailMenu.menuNm + '</p>';
                                menuHtml += '                <ul class="menuList">';
                                menuHtml += '                <li>';
                                menuHtml += '                    <div class="txt">';
                                menuHtml += '                        <span>' + fncReplaceEnter(_setDetailMenu.contents) + '</span>';
                                menuHtml += '                    </div>';
                                menuHtml += '                </li>';
                                menuHtml += '                </ul>';
                                menuHtml += '                <p class="bill">' + fncReplaceEnter(_setDetailMenu.pcCndDc) + '</p>';
                                menuHtml += '            </div>';
                            }

                            //세트 원산지 세팅
                            if (_setMenuOrigin != null && _setMenuOrigin != "") {
                                menuHtml += '            <div class="notiBox">';
                                menuHtml += '                <strong class="hidden">원산지 표시 안내</strong>';
                                menuHtml += fncReplaceEnter(_setMenuOrigin);
                                menuHtml += '            </div>';
                            }
                        }

                        //단품 메뉴 세팅
                        if (_singleLclasMenuList != null && _singleLclasMenuList.length > 0) {
                            for (var i = 0; i < _singleLclasMenuList.length; i++) {
                                var _detailMenuList = _singleLclasMenuList[i].detailMenuList; //상세 메뉴

                                menuHtml += '            <div class="menuPan type01">';
                                menuHtml += '                <p class="tit">' + _singleLclasMenuList[i].singleSclasNm + '</p>';
                                menuHtml += '                <ul class="menuList">';

                                //상세 메뉴 세팅
                                for (var j = 0; j < _detailMenuList.length; j++) {
                                    menuHtml += '                <li>';
                                    menuHtml += '                    <span class="txt">' + fncReplaceEnter(_detailMenuList[j].menuNm) + '</span>';
                                    menuHtml += '                    <p class="bill">';
                                    menuHtml += '                        ' + _detailMenuList[j].pcCndDc + '';
                                    menuHtml += '                    </p>';
                                    menuHtml += '                </li>';
                                }

                                menuHtml += '                </ul>';
                                menuHtml += '            </div>';
                            }

                            //단품 원산지 세팅
                            if (_singleMenuOrigin != null && _singleMenuOrigin != "") {
                                menuHtml += '            <div class="notiBox">';
                                menuHtml += '                <strong class="hidden">원산지 표시 안내</strong>';
                                menuHtml += fncReplaceEnter(_singleMenuOrigin);
                                menuHtml += '            </div>';
                            }
                        }

                        menuHtml += '    </div>';
                        menuHtml += '</div>';

                        jQuery(".menuPanArea").append(menuHtml);
                    }
                    commonJs.initDesignScroll($('.scrollWrap'));
                    commonJs.initTab('.tabToggle');
                    commonJs.popShow($('#menuPopup'));
                },
                error: function(r, s, e) {
                    alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
                }
            })
        }

        function fncSelectMenuTab(lclasCode) {
            jQuery("#lclasCode").val(lclasCode);
        }

        function fncMenuDownload() {
            jQuery("#diningMenuPopForm").attr("action", "/rstrntMenu/menuDownload.do");
            jQuery("#diningMenuPopForm").attr("method", "get");
            jQuery("#diningMenuPopForm").submit();
        }

        function fncReplaceEnter(str) {
            if (str != "") {
                return str.split("\r\n").join("<br/>");
            } else {
                return "";
            }
        }
    </script> -->

    <!-- footer S -->
    <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
    <!-- footer E -->
</div>
<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>
