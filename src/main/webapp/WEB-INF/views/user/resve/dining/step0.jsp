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
        
        //select시 비동기 처리 ajax
        function fncSelectDining(){
       	 var selectedDiningId = $("#diningSel").val();
       	 
       	 $.ajax({
       		 url: 'selectDining.do',
       		 type: 'GET',
       		 data: {diningId : selectedDiningId},
       		 dataType: 'json',
       		 success: function(response){
       			 updateDiningInfo(response);
       		 },
       		 error: function(error){
       			 console.erorr(error)
       		 }
       	 })
        }
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
                                <select id="diningSel" name="diningCode" data-height="150px" data-direction="down" aria-required="true" onchange="fncSelectDining()" >
									<c:forEach var="dining" items="${requestScope.diningList}">
        								<option value="${dining.diningId}">${dining.diningName}</option>
    								</c:forEach>                             
                                </select>
                            </div>
                        </div>
                        <div class="swipeWrapArea">
                            <div class="swipeWrap gallery">
                                <ul class="swipeCont" id="dining-image-container">
                                
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- //lCont -->
                    <div class="rCont">
                        <div class="roomIntro">
                            <dl>
                                <dt class="name" id="diningName"></dt>
                                <dd class="txt" id="diningComment"></dd>
                                
                                <dd class="info">
                                    <ul>
                                        <li > 
                                        	<em>메뉴<!-- 위치 --></em>
                                            <span id="menu"></span>
                                        </li>
                                        <li > 
                                        	<em>운영시간<!-- 시간 --></em>
                                            <span id="openTime" style="margin-left: 10px;"></span>-<span id="closeTime"></span>
                                        </li>
                                        <li>
                                            <em>위치<!-- 위치 --></em>
                                            <span id="location"></span>
                                        </li>
                                        <li id="seats"><!-- 좌석 --> </li>
                                        <li>
                                            <em>예약금<!-- 예약금 --></em>
                                            <span id="deposit"></span>
                                        </li>
                                        
                                    </ul>
                                </dd>
                            </dl>
                        </div>
                        <form id="reservationForm" action="dining_step0.do" method="get">
                        <input type="hidden" id="diningIdInput" name="diningId">
                       	<button id="btnResve" type="button" class="btnSC btnL active" >예약하기</button>
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

  	<script type="text/javascript">
 	
  	$(function(){
  		 $('#btnResve').click(function() {
             $('#reservationForm').submit();
         });
  	})
  	
  	//JSON 데이터를 랜덤한 다이닝의 정보를 화면에 보여준다.
  	var diningData = JSON.parse('${diningJson}');
	function updateDiningInfo(diningData){
		
		 // 다이닝 정보 설정 
		 $('#diningName').text(diningData.diningName);
	  	 $("#diningComment").text(diningData.diningComment);
         $('#location').text(diningData.location);
         $("#menu").text(diningData.menu);
         $("#openTime").text(diningData.openTime);
         $("#closeTime").text(diningData.closeTime);
         $('#deposit').text(diningData.deposit + ' KRW');
         
         
         // 다이닝 이미지 설정
         var imgHtml = '<li class="swipeSlide"><img src="http://localhost/hotel_prj/util/dining_img/' + diningData.diningImg + '" alt="다이닝 이미지"></li>';
         $('#dining-image-container').html(imgHtml);
        
         //좌석수 설정
         var seatsHtml =                
         	'<em>좌석</em><span id="hallTable">홀 테이블 :' + diningData.hallTable +  '석</span><br/><span id="roomTable">룸 테이블 :' + diningData.roomTable + '석</span><br/>*별도의 단체예약은 호텔측으로 문의바랍니다';
         $("#seats").html(seatsHtml);
         
         // hidden input의 value 업데이트
         $('#diningIdInput').val(diningData.diningId);

	}	
	
	updateDiningInfo(diningData);
    
	//다이닝 이름에 해당하는 select 옵션 선택
     var diningName = diningData.diningName;
     $('#diningSel option').each(function() {
         if ($(this).text() === diningName) {
             $(this).attr('selected', 'selected');
         }
     });

   
  	</script>

    <!-- footer S -->
    <jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
    <!-- footer E -->
</div>
<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>
