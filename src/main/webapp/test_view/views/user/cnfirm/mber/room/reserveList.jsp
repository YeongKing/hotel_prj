<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="최초 객실 예약내역 페이지 입장시" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 객실 예약 내역 | 엘리시안호텔</title>
<link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >

<link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 

<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
<script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>

<script type="text/javascript">
	// IE 브라우저인지 체크
	if(navigator.userAgent.indexOf("MSIE") !== -1 || navigator.userAgent.indexOf("Trident") !== -1) {
		// Edge 브라우저로 전환
		alert('Internet Explorer 브라우저의 서비스 지원 종료(2022년 6월 15일)에 따라 조선호텔앤리조트 웹사이트 이용 시 크로미엄 기반(Chromium Base)의 브라우저 사용을 권장 드립니다.\n\n※ 크로미엄(Chromium) 기반 브라우저\n- 크롬(Google Chrome)\n- 마이크로소프트 엣지(Microsoft Edge)\n- 파이어폭스(Mozilla Firefox)\n- 오페라(Opera)\n- 웨일(Naver Wale)\n- 사파리(Apple Safari) 등');
		window.location.replace("microsoft-edge:" + window.location.href);
	   
		// IE 브라우저 종료
		//edge 켜지지 않고, ie만 종료되어 setTimeout사용
		setTimeout(function(){
		window.open('', '_parent', '');
		window.close();
		},100)
	}
</script>

<!--schema.org 적용(2021.05.03) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Hotel",
  "name": "조선호텔앤리조트",
  "url": "https://josunhotel.com/",
  "image": [
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=426021&cntntsSn=426020",
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=253318&cntntsSn=253316",
    "https://gjb.josunhotel.com/util/file/download.do?fileSn=453363&sysCode=GJB"
  ],
  "description": "Experience the Difference - 조선호텔앤리조트는 신세계 그룹에서 운영하며, 고품격 라이프 스타일을 제안하는 서비스 전문 기업입니다.",
  "sameAs": [
    "https://www.instagram.com/josunhotelsandresorts",
    "https://www.facebook.com/Josunhotelsandresorts",
    "https://pf.kakao.com/_EnFPj",
    "https://www.youtube.com/channel/UC7ZZk3mnc0DzJqPTdjD6tOw",
    "https://play.google.com/store/apps/details?id=com.ssg.josunhotel",
    "https://apps.apple.com/kr/app/id1528269578"
  ],
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "Republic of Korea",
    "addressRegion": "서울시",
    "addressLocality": "중구",
    "streetAddress": "소공로 16",
    "postalCode": "04533"
  },
  "telephone": "02-771-0500"
}
</script>
</head>

<body>
<div class="skip"><a href="#container">본문 바로가기</a></div>
<div class="wrapper ">
<!-- mass promotion 메뉴 동적 노출 -->

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

<!--S header  -->
<jsp:include page="/user/header.jsp"></jsp:include>
<!--E header  -->

<!--(페이지 URL)-->

<script>
	function fncSearch(){
		$("#resvForm").attr("method", "get");
		$("#resvForm").attr("action", "/cnfirm/mber/room/reserveList.do");
		$("#resvForm").submit();
	}
	
	function fncResvDetail(confirmNo, hotlSysCode){
		$("#confirmationNumber").val(confirmNo);
		$("#hotlSysCode").val(hotlSysCode);
		$("#resvForm").attr("method", "post");
		$("#resvForm").attr("action", "/cnfirm/mber/room/reserveView.do");
		$("#resvForm").submit();
	}
	
	function fncSetMonth(agoMonth){
		var beginDate = new Date();
		var monthOfYear = beginDate.getMonth();
		var endDate = new Date();

		if(agoMonth != ''){
			endDate.setMonth(monthOfYear+Number(agoMonth));
			$("#datepickerFrom").val(gfncDateFormat(beginDate,'yyyy.MM.dd'));
			$("#datepickerTo").val(gfncDateFormat(endDate,'yyyy.MM.dd'));
		} else{
			$("#datepickerFrom").val("");
			$("#datepickerTo").val("");
		}
	}

	function fncMore(page){
		var maxCnt = 20;
		var listCnt = "0";
		var totalCnt = page*maxCnt;
		
		for(var i = $("#listArea > li:visible").length; i < totalCnt; i++){
			$("#show_"+i).show();
		}
		
		if(Number(listCnt) < totalCnt){
			$("#moreBtn").hide();
		}else{
			$("#moreBtn").html("<button type=\"button\" class=\"btnLine more\" onclick=\"fncMore('"+(Number(page)+1)+"');\">MORE</button>");
		}
	}
	
	function fncChangeDate(){
		$("input[id^=agoMonth]:checked").prop("checked", false);
	}
