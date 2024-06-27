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

<title>객실 예약 - 호텔, 투숙기간, 객실 선택 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
  <link href="/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
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
















<script type="text/javascript">
//2022-07-27 추가, 쿼리 파라미터 숨김처리
history.replaceState({}, null, location.pathname);
jQuery(function(){
	
	if("" != ""){
		alert("");
	}
	
	//제주 [오픈날짜 하드코딩]
	var gjjOpenDate = new Date(2021, 00, 08); // 티져 오픈 날짜
	jQuery(document).ready(function(){
		
		jQuery("button").attr("type", "button");
		
		//체크인 체크아웃 초기 정보 세팅
		var initToday = new Date();
		
		//그랜드 조선 제주 티져 날짜 대응
		if(jQuery("#hotlSysCode").val() == "GJJ"){
			//제주 [오픈날짜 하드코딩]
			if(initToday < gjjOpenDate){
				initToday = gjjOpenDate;
			}
		}
		
		fncSetCalendarDate(initToday);
		
	});

	
	/*
		호텔 선택 AREA 클릭 이벤트
	*/
	jQuery(".frmList input[type='radio']").on("click", function(){
		var hotlSysCode = jQuery(this).val();
		var hotelNm = jQuery(this).next().text();
		
		
		// ============== 객실 및 인원 선택 초기화 start ==================
		
		jQuery("#roomCnt").val("1");
		//인원 hidden value 초기화
		
		jQuery("input[name='adltCntArr']").val("0");
		jQuery("input[name='adltCntArr']").first().val("2");
		jQuery("input[name='chldCntArr']").val("0");
		
		//인원 text 초기화
		jQuery("[name='adltCntArr']").siblings("span").children().text("0");
		jQuery("[name='adltCntArr']").first().siblings("span").children().text("2");
		jQuery("[name='chldCntArr']").siblings("span").children().text("0");
		
		jQuery("#roomText").html("객실&nbsp;1개<span>성인&nbsp;2명</span>");
		
		//css 적용
		jQuery(".btnUp").removeClass("blank");
		jQuery(".btnDown").addClass("blank");
		jQuery(".btnDown").first().removeClass("blank");
		
		jQuery(".roomSel").removeClass("on");
		jQuery(".roomSel").first().addClass("on");
		
		
		// ============== 객실 및 인원 선택 초기화 start ==================
		
		
	
			jQuery('.rsvList li.toggleOn').next('li').find('.btnToggle').trigger('click_checkDate');
			jQuery("#hotelNm").html(hotelNm);
			jQuery("#hotlSysCode").val(hotlSysCode);
			
			/* 그랜드 조선 제주 티져 오픈 날짜 대응 */
			var today = new Date(); //오늘 날짜
			
		
	});
	/**
		성인,어린이 인원 수 추가/감소 Click Event
	*/
	jQuery(".numPeople button").on("click", function(){
		var target = jQuery(this).closest(".numPeople").data("target"); //성인, 어린이 여부
		var appendYn = jQuery(this).hasClass("btnUp"); //증가, 감소 여부
		var peopleCnt = jQuery(this).closest(".numPeople").find("input").val(); //현재 인원 수 
		var roomCnt = 0;
		var roomNum = jQuery(this).closest(".numWrap").attr("data-roomNum"); //현재 선택한 객실 번호
		var totalAdultCnt = 0; //총 성인 수
		var totalChildCnt = 0; //총 어린이 수
        var hotlSysCodeValue = jQuery("#hotlSysCode").val();
		var maxAdlt = jQuery("#maxAdlt").val();
		var maxChld = jQuery("#maxChld").val();

		
		if(roomNum != "1" && jQuery(".roomSel:eq("+parseInt(roomNum-2)+") input[name='adltCntArr']").val() == "0"){
			//alert("이전객실부터 선택하셈");
			return false;
		}
		
		//인원 추가
		if(appendYn){
			//객실 1이 아니고 성인 0명인 경우에 어린이 증가 시
			if(roomNum != "1" && target == "child" && jQuery("input[name='adltCntArr']:eq("+parseInt(roomNum-1)+")").val() < 1){
				peopleCnt = parseInt(peopleCnt);
			//현재 인원에  + 1시켜주기
			}else{
				if(target == "child" && parseInt(peopleCnt)< maxChld ){
					peopleCnt = parseInt(peopleCnt) + 1;	
				}else if(target == "adult" && parseInt(peopleCnt)< maxAdlt){
					peopleCnt = parseInt(peopleCnt) + 1;	
				}
			}


			
		//인원 감소
		}else{
			//기존 인원이 1이상인 경우에만 인원 감소 시켜줌
			if(peopleCnt > 0){
				//1번 객실의 경우 성인은 1명보다 더 감소시킬 수 없음
				if(roomNum == "1" && target == "adult" && peopleCnt == "1"){
					peopleCnt = parseInt(peopleCnt);
				}else{
					peopleCnt = parseInt(peopleCnt) - 1;	
				}
			}
		}
		
		//1명 이상인 경우에 -버튼에 불 켜주기
		if(0 < peopleCnt){
			jQuery(this).closest(".numPeople").find(".btnDown").removeClass("blank");
		}else{
			jQuery(this).closest(".numPeople").find(".btnDown").addClass("blank");
		}
		
		var maxCnt = target == "adult" ? maxAdlt : maxChld;
		
		if(maxCnt == peopleCnt){
			jQuery(this).closest(".numPeople").find(".btnUp").addClass("blank");
		}else{
			jQuery(this).closest(".numPeople").find(".btnUp").removeClass("blank");
		}
		
		//input에 데이터 넣기
		jQuery(this).closest(".numPeople").find("input").val(peopleCnt);
		
		//성인 수가 0명인 경우
		if(peopleCnt == 0 && target == "adult" ){
			//해당 영역 불끄기
			jQuery(".roomSel:eq("+parseInt(roomNum-1)+")").removeClass("on");
			
			//어린이 수 강제로 0명 만들기
			jQuery(this).closest(".roomSel").find(".numPeople[data-target='child'] input").val("0");
			jQuery(this).closest(".roomSel").find(".numPeople[data-target='child'] span em").text("0");
			jQuery(this).closest(".roomSel").find(".numPeople button[class='btnDown']").addClass("blank");
			
			//객실 2번에 성인이 0명인 경우 객실 3번의 인원수를 초기화 한다
			if(roomNum == "2"){
				jQuery(".roomSel:eq(2)").removeClass("on");
				jQuery(".roomSel:eq(2) input").val("0");
				jQuery(".roomSel:eq(2) span em").text("0");
				jQuery(".roomSel:eq(2) button").each(function(){
					if(jQuery(this).hasClass("btnDown")){
						jQuery(this).addClass("blank");
					}
				});
			}
		}else{
			if(jQuery(this).closest(".roomSel").find(".numPeople[data-target='adult'] input").val() != "0"){
				jQuery(".roomSel:eq("+parseInt(roomNum-1)+")").addClass("on");	
			}
		}
		
		//인원 수 텍스트 교체
		jQuery(this).closest(".numPeople").find("span em").text(peopleCnt);	
		
		jQuery(".roomSel.on").each(function(){
			jQuery(this).find(".numPeople").each(function(){
				var cntTarget = jQuery(this).attr("data-target");
				if(cntTarget =="adult"){
					totalAdultCnt += parseInt(jQuery(this).find("input").val());
				}else{
					totalChildCnt += parseInt(jQuery(this).find("input").val());
				}
			});
		});
		
		roomCnt = jQuery(".roomSel.on").length;
		//객실 수 값 변경
		jQuery("#roomCnt").val(roomCnt);
		//객실 및 인원 선택 아코디언 텍스트 수정
		
		
			
				if(totalChildCnt != 0){
					jQuery("#roomText").html("객실&nbsp;"+roomCnt+"개<span>성인&nbsp;"+totalAdultCnt+"명</span><span>어린이&nbsp;"+totalChildCnt+"명</span>");	
				}else{
					jQuery("#roomText").html("객실&nbsp;"+roomCnt+"개<span>성인&nbsp;"+totalAdultCnt+"명</span>");
				}
			
			
		
		
	});
});

