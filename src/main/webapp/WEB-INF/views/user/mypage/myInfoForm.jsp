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


<!-- S header -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!-- E header -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	// 본인인증 콜백 함수
	function fncSirenCallback(data) {
		var result = data.result;	// 결과: 인증성공(1)
		
		if (result == "1") {
			var _vNameKor = data.name;	// 성명
			var _vMobile  = data.cellNo;	// 휴대전화번호
			//alert("성명1 : " + _vNameKor + ", 휴대전화번호 : " + _vMobile);
			
		    //본인인증 리턴받은 휴대전화번호로 표기
			jQuery("#telFrstNo").val(_vMobile.substring(0,3));
			jQuery("#telMidNo").val(_vMobile.substring(3,7));
			jQuery("#telIndNo").val(_vMobile.substring(7,11));
		} else {
			alert("본인인증에 실패하였습니다.");
		}
	}
	
	//체크박스 클릭시 실행
	$(document).ready(function() {
        //입력된 주소가 없을 경우 색상 강조 표시
        if (jQuery("#oriZip").val() == ""
                && jQuery("#oriAdres").val() == ""
                && jQuery("#oriInputAdres").val() ==""
                && jQuery("#anoZip").val() == ""
                && jQuery("#anoAdres").val() == ""
                && jQuery("#anoInputAdres").val() == ""){
            jQuery(".intList-address").find(".alertMessage").show();
        }

		//이메일유형 선택시 처리
		$("#emailType").on("change", function() {
			var value = jQuery(this).val();
			if(value == ""){
				jQuery("#email2").val("");
				jQuery("#email2").prop("readonly", false);
			}else{
				jQuery("#email2").val(value);
				jQuery("#email2").prop("readonly", true);
			}
		});
		  
		$('input:radio[name="addressType"]').on('change', function() {
			var addressType = $('input:radio[name="addressType"]:checked').val();
			if(addressType == $('#oriAdresTyCode').val()) {
				$("#postcode").val($("#oriZip").val());
				$("#address").val($("#oriAdres").val());
				$("#detailAddress").val($("#oriInputAdres").val());
			} else {
				$("#postcode").val($("#anoZip").val());
				$("#address").val($("#anoAdres").val());
				$("#detailAddress").val($("#anoInputAdres").val());
			}
		});
	});
	
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
	/*---------------주소검색 종료--------------------------------- */
	    
	//이메일 중복체크 API호출
 	function fncEmlDupChk() {
		 var email1		= jQuery.trim(jQuery("#email1").val());			// 이메일1 입력
		 var email2		= jQuery.trim(jQuery("#email2").val());			// 이메일2 입력
		 var email 		= email1 + "@" + email2;						       // 이메일조합
		 jQuery("#email").val(email);
		var formData =  jQuery("#formMypage").serialize();
 		jQuery.ajax({
			type : "POST",
			 url : "/join/emlDupChkApi.do", 
			 cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				
				if(data.statusR==200 && data.codeR=='S00000') { 
                      alert("사용가능한 email입니다.");			
                      //이메일 중복체크 확인여부
                      jQuery("#emailDupChkYn").val("Y");
				}else if(data.statusR==400){
					alert("이미 사용중인 email입니다.");
				}else {
					alert(data.statusR+" : 관리자에게 문의하세요.");
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}
 	
	//개인정보 수정 API호출
 	function fncMyInfoUpdApi() {
 		 var email1		= jQuery.trim(jQuery("#email1").val());			// 이메일1 입력
		 var email2		= jQuery.trim(jQuery("#email2").val());			// 이메일2 입력
		 var email 		= email1 + "@" + email2;						       // 이메일조합
		 var nationCode =  jQuery("#nationCode option:selected").val();
		 var addressType = $('input[name="addressType"]:checked').val();
		 //국가코드세팅
		 jQuery("#nationCodeH").val(nationCode);
		 //주소유형(집/회사)
		 jQuery("#addressTypeH").val(addressType);
		
		 /*----------입력된 이메일 기입력된 이메일과 다를시 중복체크 실행체크 start--------------  */
		 //기 중복체그 이메일정보 
		 var exEmail = jQuery("#email").val();
		 if(email!=exEmail) {
			 alert("이메일 중복체크가 필요합니다.");
			 jQuery("#emlDupChkBtn").focus();
			 return;
		 }else{
		  //이메일세팅
		  jQuery("#email").val(email);
		 }
		 /*----------입력된 이메일 기입력된 이메일과 다를시 중복체크 실행체크 end--------------  */
		 
		 
		 /*----------약관동의 start--------------  */
		 var obj = $("[name=mberAgreChk]");
	     var chkArray = new Array(); // 배열 선언
         $('input:checkbox[name=mberAgreChk]').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        	 if($(this).is(":checked")) { 
        	  chkArray.push(this.value+"Y");
        	 }else {
        	  chkArray.push(this.value+"N"); 
        	 }
         });
         $('#mberAgreArrH').val(chkArray);
         /*----------약관동의 end--------------  */
         
        //2022-04-19 추가
        //address 선택값 없을 경우
        if(jQuery("[name='addressType']:checked").length == 0){
            alert("ADDRESS의 자택 또는 회사를 선택해주세요.");
            jQuery("#address-01").focus();
            return;
        }
        //주소 validation
        if(jQuery("#postcode").val() == ""
            || jQuery("#address").val() == ""
            || jQuery("#detailAddress").val() == ""){
            alert("주소를 입력해주세요.");
            jQuery("#postcode").focus();
            return;
        }
         
		//ajax전송
		var formData =  jQuery("#formMypage").serialize();
 	 	jQuery.ajax({
			type : "POST",
			url : "/mypage/myInfoUpdApi.do",
			cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				if(data.statusR==200 && data.codeR=='S00000') { 
                      alert("회원정보가 수정되었습니다.");
                    //fncMberUpdPage();
                    //2022-04-19 수정요청, 수정 후 인트로 페이지로
                    location.href = "/intro.do";
				}else{
					alert(data.codeR + " : " + data.messageR);
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});  
 	} 
 	 
 	//회원정보 수정페이지 이동
	function fncMberUpdPage() {
		jQuery("#formMypage").attr("action", "/mypage/myInfoForm.do");
	    jQuery("#formMypage").attr("method", "post");
	    jQuery("#formMypage").submit();	
	}
</script>
 
 <!-- 본인인증 소스 include Start -->
<form method="post" name="reqPCCForm">
	<input type='hidden' name='reqInfo' value='D63C34ACF8FF86563B659A9FA5AEC0EB38BBBB2620884E5AA6521F8383225A0EE85AB03CD4972728648B38BBDAB68A98B75224236DAD28004A5D32C41D53F3B6AE50E1FE78CFF2D05DFDC90AFDEB2B2B0733D8A011AC384B0D7EF61F8E1317BB467E48E9D875E149B3B62B5C84832CB8680C6AF6B377E1105C4FDFAD99F3E63F985170F981AB7D687E01969056E34BA4E9D96E62E3BCAE643B53B4BEE3121FA84A16F6D8DB66FE32FB801918E848821E7FF55547C67D60553DBFEDE5060BEBE71C54510AFE4083086DB1DFD374C3D165660E89D82A2B66ED42DED657483A57BF' /> 
	<input type='hidden' name='retUrl' value='32https://josunhotel.com/common/selfCrtfc/nameCallback.do?pageType=mypage' /> 
	<input type='hidden' name='chk_type' value='' /> 
	<input type='hidden' name='rcv_method' value='' />
</form>
 <!-- 본인인증 소스 include End -->
 
<form id="formMypage" >
<!-- 본인인증 사용유형 -->
<input type="hidden" id="certiType" name="certiType" value="" />
<input type="hidden" id="sonSeqs" name="sonSeqs" value="" />
<!--이메일 중복체크 실행여부  -->
<input type="hidden" id="emailDupChkYn" name="emailDupChkYn" value="N"  />
<!-- 수정 hidden 입력값(이메일/한글이름/국가코드)  --> 
<input type="hidden" id="email" name="email" value="dudandudan@naver.com" />
<input type="hidden" id="kName" name="kName" value="영무짱"  />
<input type="hidden" id="nationCodeH" name="nationCodeH" value=""  />
<input type="hidden" id="birthdayH" name="birthdayH" value="19960320"  />
<input type="hidden" id="sexSeCode" name="sexSeCode" value="01"  />
<input type="hidden" id="ciNo" name="ciNo" value=""  />
<input type="hidden" id="diNo" name="diNo" value=""  />
<input type="hidden" id="cellNo" name="cellNo" value="" />
<input type="hidden" id="addressTypeH" name="addressTypeH" value="" />

<input type="hidden" id="oriAdresTyCode" value="01"/>
<input type="hidden" id="oriZip" value="08793"/>
<input type="hidden" id="oriAdres" value="서울 관악구 남부순환로244가길 9"/>
<input type="hidden" id="oriInputAdres" value="301호"/>

<input type="hidden" id="anoAdresTyCode" value="02"/>
<input type="hidden" id="anoZip" value=""/>
<input type="hidden" id="anoAdres" value=""/>
<input type="hidden" id="anoInputAdres" value=""/>
  
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
	<div class="myContents">
	<h3 class="titDep2">회원 정보 수정</h3>
                    
	<!-- 필수정보수정 -->
	<h4 class="titDep3 hidden">회원 정보 수정</h4>
	<div class="frmInfo">
		<ul class="intList">
			<li>
				<div class="defaultTit">MY INFORMATION</div>
				<div class="defaultInfo">영무짱/1996.03.20/남자</div>
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
						<input type="text" id="eName1" name="eName1" style="width:490px" readonly aria-required="true" value="KIM" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();">
						<span class="alertMessage">영문만 입력 가능하며, 띄어쓰기도 문자로 인식됩니다.</span>
					</span>
	                                    
					<span class="intArea">
						<input type="text" id="eName2" name="eName2" style="width:490px" readonly aria-required="true" value="MUYEONG" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();">
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
							<option value="GH"  >가나[GH]</option>
							<option value="GA"  >가봉[GA]</option>
							<option value="GY"  >가이아나[GY]</option>
							<option value="GM"  >감비아[GM]</option>
							<option value="GP"  >과들루프[GP]</option>
							<option value="GT"  >과테말라[GT]</option>
							<option value="GU"  >괌[GU]</option>
							<option value="GD"  >그레나다[GD]</option>
							<option value="GR"  >그리스[GR]</option>
							<option value="GL"  >그린란드[GL]</option>
							<option value="GN"  >기니[GN]</option>
							<option value="GW"  >기니비사우[GW]</option>
							<option value="NA"  >나미비아[NA]</option>
							<option value="NR"  >나우루[NR]</option>
							<option value="NG"  >나이지리아[NG]</option>
							<option value="AQ"  >남극[AQ]</option>
							<option value="ZA"  >남아프리카 공화국[ZA]</option>
							<option value="NL"  >네덜란드[NL]</option>
							<option value="AN"  >네덜란드령 안틸레스[AN]</option>
							<option value="NP"  >네팔[NP]</option>
							<option value="NO"  >노르웨이[NO]</option>
							<option value="NF"  >노퍽 섬[NF]</option>
							<option value="NC"  >누벨칼레도니[NC]</option>
							<option value="NZ"  >뉴질랜드[NZ]</option>
							<option value="NU"  >니우에[NU]</option>
							<option value="NE"  >니제르[NE]</option>
							<option value="NI"  >니카라과[NI]</option>
							<option value="KR" selected="selected" >대한민국[KR]</option>
							<option value="DK"  >덴마크[DK]</option>
							<option value="DO"  >도미니카 공화국[DO]</option>
							<option value="DM"  >도미니카 연방[DM]</option>
							<option value="DE"  >독일[DE]</option>
							<option value="TP"  >동티모르[TP]</option>
							<option value="LA"  >라오스[LA]</option>
							<option value="LR"  >라이베리아[LR]</option>
							<option value="LV"  >라트비아[LV]</option>
							<option value="RU"  >러시아[RU]</option>
							<option value="LB"  >레바논[LB]</option>
							<option value="LS"  >레소토[LS]</option>
							<option value="RE"  >레위니옹[RE]</option>
							<option value="RO"  >루마니아[RO]</option>
							<option value="LU"  >룩셈부르크[LU]</option>
							<option value="RW"  >르완다[RW]</option>
							<option value="LY"  >리비아[LY]</option>
							<option value="LT"  >리투아니아[LT]</option>
							<option value="LI"  >리히텐슈타인[LI]</option>
							<option value="MG"  >마다가스카르[MG]</option>
							<option value="MQ"  >마르티니크[MQ]</option>
							<option value="MH"  >마셜 제도[MH]</option>
							<option value="YT"  >마요트[YT]</option>
							<option value="YU"  >마요트[YU]</option>
							<option value="MO"  >마카오[MO]</option>
							<option value="MW"  >말라위[MW]</option>
							<option value="MY"  >말레이시아[MY]</option>
							<option value="ML"  >말리[ML]</option>
							<option value="MX"  >멕시코[MX]</option>
							<option value="MC"  >모나코[MC]</option>
							<option value="MA"  >모로코[MA]</option>
							<option value="MU"  >모리셔스[MU]</option>
							<option value="MR"  >모리타니[MR]</option>
							<option value="MZ"  >모잠비크[MZ]</option>
							<option value="ME"  >몬테네그로[ME]</option>
							<option value="MS"  >몬트세랫[MS]</option>
							<option value="MD"  >몰도바[MD]</option>
							<option value="MV"  >몰디브[MV]</option>
							<option value="MT"  >몰타[MT]</option>
							<option value="MN"  >몽골[MN]</option>
							<option value="US"  >미국[US]</option>
							<option value="UV"  >미국[UV]</option>
							<option value="VI"  >미국령 버진아일랜드[VI]</option>
							<option value="MM"  >미얀마[MM]</option>
							<option value="FM"  >미크로네시아 연방[FM]</option>
							<option value="VU"  >바누아투[VU]</option>
							<option value="BH"  >바레인[BH]</option>
							<option value="BB"  >바베이도스[BB]</option>
							<option value="VA"  >바티칸 시국[VA]</option>
							<option value="BS"  >바하마[BS]</option>
							<option value="BD"  >방글라데시[BD]</option>
							<option value="BM"  >버뮤다[BM]</option>
							<option value="BJ"  >베냉[BJ]</option>
							<option value="VE"  >베네수엘라[VE]</option>
							<option value="VN"  >베트남[VN]</option>
							<option value="BE"  >벨기에[BE]</option>
							<option value="BY"  >벨라루스[BY]</option>
							<option value="BZ"  >벨리즈[BZ]</option>
							<option value="BA"  >보스니아 헤르체고비나[BA]</option>
							<option value="BW"  >보츠와나[BW]</option>
							<option value="BO"  >볼리비아[BO]</option>
							<option value="BI"  >부룬디[BI]</option>
							<option value="BF"  >부르키나파소[BF]</option>
							<option value="BV"  >부베 섬[BV]</option>
							<option value="BT"  >부탄[BT]</option>
							<option value="MP"  >북마리아나 제도[MP]</option>
							<option value="MK"  >북마케도니아[MK]</option>
							<option value="BG"  >불가리아[BG]</option>
							<option value="BR"  >브라질[BR]</option>
							<option value="BN"  >브루나이[BN]</option>
							<option value="WS"  >사모아[WS]</option>
							<option value="XA"  >사모아[XA]</option>
							<option value="XI"  >사모아[XI]</option>
							<option value="XX"  >사모아[XX]</option>
							<option value="SA"  >사우디아라비아[SA]</option>
							<option value="GS"  >사우스조지아 사우스샌드위치 제도[GS]</option>
							<option value="SM"  >산마리노[SM]</option>
							<option value="ST"  >상투메 프린시페[ST]</option>
							<option value="PM"  >생피에르 미클롱[PM]</option>
							<option value="SN"  >세네갈[SN]</option>
							<option value="RS"  >세르비아[RS]</option>
							<option value="SC"  >세이셸[SC]</option>
							<option value="LC"  >세인트루시아[LC]</option>
							<option value="VC"  >세인트빈센트 그레나딘[VC]</option>
							<option value="KN"  >세인트키츠 네비스[KN]</option>
							<option value="SH"  >세인트헬레나[SH]</option>
							<option value="SO"  >소말리아[SO]</option>
							<option value="SB"  >솔로몬 제도[SB]</option>
							<option value="SD"  >수단[SD]</option>
							<option value="SR"  >수리남[SR]</option>
							<option value="LK"  >스리랑카[LK]</option>
							<option value="SJ"  >스발바르 얀마옌[SJ]</option>
							<option value="SE"  >스웨덴[SE]</option>
							<option value="CH"  >스위스[CH]</option>
							<option value="ES"  >스페인[ES]</option>
							<option value="SK"  >슬로바키아[SK]</option>
							<option value="SI"  >슬로베니아[SI]</option>
							<option value="SY"  >시리아[SY]</option>
							<option value="SL"  >시에라리온[SL]</option>
							<option value="SG"  >싱가포르[SG]</option>
							<option value="AE"  >아랍에미리트[AE]</option>
							<option value="AW"  >아루바[AW]</option>
							<option value="AM"  >아르메니아[AM]</option>
							<option value="AR"  >아르헨티나[AR]</option>
							<option value="AS"  >아메리칸사모아[AS]</option>
							<option value="IS"  >아이슬란드[IS]</option>
							<option value="HT"  >아이티[HT]</option>
							<option value="IE"  >아일랜드[IE]</option>
							<option value="AZ"  >아제르바이잔[AZ]</option>
							<option value="AF"  >아프가니스탄[AF]</option>
							<option value="AD"  >안도라[AD]</option>
							<option value="AL"  >알바니아[AL]</option>
							<option value="DZ"  >알제리[DZ]</option>
							<option value="AO"  >앙골라[AO]</option>
							<option value="AG"  >앤티가 바부다[AG]</option>
							<option value="AI"  >앵귈라[AI]</option>
							<option value="ER"  >에리트레아[ER]</option>
							<option value="SZ"  >에스와티니[SZ]</option>
							<option value="EE"  >에스토니아[EE]</option>
							<option value="EC"  >에콰도르[EC]</option>
							<option value="ET"  >에티오피아[ET]</option>
							<option value="SV"  >엘살바도르[SV]</option>
							<option value="GB"  >영국[GB]</option>
							<option value="VG"  >영국령 버진아일랜드[VG]</option>
							<option value="IO"  >영국령 인도양 지역[IO]</option>
							<option value="YE"  >예멘[YE]</option>
							<option value="OM"  >오만[OM]</option>
							<option value="AU"  >오스트레일리아[AU]</option>
							<option value="AT"  >오스트리아[AT]</option>
							<option value="HN"  >온두라스[HN]</option>
							<option value="WF"  >왈리스 퓌튀나[WF]</option>
							<option value="JO"  >요르단[JO]</option>
							<option value="UG"  >우간다[UG]</option>
							<option value="UY"  >우루과이[UY]</option>
							<option value="UZ"  >우즈베키스탄[UZ]</option>
							<option value="UA"  >우크라이나[UA]</option>
							<option value="IQ"  >이라크[IQ]</option>
							<option value="IR"  >이란[IR]</option>
							<option value="IL"  >이스라엘[IL]</option>
							<option value="EG"  >이집트[EG]</option>
							<option value="IT"  >이탈리아[IT]</option>
							<option value="IN"  >인도[IN]</option>
							<option value="ID"  >인도네시아[ID]</option>
							<option value="JP"  >일본[JP]</option>
							<option value="JM"  >자메이카[JM]</option>
							<option value="ZM"  >잠비아[ZM]</option>
							<option value="GQ"  >적도 기니[GQ]</option>
							<option value="KP"  >조선민주주의인민공화국[KP]</option>
							<option value="GE"  >조지아[GE]</option>
							<option value="CN"  >중국[CN]</option>
							<option value="CF"  >중앙아프리카 공화국[CF]</option>
							<option value="TW"  >중화민국[TW]</option>
							<option value="DJ"  >지부티[DJ]</option>
							<option value="GI"  >지브롤터[GI]</option>
							<option value="ZW"  >짐바브웨[ZW]</option>
							<option value="TD"  >차드[TD]</option>
							<option value="CZ"  >체코[CZ]</option>
							<option value="CL"  >칠레[CL]</option>
							<option value="CM"  >카메룬[CM]</option>
							<option value="CV"  >카보베르데[CV]</option>
							<option value="KZ"  >카자흐스탄[KZ]</option>
							<option value="QA"  >카타르[QA]</option>
							<option value="KH"  >캄보디아[KH]</option>
							<option value="CA"  >캐나다[CA]</option>
							<option value="KE"  >케냐[KE]</option>
							<option value="KY"  >케이맨 제도[KY]</option>
							<option value="KM"  >코모로[KM]</option>
							<option value="CR"  >코스타리카[CR]</option>
							<option value="CS"  >코스타리카[CS]</option>
							<option value="CC"  >코코스 제도[CC]</option>
							<option value="CI"  >코트디부아르[CI]</option>
							<option value="CO"  >콜롬비아[CO]</option>
							<option value="CG"  >콩고 공화국[CG]</option>
							<option value="CD"  >콩고 민주 공화국[CD]</option>
							<option value="CU"  >쿠바[CU]</option>
							<option value="KW"  >쿠웨이트[KW]</option>
							<option value="CK"  >쿡 제도[CK]</option>
							<option value="HR"  >크로아티아[HR]</option>
							<option value="CX"  >크리스마스 섬[CX]</option>
							<option value="KG"  >키르기스스탄[KG]</option>
							<option value="KI"  >키리바시[KI]</option>
							<option value="CY"  >키프로스[CY]</option>
							<option value="TJ"  >타지키스탄[TJ]</option>
							<option value="TZ"  >탄자니아[TZ]</option>
							<option value="TH"  >태국[TH]</option>
							<option value="TI"  >태국[TI]</option>
							<option value="TC"  >터크스 케이커스 제도[TC]</option>
							<option value="TR"  >터키[TR]</option>
							<option value="TG"  >토고[TG]</option>
							<option value="TK"  >토켈라우[TK]</option>
							<option value="TO"  >통가[TO]</option>
							<option value="TM"  >투르크메니스탄[TM]</option>
							<option value="TV"  >투발루[TV]</option>
							<option value="TN"  >튀니지[TN]</option>
							<option value="TT"  >트리니다드 토바고[TT]</option>
							<option value="PA"  >파나마[PA]</option>
							<option value="PY"  >파라과이[PY]</option>
							<option value="PK"  >파키스탄[PK]</option>
							<option value="PG"  >파푸아뉴기니[PG]</option>
							<option value="PW"  >팔라우[PW]</option>
							<option value="FO"  >페로 제도[FO]</option>
							<option value="PE"  >페루[PE]</option>
							<option value="PT"  >포르투갈[PT]</option>
							<option value="FK"  >포클랜드 제도[FK]</option>
							<option value="PL"  >폴란드[PL]</option>
							<option value="PR"  >푸에르토리코[PR]</option>
							<option value="PS"  >푸에르토리코[PS]</option>
							<option value="FR"  >프랑스[FR]</option>
							<option value="GF"  >프랑스령 기아나[GF]</option>
							<option value="TF"  >프랑스령 남방 및 남극[TF]</option>
							<option value="PF"  >프랑스령 폴리네시아[PF]</option>
							<option value="FJ"  >피지[FJ]</option>
							<option value="FI"  >핀란드[FI]</option>
							<option value="PH"  >필리핀[PH]</option>
							<option value="PN"  >핏케언 제도[PN]</option>
							<option value="HM"  >허드 맥도널드 제도[HM]</option>
	<option value="HU"  >헝가리[HU]</option>
	<option value="HK"  >홍콩[HK]</option>
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
						<input type="text" id="telFrstNo" name="telFrstNo" title="first phone number" style="width:165px" aria-required="true" readonly value="010">
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="telMidNo" name="telMidNo" title="second phone number" style="width:165px" aria-required="true" readonly value="7427">
					</span>
					<span class="dash"></span>
					<span class="intArea">
						<input type="text" id="telIndNo" name="telIndNo" title="last phone number" style="width:165px" aria-required="true" readonly value="0406">
					</span>
                                    
					<button type="button" class="btnSC btnM" onclick="gfncNameCert(); return false;">연락처 수정</button>
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
						<input type="text" id="postcode" name="postcode" style="width:305px" aria-required="true" readonly value="08793">
					</span>
					
 					<button type="button" class="btnSC btnM" onclick="execDaumPostcode();">우편번호 검색</button>
				</div>
				
				<div class="intInner duobuleInp">
					<span class="intArea">
						<input type="text" id="address" name="address" style="width:490px" title="주소" aria-required="true" value="서울 관악구 남부순환로">
					</span>
                                    
					<span class="intArea">
						<input type="text" id="detailAddress" name="detailAddress"  style="width:490px" title="상세주소" aria-required="true" value="999호">
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
						<input type="text" id="email1" name="email1" style="width:244px" aria-required="true" value="whdcks208">
					</span>
					<span class="dash">@</span>
					<span class="intArea">
						<input type="text" id="email2" name="email2" style="width:244px" aria-required="true" title="이메일주소직접입력" value="naver.com">
					</span>
				
					<div class="intArea selectWrap" style="width:244px">
						<select name="emailType" id="emailType" class="form-control">
							<option value="">직접 입력</option>
							<option value="naver.com" >naver.com</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="hotmail.com" >hotmail.com</option>
							<option value="nate.com" >nate.com</option>
							<option value="gmail.com" >gmail.com</option>
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
</div>
<!-- //container -->
</form>
<!-- 컨텐츠 E -->

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->
</body>
</html>