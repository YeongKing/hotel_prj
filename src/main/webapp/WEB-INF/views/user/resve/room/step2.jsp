<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>객실 예약 - 옵션 선택 | 엘리시안호텔</title>

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


function getMemberSession() {
	//alert("회원 예약 버튼 클릭")
    var userId = "${sessionScope.userId}";
    
    if (!userId) {
    	//alert("회원 세션 x");
        commonJs.popShow($('#loginLayerPop'));
    } else {
    	//alert("회원 세션 o");
        fncGoStep3();
    }
}
















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








<script type="text/javascript">
	jQuery(function(){
		jQuery(document).ready(function(){
			
			//체크인 체크아웃 날짜 html 주입
			jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")
			

			
			//옵션 추가, 감소 버튼 이벤트
			jQuery("#optInfo .addOption button").on("click", function(){
				var roomIdx = jQuery(this).closest("li").data("roomidx");	//객실 인덱스
				var optType = jQuery(this).closest(".addOption").data("type");	//옵션 종류  ex) optA : 성인, optC : 어린이, optE : 엑스트라베드
				var beforeCount = parseInt(jQuery(this).closest(".numPeople").find("span").text());	//현재 옵션 갯수
				var afterCount;		//바뀔 카운트
				var btnType = jQuery(this).data("btntype"); //버튼 타입  ex) up , down
				if(btnType == "up"){
					afterCount = beforeCount + 1;
				}else if(btnType == "down" && beforeCount > 0){
					afterCount = beforeCount - 1;
				}
				//성인 옵션 갯수 세팅
				if(optType == "optA"){
					var adultCnt = jQuery("[name='adltCntArr']:eq("+roomIdx+")").val();		//해당 객실 성인 수
					if(adultCnt < afterCount){
						afterCount = beforeCount;
					}
					
					// 성인수와 옵션입력 개수가 같을 경우 추가 버튼 disabled
					if(adultCnt == afterCount){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optAQtyArr']").val(afterCount);
					
				//어린이 옵션 갯수 세팅
				}else if(optType == "optC"){
					var childCnt = jQuery("[name='chldCntArr']:eq("+roomIdx+")").val();		//해당 객실 어린이 수
					if(childCnt < afterCount){
						afterCount = beforeCount;
					}
					
					// 어린이수와 옵션입력 개수가 같을 경우 추가 버튼 disabled
					if(childCnt == afterCount){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optCQtyArr']").val(afterCount);
				//엑스트라베드 옵션 갯수 세팅
				}else if(optType == "optE"){
					if(afterCount > 1){
						afterCount = 1;
					}
					
					// 베드는 1개까지만 추가 가능 
					if(afterCount == 1){
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", true);
					}else{
						jQuery(this).closest(".addOption").find(".btnUp").attr("disabled", false);
					}
					
					jQuery(this).closest(".addOption").find("[name='optEQtyArr']").val(afterCount);
				}
				if(afterCount < 1){
					jQuery(this).addClass("blank");
				}else{
					jQuery(this).removeClass("blank");
				}
				if(afterCount > 0){
					jQuery(this).closest(".addOption").find(".btnDown").attr("disabled", false);
				}else{
					jQuery(this).closest(".addOption").find(".btnDown").attr("disabled", true);
				}
				jQuery(this).closest(".numPeople").find("span").text(afterCount);
				
				fncOptCalculate();		//전체 요금 계산
			});
		});
	});
	
	/**
		비회원 회원 전환 콜백
	*/
	function fncLoginCallBack(){
		fncGoStep3();	
	}
	/**
	객실 다시 검색 버튼 				
	*/
	function fncResvReset(){
		if(confirm("다시 검색하시겠습니까?")){ 
			location.href = "http://localhost/hotel_prj/user/room0.do";
		}
	}
	
	/**
		옵션 가격 계산				
	*/
	function fncOptCalculate(){
		var roomCnt = jQuery("#roomCnt").val();					//객실 수
		var nightCnt = parseInt(jQuery("#night").val());					//박 수
		var resvTotalAmount = 0;								//전체 객실 총 합계 가격
		var hotlSysCode = jQuery("#hotlSysCode").val();
		for(var i = 0; i < roomCnt; i++){
			var target = jQuery("#optInfo").children("li:eq("+i+")");
			var optACnt, optCCnt, optECnt = 0;					//성인, 어린이, 엑스트라베드 갯수
			var optAAmount, optCAmount, optEAmount = 0;			//성인, 어린이, 엑스트라베드 가격
			var optHtml = "";									//객실별 정보 옵션 영역 html 
			var roomAmount = parseInt(jQuery("#roomAmount"+i).val());		//객실별 객실 가격
			
			var roomTotlAmount = 0;								//객실 총 합계 가격
			var roomOptAmount = 0;								//객실,옵션 합계
			var taxAmount = 0;									//세금
			var serviceAmount = 0;								//봉사료
			//각 옵션 별 가격 및 갯수 확인
			target.find(".addOption").each(function(idx){
				if(idx == 0){
					optACnt = jQuery(this).find("[name='optAQtyArr']").val();
					optAAmount = jQuery(this).find("[name='optAAmount']").val();
				}else if(idx == 1){
					optCCnt = jQuery(this).find("[name='optCQtyArr']").val();
					optCAmount = jQuery(this).find("[name='optCAmount']").val();
				}else if(idx == 2){
					optECnt = jQuery(this).find("[name='optEQtyArr']").val();
					optEAmount = jQuery(this).find("[name='optEAmount']").val();
				}
			});
			// 성인 조식 우측 아코디언 영역 추가
			if(optACnt > 0){
				optHtml += "<li><span class=\"lfData\">성인 조식</span><span class=\"rtData\">"+fncComma(parseInt(optAAmount * optACnt * nightCnt))+"</span></li>"; //성인 조식
			}
			// 어린이 조식 우측 아코디언 영역 추가
			if(optCCnt > 0){
				optHtml += "<li><span class=\"lfData\">어린이 조식</span><span class=\"rtData\">"+fncComma(parseInt(optCAmount * optCCnt * nightCnt))+"</span></li>"; //어린이 조식
			}
			// 엑스트라베드 우측 아코디언 영역 추가
			if(optECnt > 0){
				optHtml += "<li><span class=\"lfData\">엑스트라 베드</span><span class=\"rtData\">"+fncComma(parseInt(optEAmount * optECnt * nightCnt))+"</span></li>"; //엑스트라 베드
			}
			
			// 옵션이 하나도 선택안됐을경우 옵션 영역 hide
			if(optHtml != ""){
				jQuery("#roomOptInfo"+i).show();
				jQuery("#roomOptInfo"+i).html(optHtml);
			}else{
				jQuery("#roomOptInfo"+i).hide();
			}
			
			
			
			roomOptAmount = roomAmount + parseInt(optAAmount * optACnt * nightCnt) + parseInt(optCAmount * optCCnt * nightCnt) + parseInt(optEAmount * optECnt * nightCnt);
			taxAmount = roomOptAmount / 10;
			if(hotlSysCode != "GJB" && hotlSysCode != "GJJ"){
				serviceAmount = (roomOptAmount + taxAmount) / 10;
			}
			roomTotlAmount = roomOptAmount + taxAmount + serviceAmount;	//객실 별 예약금액 합계
			resvTotalAmount += roomTotlAmount;	//총 예약금액 합계
			
			taxAmount = Math.round(taxAmount);					// 세금 반올림
			serviceAmount = Math.round(serviceAmount);			// 봉사료 반올림
			roomTotlAmount = Math.round(roomTotlAmount);		// 전체 객실요금 반올림
			resvTotalAmount = Math.round(resvTotalAmount);		// 전체 예약요금 반올림
			
			jQuery("#roomTax"+i).html(fncComma(taxAmount));
			jQuery("#roomService"+i).html(fncComma(serviceAmount));
			//jQuery("#roomAmount"+i).html(fncComma(roomTotlAmount));
			jQuery("#roomInfo").children("li:eq("+i+")").find(".listTit .price em").text(fncComma(roomTotlAmount));
		}
			jQuery("#resvTotalAmount").html(fncComma(resvTotalAmount));
	}
	/**
		스텝 3으로 이동			
	*/
	function fncGoStep3(){
		
		
		jQuery("#step2Form").attr("action", "http://localhost/hotel_prj/user/room3.do");
		jQuery("#step2Form").submit();
	}
</script>
<form action="" name="step2Form" id="step2Form" method="post">
	<input type="hidden" name="ckinDate" id="ckinDate" value="${rrVO.ckinDate}" /> 				
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="${rrVO.ckoutDate}" /> 			
	<input type="hidden" name="night" id="night" value="${rrVO.night}" /> 						
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />					
	
		<input type="hidden" name="adltCntArr" value="${rrVO.adultsNum}" />							
	
		<input type="hidden" name="chldCntArr" value="${rrVO.kidsNum}" />							
	
	
	<%-- <input type="hidden" name="roomCode" id="roomCode" value="${rrVO.roomCode}" />				 --%>
	<input type="hidden" name="adltSum" id="adltSum" value="${rrVO.adultsNum}" />					
	<input type="hidden" name="chldSum" id="chldSum" value="${rrVO.kidsNum}" />					
	
	<div id="container" class="container">
		<!-- 컨텐츠 S -->
		<h1 class="hidden">예약</h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<div class="stepWrap">
					<ol>
						<li class="prev">
							<em>객실, 요금 선택</em>
						</li>
						<li class="on">
							<span class="hidden">현재단계</span>
							<em>옵션 선택</em>
						</li>
						<li>
							<em>예약자 정보 입력</em>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- //topArea -->
		<div class="selResult">
			<div class="inner">
				<div class="infoArea">
					<dl class="dlType01">
						<dt>HOTEL</dt>
						<dd>엘리시안 서울</dd>
					</dl>
					<dl class="dlType02">
						<dt>DATE</dt>
						<dd id="dateText"></dd>
					</dl>
					<dl class="dlType03">
						<dt>ROOMS</dt>
						<dd>1</dd>
					</dl>
					<dl class="dlType03">
						<dt>ADULTS</dt>
						<dd>${rrVO.adultsNum}</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>${rrVO.kidsNum}</dd>
					</dl>
				</div>
				<a href="#none" class="btnSC btnM icoArr" onclick="fncResvReset();">객실 다시 검색</a>
			</div>
		</div>
		<!-- //selResult -->
		<div class="inner">
			<!-- rsvRoomWrap -->
			<div class="rsvRoomWrap">
				<div class="lCont">
					<h2 class="titDep2">ROOM ONLY</h2>
					<p class="categoryTxt">

						${rrVO.roomRankName} /	${rrVO.bedName}	/	${rrVO.viewName}	
						

					</p>
					<ul class="toggleList rsvList roomRsv" id="optInfo">
						
							<li class="toggleOn" data-roomidx="0"><!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<input type="hidden" name="bpArr" id="bpArr0" value="" />
								<input type="hidden" name="bpNmArr" id="bpNmArr0" value="" />
								<strong class="listTit">객실</strong>
								<button type="button" class="btnToggle">
									<span class="hidden">상세내용 보기</span>
								</button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">

										
											
                                                
												
											
	
											

										
										<h3 class="opTit">
											<label for="request01">REQUESTS</label>
										</h3>
										<textarea name="contArr"  placeholder="호텔 이용 시 문의하실 사항이 있으시면 입력해 주세요." ></textarea>
										<p class="txtGuide">전달해주신 요청사항을 최대한 반영하도록 최선을 다하겠습니다.<br/>다만, 부득이하게 반영되지 않을 수 있는 점, 양해 부탁드립니다.</p> 
									</div>
								</div>
							</li>
						
					</ul>
				</div>
				<div class="rCont floating" style="margin-top: 378.6px;">
					<ul class="toggleList rsvList" id="roomInfo">
						
						
							
							
								
									
								
								
							
							
							<li class="toggleOn"> <!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<strong class="listTit">
									객실
									<span class="price" id="roomAmount0"><em>${rrVO.payPrice}</em>KRW</span>
								</strong>
								<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">
										<div class="optionTotal scrollWrap">
											<ul class="infoData">
												
													
													<li>
														<span class="lfData"><fmt:formatNumber value="${rrVO.payPrice}" pattern="#,##0"/> KRW * ${rrVO.night} 박</span>
													</li>
												
											</ul>
											<ul class="infoData" id="roomOptInfo0" style="display:none;"></ul>

										</div>
									</div>
								</div>
							</li>	
						
					</ul>
					<div class="totalCont">
						<div class="totalPrice">
							<span class="txt">총 예약금액</span>
							


							    <span class="price">
							    	<em id="resvTotalAmount">
							        	<fmt:formatNumber value="${rrVO.payPrice * rrVO.night}" pattern="#,##0"/>
							    	</em> KRW
							    </span>
							</div>
						<div class="btnArea">
							
							
							
<!-- 								<div>
									<a href="#none" class="btnSC btnL active" onclick="fncGoStep3();">
										회원 예약
									</a>
								</div> -->
									<div>
										<a href="#none" class="btnSC btnL active" onclick="getMemberSession()">
												회원 예약
										</a>
									</div>
							
						</div>

					</div>
				</div>
			</div>
			<!-- //rsvRoomWrap -->
		</div>
		<!-- //inner -->
		<!-- 컨텐츠 E -->
	</div>

	
</form>





<script>
 $(document).ready(function(){
    var userInputId = getLoginCookie("userInputId");//저장된 쿠기값 가져오기
    $("#frm_userid").val(userInputId); 
     
    if($("#frm_userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteLoginCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#frm_userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setLoginCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteLoginCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getLoginCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

	<script type="text/javascript">
		var PageScript = function() {
			var callback = {
					execute:function(data){}
			};
		}
		
		PageScript.prototype = {
			init : function() {
				this.bindSnsLinkEvent();
			}
			,fncCloseLayerPopup : function(param_loginSeCode, callback){
				$('.dimmed').css('display', 'none');
				$('.layerPop.login').css('display', 'none');
			}
			,validate:function(){
				
				var bResult = true;
				
				/*
				사용자 입력정보 VALIDATION 체크
				해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
				최초 미입력 된 element로 focus 이동됨
				*/
				var frstIdx = "";
				$(".membersLogin p").each(function(){
					var $this = $(this);
					$this.find("input[type='text'],input[type='password']").each(function(idx){
						var validYn = true;
						var value = jQuery(this).val();
						var id = jQuery(this).attr("id");
						if(value == "" && id != "emailType"){
							validYn = false;
							if(frstIdx == ""){
								frstIdx = jQuery(this);
							}
						}
						if(!validYn){
							$this.addClass("error");
							$this.find(".alertMessage").show();
						}else{
							$this.removeClass("error");
							$this.find(".alertMessage").hide();
						}
					});
					
				});
				if(frstIdx != ""){
	  				bResult = false;
					frstIdx.focus();
					return false;
				}
				return bResult;
			}
			,fncLogin: function(param_loginSeCode) {
		        var frm_userid = "";
		        var frm_userpw = "";
		        var param_nextUrl = "";

		        // 아이디 로그인시
		        if (param_loginSeCode != "SNS") {
		            if (PageScript.validate()) {
		                frm_userid = jQuery("#frm_userid").val(); // 입력된 아이디
		                frm_userpw = jQuery("#frm_userpw").val(); // 입력된 비밀번호

		                // 아이디 입력 확인
		                if (frm_userid == "") {
		                    alert("아이디를 입력해주세요.");
		                    jQuery("#frm_userid").focus();
		                    return;
		                }

		                // 비밀번호 입력 확인
		                if (frm_userpw == "") {
		                    alert("비밀번호를 입력해주세요.");
		                    jQuery("#frm_userpw").focus();
		                    return;
		                }

		                var uVO = {
		               		 
		                	userId: frm_userid,  
		                	userPw: frm_userpw
		                    }; 

		                $.ajax({
		                    url: "http://localhost/hotel_prj/user/searchPopupLogin.do",
		                    type: "POST",
		                    data: uVO,
		                    dataType: "json",
		                    beforeSend: function(xhr, settings) {
		                        //commonJs.showLoadingBar();
		                        // alert('before=>xhr:' + JSON.stringify(xhr));
		                        // alert('before=>xhr:' + JSON.stringify(xhr) + "settings:" + JSON.stringify(settings));
		                    },
		                    success: function(result) {
		                        commonJs.closeLoadingBar();
		                        if (result.result === "fail") {
		                            alert("로그인에 실패하였습니다.");
		                            jQuery('.dimmed').show();
		                        } else if (result.result === "success") {
		                            alert("로그인에 성공하였습니다.");
		                            fncLoginCallBack(); // 로그인 콜백이 필요한 경우 해당 이름으로 function 정의해서 사용하면 가능함
		                            PageScript.fncCloseLayerPopup();
		                        }
		                    },
		                    complete: function(xhr, textStatus) {
		                        // alert('complete=>xhr:' + JSON.stringify(xhr) + ":textStatus:" + textStatus);
		                    },
		                    error: function(xhr, status, error) {
		                        alert("로그인 수행중 서버 오류가 발생하였습니다.");

		                    }
		                });
		            }
		        }
		    }
			
			,bindSnsLinkEvent : function() {
				$('.snsLogin > a').each(
					function() {
						$(this).bind('click', function() {
							var lnkType = $(this).attr('class');
							var winSize = '';
							var lnkUrl = '';
							switch (lnkType) {
							case "google":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/googleLogin.do?fromPageType=LOGIN";
								break;
							case "facebook":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/facebookLogin.do?fromPageType=LOGIN";
								//alert('준비중입니다.');
								//return;	
								break;
							case "naver":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/naverLogin.do?callbackType=login&fromPageType=LOGIN";
								break;
							case "kakao":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=LOGIN";
								break;
							case "apple":
								winSize = 'width=750,height=850';
								lnkUrl = "/sns/appleLogin.do?fromPageType=LOGIN";
								break;

							default:
								break;
							}

							window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');

						});

					});
			}
	
		}
	
		$(document).ready(function() {
			PageScript = new PageScript();
			PageScript.init();
		});
		
		function redirectNextPage(nextURL) {
			//document.location.href = nextURL;
		}
		
		function redirectPage() {
			fncLoginCallBack('Y'); //로그인 콜백이 필요한 경우 해당 이름으로 function 정의해서 사용하면 가능함
			PageScript.fncCloseLayerPopup();
		}
	</script>

	<div id="loginLayerPop" class="layerPop login" style="display:none;">
		<div class="layerCont" style="top: 50%; left: 50%; margin-top: -319.5px; margin-left: -520px;">
			<div class="compLayer">
				<h2 class="compTit">로그인<!-- 로그인 --></h2>
				<div class="compCont"><!-- 20200528 수정 : width(삭제) -->
					<div class="loginBox">
						<div class="membersLogin">
							<p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage" style="display:none;">아이디를 입력해주세요.<!-- 아이디를 입력해주세요. --></span>
								<label class="hidden" for="frm_userid">아이디</label>
								<input type="text" id="frm_userid" placeholder="아이디" aria-required="true" />
							</p>
							<p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage" style="display:none">비밀번호를 입력해주세요.</span><!-- 비밀번호를 입력해주세요. -->
								<label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 -->
								<input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" />
							</p>
							<!-- 20200528 수정 : 아이디저장(추가) -->
							<span class="frm">
								<input type="checkbox" id="idSaveCheck"><label for="idSaveCheck">아이디 저장</label><!-- 아이디 저장 -->
							</span>
							<!-- //20200528 수정 : 아이디저장(추가) -->
							<button type="button" class="btnSC btnL active btnFull" onclick= "PageScript.fncLogin('ID'); return false;" >로그인<!-- 로그인 --></button>
							<div class="loginLink">
								<a href="/identify/identifyIntro.do" class="btnS icoArr">회원가입<!-- 회원가입 --></a>
								<a href="/identify/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기<!-- 아이디 / 비밀번호 찾기 --></a>
							</div>
						</div>
						<div class="snsLogin">
							<a href="javascript:void(0);" class="google">구글 로그인<!-- 구글 로그인 --></a>
							<a href="javascript:void(0);" class="facebook">페이스북 로그인<!-- 페이스북 로그인 --></a>
							
								<a href="javascript:void(0);" class="naver">네이버 로그인<!-- 네이버 로그인 --></a>
								<a href="javascript:void(0);" class="kakao">카카오톡 로그인<!-- 카카오톡 로그인 --></a>
							
							<a href="javascript:void(0);" class="apple">애플 로그인<!-- 애플 로그인 --></a><!-- 20200528 수정 : 애플로그인(추가) -->
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="btnClose" onclick="commonJs.popClose($('#loginLayerPop'));">닫기</button>
		</div>
	</div>

		<!-- //container -->


<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->



	</div>
	<!-- //wrapper -->


<div class="dimmed"></div>
</body>
</html>

