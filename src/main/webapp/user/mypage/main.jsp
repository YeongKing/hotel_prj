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

<title>마이페이지 | 엘리시안호텔</title>
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
<head>
<script type="text/javascript" src="/static/home/js/home.js"></script> 
</head>
 
<script type="text/javascript">
	$(document).ready(function(){
		//멤버십상품정보 국문 아닐경우 숨김
		var langCode = $('#langCode').val();
		if(langCode!='ko') {
		/*    $('#membershipDiv').css('visibility','hidden'); */
			$('#membershipDiv').css('display','none');
			$('#membdhipResDiv').css('display','none');
		} 
	}); 
</script>

<input type="hidden" id="langCode" name="langCode" value="ko"/>  

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
	
<script type="text/javascript">
	var vocRegistValid = false;
	jQuery(function() {
		jQuery.ajax({
			
			type : "POST",
			url : "/voc/getInitCodeList.json",
			cache : false,
			dataType : "json",
			data : {},
			global : false,
			success : function(data){
				var _langCode = data.langCode
				
				$("#langCode").val(_langCode);

				if(_langCode == "ko"){
					$("#otherLang").empty();
				}else {
					$("#koLang").empty();
				}
				
			},
			
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});
		
		//keyup 이벤트로 validation 체크
		jQuery("input[type='text']").on("keyup", function(){
			var validFlag = true;
			jQuery(this).closest("li").find("input[type='text']").each(function(idx){
				if(jQuery(this).val() == ""){
					validFlag = false;
				}	
			});
		
			if(validFlag && jQuery(this).closest("li").hasClass("error")){
				jQuery(this).closest("li").removeClass("error");
				jQuery(this).closest("li").find(".alertMessage").hide();
			}
		});
		
		//전화번호  maxlength만큼 입력 시 다음 input 으로 이동
		jQuery("input[id^='idPhone']").keyup(function(idx){
			var charLimit = jQuery(this).attr("maxlength");
			if(jQuery(this).attr("role") != "last"){
				if(this.value.length >= charLimit) {
					jQuery(this).parent().next().next().find("input").focus();
					return false;
				}
			}
		});
	});
	
	function fncCancel() {
		$(".alertMessage").hide();
		
		$("#vocForm")[0].reset();
		commonJs.popClose($('#layerPop2'));
	}
	
	function fncRegist(){
		/*
		사용자 입력정보 VALIDATION 체크
		해당 열  input이 하나라도 미기재 된 경우 validation false
		최초 미입력 된 element로 focus 이동됨
		*/
		var frstIdx = "";
		jQuery(".intList li").each(function(){
			var $this = jQuery(this);
			var validYn = true;
			$this.find("input[type='text'], select").each(function(idx){
				var value = jQuery(this).val();
				var id = jQuery(this).attr("id");
				
				
				if(value == "" && id != "availableTime"){
					validYn = false;
					if(frstIdx == ""){
						frstIdx = jQuery(this);
					}
				}
			});
			
			if(!validYn){
				$this.addClass("error");
				$this.find(".alertMessage").show();
			}else{
				$this.removeClass("error");
				$this.find(".alertMessage").hide();
			}
		});
		if(frstIdx != ""){
			frstIdx.focus();
			return false;
		}
		
		var idPhone = $("#idPhone1").val()+"-"+$("#idPhone2").val()+"-"+$("#idPhone3").val();
		$("#idPhone").val(idPhone);
		if($("#langCode").val() == "ko"){
			var korNm = $("#korNm").val()
			$("#nmCust").val(korNm);
		}else{
			var engNm = $("#engLastName").val()+" "+$("#engFirstName").val();
			$("#nmCust").val(engNm);
		}
		
		$("#bnefNo").val($(".titDep1").text());
		
		// 개인정보 수집ㆍ이용 동의
		if(!jQuery("#privacyAgree").is(":checked")){
			alert("개인정보 수집ㆍ이용에 동의해주세요."); 
			jQuery("#privacyAgree").focus();
			return false;
		}

		jQuery.ajax({
			type : "POST",
			url : "/voc/regist.json",
			cache : false,
			dataType : "json",
			data : jQuery("#vocForm").serialize(),
			global : false,
			beforeSend: function (data, frm, opt) {
				//중복 등록 방지
				if(vocRegistValid){
					alert("처리중입니다.");
					return false;
				}else {
					vocRegistValid = true;
				}
			},
			success : function(data){
				var resultCode = data.resultCode;
				var resultMsg = data.resultMsg;
				commonJs.popClose($('#layerPop2'));
				if(resultCode == "SUCCESS"){
					//상담신청이 정상적으로 접수되었습니다.\r\n내용 확인 후 빠른 시일 내에 담당자가 연락드릴 예정입니다.
					alert('상담신청이 정상적으로 접수되었습니다.\r\n내용 확인 후 빠른 시일 내에 담당자가 연락드릴 예정입니다.');
				}else{
					alert(resultMsg);
				}
				vocRegistValid = false;
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});
	}
	
</script>

<!-- myContents -->
<div class="myContents">
	<h3 class="hidden">마이페이지</h3>
	<!-- 예약 확인 -->
	<h4 class="hidden">예약 확인</h4>

	<!-- loop -->
	<ul class="membershipCashList">
		<li class="noData">
		<p class="txt">예약 내역이 없습니다.<br>엘리시안 호텔의 다양한 상품을 예약해보세요.</p>
		</li>
	</ul>
	<!-- <div class="myReserveBox">
		<strong class="tit">객실 예약 내역</strong>
		<p class="txtGuide">현재부터 3개월 이후의 예약 내역을 확인할 수 있습니다.</p>
		<ul class="myReserveList">
			<li><a href="#">
				<div class="myReserveInfo">
					<dl>
					<dt>[411665] ROOM ONLY</dt>
					<dd>2024.07.16 - 2024.07.17</dd>
					</dl>
				</div>
			</a></li>
		</ul>
	
		<a href="#"> <button type="button" class="btnLine" >전체보기</button> </a>
	</div> -->
	<!-- //loop -->
</div>

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