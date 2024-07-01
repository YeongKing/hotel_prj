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

<title>개인정보관리 - 회원정보수정 | 엘리시안호텔</title>

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

<!-- S header -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!-- E header -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	//체크박스 클릭시 실행
	$(function() {
		changeEmail();
		// 페이지 로딩 시 선택된 이메일 유형이 직접입력이라면 readonly false, 그렇지 않으면 true
		if($("#emailType").val() == "") {
			$("#email2").prop("readonly", false);
		} else {
			$("#email2").prop("readonly", true);
		} // end else
	}); // ready
	
	function changeEmail() {
		// 이메일 유형 선택 시 처리
		$("#emailType").on("change", function() {
			var value = $(this).val();
			if(value == "") {
				$("#email2").val("");
				$("#email2").prop("readonly", false);
			} else {
				$("#email2").val(value);
				$("#email2").prop("readonly", true);
			} // end else
		});
	} // changeEmail
	
    /*---------------주소검색 시작--------------------------------- */
	var themeObj = {
		   bgColor: "#162525", //바탕 배경색
		   searchBgColor: "#162525", //검색창 배경색
		   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   pageBgColor: "#162525", //페이지 배경색
		   textColor: "#FFFFFF", //기본 글자색
		   queryTextColor: "#FFFFFF", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   outlineColor: "#444444" //테두리
	};
	    
	//신주소 입력
	function execDaumPostcode() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	
	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var addr = ''; // 주소 변수
	        var extraAddr = ''; // 참고항목 변수
	
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	
	        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	        if(data.userSelectedType === 'R'){
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }
	            // 조합된 참고항목을 해당 필드에 넣는다.
	            //document.getElementById("sample2_extraAddress").value = extraAddr;
	
	        } else {
	            //document.getElementById("sample2_extraAddress").value = '';
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('postcode').value = data.zonecode;
	        document.getElementById("address").value = addr;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("detailAddress").focus();
	    }
	}).open();
	}
	
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');
	
	function closeDaumPostcode() {
	    // iframe을 넣은 element를 안보이게 한다.
	    element_layer.style.display = 'none';
	}
	
	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition(){
	    var width = 300; //우편번호서비스가 들어갈 element의 width
	    var height = 400; //우편번호서비스가 들어갈 element의 height
	    var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	    // 위에서 선언한 값들을 실제 element에 넣는다.
	    element_layer.style.width = width + 'px';
	    element_layer.style.height = height + 'px';
	    element_layer.style.border = borderWidth + 'px solid';
	    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	}
	/*-------------------------주소검색 종료--------------------------------- */
	    
	//이메일 중복체크 API호출
 	function fncEmlDupChk() {
		 var email1		= $.trim($("#email1").val());			// 이메일1 입력
		 var email2		= $.trim($("#email2").val());			// 이메일2 입력
		 var email 		= email1 + "@" + email2;						       // 이메일조합
		 $("#email").val(email);
		var formData =  $("#formMypage").serialize();
		
 		$.ajax({
			type : "POST",
			 url : "checkDupEmail.do", 
			data : formData, 
			dataType : "json",
			success : function(jsonObj) {
				if(jsonObj.dupResult==='SUCCESS') { 
                      alert("사용가능한 email입니다.");			
                      //이메일 중복체크 확인여부
                      $("#emailDupChkYn").val("Y");
				} else {
					alert("이미 사용중인 email입니다.");
				} // end 
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		}); // ajax
 	} // fncEmlDupChk
 	
	//개인정보 수정 API호출
 	function fncMyInfoUpdApi() {
 		 var email1		= $.trim($("#email1").val());			// 이메일1 입력
		 var email2		= $.trim($("#email2").val());			// 이메일2 입력
		 var email 		= email1 + "@" + email2;						       // 이메일조합
		 var nationCode =  $("#nationCode option:selected").val();
		 //국가코드세팅
		 $("#nationCodeH").val(nationCode);

		 /*----------입력된 이메일 기입력된 이메일과 다를시 중복체크 실행체크 start--------------  */
		 //기 중복체그 이메일정보 
		 var exEmail = $("#email").val();
		 if(email!=exEmail) {
			 alert("이메일 중복체크가 필요합니다.");
			 $("#emlDupChkBtn").focus();
			 return;
		 } else{
		  //이메일세팅
		  $("#email").val(email);
		 } // end else
		 
		 /*----------입력된 이메일 기입력된 이메일과 다를시 중복체크 실행체크 end--------------  */
		 
		 // 휴대폰번호
		 var telFrstNo = $("#telFrstNo").val();
		 var telMidNo = $("#telMidNo").val();
		 var telIndNo = $("#telIndNo").val();
		 var fullPhone = telFrstNo + "-" + telMidNo + "-" + telIndNo;
		 		 
		 // 영어 이름 체크
		 if($("#eName1").val() == "" || $("#eName2").val() == "") {
			 alert("영어 이름을 입력해주세요.");
			 
			 if($("#eName1").val() == "") {
				 $("#eName1").focus();
			 } else {
				 $("#eName2").focus();
			 } // end else
			 return;
		 } // end if
         
        // 주소 validation
        if($("#postcode").val() == "" || $("#address").val() == "" || $("#detailAddress").val() == "") {
            alert("주소를 입력해주세요.");
            $("#postcode").focus();
            return;
        } // end if
		 
		// 수정 클릭 시 ajax전송
 	 	$.ajax({
			type : "POST",
			url : "modifyMemberInfo.do",
		 	contentType : "application/json",	
			dataType : "json",
			data : JSON.stringify({
				engLName : $("#eName1").val().trim(),
      			engFName : $("#eName2").val().trim(),
     			nationalCode : nationCode,
     			phone : fullPhone,
     			zipcode : $("#postcode").val(),
     			address : $("#address").val(),
     			addressDetail : $("#detailAddress").val(),
     			email : email	
			}), 
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj) {
				if(jsonObj.resultCode == 'SUCCESS') { 
                    alert("회원정보가 수정되었습니다.");
                    location.href = "${pageContext.request.contextPath}/user/mypage.do";
				} else{
					alert("죄송합니다. 회원정보수정이 정상적으로 처리되지 않았습니다. 관리자에게 문의해 주세요.");
				}
			},
			error: function() {
				alert("죄송합니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.");
			}
		});  
 	} 
 	
 	// 휴대폰 인증번호 요청 ajax 및 번호 확인 창 동적 추가
 	function fncCheckRequestNum() {
 		var authName = $("#authName").val();
 		var authPhone = $("#authPhone").val();
 		var defaultInfo = $(".defaultInfo").text();
 		var phonePattern = /^010([0-9]{4})([0-9]{4})$/;
 		
 		if(authName === '' || authName.length === 1) {
 			alert("이름을 정확히 입력해 주세요.");
 			return;
		} // end if
		
		console.log(authName);
		console.log(defaultInfo.substring(0, defaultInfo.indexOf("/")));
		
		if(authName !== defaultInfo.substring(0, defaultInfo.indexOf("/")).trim()) {
			alert("가입자와 동일한 이름이 아닙니다.");
			return;
		} // end if
		
		if(!phonePattern.test(authPhone)) {
			alert("휴대폰번호 11자리를 정확히 입력해 주세요.");
			return;
		} // end if
 		
		$.ajax({
			url : "send-one.do",
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify({authPhone : authPhone}),
			beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
			success : function(jsonObj) {
				var randomNum = jsonObj.randomNum;
				var statusMessage = jsonObj.statusMessage;
				var statusCode = jsonObj.statusCode;
				
				if(statusCode !== '2000') { // 문자 전송 실패
					alert("죄송합니다. 잠시 후 다시 시도해 주세요. 문제가 지속될 경우 관리자에게 문의주시기 바랍니다.");
					console.log(statusMessage);
					$(".dimmed").show();
					return;
				} // end if
				
				// 문자 전송 성공이라면
		 		$("#btnRequestNum").prop('disabled', true);
		 		var html = `<li>
								<div class="intWrap">
								<span class="txtConfirm">
									<label for=authNumber>인증번호</label>
									<span class="essential">*</span>
								</span>
								</div>
							
								<div class="intInner authNumberInput">
									<span class="intArea">
										<input type="text" id="authNumber" placeholder="숫자 6자리" style="width:500px" onkeyup="this.value=this.value.replace(/[^0-9]/gi, '').slice(0, 6);">
									</span>
						       	 	<button type="button" class="btnSC btnM active" onclick="fncCheckAuthNumber(); return false;">확인</button>
						        </div>
					    	</li>`;
				$("#layerPop2 .intList").append(html);
				alert("인증 문자가 발송되었습니다.");
		 		$("#newNumber").val(authPhone);
				$("#randomNum").val(randomNum);
				$(".dimmed").show();
			},
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		}); // ajax
 	} // fncCheckRequestNum
 	
 	// 번호 확인 ajax
 	function fncCheckAuthNumber() {
 		if($("#authNumber").val() === $("#randomNum").val()){
 			alert("인증 성공");
 			var newNumber = $("#newNumber").val();
 			var telFrstNo = newNumber.substring(0, 3);
 			var telMidNo = newNumber.substring(3, 7);
 			var telIndNo = newNumber.substring(7);
 			
 			$("#telFrstNo").val(telFrstNo);
 			$("#telMidNo").val(telMidNo);
 			$("#telIndNo").val(telIndNo);
 			commonJs.popClose($('#layerPop2'));
 		} else {
 			alert("본인인증에 실패하였습니다. 다시 시도해 주세요.");
 			location.reload();
 		} // end else
 	}
