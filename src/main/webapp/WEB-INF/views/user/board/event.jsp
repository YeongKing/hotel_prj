<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이벤트 화면" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>이벤트 이벤트 목록 | 엘리시안호텔</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico">
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
    
  
</head>
    <!-- S header -->
    <jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
    <!-- E header -->
<body>
<script type="text/javascript">
	
	var page = 1; // 페이지 초기 값
	var size = 6; // 한 페이지에 6개 이벤트

	
    $(document).ready(function() {
        var searchDataBeginDe = "";
        var searchDataEndDe = "";
        var searchText = "";
    	//초기 로딩
    	loadEvents(page, size,searchDataBeginDe,searchDataEndDe,searchText);
        // 이벤트 목록 더보기 버튼 클릭
        $("#btnMore").on('click', function(e) {
            $(".btnArea").hide();
            e.preventDefault(); // 기본 동작 방지
            loadEvents(++page, size,searchDataBeginDe,searchDataEndDe,searchText); // AJAX를 통해 다음 페이지의 이벤트를 로드
        });
        
	});//ready
    
    
	function fncSearch() {
		page = 1;
    	fncPage(page);
	}

    function fncPage(page) {
        var searchDataBeginDe = $("#datepickerFrom").val();
        var searchDataEndDe = $("#datepickerTo").val();
        var searchText = $("#searchDataValue").val();
		if (searchDataBeginDe != "" && searchDataEndDe == "") {
            alert("검색 종료일을 입력해 주세요.");
            $("#datepickerTo").focus();
            return;
        }

        if (searchDataBeginDe == "" && searchDataEndDe != "") {
            alert("검색 시작일을 입력해 주세요.");
            $("#datepickerFrom").focus();
            return;
        }
		
        loadEvents(page, size, searchDataBeginDe, searchDataEndDe,searchText);
  
    }
    
    function loadEvents(page,size,startDate, endDate,searchText) {
        //ajax로 이벤트 리스트 비동기 형식으로 얻기
        $.ajax({
            type: "GET",
            url: "eventList.do",
            cache: false, 
            data: {
            	page : page,
            	size : size,
            	startDate : startDate,
            	endDate : endDate,
            	searchText : searchText}
            ,
            dataType: "json",
            global: false,
            beforeSend: function() {
                commonJs.showLoadingBar();
            },
            complete: function() {
                commonJs.closeLoadingBar();
            },
            success: function(response) {
                var events = response.events;
                var totalCount = response.totalCount;
                var html = "";
                
                // 페이지 초기화 시 기존 내용을 지움
                if (page === 1) {
                    $(".boxtypeList.eventType").empty();
                }
                
                if (events.length > 0) {
                	events.forEach(function(event) {
                        html += '<li style="opacity: 1; transform: matrix(1, 0, 0, 1, 0, 0);">';
                        html += '<dl>';
                        html += '<dt>' + event.eventTitle + '</dt>';
                        html += '<dd class="thum"><img src="http://localhost/hotel_prj/util/event_img/' + event.eventMainImg + '" alt="' + event.eventTitle + '"></dd>';
                        html += '<dd class="txt">' + event.eventSubTitle + '</dd>';
                        html += '<dd class="date">';
                        html += '<div><span>기간</span><em>' + event.eventStartDate + ' - ' + event.eventEndDate + '</em></div>';
                        html += '</dd>';
                        html += '</dl>';
                        html += '<div class="btn">';
                        html += '<a href="http://localhost/hotel_prj/user/eventDetail.do?eventNum=' + event.eventNum + '" class="btnSC btnM active" id="event_see_detail" ">자세히 보기</a>';
                        html += '</div>';
                        html += '</li>';
                    });

                    $(".boxtypeList.eventType").append(html);
                }
				
                //페이지 * 사이즈가 리스트전체개수와
                if (page * size >= totalCount) {
                    $(".btnArea").hide();
                } else {
                    $(".btnArea").show();
                }
            },
            error: function(xhr, status, error) {
                console.log('Status:', status);
                console.log('Error:', error);
                console.log('Response:', xhr.responseText);
                // 응답이 HTML일 경우, JSON으로 파싱할 수 없어서 오류가 발생할 수 있습니다.
                if (xhr.responseText.startsWith('<')) {
                    console.log('HTML 응답이 반환되었습니다. 서버 측의 응답을 확인하세요.');
                }
                alert('이벤트 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
    }
</script>

<div class="wrapper">

    <form id="form" name="form">
        <input type="hidden" id="page" name="page" value="1" />
        <input type="hidden" id="rowPerPage" name="rowPerPage" value="6" />
        <input type="hidden" id="totalCount" name="totalCount" value="20" />
        <input type="hidden" id="searchDataType" name="searchDataType" />
        <input type="hidden" id="eventSn" name="eventSn" value="" />
        <input type="hidden" id="sysCode" value="JOSUNHOTEL"/>

        <div id="container" class="container">
            <!-- 컨텐츠 S -->
            <h1 class="hidden">Promotion</h1>
            <div class="topArea">
                <div class="topInner">
                    <h2 class="titDep1">Promotion</h2>
                    <p class="pageGuide">
                        조선호텔앤리조트의 특별한 이벤트를 놓치지 마세요.    
                    </p>
                </div>
            </div>
            <!-- 이벤트 검색 박스 -->
            <div class="searchBox package">
                <div class="inner">
                    <div class="searchOp">
                        <div class="period">
                            <span class="hidden">날짜선택</span>
                            <span class="intArea">
                                <input type="text" value="" name="searchDataBeginDe" style='width:200px' placeholder="YYYY-MM-DD" title="검색 시작일" readonly id="datepickerFrom">
                            </span>
                            <span class="hBar">-</span>
                            <span class="intArea">
                                <input type="text" value="" name="searchDataEndDe" style='width:200px' placeholder="YYYY-MM-DD" title="검색 종료일" readonly id="datepickerTo">
                            </span>
                        </div>
                        <div class="intWord">
                            <span class="intArea">
                                <input type="text" style='width:376px' id="searchDataValue" name="searchDataValue" value="" title="검색어 입력" placeholder="검색어를 입력해주세요.">
                            </span>
                            <button type="button" class="btnSC btnM" onclick="fncSearch();">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //searchBox -->

            <!-- 이벤트 목록 -->
            <div class="inner">
                <ul class="boxtypeList parallaxUp eventType">
                    <!-- 이벤트 항목이 동적으로 추가됩니다. -->
                </ul>
                <div class="btnArea">
                    <a href="#" class="btnSC btnMore" id="btnMore">MORE</a>
                </div>
            </div>
            <!-- //inner -->
        </div> <!-- container div의 닫는 태그 추가 -->
    </form>

    <!-- S footer -->
    <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
    <!-- E footer -->
</div>
<!-- //wrapper -->


</body>
</html>