</script>

<div id="container" class="container mypage">

<script type="text/javascript">
	$(document).ready(function(){
		fncLnbInfoApi();
	}); 
	  
	//LNB정보조회(쿠폰수,가용포인트) API호출
	function fncLnbInfoApi() {
		var formData =  jQuery("#formLnb").serialize();
		jQuery.ajax({
			type : "POST",
			url : "/mypage/lnbInfoApi.do",
			cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				if(data.statusR==200 && data.codeR=='S00000') { 
					  //회원명 세팅
					  var nameHtml = ''+data.name;
				      /* $('.name').html(nameHtml); */
				      $('#nm1').html(nameHtml);
				      //가용포인트 세팅 
				      $('#usefulPointSpan').html(fncComma(data.usefulPoint));
				      //보유쿠폰수 세팅 
				      $('#couponCntDiv').html(fncComma(data.couponCnt));
					     
						//언어코드가 영문이면 멤버십메뉴 숨김
	// 				      if(data.langCode=='en') {
	// 				    	  $('#mbrshp1').css('display','none');
	// 				    	  $('#mbrshp2').css('display','none');
	// 				      }
					      
				}else{
					alert(data.statusR + " : 관리자에게 문의하세요");
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
	}
</script> 

<script type="text/javascript">
	// 페이지 로드 시 기간 조회의 현재 일자, 3개월 뒤 일자 설정
	$(function() {
		const today = new Date();
		
		const year = today.getFullYear();
		const month = String(today.getMonth()+1).padStart(2, '0');
		const after3month = String(today.getMonth()+4).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		
		const todayString = year+"."+month+"."+day;
		const after3monthString = year+"."+after3month+"."+day;
		
		datepickerFrom = $("#datepickerFrom").val(todayString);
		datepickerTo = $("#datepickerTo").val(after3monthString);
	});
</script>
 
<form id="formLnb">
<input type="hidden" id="langCode" name="langCode" value="ko" />
</form>
                 
<h1 class="hidden">마이페이지</h1>
<div class="topArea">
	<div class="topInner">
		<h2 class="titDep1">My Page</h2>
		<p class="pageGuide">회원을 위한 다양한 혜택이 준비되어 있습니다.</p>
	</div>
</div> 

<div class="inner">
	<!-- LNB -->
	<jsp:include page="/user/mypage/lnb.jsp"></jsp:include>
	<!-- LNB -->
	
	<!-- resvForm -->
	<form id="resvForm" name="resvForm">
	<input type="hidden" id="confirmationNumber" name="confirmationNumber" />
	<input type="hidden" id="hotlSysCode" name="hotlSysCode" />
	<input type="hidden" id="test" name="test" value="GJB" />
	
	<!-- myContents -->
	<div class="myContents">
		<h3 class="titDep2">예약확인</h3>
		<ul class="tabType01 tabType02">
			<li class="on"><a href="#">객실</a></li>
			<li><a href="#">다이닝</a></li>
		</ul>
		
		<!-- tab01 -->
		<div id="tab01" class="tabCont" style="display:block">
		<h3 class="hidden">객실</h3>
			<!-- searchBox -->
			<div class="searchBox">
			<div class="searchOp">
				<span class="hidden">기간 조회</span>
				
				<div class="selectWrap" style="width:346px">
					<select title="조회옵션" data-height="150px" id="searchDataType" name="searchDataType">
						<option value="GJB" selected="selected">엘리시안 서울</option>
					</select>
				</div>

				<div class="period">
					<span class="hidden">날짜선택</span>
					<span class="intArea">
						<input type="text" style='width:143px;' title="검색 시작일" readonly="readonly"
								id="datepickerFrom" name="searchDataBeginDe" onchange="fncChangeDate();" />
					</span>
					<span class="hBar">-</span>
					<span class="intArea">
						<input type="text" style='width:143px;' title="검색 종료일" readonly="readonly"
								id="datepickerTo" name="searchDataEndDe" onchange="fncChangeDate();" />
					</span>
				</div>
				
				<div class="frmList periodOp">
					<span class="frmRadio">
						<input type="radio" id="agoMonth1" onclick="fncSetMonth('1');" name="agoMonth" value="1"  />
						<label for="agoMonth1">1개월</label>
					</span>
					
					<span class="frmRadio">
						<input type="radio" id="agoMonth3" onclick="fncSetMonth('3');" name="agoMonth" value="3" checked="checked" />
						<label for="agoMonth3">3개월</label>
					</span>
					
					<span class="frmRadio">
						<input type="radio" id="agoMonth6" onclick="fncSetMonth('6');" name="agoMonth" value="6"  />
						<label for="agoMonth6">6개월</label>
					</span>
				</div>
			</div>
			
			<div class="btnWrap">
				<a href="#" class="btnSC btnM" role="button" onclick="fncSearch();">기간조회</a>
			</div>
			
			<ul class="txtGuide">
				<li>온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.</li>
				<li>예약날짜 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.</li>
				<li>과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.</li>
			</ul> 
			</div>
			<!-- searchBox -->
			
			<!-- listBox -->
			<div class="listBox">
			<div class="countList">
				<span class="count">총 <em>2</em>건</span>
				<div class="selectWrap" style="width:200px;">
					<select title="목록정렬" data-height="150px" id="searchCtgry" name="searchCtgry" onchange="fncSearch();">
						<option value="">ALL</option>
						<option value="RESERVED" >RESERVED</option>
						<option value="CANCELED" >CANCELED</option>
					</select>
				</div>
			</div>
					
			<ul class="cardList reserveInfo">
				<!-- <li class="noData"><p class="txt">검색 결과가 없습니다.</p></li> -->
				
				<li id="show_0" >
					<div class="cardInner">
					<span class="status" >RESERVED</span>
					<em class="tit">
						<a href="#none" onclick="fncResvDetail('411665', 'GJJ');">ROOM ONLY</a>
					</em>
					<p class="info">엘리시안 서울 / 객실 1개 / 성인  2, 어린이  0</p>
					<p class="number">예약번호
						<em>411665</em>
					</p>
					<p class="date">2024.07.16 - 2024.07.17</p>
					</div>
				</li>
				
				<li id="show_1" >
					<div class="cardInner">
					<span class="status" style="color:#B01414;">CANCELED</span>
					<em class="tit">
						<a href="#none" onclick="fncResvDetail('411665', 'GJJ');">ROOM ONLY</a>
					</em>
					<p class="info">엘리시안 서울 / 객실 1개 / 성인 2, 어린이 0</p>
					<p class="number">예약번호
						<em>411665</em>
					</p>
					<p class="date">2024.07.16 - 2024.07.17</p>
					</div>
				</li>
			</ul>
			</div>
			<!-- listBox -->
		</div>
		<!-- tab01 -->
	</div>
	<!-- myContents -->
	</form>
	<!-- tab01 -->
	
		
</div>
<!-- //inner -->
	
</div>
<!-- //container -->


<!--S footer  -->
<jsp:include page="/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->
</body>
</html>