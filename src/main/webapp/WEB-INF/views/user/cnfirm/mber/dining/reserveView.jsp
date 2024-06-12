<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="다이닝 예약내역 페이지 상세 보기" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 다이닝 예약 내역, 예약 상세보기 | 엘리시안호텔</title>

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
	
	            const result = data.result;
	
	            if (data.resultCode != "SUCCESS") {
	                alert(data.resultMsg);
	            }else {
	                const langCode = jQuery("#langCode").val();
	
	                const hotelNm = result.hotelNm;
	                const diningNm = result.diningNm;
	                const visitFullDate = result.visitFullDate;
	                const visitDateTimeStr = result.visitDateTime;
	                const personCount = result.personCount;         //방문 인원
	                const refundPolicy = result.shopInfo.refundPolicy;       //취소 정책
	                const isCancellable = result.isCancellable;     //취소 가능 여부
	                const isModifiable = result.isModifiable;       //정보 변경 가능 여부
	                const statusNm = result.statusNm;
	
	                //방문자 정보
	                const visitor = result.visitor;
	                const visitorEmail = visitor.email;
	                const visitorNm = visitor.name;
	                const visitorPhone = visitor.phone;
	                const requests = result.requests;
	
	                jQuery(".titDep2").text(diningNm);                      //다이닝 이름
	                jQuery(".titDep4").text(statusNm);                      //예약 상태 명
	                const visitorCount = '방문 인원 {1}명'.replace("{1}", personCount);
	                jQuery(".reserveInfo .txt").text(`\${hotelNm} | \${visitFullDate} | \${visitorCount}`);        //호텔 명 | 예약 시간
	
	                jQuery(".visitorEmail").text(visitorEmail);
	                jQuery(".visitorNm").text(visitorNm);
	                jQuery(".visitorPhone").text(visitorPhone);
	                jQuery(".requests").text(requests);
	
					const sellType = result.sellType;
					if (sellType === "C") {
						const selectedMenus = result.selectedMenus;
						if (selectedMenus && selectedMenus.length > 0) {
							const menuSetName = langCode === "ko" ? selectedMenus[0].menuSetName : selectedMenus[0].menuSetNameEn;
							const menuItemList = selectedMenus.map(menu => `\${menu[langCode === "ko" ? "menuItemName" : "menuItemNameEn"]}(\${menu.amount})`).join(", ");
							jQuery(".selectedMenus").text(`\${menuSetName} | \${menuItemList}`);
							jQuery(".selectedMenus").closest("tr").show();
						}
					}
	
	                //취소 가능
	                if (isCancellable) {
	                    jQuery("#cancelBtn").show();
	                }
	                
	                //정보 수정 가능
	                if (isModifiable) {
	                    jQuery("#updateBtn").show();
	                }
	
	                //방문일
	                let visitDate = new Date(visitDateTimeStr);
	                visitDate.setHours(0);
	                visitDate.setMinutes(0);
	                visitDate.setSeconds(0);
	                visitDate.setMilliseconds(0);
	
	                //조회일
	                let nowDate = new Date();
	                nowDate.setHours(0);
	                nowDate.setMinutes(0);
	                nowDate.setSeconds(0);
	                nowDate.setMilliseconds(0);
	
	                //방문일과 조회일의 날짜 차이
	                let diffDay = (visitDate - nowDate) / (1000 * 60 * 60 * 24);
	
	                let refundRate = 1;     //환불률
	                if(refundPolicy != null && refundPolicy.length != 0){
	                    jQuery(".refundPolicyTitle").show();
	                    let refundHtml = "";
	                    refundPolicy.reverse().forEach(function (item, idx){
	                        let baseDay = item.baseDay;
	                        let itemRefundRate = item.refundRate;
	                        let dayNm = "";
	                        let rateNm = "";
	
	                        // 날짜차이에 맞는 환불 규정이 있을 경우 세팅
	                        if (diffDay == baseDay) {
	                            refundRate = itemRefundRate;
	                        }
	
	                        switch (baseDay) {
	                            case -1:
	                                dayNm = "노쇼 시";
	                                break;
	                            case 0:
	                                dayNm = "당일 취소";
	                                break;
	                            default:
	                                dayNm = baseDay+"일 전 취소 ";
	                                break;
	                        }
	
	                        if (itemRefundRate > 0) {
	                            rateNm = (itemRefundRate * 100) +"% 환불 ";
	                        } else if (itemRefundRate == 0) {
	                            rateNm = "환불 불가 ";
	                        }
	
	                        refundHtml += `<li>${dayNm} : \${rateNm}</li>`;
	                    });
	                    $(".refundPolicy").html(refundHtml);
	                }
	
	                //결제금 정보
	                const deposit = result.deposit;
	                if(deposit != null){
	                    const amount = deposit.amount;                  //예약금액
	                    const refundAmount = amount * refundRate;       //최종 환불 금액
	                    const refundFee = amount - refundAmount;        //취소 수수료
	
	                    jQuery("#amount").text(fncComma(amount));
	                    jQuery("#refundAmount").text(fncComma(refundAmount));
	                    jQuery("#refundFee").text(fncComma(refundFee));
	                    jQuery("#timeInfoMsg").text("수수료 계산 기준 일시  : " + new Date().format("yyyy-MM-dd HH:mm"));
	                    jQuery(".depositAmount").text(fncComma(amount));
	                }else {
	                    //예약금이 없을 경우 예약금 부분 숨김처리
	                    jQuery(".total").hide();
	                    jQuery("#timeInfoMsgLi").hide();
	                }
	            }
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    })
	}

	//예약 취소
	function fncCancel(){
	    jQuery.ajax({
	        type : "POST",
	        url : "/resve/dining/cancel.json",
	        cache : false,
	        dataType : "json",
	        data : {
	            reservationId: jQuery("#reservationId").val(),
	            cancelReasonText: jQuery("#cancelReasonText").val()
	        },
	        global : false,
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
	     	},
	        complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
	        },
	        success : function(data){
	            const result = data.result;
	
	            if (data.resultCode != "SUCCESS") {
	                alert(data.resultMsg);
	            }else {
	                alert("취소 처리 되었습니다. ");
	                location.reload();
	            }
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    })
	}

	function fncUpdateForm() {
	    location.href = "/cnfirm/mber/dining/infoUpdateForm.do?reservationId=" + jQuery("#reservationId").val();
	};

	function fncList(){
	    location.href = '${pageContext.request.contextPath}/user/diningResList.do';
	}