</script>

<c:set var="mDomain" value="${memberDomain}"/>
 
<!-- 휴대폰 본인인증 사용 -->
<input type='hidden' id='randomNum' value='' />
<input type='hidden' id='newNumber' value='' />
<!-- 휴대폰 본인인증 사용 -->
 
<form id="formMypage" >
<!--이메일 중복체크 실행여부  -->
<input type="hidden" id="emailDupChkYn" name="emailDupChkYn"  />
<!-- 수정 hidden 입력값(이메일/국가코드)  --> 
<input type="hidden" id="nationCodeH" name="nationCodeH" value="${mDomain.nationalCode}" />
<input type="hidden" id="email" name="email" value="${mDomain.email}" />
  
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
	<div class="myContents">
	<h3 class="titDep2">회원 정보 수정</h3>
                    
	<!-- 필수정보수정 -->
	<h4 class="titDep3 hidden">회원 정보 수정</h4>
	<div class="frmInfo">
		<ul class="intList">
			<li>
				<div class="defaultTit">MY INFORMATION</div>
				<div class="defaultInfo">
					<c:out value="${mDomain.name}"/>/<c:out value="${mDomain.birthday}"/>/<c:choose>
						<c:when test="${mDomain.gender eq 'F'}">
						여자
						</c:when>
						<c:otherwise>
						남자
						</c:otherwise>
					</c:choose>
				</div>
			</li>

			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="eName">ENGLISH NAME</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner duobuleInp">
					<span class="intArea">
						<input type="text" id="eName1" name="eName1" style="width:490px" aria-required="true" value="${mDomain.engLName}" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').slice(0, 10).toUpperCase();">
						<!-- <span class="alertMessage">영문만 입력 가능하며, 띄어쓰기도 문자로 인식됩니다.</span> -->
					</span>
	                                    
					<span class="intArea">
						<input type="text" id="eName2" name="eName2" style="width:490px" aria-required="true" value="${mDomain.engFName}" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').slice(0, 20).toUpperCase();">
					</span>
				</div>
			</li>
                            
			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="national">NATIONALITY</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner">
					<div class="intArea selectWrap" style="width:490px">
						<select id="nationCode" data-height="150px" data-msg="" data-direction="down" title="국적정보">
						<c:forEach var="allNInfo" items="${allnationalInfo}" varStatus="i">
							<option value="${allNInfo.nationalCode}" <c:if test="${allNInfo.nationalCode eq mDomain.nationalCode}">selected='selected'</c:if>>
								<c:out value="${allNInfo.nationalName}"/>[<c:out value="${allNInfo.nationalCode}"/>]
							</option>
						</c:forEach>
						</select>
					</div>
				</div>
			</li>
			
			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="phone">PHONE NUMBER</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner phoneInp">
					<span class="intArea">
						<input type="text" id="telFrstNo" name="telFrstNo" title="first phone number" style="width:165px" aria-required="true" value="${mDomain.firstPhoneNum}" readonly >
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="telMidNo" name="telMidNo" title="second phone number" style="width:165px" aria-required="true" value="${mDomain.secondPhoneNum}" readonly >
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="telIndNo" name="telIndNo" title="last phone number" style="width:165px" aria-required="true" value="${mDomain.lastPhoneNum}" readonly >
					</span>
                                    
					<button type="button" class="btnSC btnM" onclick="commonJs.popShow($('#layerPop2'))">연락처 수정</button>
				</div>
			</li>
			
			<li class="intList-address">
				<div class="intWrap">
					<span class="tit">
						<label for="address">Address</label>
						<span class="essential">필수</span>
					</span>
				</div>
                               
				<div class="intBox">
					<span class="frm">
						<input type="radio"id="address-01" name="addressType" value="01" checked >
						<label for="address-01">자택</label>
					</span>
				</div>
				
				<div class="intInner">
					<span class="intArea">
						<input type="text" id="postcode" name="postcode" style="width:305px" aria-required="true" readonly value="${mDomain.zipcode}">
					</span>
					
 					<button type="button" class="btnSC btnM" onclick="execDaumPostcode();">우편번호 검색</button>
				</div>
				
				<div class="intInner duobuleInp">
					<span class="intArea">
						<input type="text" id="address" name="address" style="width:490px" title="주소" aria-required="true" readonly value="${mDomain.address}">
					</span>
                                    
					<span class="intArea">
						<input type="text" id="detailAddress" name="detailAddress"  style="width:490px" title="상세주소" aria-required="true" value="${mDomain.addressDetail}">
					</span>
                                    
					<span class="alertMessage">상세주소를 입력해주세요.</span>
				</div>
			</li>                            
                            
			<li>
				<div class="intWrap">
					<span class="tit">
						<label for="eMail">E-MAIL</label>
						<span class="essential">필수</span>
					</span>
				</div>
				
				<div class="intInner emailInp">
					<span class="intArea">
						<input type="text" id="email1" name="email1" style="width:244px" aria-required="true" value="${mDomain.firstEmail}">
					</span>
					<span class="dash">@</span>
					<span class="intArea">
						<input type="text" id="email2" name="email2" style="width:244px" aria-required="true" title="이메일주소직접입력" value="${mDomain.lastEmail}">
					</span>
				
					<div class="intArea selectWrap" style="width:244px">
						<select name="emailType" id="emailType" class="form-control" >
							<option value="">직접 입력</option>
							<option value="naver.com" <c:if test="${mDomain.lastEmail eq 'naver.com'}">selected</c:if>> naver.com</option>
							<option value="hanmail.net" <c:if test="${mDomain.lastEmail eq 'hanmail.net'}">selected</c:if>>hanmail.net</option>
							<option value="hotmail.com" <c:if test="${mDomain.lastEmail eq 'hotmail.com'}">selected</c:if>>hotmail.com</option>
							<option value="nate.com" <c:if test="${mDomain.lastEmail eq 'nate.com'}">selected</c:if>>nate.com</option>
							<option value="gmail.com" <c:if test="${mDomain.lastEmail eq 'gmail.com'}">selected</c:if>>gmail.com</option>
						</select>
					</div>
					
					<button id="emlDupChkBtn" type="button" class="btnSC btnM" onclick="fncEmlDupChk(); return false;">중복 확인</button>
				</div>
			</li>
		</ul>
	</div>
	<!-- //필수정보수정 -->
                  
	<div class="btnArea">
		<button type="button" class="btnSC btnL active" onclick="fncMyInfoUpdApi();return false;"><!-- 저장 -->저장</button>
	</div>
	</div>
	<!-- //myContents -->
