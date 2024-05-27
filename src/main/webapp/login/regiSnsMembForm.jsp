<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
view-source:https://www.josunhotel.com/login/regiSnsMembForm.do











<!--( 템플릿 명(PC 기본 템플릿) 최종수정일 : 2024-03-07 17:08)-->
















  










	
        
		
		
		
		
		
		
        
        
	
	

 
<!DOCTYPE html>
<html lang="ko">
 <head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="7cc31c414eda7a3ea7b7a0bbb9c0a5c624370a87"/>

  <title>SNS 아이디 연결 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트로그인, 조선호텔앤리조트회원가입, 조선호텔앤리조트회원, 조선호텔앤리조트휴면회원">
  <meta name="description" content="조선호텔앤리조트 SNS 아이디 연결">
  <meta property="og:title" content="SNS 아이디 연결 | 조선호텔앤리조트">
  <meta property="og:description" content="조선호텔앤리조트 SNS 아이디 연결">
  <meta property="og:url" content="https://josunhotel.com/login/regiSnsMembForm.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/login/regiSnsMembForm.do"/>
  <link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  
  
  
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
  
  

  <link href="http://localhost/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-173355219-1"></script>
  <script type="text/javascript">
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-173355219-1');
  </script>
  <!-- End Global site tag (gtag.js) - Google Analytics -->
  
  <!-- Google Tag Manager -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-NP6NJMP');</script>
  <!-- End Google Tag Manager -->

  <script type="text/javascript">
    // IE 브라우저인지 체크
    if (navigator.userAgent.indexOf("MSIE") !== -1 || navigator.userAgent.indexOf("Trident") !== -1) {
      // Edge 브라우저로 전환
      alert('Internet Explorer 브라우저의 서비스 지원 종료(2022년 6월 15일)에 따라 조선호텔앤리조트 웹사이트 이용 시 크로미엄 기반(Chromium Base)의 브라우저 사용을 권장 드립니다.\n\n※ 크로미엄(Chromium) 기반 브라우저\n- 크롬(Google Chrome)\n- 마이크로소프트 엣지(Microsoft Edge)\n- 파이어폭스(Mozilla Firefox)\n- 오페라(Opera)\n- 웨일(Naver Wale)\n- 사파리(Apple Safari) 등');
      window.location.replace("microsoft-edge:" + window.location.href);
    
      // IE 브라우저 종료
      //edge 켜지지 않고, ie만 종료되어 setTimeout사용
      setTimeout(function(){
        window.open('', '_parent', '');
        window.close();
      },100)

    }


    
	function fncChangeLang (changeLang) {
		let currentLang = 'ko';
		
			$(location).attr("href", "/intro.do?locale=" + changeLang);
		
		
	}
  </script>


<!-- 네이버 사이트 연관 채널 Code -->	
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Person",
"name": "조선호텔앤리조트",
"url": "https://josunhotel.com/",
	"sameAs": [
		"https://www.instagram.com/josunhotelsandresorts/",
		"https://www.facebook.com/Josunhotelsandresorts",
		"https://pf.kakao.com/_EnFPj",
		"https://www.youtube.com/channel/UC7ZZk3mnc0DzJqPTdjD6tOw",
		"https://play.google.com/store/apps/details?id=com.ssg.josunhotel",
		"https://apps.apple.com/kr/app/id1528269578"
		]
}	
</script>
<!-- End 네이버 사이트 연관 채널 Code -->
   
<!--schema.org 적용(2021.05.03) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Hotel",
  "name": "조선호텔앤리조트",
  "url": "https://josunhotel.com/",
  "image": [
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=426021&cntntsSn=426020",
    "https://www.josunhotel.com/revolution/content/fileImage.do?fileId=253318&cntntsSn=253316",
    "https://gjb.josunhotel.com/util/file/download.do?fileSn=453363&sysCode=GJB"
  ],
  "description": "Experience the Difference - 조선호텔앤리조트는 신세계 그룹에서 운영하며, 고품격 라이프 스타일을 제안하는 서비스 전문 기업입니다.",
  "sameAs": [
    "https://www.instagram.com/josunhotelsandresorts",
    "https://www.facebook.com/Josunhotelsandresorts",
    "https://pf.kakao.com/_EnFPj",
    "https://www.youtube.com/channel/UC7ZZk3mnc0DzJqPTdjD6tOw",
    "https://play.google.com/store/apps/details?id=com.ssg.josunhotel",
    "https://apps.apple.com/kr/app/id1528269578"
  ],
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "Republic of Korea",
    "addressRegion": "서울시",
    "addressLocality": "중구",
    "streetAddress": "소공로 16",
    "postalCode": "04533"
  },
  "telephone": "02-771-0500"
}
</script>
 </head>
 <body>
 <!-- Google Tag Manager (noscript) -->
 <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP"
 height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
 <!-- End Google Tag Manager (noscript) -->

	<div class="skip"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
		<!--(HEAD 최종수정일 : 2024-05-07 17:12)-->
<!-- mass promotion 메뉴 동적 노출 -->


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
<jsp:include page="/header.jsp"></jsp:include>
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
<jsp:include page="/footer.jsp"></jsp:include>
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