</script>

<input type="hidden" id="reservationId" name="reservationId" value="_8XFRjsyWJnW2DzLHDwN7w">

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
	</div>
	<!-- //예약 정보 -->

	<!-- 방문자 정보 -->
	<h3 class="titDep3">
		방문자 정보
		<button type="button" id="updateBtn" class="btnModify" onclick="fncUpdateForm();" style="display: none;">정보수정</button>
	</h3>

	<table class="tblV">
		<colgroup>
			<col style="width:240px">
			<col style="width:auto">
		</colgroup>
	
		<caption>예약 방문자정보 목록</caption>
		<thead>
		<tbody>
			<tr>
			    <th scope="row">이름</th>
			    <td class="visitorNm"></td>
			</tr>
                    
 			<tr>
				<th scope="row">연락처</th>
				<td class="visitorPhone"></td>
			</tr>
			
			<tr>
				<th scope="row">이메일</th>
				<td class="lower visitorEmail"></td>
			</tr>
                    
			<tr>
				<th scope="row">요청사항</th>
				<td class="requests"></td>
			</tr>
                    
			<tr style="display: none;">
				<th scope="row">내역</th>
				<td class="selectedMenus"></td>
			</tr>
		</tbody>
	</table>
	<!-- //회원 정보 -->

	<!-- 금액 정보 -->
	<h3 class="hidden">금액 정보</h3>
	<div class="total noMember">
		<div class="totalWrap type02">
			<span class="tit">선 결제 금액(예약금)</span>
			<strong class="pay"><em class="depositAmount"></em>KRW</strong>
		</div>
	</div>
	<!-- //금액 정보 -->

	<!-- 취소 규정 -->
	<h3 class="titDep3 refundPolicyTitle" style="display: none">취소 규정</h3>
		<ul class="listDep1 refundPolicy"></ul>
	<!-- // 취소 규정 -->
		
	<div class="btnArea">
		<a href="#" class="btnSC btnL" onclick="fncList();">목록</a>
		<a href="#" id="cancelBtn" class="btnSC btnL active" onclick="commonJs.popShow($('#layerPop2'))" style="display: none">예약 취소</a>
	</div>

	</div>
	<!-- MyContents -->

<!-- 예약취소 Layer -->
<div id="layerPop2" class="layerPop">
    <div class="layerCont">
        <div class="reserveOpArea drDiningCancel">
            <strong class="tit">예약 취소 </strong>
            <p class="txtConfirm">예약을 취소 하시겠습니까? </p>
            <ul class="listDep1">
                <li>예약취소 시 기존 예약으로 복구가 불가합니다. </li>
                <li>취소 및 환불 정책 기준으로 예약 취소가 진행됩니다. </li>
            </ul>
            
            <div class="total">
                <div class="totalWrap">
                    <span class="tit">예약 금액</span>
                    <strong class="pay"><em id="amount"></em></strong>
                </div>
                
                <div class="totalWrap">
                    <span class="tit">취소 수수료</span>
                    <strong class="pay"><em id="refundFee"></em></strong>
                </div>
                
                <div class="totalWrap type02">
                    <span class="tit">최종 환불 금액</span>
                    <strong class="pay"><em id="refundAmount"></em>KRW</strong>
                </div>
            </div>
            
            <ul class="txtGuide" id="timeInfoMsgLi">
	            <li>취소수수료는 [예약취소] 버튼이 눌러진 시간을 기준으로 처리 됩니다. 화면상 수수료 계산 시간과 상이할 경우를 유의해 주세요. (단, 예약 후 30분 이내에 취소 시, 모든 취소수수료 미 발생)</li>
                <li id="timeInfoMsg"></li>
            </ul>
            
            <div class="btnArea">
                <button type="button" class="btnSC btnM" onclick="commonJs.popClose($('#layerPop2'))">취소 </button>
                <button type="button" class="btnSC btnM active" onclick="fncCancel();">예약 취소 </button>
            </div>
        </div>
        <button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop2'))">닫기 </button>
    </div>
</div>
<!-- //예약취소 Layer -->
		
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