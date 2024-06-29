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

<!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->

<!--(페이지 URL)-->
<script>
	$(function(){
		getDetail();
		
		// 이메일 셀렉 변경 시 직접입력이 아닐 경우 readonly로 변경
		$(document).on("change" , "#emailType", function(){
			const domain = $(this).val();
			if(domain == "") {
				$("#visitorEmail2").val("");
				$("#visitorEmail2").prop("readonly", false);
			} else {
				$("#visitorEmail2").val(domain);
				$("#visitorEmail2").prop("readonly", true);
			} // end else
		}); // change
	}); // ready

	//예약 내역 상세 조회 api
	function getDetail() {
		$.ajax({
			type : "POST",
			url : "diningResViewResult.do",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify({
				payNum : $("#payNum").val()
			}),
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj){
				const diningName = jsonObj.diningName;
				const visitDate = jsonObj.visitDate;
				const visitTime = jsonObj.visitTime;
				const diningResStatus = jsonObj.diningResStatus;
				const isModifiable = diningResStatus === '예약' ? true : false;       //정보 변경 가능 여부
				
				//방문자 정보
				const visitorEmail = jsonObj.visitorEmail;
				const visitorName = jsonObj.visitorName;
				const visitorPhone = jsonObj.visitorPhone;
				const visitorRequest = jsonObj.visitorRequest;
				const adultCnt = jsonObj.adultCnt;
				const childCnt = jsonObj.childCnt;
				const babyCnt = jsonObj.babyCnt;
				const visitPeople = '방문 인원 {1}명'.replace("{1}", jsonObj.visitPeople);
				const visitorCnt = `어른 \${adultCnt}명 | 어린이 \${childCnt}명 | 영유아 \${babyCnt}명`;
				
				$(".titDep2").text(diningName); //다이닝 이름
				$(".titDep4").text(diningResStatus); //예약 상태
				
				$("#preVisitorName").val(visitorName);
				$(".reserveInfo .txt").text(`엘리시안 서울 | \${visitDate} | \${visitTime} | \${visitPeople}`); //호텔 명 | 예약 시간

				$("#visitorName_ko").val(visitorName);

				// 전화번호 길이에 따라 input 분기처리 한국 전화번호 길이
				if(visitorPhone.length == 13){
					//전화 번호
					$("#visitorPhoneArea_en").remove();
					$("#visitorPhone_ko1").val(visitorPhone.split("-")[0]);
					$("#visitorPhone_ko2").val(visitorPhone.split("-")[1]);
					$("#visitorPhone_ko3").val(visitorPhone.split("-")[2]);
                } // end if

				if(visitorEmail != "" && visitorEmail != undefined) {
					const visitorEmail1 = visitorEmail.split("@")[0];
					const visitorEmail2 = visitorEmail.split("@")[1];
					$("#visitorEmail1").val(visitorEmail1);
					$("#visitorEmail2").val(visitorEmail2);
					$("#emailType").val(visitorEmail2);
					$(".ui-selectmenu-text").text(visitorEmail2);
				} // end if
				
				$("#visitorRequest").val(visitorRequest);

				//정보 수정 가능
				if (isModifiable) {
					$("#isModifiable").show();
				} // end if
	        },
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
	    }); // ajax
	} // getDetail

	function setHiddenInputVal() {
		// 이름 세팅
		$("#visitorName").val($("#visitorName_ko").val());
	
		//전화번호 세팅
		const fullPhone = $("#visitorPhone_ko1").val()+"-"+$("#visitorPhone_ko2").val()+"-"+$("#visitorPhone_ko3").val();
		$("#visitorPhone").val(fullPhone);
	
		//이메일 세팅
		if ($("#visitorEmail1").val() != "" || $("#visitorEmail2").val() != "") {
			$("#visitorEmail").val($("#visitorEmail1").val()+"@"+$("#visitorEmail2").val());
		} // end if

		//변경 scope 세팅
		//방문자 명이 바뀐 경우
		if($("#preVisitorName").val() != $("#visitorName").val()) {
			$("#scope").val("person");
		} else {
			$("#scope").val("information");
		} // end else
	} // setHiddenInputVal

	function validation() {
		const scope = $("#scope").val();
		const email = $("#visitorEmail").val();
		const phoneKo2 = $("#visitorPhone_ko2").val();
		const phoneKo3 = $("#visitorPhone_ko3").val();
		
		//이메일에 값이 있을 경우 형식 체크
		if(email != "" && !gfncVaildateEmail(email)){
			alert("이메일 형식이 잘못 되었습니다.");
			return false;
	    } // end if
	
		// 전화번호 형식 체크
	    if($("#visitorPhone_ko1").val() !== "010" || phoneKo2.length !== 4 || phoneKo3.length !== 4) {
        	alert("유효한 전화번호 형식이 아닙니다.");
        	return false;
        } // end if

        //스코프에 따라 validation 분기
		if(scope == "person") {
			// 사람이 변경되는 경우 이름, 전화번호 필수
			if($("#visitorPhone_ko1").val() === "" || $("#visitorPhone_ko2").val() === "" || $("#visitorPhone_ko3").val() === ""){
	            alert("전화 번호를 입력해 주세요 ");
	            return false;
	        } // end if
	
			// 이름 미입력시
	        if($("#visitorName").val() == ""){
				alert("이름을 입력해 주세요 ");
				return false;
			} // end if
			
			// 한글 이름 2~20자로 이름 제한
			var pattern = /^[가-힣]{2,20}$/;
			if(!pattern.test($("#visitorName").val())) {
				alert("이름은 한글 이름으로 최소 2자, 최대 20자까지 입력가능합니다.");
				return false;
			} // end if
	    } // end if
		return true;
	} // validation

	//예약 수정
	function fncUpdate(){
		setHiddenInputVal();
	
		if(!validation()) {
			return false;
		} // end if
	
	    $.ajax({
	        type : "POST",
	        url : "modifyVisitorInfo.do",
	        contentType : "application/json",
	        dataType : "json",
	        data : JSON.stringify({
	            payNum : $("#payNum").val(),
	           //scope: $("#scope").val(),
	            visitorName : $("#visitorName").val(),
	            visitorPhone : $("#visitorPhone").val(),
	            visitorEmail : $("#visitorEmail").val(),
	            visitorRequest : $("#visitorRequest").val()
	        }),
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
	        success : function(jsonObj){
	            var resultCode = jsonObj.resultCode;
	            if (resultCode == "SUCCESS") {
	                alert("방문자 정보수정이 완료 되었습니다. ");
	                fncView();
	            } else { 
	            	alert("죄송합니다. 방문자 정보수정이 정상적으로 처리되지 않았습니다. 관리자에게 문의해주세요.");
	            } // end else
	        },
	        error:function(r, s, e){
	            alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
	        }
	    }); // ajax
	} // fncUpdate

	// 예약 상세페이지
	function fncView() {
		location.href = "${pageContext.request.contextPath}/user/diningResView.do?payNum="+$("#payNum").val();
	} // fncView
</script>

<input type="hidden" id="payNum" name="payNum" value="${payNum}">
<input type="hidden" id="scope" value="information"/> <!-- 기본 변경 스코프  -->
<input type="hidden" id="preVisitorName" value=""/> <!-- 이전 예약자 이름, 변경 될 경우 변경 스코프도 변경 됨   -->
<input type="hidden" id="visitorEmail" value=""/>
<input type="hidden" id="visitorName"/>
<input type="hidden" id="visitorPhone"/>
<div id="container" class="container mypage">

<script type="text/javascript">
	$(function(){
		fncLnbInfoApi();
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
						<label for="visitorRequest">REQUEST</label>
					</span>
				</div>

				<div class="intInner requestArea">
					<input type="text" id="visitorRequest" value="" placeholder="알레르기가 있다면, 예약 시 미리 말씀해 주십시오. 유아용품이 필요하신 경우 여기에 기재해 주십시오. ">
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