</div>
<!-- //inner -->

<!-- 휴대폰 본인인증 Layer -->
<div id="layerPop2" class="layerPop">
	<div class="layerCont">
		<div class="reserveOpArea">
			<strong class="tit">휴대폰 본인인증</strong>
			<ul class="intList">
			<li>
				<div class="intWrap">
					<span class="txtConfirm">
						<label for="name">이름</label>
						<span class="essential">*</span>
					</span>
				</div>
				
				<div class="intInner nameInput">
					<span class="intArea">
						<input type="text" id="authName" style="width:500px" placeholder="이름 입력" onkeyup="this.value=this.value.replace(/[^가-힣]/gi, '').slice(0, 5);">
					</span>
	            </div>
            </li>
            
            <li>
				<div class="intWrap">
					<span class="txtConfirm">
						<label for="phone">휴대폰번호</label>
						<span class="essential">*</span>
					</span>
				</div>
				
				<div class="intInner phoneInput">
					<span class="intArea">
						<input type="text" id="authPhone" style="width:500px" placeholder="숫자만 입력" onkeyup="this.value=this.value.replace(/[^0-9]/gi, '').slice(0, 11);">
					</span>
					<button type="button" id="btnRequestNum" class="btnSC btnM" onclick="fncCheckRequestNum(); return false;">인증번호 요청</button>
	            </div>
            </li>
            </ul>
            
			<div class="btnArea">
				<button type="button" class="btnSC btnM" onclick="commonJs.popClose($('#layerPop2'))">취소</button>
			</div>
		</div>
	<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop2'))">닫기</button>
	</div>
</div>
<!-- //휴대폰 본인인증 Layer -->

</div>
<!-- //container -->
</form>
<!-- 컨텐츠 E -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->

<!-- layer 생성 시 배경 어둡게 -->
<div class="dimmed" style="display: none;"></div>

</body>
</html>