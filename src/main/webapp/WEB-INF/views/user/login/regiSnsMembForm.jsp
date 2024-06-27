<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- view-source:https://www.josunhotel.com/login/regiSnsMembForm.do -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>SNS 아이디 연결 | 엘리시안호텔</title>

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
	 
	var PageScript = function() {

	}

	PageScript.prototype = {
		init : function() {
		
		}
		,validate:function(){
			
			var bResult = true;
			
			/*
			사용자 입력정보 VALIDATION 체크
			해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
			최초 미입력 된 element로 focus 이동됨
			*/
			var frstIdx = "";
			$(".txtBox p").each(function(){
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
		,fncLogin : function(param_loginSeCode) {
			var frm_userid = "";
			var frm_userpw = "";
			var param_nextUrl = "/main.do";

			// 아이디 로그인시
			
			frm_userid = jQuery("#frm_userid").val(); // 입력된 아이디
			frm_userpw = jQuery("#frm_userpw").val(); // 입력된 비밀번호
			
			
			if(PageScript.validate()){
				
				var param = {
					loginSeCode : param_loginSeCode
					,loginId : frm_userid
					,loginPassword : frm_userpw
					,fromPageType : 'SNS_REL'
					,nextURL : param_nextUrl
				}
	
				/****************************
				 * post 날리기 전에 요청전과 후의 동작을 정의
				 ****************************/
				$.ajaxSetup({
					beforeSend : function(xhr, settings) {
						//alert('before=>xhr:' + JSON.stringify(xhr));
						//							   alert('before=>xhr:' + JSON.stringify(xhr) + "settings:"+JSON.stringify(settings));
					},
					complete : function(xhr, textStatus) {
						//alert('complete=>xhr:' + JSON.stringify(xhr) + ":textStatus:" + textStatus);
	
					}
				});
	
				/**********************************
				 * post 요청
				 **********************************/
				$.post("/login/api/login.json", param, function(data, status, xhr) {
					//로그인 실패시
					if (data.loginYn == "N") {
						//alert(data.msg);
						
						switch (data.apiRtnCd) {
						case 'FC1004':
								$('#frm_userpw').val("");
								
								if(data.nextURL != null && data.nextURL != '' && data.apiRtnCd == 'FC1004'){
									
									if(confirm(data.msg)){
										
										location.href = data.nextURL;						
										
									}								
									
								}else{
									
									alert(data.msg);
									
								}
							
							break;
						case 'FC1003':
							location.href = data.nextURL;	
							break;	
						case 'FC1006':
							alert(data.msg);	
							break;
						case 'E00007':
							alert(data.msg);	
							break;

						default:
							console.log(data.msg);
							break;
						}						
					//로그인 성공시	
					} else {
						alert("로그인 되었습니다.");/* 로그인 되었습니다. */
						location.href = data.nextURL;
					}
	
				}, "json")
	
				// error handling
				.fail(function(xhr, status, error) {
					alert("로그인 수행중 서버 오류가 발생하였습니다."); /* 로그인 수행중 서버 오류가 발생하였습니다. */
					alert("아직은 에러남");
				});
				
			}

			

		}
	

	}

	$(document).ready(function() {

		PageScript = new PageScript();
		PageScript.init();

	});

	
	function redirectNextPage(nextURL) {
		document.location.href = nextURL;
	}
	
	function redirectPage() {
		var nextURL = "/main.do";

		if (nextURL != '') {
			document.location.href = nextURL;
		} else {
			document.location.href = "/main.do";
		}
	}


</script>	
	
		<div id="container" class="container findingBox">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">로그인</h1><!-- 로그인 -->
			<div class="topArea">
                <h2 class="titDep2">SNS 아이디 연결</h2><!-- SNS 아이디 연결 -->
                <p class="pageGuide">이미 가입되어 있는 조선호텔앤리조트 아이디가 있으시면 <br>SNS 아이디 연결을 할 수 있습니다.</p><!-- 이미 가입되어 있는 신세계 조선 호텔 아이디가 있으시면 <br>SNS 아이디 연결을 할 수 있습니다. -->
			</div>
			<div class="inner">
				<div class="txtBox">
                    <p class="txtBoxTitle">
                    	
                    		
			                   <em>&apos;GOOGLE&apos;</em>&nbsp;계정과 자동으로 연결을 원하시면<br>아이디와 비밀번호 입력 후 확인을 클릭해주세요. 
                    		
                    
                    </p><!-- 계정과 자동으로 연결을 원하시면<br>아이디와 비밀번호 입력 후 확인을 클릭해주세요. -->
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">아이디를 입력해주세요.</span><!-- 아이디를 입력해주세요. -->
                        <label class="hidden" for="frm_userid">아이디</label><!-- 아이디 -->
                        <input type="text" id="frm_userid" placeholder="아이디" aria-required="true" /><!-- 아이디 -->
                    </p>
                    <p class="loginFrm"><!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
                        <span class="alertMessage">비밀번호를 입력해주세요.</span><!-- 비밀번호를 입력해주세요. -->
                        <label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 -->
                        <input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" /><!-- 비밀번호 -->
                    </p>
                    <div class="btnArea">
                        <button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID')">확인</button><!-- 확인 -->
                    </div>
                    <p class="loginGuide">Club Josun 회원이 되시면 더 많은 혜택이 있습니다.</p><!-- Club Josun 회원이 되시면 더 많은 혜택이 있습니다. -->
                    <div class="loginLink">
                        <a href="/identify/identifyIntro.do?fromPage=SNS_REL" class="btnS icoArr">회원가입</a><!-- 회원가입 -->
                        <a href="/identify/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기</a><!-- 아이디 / 비밀번호 찾기 -->
                    </div>
				</div>
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

