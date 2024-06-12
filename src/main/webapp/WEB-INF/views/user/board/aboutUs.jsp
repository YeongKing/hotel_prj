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

<title>기업소개 | 엘리시안호텔</title>

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
	<!-- //topArea -->
	<div class="topArea">
		<div class="topInner">
			<h2 class="titDep1">About Us</h2>
		</div>
	</div>
	<!-- //topArea -->

	<div class="visualBox">
	<div class="inner">
		<img src="http://localhost/hotel_prj/util/file/img_visual_about01_01.jpg" alt="로비">
	</div>
	</div>
	<!-- //visualBox -->

	<div class="inner">
	<h3 class="hidden">사업소개</h3>
                
	<!-- 사업소개(Intro) -->
	<div class="propertyIntro type02">
		<em class="tit">엘리시안호텔은 <br>고품격 라이프 스타일을 제안하는 <br>서비스 전문 기업입니다.</em>
		<p class="txt">엘리시안호텔은 ‘꿈꾸던 이상향에서의 완벽한 휴식’을 지향하며 호스피탈리티 산업의 대표기업으로 자리매김 하고 있습니다.<br>
						수많은 ‘한국 최초’의 신화를 남겨온 엘리시안은 호텔 뿐 아니라 외식사업 등 품격 있는 서비스와 시설을 제공합니다.</p>
		<div class="txt">
		<dl style="width: 114px;">
			<dt>설립일</dt>
			<dd>2024<span class="hidden">년</span>.06<span class="hidden">월</span></dd>
		</dl>
		</div>
	</div>
	<!-- 사업소개(Intro) -->

	<!-- CI -->
	<div class="topInner type02" style="padding-top: 140px;">
		<h2 class="titDep1" style="padding-bottom: 50px;">CORPORATE IDENTITY</h2>
		<ul class="businessRoomList type02" style="margin-top: 0px;">
			<li>
				<div class="info">
				<strong class="hidden">세로형</strong>
					<span class="ciImg"><img src="http://localhost/hotel_prj/util/file/logo_Elysian.png" alt=""></span>
				</div>
			</li>
			
 			<li>
				<div class="info">
				<strong class="hidden">가로형</strong>
				<span class="ciImg"><img src="http://localhost/hotel_prj/util/file/logo_Elysian2.png" alt=""></span>
				</div>
			</li>
		</ul>            
	</div>
	<!-- //CI -->
	
	</div>
	<!-- //inner -->
	
</div>
<!-- 컨텐츠 E -->
<!-- //container -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
		
</div>
<!-- //wrapper -->
</body>
</html>