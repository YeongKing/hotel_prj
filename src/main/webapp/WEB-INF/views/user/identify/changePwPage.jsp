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

<title>비밀번호 찾기 - 비밀번호 재입력 | 엘리시안호텔</title>

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
    //패스워드 변경버튼 
 	function fnChngPwApi() {
    	
 		/*
		사용자 입력정보 VALIDATION 체크
		해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
		최초 미입력 된 element로 focus 이동됨
		*/
		var frstIdx = "";
		jQuery(".inner p").each(function(){
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
			
		
    	//-----------------패스워드 변경API(토큰처리) 호출-------------------
 		var formData =  jQuery("#formIdentify").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/identify/chngPwTknApi.do",
			cache : false,
		    data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				//신규회원 
				if (data.statusR==200 && data.codeR=='S00000' ) { 
					alert("패스워드가 변경되었습니다.");
					goLogin();
				} else if (data.statusR == 400 && (data.codeR == 'FC1006'  || data.codeR == 'FC1007' || data.codeR == 'FC1008' || data.codeR == 'FC1009')){
					alert(data.messageR);
				} else {
					alert(data.statusR +" : " +data.codeR+" : "+data.messageR);
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}

	//패스워드 변경후 로그인화면 이동
    function goLogin() {
    	jQuery("#formIdentify").attr("action", "/login/loginForm.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
 </script>

 <form id="formIdentify" >
 
 <!-- 본인인증 사용유형 -->
 <input type="text" id="loginId" name="loginId" value="ywc980513" />
		<div id="container" class="container findingBox">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">비밀번호 찾기</h1>
			<div class="topArea">
				<h2 class="titDep2">비밀번호 재입력</h2>
			</div>
			<div class="inner">
				<div class="txtBox">
                    <p class="txtBoxTitle">새로운 비밀번호를 입력해주세요.</p>
                     <!-- 20200716 수정 : 구조/문구(변경/추가) -->
                    <ul class="txtBoxDescription">
                        <li>영문/숫자/특수문자 조합 8~12자리</li>
                        <li>ID 포함, 연속되는 문자/숫자 3자리 이상 사용 불가</li>
                    </ul>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">비밀번호를 입력해주세요.</span>
                        <label class="hidden" for="frm_userpw-new">새 비밀번호</label>
                        <input type="password" id="loginPassword" name="loginPassword"  placeholder="새 비밀번호" aria-required="true" maxlength="12"/>
                    </p>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">동일한 비밀번호를 입력해주세요.</span>
                        <label class="hidden" for="frm_userpw-renew">새 비밀번호 확인</label>
                        <input type="password" id="loginPasswordRe" name="loginPasswordRe"  placeholder="새 비밀번호 확인" aria-required="true" maxlength="12"/>
                    </p>
					<div class="btnArea">
                        <button type="button" class="btnSC btnL active btnFull" onclick="fnChngPwApi(); return false;">확인</button>
                    </div>
				</div>	
                <ul class="txtGuide">
                    <li>변경된 비밀번호는 회원정보에 반영됩니다.</li>
                    <li>수정 완료하신 후 로그인하시면 방문 가능합나다.</li>
                </ul>
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