//check in, check out 날짜 , 달력 세팅을 위한 fnc
function fncSetCalendarDate(startDate){
	
	var nightTxt = '박';
	
	//달력 라이브러리 예약 가능 날짜 수정
	var setCalendarEndDate = new Date(startDate);
	setCalendarEndDate.setDate(365);
	commonJs.calendarMgr._resetDate($( ".calContainer" ), startDate, setCalendarEndDate);
	
	var setCalendarStartDate = new Date(startDate);
	var setCkinDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckinDate").val(setCkinDate);

	setCalendarStartDate.setDate(setCalendarStartDate.getDate() + 1);
	var setCkoutDate = setCalendarStartDate.getFullYear()+"."+("0"+(setCalendarStartDate.getMonth()+1)).slice(-2)+"."+("0"+(setCalendarStartDate.getDate())).slice(-2);
	jQuery("#ckoutDate").val(setCkoutDate);
	
	jQuery("#dateText").html(setCkinDate + "&nbsp;" + dUtils.getDateToDay(setCkinDate) + "&nbsp;-&nbsp;" + setCkoutDate + "&nbsp;" + dUtils.getDateToDay(setCkoutDate) + "<span>"+ dUtils.dateDiff(setCkinDate, setCkoutDate)+" "+nightTxt +"</span>");
	jQuery("#night").val(dUtils.dateDiff(setCkinDate, setCkoutDate));
	
}

