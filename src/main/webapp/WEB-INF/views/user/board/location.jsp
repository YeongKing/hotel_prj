<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>오시는길 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>
 
<body>
<!-- S header -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!-- E header -->
 
<div class="skip"><a href="#container">본문 바로가기</a></div>
<div class="wrapper mainWrapper topBanner">

<script>
	jQuery(function(){
		jQuery.ajax({
			type : "GET",
			url : "/massPromotion/get.json",
			cache : false,
			dataType : "json",
			global : false,
			beforeSend: function() {
			},
			complete: function() {
			},
			success : function(data){
                var massPromtn = data.bean;
                //조회 결과에 따라 랜더링
                if(massPromtn != null && massPromtn != ""){
                    var url = getMassPromtnUrl();
                    var menuNm = massPromtn.promtnNm;
                    var sysCode = massPromtn.sysCode;
                    appendMassPromotionMenu(url, menuNm, sysCode);
                }
			},
			error:function(r, s, e){
			}
		});
	});

    function getMassPromtnUrl(){
        var url = "";
        var sysCode = jQuery("#sysCode").val();

        if(gfncIsApp()){
            //앱일 경우
            url = "/m/massPromotion/list.do";
        }else if(gfncIsMobile()){
            //모바일일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/m/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/m/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/m/massPromotion/list.do";
                }
            }
        }else {
            //pc일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/massPromotion/list.do";
                }
            }
        }
        return url;
    }

    function appendMassPromotionMenu(url, menuNm, sysCode){
        if(gfncIsApp()){
            //앱일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';

            var pathname = window.location.pathname;
            if(pathname.indexOf("/app/main.do") == 0){
                jQuery(".gnbArea ul.toggleList > li > .titArea:contains('패키지')").closest("ul").append(menuHtml);
            }else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }

            /*if(jQuery(".gnbArea ul.toggleList li:contains('패키지')").length > jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").length){
                jQuery(".gnbArea ul.toggleList li:contains('패키지')").closest("ul").append(menuHtml);
            } else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }*/

        }else if(gfncIsMobile()){
            //모바일일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';
            jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
        }else{
            //pc일 경우
            if(sysCode == "JOSUNHOTEL" || sysCode == "JPY"){
                //해당 페이지가 HUB거나 JPY일 경우
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".allMenu ul.menuDepth01 ul.menuDepth02 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }else {
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".headArea .utilMenu .gnbDepth1 .gnbDepth2 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }
        }
    }
</script>

<script>
	//2022-05-23 조선라운지 추가
	//헤더 메뉴 버튼 클릭 이벤트
	jQuery(document).on("click",".headArea .btnMenu" ,function(){

	//메뉴 펼쳐질때 라운지 list 3가지 무작위 노출
	if(jQuery(this).hasClass("menuOn")){
		var expsrCount = 3;
		var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
		var randomArray = generateRandomNumberArray(expsrCount, $loungeList.length);

		$loungeList.addClass("hidden");
		$loungeList.each(function(index){
			if(randomArray.indexOf(index) > -1){
			jQuery(this).removeClass("hidden");
			}
		});
	}
})
</script>

<!-- container -->
<div id="container" class="container about">
	<!-- 컨텐츠 S -->
	<h1 class="hidden">기업 소개</h1>
	<div class="topArea">
	<div class="topInner">
	<h2 class="titDep1">Location</h2>
	<div class="pageGuide">
		<strong class="hidden">엘리시안호텔 오시는 길</strong>
		<p class="txt">
			<span class="hidden">주소</span>서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 엘리시안호텔
			<span class="vBar"><span class="hidden">대표전화</span>02-3482-4632~5</span>
		</p>
	</div>
	</div>
	</div>
	<!-- //topArea -->
	
	<div class="inner">
	<div class="mapArea" id="map" style="width: 1400px;height: 560px;"></div>
	<ul class="toggleList rsvList">
		<li class="toggleOn">
			<strong class="listTit">지하철</strong>
			<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button><!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
			<div class="toggleCont" style="display:block">
			<div class="locationInfo">
				<em class="tit">2호선(역삼역)</em>
				<ul class="txt">
					<li>역삼역 3번출구 도보3분 거리</li>
				</ul>
				
				<em class="tit">2호선(강남역)</em>                                
				<ul class="txt">
					<li>강남역 1번출구 도보5분 거리</li>
				</ul>
			</div>
			</div>
		</li>
	
		<li>
			<strong class="listTit">버스</strong>
			<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
			<div class="toggleCont">
			<div class="locationInfo">
				<em class="tit">역삼역 하차</em>
				<p class="txt">N13, N61, 146,341, 360, 740, 6000, 6020, 1100, 1700, 2000, 2000-1, 7007, 8001</p>
			</div>
			</div>
		</li>
                    
		<li>
			<strong class="listTit">자가용</strong>
			<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
			<div class="toggleCont">
			<div class="locationInfo">
				<em class="tit">엘리시안호텔 서울</em>
                <p class="txt">서울 강남구 테헤란로 132(역삼동) 한독약품 빌딩 8층</p>
			</div>
			</div>
		</li>
	</ul>                
	</div>
	<!-- //inner -->
	<!-- 컨텐츠 E -->
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f404c372f87b1f48066b04beee9e199b"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.499285, 127.0332008), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.499285, 127.0332008); 
	
	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">엘리시안호텔 <br><a href="https://map.kakao.com/link/map/엘리시안호텔,37.499285,127.0332008" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/엘리시안호텔,37.499285,127.0332008" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.499285, 127.0332008); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	
	//아래 코드는 지도 위의 마커를 제거하는 코드입니다
	//marker.setMap(null);    
</script>
<!-- //container -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
		
</div>
<!-- //wrapper -->
</body>
</html>