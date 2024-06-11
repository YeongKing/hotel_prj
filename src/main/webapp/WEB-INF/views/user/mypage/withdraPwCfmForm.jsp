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

<title>개인정보관리 - 회원탈퇴, 비밀번호 입력 | 엘리시안호텔</title>

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









 
 
<script type="text/javascript">
  
    //회원탈퇴 신청화면 진입전 패스워드 재확인
	function fncWithDraPwCfmApi() {
    	
	var password = jQuery("#password").val();
	if(password.length == 0) {
      alert('비밀번호를 입력해주세요.');		
      return;
	}
    jQuery("#loginPassword").val(password);
    
	var formData =  jQuery("#formWithPwForm").serialize();
		jQuery.ajax({
		type : "POST",
		url : "/mypage/pwCheckApi.do",
		cache : false,
		data : formData, 
		dataType : "json",
		global : false,
		success : function(data) {
			if(data.statusR==200 && data.codeR=='S00000') { 
				goConvertPage();
			}else if(data.statusR==400){
				alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
			}else{ 
				alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
			}
		},
		error:function(){
			alert('처리가 실패하였습니다. 잠시 후 재시도 해주세요. 지속적으로 문제발생 시 관리자에게 문의해 주세요.');
		}
	});
	}
    
	//회원탈퇴 페이지 이동
    function goConvertPage() {
    	jQuery("#formWithPwForm").attr("action", "/mypage/withdraCfmForm.do");
	    jQuery("#formWithPwForm").attr("method", "post");
	    jQuery("#formWithPwForm").submit();
	} 
	
</script> 

<form id="formWithPwForm">
<input type="hidden" id="loginPassword" name="loginPassword" value=""  />
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
				     
				      ///언어코드가 영문이면 멤버십메뉴 숨김
// 				      if(data.langCode=='en') {
// 				    	  $('#mbrshp1').css('display','none');
// 				    	  $('#mbrshp2').css('display','none');
// 				      }
				      
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
 
  <form id="formLnb">
  <input type="hidden" id="langCode" name="langCode" value="ko" />
  </form>
                 
			<h1 class="hidden">마이페이지</h1>
			<div class="topArea">
                <div class="topInner">
                    <h2 class="titDep1">My Page</h2>
                    <p class="pageGuide"><!-- 멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다. -->멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.</p>
                </div>
			</div> 
			<div class="inner">
                <!-- LNB -->
                <div class="lnbArea">
                 <!-- 20200806 수정 : 구조(변경) -->
                    <div class="myInfo">
                       <p class="name"> <a href="/mypage/main.do"><em id="nm1">  </em><!-- 님 -->님</a> </p>
                        <div class="info">
                            <a href="/mypage/myPointForm.do">
                                <span class="tit"><!-- 포인트 -->포인트</span>
                                <span  class="txt"><em id="usefulPointSpan">  </em><abbr title="Josun Point">J</abbr></span>
                            </a>
                            <a href="/mypage/myCouponaForm.do">
                                <span class="tit"><!-- 쿠폰 -->쿠폰</span>
                                <span id="couponCntDiv" class="txt"></span>
                            </a>
                        </div>
                    </div>
                    <ul class="lnb">
                        <!-- 20200709 수정 : LNB목록(text변경) -->
                        
	                        <li id="mbrshp1">멤버십확인
	                            <ul>
	                                <li><a href="/mypage/myGoodsForm.do">CLUB JOSUN VIP 내역</a></li>
	                            </ul>
	                        </li>
                        
                        <!-- //20200709 수정 : LNB목록(text변경) -->
                        <li><!-- 예약확인 -->예약확인
                            <ul>
                                <li><a href="/cnfirm/mber/room/reserveList.do"><!-- 객실 &middot; 패키지 예약 내역 -->객실 &middot; 패키지 예약 내역</a></li>
                                <li><a href="/cnfirm/mber/dining/reserveList.do"><!-- 다이닝 예약 내역 -->다이닝 예약 내역</a></li>
                                <li><a href="/cnfirm/mber/activity/reserveList.do"><!-- 액티비티 예약 내역 -->액티비티 예약 내역</a></li>
                                
                                <li id="mbrshp2"><a href="/cnfirm/mber/vouch/reserveList.do"><!-- 멤버십 예약 내역 -->멤버십 예약 내역</a></li>
                                
                            </ul>
                        </li>
                        <li><!-- 관심 리스트 -->관심 리스트
                            <ul>
                                <li><a href="/mber/interest/roomList.do"><!-- 객실 리스트 -->객실 리스트</a></li>
                                <li><a href="/mber/interest/packageList.do"><!-- 패키지 리스트 -->패키지 리스트</a></li>
                            </ul>
                        </li>
                        <li><!-- 개인정보관리 -->개인정보관리
                            <ul>
                                <li>
                                <a href="/mypage/myInfoForm.do"> <!-- 회원 정보 수정 -->회원 정보 수정 </a>  
                                
                                 </li>
                                <li><a href="/mypage/pwChngForm.do"><!-- 비밀번호 변경 -->비밀번호 변경</a></li>
                                <li><a href="/mypage/withdraPwCfmForm.do"><!-- 회원 탈퇴 -->회원 탈퇴</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>


 
		
                <!-- myContents -->
                <div class="myContents">
                    <h3 class="titDep2"><!-- 회원 탈퇴 -->회원 탈퇴</h3>
                    <p class="pageGuide tleft"><!-- 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다. -->정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
                    <div class="frmInfo">
                        <ul class="intList">
                            <li><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                                <div class="intWrap"><span class="tit"><label for="userpw">PASSWORD</label><span class="essential"><!-- 필수 -->필수</span></span></div>
                                <div class="intInner">
                                    <span class="intArea"><input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요." style="width:1000px" aria-required="true"><span class="alertMessage"><!-- 비밀번호를 입력해주세요. -->비밀번호를 입력해주세요.</span></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btnArea">
                        <button type="button" class="btnSC btnL" onclick="fncWithDraPwCfmApi();"><!-- 다음 -->다음</button>
                    </div>
                    
                        <!-- 20220412 추가 : 신세계면세점 동시가입 회원탈퇴 안내 -->
                        <div class="cautionBox ssg-dfs">
                            <span class="tit">신세계면세점 동시가입 고객 안내</span>
                            <ul class="listDep1">
                                <li>회원가입 동의철회 : <a href="https://www.ssgdfs.com/" class="txtCl-link" target="_blank">www.ssgdfm.com</a> 접속 &gt; 로그인 &gt; 회원탈퇴</li>
                                <li>광고 &#47; 마케팅 동의철회 : <a href="https://www.ssgdfs.com/" class="txtCl-link" target="_blank">www.ssgdfm.com</a> 접속 &gt; 로그인 &gt; 회원정보수정 &gt; 동의철회</li>
                                <li>문의번호 : 1611-8778 ( 09:00~18:00 연중무휴 )</li>
                            </ul>
                        </div>
                        <!-- // 20220412 추가 : 신세계면세점 동시가입 회원탈퇴 안내 -->
                    
                </div>
               </div> 
                <!-- //myContents -->
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

