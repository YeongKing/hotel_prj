<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="이벤트 화면" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>이벤트 이벤트 상세 | 엘리시안호텔</title>
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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <meta property="og:url" content="http://localhost/hotel_prj/user/eventDetail.do?eventNum=<c:out value='${eDomain.eventNum}'/>">

</head>

<!-- S header -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!-- E header -->

<body>
    <div class="wrapper">

        <input type="hidden" id="endYn" name="endYn" value="N" />

        <div id="container" class="container">
            <!-- 컨텐츠 S -->
            <h1 class="hidden">Promotion</h1>
            <div class="topViewCont">
                <div class="img">
                    <img src="http://localhost/hotel_prj/util/event_img/${eDomain.eventSubImg}" >
                </div>
                <div class="txtCont">
                    <strong class="tit">${eDomain.eventTitle}</strong>
                    <p class="txt">${eDomain.eventSubTitle}</p>
                </div>
            </div>
            <!-- //topCont -->

            <div class="rsvInfor">
                <div class="inner">
                    <dl>
                        <dt>이벤트 기간</dt>
                        <dd>[${eDomain.eventStartDate}] - [${eDomain.eventEndDate}]</dd>
                    </dl>
                    <div class="btnArea">
                        <a href="#" class="btnSC btnL typeShare" onClick="commonJs.popShow($('#shareLayerpop'));return false;"><span>공유하기</span></a>
                    </div>
                </div>
            </div>

            <div class="inner">
                <ul class="packageCont02">
                    <li>
                        <dl>
                            <dt>${eDomain.eventTitle }</dt>
                            <dd class="thum">
                                <img src="http://localhost/hotel_prj/util/event_img/${eDomain.eventMainImg}" >
                            </dd>
                            <dd class="txtArea">
                                ${eDomain.eventContent}
                            </dd>
                        </dl>
                    </li>
                </ul>

                <div class="noticeArea">
                    <div class="revInquiry">
                        <h3 class="titDep3">이벤트 문의</h3>
                        <span><em>엘리시안 호텔로 연락 부탁드립니다</em></span>
                    </div>
                </div>

                <div class="btnArea">
                    <a href="http://localhost/hotel_prj/user/event.do" class="btnSC btnL">목록</a>
                </div>

                <div class="promotion">
                    <h2 class="titDep2">추천 이벤트</h2>
                    <div class="swipeWrapArea">
                        <button type="button" class="btnSwipe btnPrev">
                            <span class="hidden">이전</span>
                        </button>
                        <div class="swipeWrap swipeGroup">
                            <ul class="swipeCont promList">
                                <c:forEach var="event" items="${eventList}" varStatus="i">
                                    <li class="swipeSlide">
											<a href="<c:url value='/user/eventDetail.do'/>?eventNum=${event.eventNum}">
                                            <strong class="tit"><c:out value="${event.eventTitle}" /></strong>
                                            <p class="txt"><c:out value="${event.eventContent}" /></p>
                                            <p class="date">
                                                <span><em>기간</em><c:out value="${event.eventStartDate}" /> - <c:out value="${event.eventEndDate}" /></span>
                                            </p>
                                            <span class="thum">
                                                <img src="http://localhost/hotel_prj/util/event_img/${event.eventMainImg}" alt="<c:out value='${event.eventTitle}'/>">
                                            </span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <button type="button" class="btnSwipe btnNext">
                            <span class="hidden">다음</span>
                        </button>
                        <div class="indicator">
                            <button type="button" class="num on">
                                <em class="hidden">현재 이미지</em>01
                            </button>
                        </div>
                    </div>
                </div>
                <!-- //promotion -->
            </div>
            <!-- //inner -->
            <!-- 컨텐츠 E -->
        </div>

        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script type="text/javascript">
        if (!Kakao.isInitialized()) {
            Kakao.init('0fdf7d8e1b7179f124a17f4c6c047ee2');  // 'YOUR_APP_KEY'를 실제 앱 키로 변경하세요.
        }
        
        var imageUrl = document.querySelector('meta[property="og:image"]').getAttribute('content');

        function shareKakao() {
            var imageUrl = "http://localhost/hotel_prj/util/event_img/<c:out value="${eDomain.eventMainImg}"/>";
            fetch(imageUrl)
                .then(response => response.blob())
                .then(blob => {
                    var file = new File([blob], "eventMainImg.jpg", { type: blob.type });

                    Kakao.Share.uploadImage({
                        file: [file],
                    }).then(function(response) {
                        console.log(response.infos.original.url);
                        Kakao.Link.sendDefault({
                            objectType: 'feed',
                            content: {
                                title: '엘리시안의 특별한 이벤트를 확인해보세요!',
                                description: '<c:out value="${eDomain.eventTitle}"/>',
                                imageUrl: response.infos.original.url,
                                link: {
                                    mobileWebUrl: 'http://localhost/hotel_prj/user/eventDetail.do?eventNum=<c:out value="${eDomain.eventNum}"/>',
                                    webUrl: 'http://localhost/hotel_prj/user/eventDetail.do?eventNum=<c:out value="${eDomain.eventNum}"/>'
                                }
                            },
                            buttons: [
                                {
                                    title: '자세히 보기',
                                    link: {
                                        mobileWebUrl: 'http://localhost/hotel_prj/user/eventDetail.do?eventNum=<c:out value="${eDomain.eventNum}"/>',
                                        webUrl: 'http://localhost/hotel_prj/user/eventDetail.do?eventNum=<c:out value="${eDomain.eventNum}"/>'
                                    }
                                }
                            ],
                            success: function(response) {
                                console.log(response);
                            },
                            fail: function(error) {
                                console.log(error);
                            } 
                        });
                    }).catch(function(error) {
                        console.log(error);
                    });
                });
        } 
     // URL 복사하기
        function copyToClipboard() {
            var copyUrl = document.createElement("textarea");
            document.body.appendChild(copyUrl);
            copyUrl.value = document.querySelector('meta[property="og:url"]').getAttribute('content').replace(/&amp;/g, '&');
            copyUrl.select();
            document.execCommand('copy');
            document.body.removeChild(copyUrl);
            alert("클립보드로 URL이 복사되었습니다.");
        }

       
        </script>

        <div id="shareLayerpop" class="layerPop">
            <div class="layerCont shareLayer">
                <h2 class="compTit">공유하기</h2>
                <div class="shareCont">
                    <ul>
                        <li class="kakao"><a href="#" onclick="shareKakao();return false;">카카오톡</a></li>
                        <li class="url"><a href="#" onclick="copyToClipboard();return false;">URL복사</a></li>
                    </ul>
                </div>
                <button type="button" class="btnClose" onclick="commonJs.popClose($('#shareLayerpop'))">닫기</button>
            </div>
        </div>

        <div class="dimmed"></div>
    </div>
    <!-- //wrapper -->

    <div class="dimmed"></div>
</body>
</html>