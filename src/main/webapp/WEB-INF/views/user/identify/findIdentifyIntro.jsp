<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
.findId + .frm{display:block;margin:16px 0 7px}
.findId{position:relative;margin-bottom:10px}
.findId input{width:50%;height:65px;padding:20px;border:none}
.findId input::placeholder{color:#666}
.findId input:-ms-input-placeholder{color:#666}
.findId input + input{margin-left:6px}
.findId.error input{border:1px solid #b01414}
.findId .alertMessage, .selectWrap .alertMessage{display:none;width:100%;color:#b01414;font:500 14px/32px notokrR}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>아이디/ 비밀번호찾기 - 본인인증 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
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
    


    /* 본인인증 팝업창 띄우기 */
    function verifyPopup() {
        // 화면 중앙에 팝업 창을 띄우기 위한 계산
        var width = 600;
        var height = 400;
        var left = (window.screen.width - width) / 2;
        var top = (window.screen.height - height) / 2;
        var specs = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",scrollbars=no,resizable=no";

        window.open(
            "<c:url value='/user/verify.do' />", 
            "verificationPopupWindow", 
            specs // specs 문자열을 사용하여 위치와 크기를 설정합니다.
        );
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
  
	//아이디확인 페이지이동
    function goIdPage() {
    	jQuery("#formIdentify").attr("action", "/identify/findIdPage.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
	
  //비밀번호 찾기용 변경 페이지이동
    function goPwChngPage() {
    	jQuery("#formIdentify").attr("action", "/identify/changePwPage.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
  
    //비밀번호 찾기용 변경 페이지이동
    var tabSe = "";
    function tabChange(tabSe) {
	     jQuery("#tabSe").val(tabSe);
	     //클릭하는 탭별로 제어
	     if(tabSe=='id') {	  
	         $('#tabId').removeClass('on').addClass('on');
	         $('#tab01').attr('style',"display: block");
	         $('#tabPw').removeClass('on').addClass('off');
	         $('#tab02').attr('style',"display: none");
	    }else {
	    	 $('#tabId').removeClass('on').addClass('off');
	    	 $('#tab01').attr('style',"display: none");
	         $('#tabPw').removeClass('on').addClass('on');
	         $('#tab02').attr('style',"display: block");
	     }
	}

  </script>
	
		<div id="container" class="container findingBox">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">아이디 찾기</h1>
			<div class="topArea">
				<h2 class="titDep2">아이디 / 비밀번호 찾기</h2>
			</div>
			<div class="inner">
				<ul class="tabType01 tabType02">
					<li  id="tabId"  class="on">  <a href="javascript:tabChange('id');"> 아이디 찾기</a></li>
					<li  id="tabPw" class="off">  <a href="javascript:tabChange('pw');"> 비밀번호 찾기</a></li>
				</ul>
				<!-- tabCont(아이디찾기) -->
				<div id="tab01" class="tabCont" style="display: block;">
					<h3 class="hidden">아이디 찾기</h3>
					<div class="txtBox">
						<p class="txtBoxTitle">아이디를 잊으셨나요?<br>휴대폰 문자인증을 통해<br>아이디를 확인하실 수 있습니다.</p>
						<p class="txtBoxDescription">휴대폰 문자인증의 경우 인증번호 일치여부에 따라<br>본인확인 과정을 거치게 됩니다.<br>가입되어 있는 회원님의 개인정보와<br>일치하지 않는 휴대폰 번호일 경우,<br>확인이 이루어지지 않습니다.</p>
						
						
<!-- 						<div class="textBox1">
						<div class="findId" style="text-align: center !important">
							<p class="findIdFrm">
								필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거
								<span class="alertMessage">
								휴대폰 번호를 입력해주세요.아이디를 입력해주세요.
								</span> 
								<label class="hidden" for="frm_userPhone">휴대폰 번호</label> 
								<input type="text" id="frm_userPhone" placeholder="휴대폰 번호" aria-required="true" style="margin-bottom: 20px !important"/>아이디
								<div class="sendBtn">
									<button type="button" class="btnSC btnL active" onclick="gfncNameCert(); return false;" style="">인증번호 보내기</button>
								</div>
							</p>
							<p class="findIdFrm">
								<span class="alertMessage">인증번호를 입력해주세요.비밀번호를 입력해주세요.</span> 
								<label class="hidden" for="frm_verificationNum">인증번호</label>비밀번호 
								<input type="password" id="frm_verificationNum" placeholder="인증번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" />비밀번호
							</p>
						</div>
						</div> -->
						
						
						
						
						
						<div class="btnArea">
							<button type="button" class="btnSC btnL active" onclick="verifyPopup(); return false;">휴대폰 문자 인증</button>
						</div>
					</div>
				</div>
				<!-- //tabCont(아이디찾기) -->
				<!-- tabCont(비밀번호찾기) -->
				<div id="tab02" class="tabCont" style="display: none;">
					<h3 class="hidden">비밀번호 찾기</h3>
					<div class="txtBox">
						<p class="txtBoxTitle">비밀번호를 잊으셨나요?<br>휴대폰 본인인증을 통해 고객님의 비밀번호를 안전하게 재설정 가능합니다.</p>
						<p class="txtBoxDescription">휴대폰 인증의 경우 회원님 명의로 되어있는<br>휴대폰 번호를 통해서 본인확인 과정을 거치게 됩니다.<br>회원님의 개인정보와 일치하지 않는 소유자의 휴대폰일 경우,<br>확인이 이루어지지 않습니다.</p>
						<div class="btnArea">
							<button type="button" class="btnSC btnL active" onclick="gfncNameCert(); return false;">휴대폰 본인 인증</button>
						</div>
					</div>
				</div>
				<!-- //tabCont(비밀번호찾기) -->
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>


		<!-- //container -->
		
		
       <!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
	</div>
	<!-- //wrapper -->

<!-- 호텔 찾기 Layer -->
<div id="hotelFindLayer" class="layerPop">
	<div class="layerCont">
		<div class="hotelFindPop">
			<h2>호텔 찾기</h2>
			<ul class="hotelSelect">
								<li>
					<a href="https://jpg.josunhotel.com/main.do" target="_blank" title="새창열림">		
						<span class="hotelLogo palace">
						</span>
						<span class="hotelTit">조선 팰리스<!-- 조선 팰리스 --></span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selwi-the-westin-chosun-seoul" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinSeoul">
						</span>
						<span class="hotelTit">웨스틴 조선 서울</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/puswi-the-westin-chosun-busan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinBusan">
						</span>
						<span class="hotelTit">웨스틴 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjb.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandBusan">
						</span>
						<span class="hotelTit">그랜드 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjj.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandJeju">
						</span>
						<span class="hotelTit">그랜드 조선 제주</span>
					</a>
				</li>
				<li>
					<a href="https://lescapehotel.com/main" target="_blank" title="새창열림">
						<span class="hotelLogo lescape">
						</span>
						<span class="hotelTit">레스케이프 호텔</span>
					</a>
				</li>
				<li>
					<a href="https://grp.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo gravityPangyo">
						</span>
						<span class="hotelTit">그래비티 서울 판교</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfp-four-points-seoul-namsan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonSeoulstation">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선 서울역</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfd-four-points-seoul-myeongdong" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonMyeongdong">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선, 서울 명동</span>
					</a>
				</li>
			</ul>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#hotelFindLayer'))">닫기</button>
	</div>
</div>
<!-- //호텔 찾기 Layer -->
<div class="dimmed"></div>
</body>
</html>
