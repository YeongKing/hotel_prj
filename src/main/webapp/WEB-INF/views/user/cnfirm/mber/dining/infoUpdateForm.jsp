<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="다이닝 방문자 정보수정" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 다이닝 예약 내역, 방문자 정보수정 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>

<body>
<div class="skip"><a href="#container">본문 바로가기</a></div>
<div class="wrapper ">

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
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->

<!--(페이지 URL)-->
<script>
	$(function(){
	    getDetail();
	
	    jQuery(document).on("change" , "#emailType", function(){
	        const domain = jQuery(this).val();
	        if(domain == ""){
	            jQuery("#visitorEmail2").val("");
	            jQuery("#visitorEmail2").prop("readonly", false);
	        }else {
				jQuery("#visitorEmail2").val(domain);
	            jQuery("#visitorEmail2").prop("readonly", true);
	        }
	    });
	});

	//예약 내역 상세 조회 api
	function getDetail() {
	    jQuery.ajax({
	        type : "GET",
	        url : "/resve/dining/detail.json",
	        cache : false,
	        dataType : "json",
	        data : {
	            reservationId: jQuery("#reservationId").val()
	        },
	        global : false,
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
	     	},
	        complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
	        },
	        success : function(data){
	            console.log(data);
	            const result = data.result;
	
	            if (data.resultCode != "SUCCESS") {
	                alert(data.resultMsg);
	            }else {
	                const hotelNm = result.hotelNm;
	                const diningNm = result.diningNm;
	                const visitFullDate = result.visitFullDate;
	                const personCount = result.personCount;         //방문 인원
	
	                const isModifiable = result.isModifiable;     //수정 가능 여부
	                const statusNm = result.statusNm;
	
	                //방문자 정보
	                const visitor = result.visitor;
	                const visitorEmail = visitor.email;
	                const visitorName = visitor.name;
	                const visitorPhone = visitor.phone;
	                const requests = result.requests;
	                const langCode = jQuery("#langCode").val();
	
	                jQuery("#preVisitorName").val(visitorName);
	
	
	                jQuery(".titDep2").text(diningNm);                      //다이닝 이름
	                jQuery(".titDep4").text(statusNm);                      //예약 상태 명
	                const visitorCount = '방문 인원 {1}명'.replace("{1}", personCount);
	                jQuery(".reserveInfo .txt").text(`${hotelNm} | ${visitFullDate} | ${visitorCount}`);        //호텔 명 | 예약 시간
	
	                //언어에 따른 input 분기처리
	                if(langCode == "ko"){
	                    //이름
	                    jQuery("#visitorNameArea_en").remove();
	                    jQuery("#visitorName_ko").val(visitorName);
	                }else {
	                    //이름
	                    jQuery("#visitorNameArea_ko").remove();
	                    if(visitorName.indexOf(" ") > -1){
	                        jQuery("#visitorName_en1").val(visitorName.split(" ")[0]);
	                        jQuery("#visitorName_en2").val(visitorName.split(" ")[1]);
	                    }else {
	                        jQuery("#visitorName_en1").val(visitorName);
	                    }
	                }
	
	                //전화번호 길이에 따라 input 분기처리
	                //한국 전화번호 길이
	                if(visitorPhone?.length == 11){
	                    //전화 번호
		                jQuery("#visitorPhoneArea_en").remove();
	                    jQuery("#visitorPhone_ko1").val(visitorPhone.substring(0, 3));
	                    jQuery("#visitorPhone_ko2").val(visitorPhone.substring(3, 7));
	                    jQuery("#visitorPhone_ko3").val(visitorPhone.substring(7, 11));
	
	                }else {
						jQuery("#visitorPhone_en").val(visitorPhone);
	                    //전화 번호
						jQuery("#visitorPhoneArea_ko").remove();
	                }
	
	                if(visitorEmail != "" && visitorEmail != undefined){
	                    const visitorEmail1 = visitorEmail.split("@")[0];
	                    const visitorEmail2 = visitorEmail.split("@")[1];
	                    jQuery("#visitorEmail1").val(visitorEmail1);
	                    jQuery("#visitorEmail2").val(visitorEmail2);
	                }
	                jQuery("#requests").val(requests);
	
	                //정보 수정 가능
	                if (isModifiable) {
	                    jQuery("#isModifiable").show();
	                }
	            }
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    })
	}

	function setHiddenInputVal() {
	    const langCode = jQuery("#langCode").val();
	
	    //언어에 따라 이름 검증 분기
	    if(langCode == "ko"){
	        jQuery("#visitorName").val(jQuery("#visitorName_ko").val());
	    }else {
	        jQuery("#visitorName").val(jQuery("#visitorName_en1").val()+ " " + jQuery("#visitorName_en2").val());
	    }
	
	    //전화번호 입력 폼 분기
	    if (jQuery("#visitorPhone_en").length) {
	        jQuery("#visitorPhone").val(jQuery("#visitorPhone_en").val());
	    }else {
	        const fullPhone = jQuery("#visitorPhone_ko1").val()+jQuery("#visitorPhone_ko2").val()+jQuery("#visitorPhone_ko3").val();
	        jQuery("#visitorPhone").val(fullPhone);
	    }
	
	    //이메일 세팅
	    if (jQuery("#visitorEmail1").val() != "" || jQuery("#visitorEmail2").val() != "") {
	        jQuery("#visitorEmail").val(jQuery("#visitorEmail1").val()+"@"+jQuery("#visitorEmail2").val());
	    }
	
	
	
	    //변경 scope 세팅
	    //방문자 명이 바뀐 경우
	    if(jQuery("#preVisitorName").val() != jQuery("#visitorName").val()){
	        jQuery("#scope").val("person");
	    }else {
	        jQuery("#scope").val("information");
	    }
	
	}

	function validation() {
	
	    const scope = jQuery("#scope").val();
	
	    const email = jQuery("#visitorEmail").val();
	
		//이메일에 값이 있을 경우 형식 체크
	    if(email != "" && !gfncVaildateEmail(email)){
	        alert("이메일 형식이 잘못 되었습니다.");   //이메일 형식이 잘못 되었습니다.
	        return false;
	    }
	
	    //스코프에 따라 validation 분기
	    if (scope == "person") {
	        // 사람이 변경되는 경우 / 이름, 전화번호 필수
	        if(jQuery("#visitorPhone").val() == ""){
	            alert("전화 번호를 입력해 주세요 ");
	            return false;
	        }
	
	        if(jQuery("#visitorName").val() == ""){
	            alert("이름을 입력해 주세요 ");
	            return false;
	        }
	    }
	    return true;
	}

	//예약 수정
	function fncUpdate(){
	
	    setHiddenInputVal();
	
	    if(!validation()){
	        return false;
	    }
	
	    jQuery.ajax({
	        type : "POST",
	        url : "/resve/dining/update/info.json",
	        cache : false,
	        dataType : "json",
	        data : {
	            reservationId: jQuery("#reservationId").val(),
	            scope: jQuery("#scope").val(),
	            visitorName: jQuery("#visitorName").val(),
	            visitorPhone: jQuery("#visitorPhone").val(),
	            visitorEmail: jQuery("#visitorEmail").val(),
	            requests: jQuery("#requests").val()
	        },
	        global : false,
	        success : function(data){
	            const result = data.result;
	
	            if (data.resultCode != "SUCCESS") {
	                alert(data.resultMsg);
	            }else {
	                alert("방문자 정보수정이 완료 되었습니다. ");
	                fncView();
	            }
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    })
	}

	// 예약 상세페이지
	function fncView() {
	    location.href = "/cnfirm/mber/dining/reserveView.do?reservationId="+jQuery("#reservationId").val();
	}
</script>

<input type="hidden" id="reservationId" name="reservationId" value="VkxISw3LOjRZ90lBVSjMDg">
<input type="hidden" id="scope" value="information"/>   <!-- 기본 변경 스코프  -->
<input type="hidden" id="preVisitorName" value=""/>   <!-- 이전 예약자 이름, 변경 될 경우 변경 스코프도 변경 됨   -->
<input type="hidden" id="visitorEmail" value=""/>
<input type="hidden" id="langCode" value="ko"/>
<input type="hidden" id="visitorName"/>
<input type="hidden" id="visitorPhone"/>
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

<h1 class="hidden">마이페이지</h1>
<div class="topArea">
	<div class="topInner">
		<h2 class="titDep1">My Page</h2>
		<p class="pageGuide">회원을 위한 다양한 혜택이 준비되어 있습니다.</p>
	</div>
</div> 

<div class="inner">
	<!-- LNB -->
	<jsp:include page="/WEB-INF/views/user/mypage/lnb.jsp"></jsp:include>
	<!-- LNB -->
	
	<!-- myContents -->
	<div class="myContents drDiningMypage">
	<h2 class="titDep2"></h2>
	
	<!-- 예약 정보 -->
	<h3 class="hidden">예약 정보 </h3>
	<div class="reserveInfo">
		<h4 class="titDep4"></h4>
		<div class="commWrap">
			<div class="commlist">
				<span class="txt"></span>
			</div>
		</div>
		
		<ul class="txtGuide">
			<li>예약업장 및 방문일시/인원 수정을 원하실 경우, 기존 예약취소 후 새로 예약해 주셔야 합니다. </li>
		</ul>
	</div>
	<!-- //예약 정보 -->

	<!-- 방문자 정보 -->
	<h3 class="titDep3 line">방문자 정보 수정 </h3>
	<div class="rsvDingList">
		<ul class="intList">
			<li>
				<div class="intWrap top">
					<span class="tit">
					<label for="visitorName">NAME</label>
					</span>
				</div>
				
				<div id="visitorNameArea_ko" class="intInner">
					<span>
						<input type="text" id="visitorName_ko" value="" placeholder="이름" style="width:437px" aria-required="true">
					</span>
				</div>
                           
				<div id="visitorNameArea_en" class="intInner duobuleInp">
					<span>
						<input type="text" id="visitorName_en1" value="" placeholder="LAST NAME" style="width:437px" aria-required="true">
					</span>
	                            
					<span>
						<input type="text" id="visitorName_en2" placeholder="FIRST NAME" style="width:440px" aria-required="true">
					</span>
				</div>
                        
			</li>
			
			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="visitorPhone">PHONE NUMBER</label>
					</span>
				</div>

				<div id="visitorPhoneArea_ko" class="intInner phoneInp">
					<span class="intArea">
						<input type="text" id="visitorPhone_ko1" value="" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9+]/g, '');">
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="visitorPhone_ko2" value="" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');">
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="visitorPhone_ko3" value="" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');">
					</span>
				</div>
				<p class="txtGuide">연락처는 업장에서 고객님께 연락드릴 경우 꼭 필요하므로 정확히 기입해 주세요.  </p>
			</li>
                        
			<li>
     			<div class="intWrap">
					<span class="tit">
						<label for="visitorEmail1">E-MAIL</label>
					</span>
				</div>
                            
				<div class="intInner emailInp">
					<span>
						<input type="text" id="visitorEmail1" value="" style="width:273px" aria-required="true">
					</span>
                    <span class="dash">@</span>
					<span>
						<input type="text" id="visitorEmail2" value="" style="width:273px" aria-required="true">
					</span>
					
					<div class="intArea selectWrap" style="width:273px" first="true">
						<select name="emailType" id="emailType" class="form-control"   title="booker" >
							<option value="">직접 입력</option>
							<option value="naver.com" >naver.com</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="hotmail.com" >hotmail.com</option>
							<option value="nate.com" >nate.com</option>
							<option value="gmail.com" >gmail.com</option>
						</select>
					</div>
				</div>
			</li>
                        
			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="requests">REQUEST</label>
					</span>
				</div>

				<div class="intInner requestArea">
					<input type="text" id="requests" value="" placeholder="알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오. ">
				</div>
                            
				<p class="txtGuide">요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br>다만, 호텔의 사정으로 부득이 반영되지 않을 수도 있으니 이 점 양해 부탁드립니다. </p>
			</li>
		</ul>
	</div>
	<!-- 방문자 정보 -->

	<div class="btnArea">
		<a href="#" onclick="fncView(); return false;" class="btnSC btnL">취소 </a>
		<a href="#" onclick="fncUpdate(); return false;" class="btnSC btnL active">수정 </a>
	</div>
	
	</div>
	<!-- MyContents -->

</div>
<!-- //inner -->
	
</div>
<!-- //container -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->
</body>
</html>