function fncSearchList(){
	
	$('#adultsNum').val($('input[name="adltCntArr"]').val());
	$('#kidsNum').val( $('input[name="chldCntArr"]').val());
	//validation check
	if(jQuery("#hotlSysCode").val() == ""){
		// 호텔 시스템 코드 없음
		alert("호텔을 선택해주세요."); 
		return false;
	}
	if(jQuery("#ckinDate").val() == "" || jQuery("#ckoutDate").val() == ""){
		// 체크인, 체크아웃 날짜 미선택
		alert("투숙기간을 선택해주세요."); 
		return false;
	}
	commonJs.showLoadingBar();
	jQuery("#step0Form").attr("action", "http://localhost/hotel_prj/user/room1.do");
	 		//alert("선택된 호텔코드 : "+$("#hotlSysCode").val() + "\n" + 
	"체크인 날짜 : " +$("#ckinDate").val() + "\n" +
	"체크아웃 날짜 : " + $("#ckoutDate").val() + "\n" +
	"어른 : " +   $('input[name="adltCntArr"]').val() + "\n" +
	"어린이 : " +  $('input[name="chldCntArr"]').val()); 
	jQuery("#step0Form").submit();
}
</script>
<form id="step0Form" name="step0Form" method="post" >
	
		
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS"/> 	
	<input type="hidden" name="ckinDate" id="ckinDate" value="" /> 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="" /> 			
	<input type="hidden" name="night" id="night" value="" />					
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />				
	<input type="hidden" name="maxAdlt" id="maxAdlt" value="6" />								
	<input type="hidden" name="maxChld" id="maxChld" value="2" />		
	
						
	<input type="hidden" name="adultsNum" id="adultsNum" value="" />				
	<input type="hidden" name="kidsNum" id="kidsNum" value="" />	
	
	
	
	
	
	
	
	
	
	
	
							
	<div id="container" class="container">
		<!-- 컨텐츠 S --> 
		<h1 class="hidden">예약<!-- 예약 --></h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<p class="pageGuide">엘리시안호텔의 다양하고 감각적인 인테리어와 특별한 여유를<br> 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.</p> 
			</div>
		</div>
		<!-- //topArea -->
		<div class="inner">
			
			<ul class="toggleList rsvList checkDate">
				
					<li>
						<strong class="listTit">호텔명<!--  호텔 선택--></strong>
						<em class="intValue" id="hotelNm">엘리시안 서울</em>
						<button type="button" class="btnToggle">
							<span class="hidden">상세내용 보기<!--  상세내용 보기--></span>
						</button> <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐, disabled 속성 추가시 비활성화 -->
						<div class="toggleCont">
							<div class="toggleInner">
								<div class="hotelSel">
									<ul class="frmList">
												<li class="frmRadio">
													<input type="radio" id="hotelCode1" name="frmRdo" value="ELS" checked="checked" >
													<label for="hotelCode1">엘리시안 서울</label>
												</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- //toggleCont -->
					</li>
				
				<li class="toggleOn">
					<strong class="listTit">투숙기간 선택</strong>
					<em class="intValue" id="dateText"></em> 
					<button type="button" class="btnToggle">
						<span class="hidden">상세내용 보기</span>
					</button>
					<div class="toggleCont" style="display: block;">
						<div class="toggleInner">
							<div class="calContainer"></div>
						</div>
					</div>
					<!-- //toggleCont -->
				</li>
				<li>
					<strong class="listTit">객실 및 인원 선택</strong>
					<em class="intValue" id="roomText">
						객실 1개
						<span>
							성인 2명
							
						</span>
					</em> 
					<button type="button" class="btnToggle">
						<span class="hidden">상세내용 보기</span>
					</button>
					<div class="toggleCont">
						<div class="toggleInner">
							<div class="roomContainer">
								<div class="roomWrap">
									<div class="roomSel on">
										<div class="roomInner">
											<strong class="roomTit">객실</strong>
											<div class="numWrap" data-roomNum="1">
												<div class="numPeople" data-target="adult">
													<input type="hidden" name="adltCntArr" value="2"/>
													<button type="button" class="btnDown">인원 수 감소</button>
													<span>성인 <em>2</em></span>
													<button type="button" class="btnUp">인원 수 증가</button>
												</div>
												<div class="numPeople" data-target="child">
													<input type="hidden" name="chldCntArr" value="0"/>
													<button type="button" class="btnDown">인원 수 감소</button>
													<span>어린이 <em>0</em></span>
													<button type="button" class="btnUp">인원 수 증가</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- //roomWrap -->

							</div>
							<!-- //roomContainer -->
							<div class="btnArea">
								<a href="#none" class="btnSC btnL active" onclick="fncSearchList();">객실 검색</a>
							</div>
						</div>
					</div>
					<!-- //toggleCont -->
				</li>
			</ul>
			<!-- //toggleList -->
		</div>
		<!-- //inner -->
		<!-- 컨텐츠 E -->
	</div>
</form>
		<!-- //container -->
		
		
		
       <!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
 		
	</div>
	<!-- //wrapper -->

<div class="dimmed"></div>
</body>
</html>

