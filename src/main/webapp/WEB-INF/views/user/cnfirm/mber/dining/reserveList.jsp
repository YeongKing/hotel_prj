<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="다이닝 예약내역 페이지 메인" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>예약내역 - 다이닝 예약 내역 | 엘리시안호텔</title>

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
        fncGetList();
    });

    function fncGetList() {
        const statusCode = jQuery("#statusCode").val();
        const visitFrom = jQuery("#datepickerFrom").val();
        const visitTo = jQuery("#datepickerTo").val();
        const searchSysCode = jQuery("#searchDataValue").val();

        if (visitFrom != "" && visitTo == "") {
            alert("검색 종료일을 입력해 주세요.");	//검색 종료일을 입력해 주세요.
            jQuery("#datepickerTo").focus();
            return false;
        }else if (visitTo != "" && visitFrom == "") {
            alert("검색 시작일을 입력해 주세요."); //검색 시작일을 입력해 주세요.
            jQuery("#datepickerFrom").focus();
            return false;
        }

        jQuery.ajax({
            type : "GET",
            url : "/resve/dining/list.json",
            cache : false,
            dataType : "json",
            data : {
                statusCode  : statusCode,
                visitFrom   : visitFrom,
                visitTo : visitTo,
                searchSysCode   : searchSysCode
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

                    let html = "";
                    const list = result;   //예약 list
                    let count = 0;
                    
                    //리스트 없을 경우
                    if(list == null || list.length == 0){
                        html = `<li class="noData"><p class="txt">검색 결과가 없습니다. </p></li>`;
                    }else {
                        for (let i = 0; i < list.length; i++) {
                            const visitorInfo = '방문 인원 {1}명'.replace("{1}", list[i].personCount);
                            const deposit = list[i].deposit;
                            const depositInfoHtml  = list[i].deposit ? `<br/>예약금: \${fncComma(list[i].deposit.amount)}KRW` : '';

                            html += `<li>
                                        <div class="cardInner">
                                            <span class="status">${list[i].statusNm}</span>
                                            <em class="tit"><a href="javascript:fncView('${list[i].reservationId}')">${list[i].diningNm}</a></em>
                                            <p class="info">${list[i].hotelNm}</p>
                                            <p class="date">${list[i].visitFullDate} | ${visitorInfo } ${depositInfoHtml}
											</p>
                                        </div>
                                    </li>`;
                        }
                        count = list.length;
                    }
                    jQuery(".count").text("총 {1} 건".replace("{1}", count.toString()));    //총 n 건
                    jQuery(".cardList").html(html);
                }
            },
            error:function(r, s, e){
                alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
            }
        });
    }

	// 예약 상세페이지
	function fncView(reservationId) {
        jQuery("#reservationId").val(reservationId);
		jQuery("#form").attr("action", "/cnfirm/mber/dining/reserveView.do");
	    jQuery("#form").attr("method", "get");
	    jQuery("#form").submit();
	}
	
	function fncSetMonth(agoMonth){
		var beginDate = new Date();
		var monthOfYear = beginDate.getMonth();
		var endDate = new Date();

		if(agoMonth != ''){
			endDate.setMonth(monthOfYear+Number(agoMonth));
			jQuery("#datepickerFrom").val(gfncDateFormat(beginDate,'yyyy.MM.dd'));
			jQuery("#datepickerTo").val(gfncDateFormat(endDate,'yyyy.MM.dd'));
		}else{
			jQuery("#datepickerFrom").val("");
			jQuery("#datepickerTo").val("");
		}
	}
	
	function fncChangeDate(){
		$("input[id^=agoMonth]:checked").prop("checked", false);
	}
</script>

<form id="form" name="form">
    <input type="hidden" id="reservationId" name="reservationId" value=""/>
</form>

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
	<div class="myContents">
		<h3 class="titDep2">예약확인</h3>
		<ul class="tabType01 tabType02">
			<li><a href="http://localhost/hotel_prj/user/roomResList.do">객실</a></li>
			<li class="on"><a href="http://localhost/hotel_prj/user/diningResList.do">다이닝</a></li>
		</ul>
		
		<!-- tabCont(다이닝) -->
		<div id="tab01" class="tabCont" style="display:block">
		<h3 class="hidden">다이닝 </h3>
			<!-- 기간조회 -->
			<div class="searchBox">
 			<div class="searchOp">
				<span class="hidden">기간 조회</span>
				
				<div id="hotlSel" class="selectWrap" style="width:346px">
					<select data-height="150px" data-direction="down" id="searchDataValue" name="searchDataValue" style="display: none;" title="전체 호텔">
						<option value="엘리시안 서울" selected="selected">엘리시안 서울</option>
					</select>
				</div>
                    
				<div class="period">
  					<span class="hidden">날짜선택</span>
					<span class="intArea">
						<input type="text" value="" style="width:143px" title="검색 시작일" readonly id="datepickerFrom" name="searchDataBeginDe" onchange="fncChangeDate();">
					</span>
					<span class="hBar">-</span>
					<span class="intArea"><input type="text" value="" style="width:143px" title="검색 종료일" readonly id="datepickerTo" name="searchDataEndDe" onchange="fncChangeDate();"></span>
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
						<input type="radio" id="agoMonth6" onclick="fncSetMonth('6');" name="agoMonth" value="6" />
						<label for="agoMonth6">6개월</label>
					</span>
				</div>
			</div>
                
			<div class="btnWrap">
				<a href="#" class="btnSC btnM" role="button" onclick="fncGetList(); return false;">기간 조회</a>
			</div>
			
			<ul class="txtGuide">
				<li>온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.</li><!-- 온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1까지 제공됩니다. -->
				<li>예약날짜 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.</li><!-- 예약날짜 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다. -->
				<li>과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.</li><!-- 과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오. -->
			</ul>
            </div>
			<!-- //기간조회 -->
            
			<!-- 조회목록 -->
			<div class="listBox">
			<!-- Sorting -->
			<div class="countList">
				<span class="count"></span>
 				<div class="selectWrap" style="width:200px;">
					<select name="statusCode" id="statusCode"  onchange="fncGetList();">
						<option value="">전체 예약</option>
						<option value="COMPLETED" >이용완료</option>
						<option value="CONFIRMED" >예약</option>
						<option value="CANCELLED" >취소</option>
						<option value="NO-SHOW" >NO SHOW</option>
					</select>
				</div>
			</div>
			<!-- //Sorting -->
			
			<ul class="cardList reserveInfo">

			</ul>
            </div>
            <!-- 조회목록 -->
        </div>
        <!-- //tabCont(다이닝) -->
	</div>
	<!-- myContents -->
		
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