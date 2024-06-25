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

<!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->

<!--(페이지 URL)-->
<script>
    $(function(){
    	setDate();
        fncGetList();
    }); // ready
    
    function setDate() {
		const today = new Date();
		
		const year = today.getFullYear();
		const month = String(today.getMonth()+1).padStart(2, '0');
		const after3month = String(today.getMonth()+4).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		
		const todayString = year+"."+month+"."+day;
		const after3monthString = year+"."+after3month+"."+day;
		
		$("#agoMonth3").prop('checked', true);	
		$("#datepickerFrom").val(todayString);
		$("#datepickerTo").val(after3monthString);
    } // setDate

    function fncGetList() {
        const searchCtgry = $("#searchCtgry").val();
        const searchDataBeginDe = $("#datepickerFrom").val();
        const searchDataEndDe = $("#datepickerTo").val();

        $.ajax({
            url : "diningResListResult.do",
            type : "POST",
            contentType : "application/json",
            dataType : "text",
            data : JSON.stringify({
            	searchCtgry  : searchCtgry,
            	searchDataBeginDe : searchDataBeginDe,
            	searchDataEndDe : searchDataEndDe,
            }),
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
         	},
            complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
            },
            success : function(jsonObj){
            	var jsonObj = JSON.parse(jsonObj);
                const result = jsonObj.result;
                let html = "";
                let count = 0;
                
                //리스트 없을 경우
                if(result == null || result.length == 0) {
                    html = `<li class="noData"><p class="txt">검색 결과가 없습니다. </p></li>`;
                } else {
                    for (let i = 0; i < result.length; i++) {
                        const visitPeople = `방문 인원 \${result[i].visitPeople}명`;
                        const payPrice = result[i].payPrice;
                        const depositInfoHtml  = result[i].payPrice ? `<br/>예약금: \${fncComma(result[i].payPrice)}KRW` : '';

                        html += `<li>
                                    <div class="cardInner">
                                        <span class="status" \${result[i].diningResStatus == 'CANCELED' ? "style='color:#B01414'" : ""}>\${result[i].diningResStatus}</span>
                                        <em class="tit">
                                        	<a href="javascript:fncView('\${result[i].payNum}')">\${result[i].diningName}</a>
                                       	</em>
                                        <p class="info">엘리시안 서울</p>
                                        <p class="date">\${result[i].visitDate} | \${result[i].visitTime} | \${visitPeople} \${depositInfoHtml}</p>
                                    </div>
                                </li>`;
                    } // end for
                    count = result.length;
                } // end else
                $(".count").text("총 {1}건".replace("{1}", count.toString())); //총 n 건
                $(".cardList").html(html);
            },
            error:function(r, s, e){
                alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
            }
        }); // ajax
    } // fncGetList

	// 예약 상세페이지
	function fncView(payNum) {
        $("#payNum").val(payNum);
		$("#form").attr("action", "diningResView.do");
	    $("#form").attr("method", "get");
	    $("#form").submit();
	} // fncView
	
	function fncSetMonth(agoMonth){
		var beginDate = new Date();
		var monthOfYear = beginDate.getMonth();
		var endDate = new Date();

		if(agoMonth != ''){
			endDate.setMonth(monthOfYear+Number(agoMonth));
			$("#datepickerFrom").val(gfncDateFormat(beginDate,'yyyy.MM.dd'));
			$("#datepickerTo").val(gfncDateFormat(endDate,'yyyy.MM.dd'));
		} else {
			$("#datepickerFrom").val("");
			$("#datepickerTo").val("");
		} // end else
	} // fncSetMonth
	
	function fncChangeDate(){
		$("input[id^=agoMonth]:checked").prop("checked", false);
	}
</script>

<form id="form" name="form">
    <input type="hidden" id="payNum" name="payNum" value=""/>
</form>

<div id="container" class="container mypage">

<script type="text/javascript">
	$(function(){
		fncLnbInfoApi();
	}); // ready
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
						<option value="SEOUL" selected="selected">엘리시안 서울</option>
					</select>
				</div>
                    
				<div class="period">
  					<span class="hidden">날짜선택</span>
					<span class="intArea">
						<input type="text" style="width:143px" title="검색 시작일" readonly="readonly"
						 		id="datepickerFrom" name="searchDataBeginDe" onchange="fncChangeDate();">
					</span>
					<span class="hBar">-</span>
					<span class="intArea">
						<input type="text" style="width:143px" title="검색 종료일" readonly="readonly"
								 id="datepickerTo" name="searchDataEndDe" onchange="fncChangeDate();">
					</span>
				</div>
				
				<div class="frmList periodOp">
					<span class="frmRadio">
						<input type="radio" id="agoMonth1" onclick="fncSetMonth('1');" name="agoMonth" value="1" />
						<label for="agoMonth1">1개월</label>
					</span>
                        
					<span class="frmRadio">
						<input type="radio" id="agoMonth3" onclick="fncSetMonth('3');" name="agoMonth" value="3" />
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
				<li>온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.</li>
				<li>방문일 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.</li>
				<li>과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.</li>
			</ul>
            </div>
			<!-- //기간조회 -->
            
			<!-- 조회목록 -->
			<div class="listBox">
			<!-- Sorting -->
			<div class="countList">
				<span class="count"></span>
 				<div class="selectWrap" style="width:200px;">
					<select id="searchCtgry" name="searchCtgry" onchange="fncGetList();">
						<option value="ALL" >전체 예약</option>
						<option value="COMPLETED" >이용완료</option>
						<option value="CONFIRMED" >예약</option>
						<option value="CANCELED" >취소</option>
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