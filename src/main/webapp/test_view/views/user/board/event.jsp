<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>이벤트 - 이벤트 목록 | 엘리시안호텔</title>
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
        //2022-05-23 조선라운지 추가
        //헤더 메뉴 버튼 클릭 이벤트
        jQuery(document).on("click", ".headArea .btnMenu", function() {
            //메뉴 펼쳐질때 라운지 list 3가지 무작위 노출
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
        })
    </script>
 
</head>
<body>
    <!--S header  -->
	<jsp:include page="../header.jsp"></jsp:include>
	<!--E header  -->
    <div class="wrapper ">
    <form id="form" name="form">
        <input type="hidden" id="page" name="page" value="1" />
        <input type="hidden" id="rowPerPage" name="rowPerPage" value="6" />
        <input type="hidden" id="totalCount" name="totalCount" value="20" />
        <input type="hidden" id="searchDataType" name="searchDataType" />
        <input type="hidden" id="eventSn" name="eventSn" value="" />
        <input type="hidden" id="sysCode" value="JOSUNHOTEL" />
        <div id="container" class="container">
            <h1 class="hidden">Promotion</h1>
            <div class="topArea">
                <div class="topInner">
                    <h2 class="titDep1">Promotion</h2>
                    <p class="pageGuide">엘리시안 호텔의 특별한 이벤트를 놓치지 마세요.</p>
                </div>
            </div>
<!--             <div class="searchBox package"> -->
                <div class="inner">
                    <div class="searchOp">
                        <div class="selectWrap" style='width:296px;'>
                        </div>
                        <div class="period">
                            <span class="hidden">날짜선택</span>
                            <span class="intArea"><input type="text" value="" name="searchDataBeginDe" style='width:200px' placeholder="YYYY-MM-DD" title="검색 시작일" readonly id="datepickerFrom"></span>
                            <span class="hBar">-</span>
                            <span class="intArea"><input type="text" value="" name="searchDataEndDe" style='width:200px' placeholder="YYYY-MM-DD" title="검색 종료일" readonly id

="datepickerTo"></span>
                        </div>
                        <div class="intWord">
                            <span class="intArea"><input type="text" style='width:376px' id="searchDataValue" name="searchDataValue" value="" title="검색어 입력" placeholder="검색어를 입력해주세요."></span>
                            <button type="button" class="btnSC btnM" onclick="fncSearch();">검색</button>
                        </div>
                    </div>
                </div>
            <div class="inner">
 
                <ul class="boxtypeList parallaxUp eventType">
                    <li>
                        <dl>
                            <dt>2024 Summer Art Festival</dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2042194&sysCode=TWC" alt="2024 Summer Art Festival"></dd>
                            <dd class="locationTag TWC">웨스틴 조선 서울 </dd>
                            <dd class="txt">10회를 맞이한 웨스틴 조선 서울 시그니처 문화 컨텐츠 "Summer Art Festival" !! 
                                8월 3일 토요일 "김필, 정은지"와 함께하는 여름 밤에 초대합니다. 
                            </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.08.03 - 2024.08.03</em></div>
                                <div><span>대상자</span><em>2024 Summer Art Festival </em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2037442');return false;">자세히 보기</a>
                        </div>
                    </li>
                    <li>
                        <dl>
                            <dt>Sound Club Vol.2 | LIVE JAZZ BAR</dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2053475&sysCode=LESCAPE" alt="마크다모르 재즈 바"></dd>
                            <dd class="locationTag LESCAPE">레스케이프 </dd>
                            <dd class="txt">로맨틱한 바와 어울리는 재즈 선율과 음악과 즐기기 좋은 위스키 그리고 월드 클래스 바텐더의 칵테일까지 잊을 수 없는 순간을 경험하세요. </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.06.01 - 2024.12.31</em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2053196');return false;">자세히 보기</a>
                        </div>
                    </li>
                    <li>
                        <dl>
                            <dt>Palais de Chine '門' </dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2055344&sysCode=LESCAPE" alt="팔레드 신 신메뉴 "></dd>
                            <dd class="locationTag LESCAPE">레스케이프 </dd>
                            <dd class="txt">"팔레드 신의 새로운 문을 열다" 
                                모던 차이니즈 레스토랑 팔레드 신에서 
                                익숙한 듯 새로운 신메뉴 4종을 선보입니다.  
                            </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.06.01 - 2024.12.31</em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2055343');return false;">자세히 보기</a>
                        </div>
                    </li>
                    <li>
                        <dl>
                            <dt>인스타그램 스토리 이벤트</dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2058342&sysCode=JOSUNHOTEL" alt="그래비티 서울판교 부스트(VOOST), 조선델리(JOSUN DELI), 인증샷 스토리 이벤트"></dd>
                            <dd class="locationTag JOSUNHOTEL">조선호텔앤리조트 </dd>
                            <dd class="txt">그래비티 서울 판교에 새로 오픈한 루프탑 바 VOOST와 JOSUN DELI에 방문하고 인증샷을 스토리에 공유해 주세요. </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.06.05 - 2024.07.07</em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2058341');return false;">자세히 보기</a>
                        </div>
                    </li>
                    <li>
                        <dl>
                            <dt>Summer Bingsu Delights</dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2058419&sysCode=JOSUNHOTEL" alt="조선호텔앤리조트 빙수, 수박빙수, 애플망고빙수, 제주애플망고빙수, 제비집빙수"></dd>
                            <dd class="locationTag JOSUNHOTEL">조선호텔앤리조트 </dd>
                            <dd class="txt">새콤달콤한 풍미 가득한 제철과일이 듬뿍 올라간 조선호텔앤리조트 빙수로 다가오는 여름을 시원하게 즐겨보세요. </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.06.03 - 2024.08.31</em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2058418');return false;">자세히 보기</a>
                        </div>
                    </li>
                    <li>
                        <dl>
                            <dt>Sweet Apple Mango Delight</dt>
                            <dd class="thum"><img src="/util/file/download.do?fileSn=2046681&sysCode=TWC" alt="Sweet Apple Mango Delight"></dd>
                            <dd class="locationTag TWC">웨스틴 조선 서울 </dd>
                            <dd class="txt">라운지앤바와 조선델리에서 선보이는 달콤한 애플 망고 프로모션 </dd>
                            <dd class="date">
                                <div><span>기간</span><em>2024.05.27 - 2024.07.31</em></div>
                            </dd>
                        </dl>
                        <div class="btn">
                            <a href="#" class="btnSC btnM active" id="event_see_detail" onclick="fncView('2046680');return false;">자세히 보기</a>
                        </div>
                    </li>
                </ul>
                <div class="btnArea">
                    <a href="#" class="btnSC btnMore" id="btnMore">MORE</a>
                </div>
            </div>
		</div>
    </form>
    <!-- footer -->
        <jsp:include page="../footer.jsp"></jsp:include>
    </div>
    </body>
</html>