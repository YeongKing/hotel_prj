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

<title>개인정보관리 - 비밀번호변경 | 엘리시안호텔</title>

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

<script type="text/javascript">
    //패스워드 변경버튼 
 	function fnChngPwApi() {
    	
 		/*
		사용자 입력정보 VALIDATION 체크
		해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
		최초 미입력 된 element로 focus 이동됨
		*/
		var frstIdx = "";
		jQuery(".intList span").each(function(){
			var $this = jQuery(this);
			var validYn = true;
			$this.find("input[type='text'],input[type='password']").each(function(idx){
				var value = jQuery(this).val();
				var id = jQuery(this).attr("id");
				if(value == "" && id != "emailType"){
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
    	
        //--------비밀번호 형식검증------------		
		 var userPw 	= jQuery.trim(jQuery("#loginPassword").val());		// 비밀번호 입력
		 var userPwRe 	= jQuery.trim(jQuery("#loginPasswordRe").val());		// 비밀번호 재입력 확인
			
		 	// 비밀번호1 형식 검증
			if (!gfncPatternCheck(userPw)) {
				alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
				jQuery("#loginPassword").focus();
				return;
			}
			// 비밀번호2 형식 검증
			if (!gfncPatternCheck(userPwRe)) {
				alert('비밀번호는 영문/숫자/특수문자 조합 8~12자리까지 입력 가능합니다.');
				jQuery("#loginPasswordRe").focus();
				return;
			}
			
			// 비밀번호 확인 일치 검증
			if (userPw != userPwRe) {
				alert('비밀번호 확인이 일치하지 않습니다.');
				jQuery("#loginPasswordRe").focus();
				return;
			}
			
		
    	//-----------------패스워드 변경API 호출-------------------
 		var formData =  jQuery("#formPwChng").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/identify/chngPwApi.do",
			cache : false,
		    data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				//신규회원 
				if(data.statusR==200 && data.codeR=='S00000' ) { 

					alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');
					goLogout();
					
				}else if(data.statusR==400 && data.codeR=='FC1007' ){
					alert('현재 사용중인 비밀번호가 아닙니다.');
				
				}else if(data.statusR==400 && data.codeR=='FC1008' ){
					/* alert("변경 할 비밀번호가 이전 비밀번호와 동일합니다."); */
					alert('변경 할 비밀번호가 이전 비밀번호와 동일합니다.');
					
				}else if(data.statusR==400 && data.codeR=='FC1009' ){
					alert('변경 할 비밀번호가 이전 비밀번호와 동일합니다.');
					
				}else{
					alert(data.messageR + ' : 처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
				}
			},
			error:function(){
				alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
			}
		});
 	}
    
 	//회원탈퇴 처리후 로그아웃 실행
    function goLogout() {
    	jQuery("#formPwChng").attr("action", "/login/logout.do");
	    jQuery("#formPwChng").attr("method", "post");
	    jQuery("#formPwChng").submit();
	} 
</script>

<form id="formPwChng" >
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
	<h3 class="titDep2">비밀 번호 변경</h3>
	<p class="pageGuide tleft">현재 비밀번호를 올바르게 입력해야만 비밀번호 변경이 가능합니다.</p>
		<div class="frmInfo">
			<ul class="intList">
				<li><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
				<div class="intWrap">
					<span class="tit">
						<label for="userpw">CURRENT PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>
                                
				<div class="intInner">
					<span class="intArea">
						<input type="password" id="curLoginPassword" name="curLoginPassword" placeholder="현재 비밀번호를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">비밀번호를 입력해주세요.</span>
					</span>
				</div>
				</li>

				<li>
				<div class="intWrap">
					<span class="tit">
						<label for="userpw">NEW PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>
                               
     			<div class="intInner">
					<span class="intArea">
						<input type="password" id="loginPassword" name="loginPassword" placeholder="영문, 숫자, 특수문자 조합 8~12자리를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">비밀번호를 입력해주세요.</span>
					</span>
				</div>   
				                             
				<p class="txtGuide">비밀번호 내 ID가 포함되거나, 연속되는 문자 또는 숫자는 3자리 이상 사용할 수 없습니다.</p>
				</li>
                            
				<li class="intList-repwd">
				<div class="intWrap">
					<span class="tit">
						<label for="userpw-re">CONFIRM PASSWORD</label>
						<span class="essential">필수</span>
					</span>
				</div>

				<div class="intInner">
					<span class="intArea">
						<input type="password" id="loginPasswordRe" name="loginPasswordRe" placeholder="동일한 비밀번호를 입력해주세요." style="width:487px" aria-required="true">
						<span class="alertMessage">동일한 비밀번호를 입력해주세요.</span>
					</span>
 				</div>
				</li>
			</ul>
		</div>
                    
		<div class="btnArea">
			<button type="button" class="btnSC btnL active" onclick="fnChngPwApi(); return false;">확인</button>
		</div>
	</div>
</div>
<!-- inner -->
</div>
<!-- //container -->
</form>

<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->

</div>
<!-- //wrapper -->

</body>
</html>