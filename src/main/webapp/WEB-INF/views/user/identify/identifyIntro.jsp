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
    <meta name="naver-site-verification" content="7cc31c414eda7a3ea7b7a0bbb9c0a5c624370a87"/>

  <title>회원가입 - 본인인증 | 조선호텔앤리조트</title>

  <link rel="canonical" href="https://josunhotel.com/identify/identifyIntro.do"/>
  <link rel="shortcut icon" type="text/css" href="/static/home/images/ko/pc/common/favicon.ico" >
  <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
  
  
  
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
  
  

  <link href="/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
  <link href="/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script> <!-- 컨텐츠 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script> <!-- 메인, GNB 스크립트 -->
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
  <script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>


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



 <script type="text/javascript" src="/static/home/js/home.js"></script> 
 
  <script type="text/javascript">
  
	// 본인인증 콜백 함수
	function fncSirenCallback(data) {
		
		var result = data.result;	// 결과: 인증성공(1)
		if (result == "1") {
			var name = data.name;	// 성명
			var cellNo  = data.cellNo;	// 휴대전화번호
			var birth   =  data.birth;
			//alert("성명1 : " + cellNo + ", 휴대전화번호 : " + cellNo + ",  생일 : " + birth);
			//본인인증 후 구CRM 회원여부를 확인한다.
			//fncCrmAsisChk();

			//2021-09-30 구CRM 회원 혜택 만료됨에 따라
			//구CRM 회원 여부 회원 여부 조회 하지 않음
			fncMembChk();
			
		} else {
			alert("본인인증에 실패하였습니다.");
		}
	}
	
	//CRM 전환가입 대상 여부확인
 	/*function fncCrmAsisChk() {
 		var formData =  jQuery("#formIdentify").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/join/crmAsisChk.do",
			cache : false,
		    data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
			 	//신규회원 
				if(data.crmAsisCnt < 1) { 
					//to-be 기회원인지 확인
					fncMembChk();
				}else{
					//alert("회원전환 오픈대기중");
					goConvertPage();
				} 
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}*/
	
	//멤버십 기가입여부 체크API 호출
 	function fncMembChk() {
 		var formData =  jQuery("#formIdentify").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/identify/membChkApi.do",
			cache : false,
		    data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				//신규회원 
			    if(data.statusR==200 && data.codeR=='S00000' && data.mssageId=='FC1006') { 
					goJoinPage();   
				}else{
					//기가입회원 및 예외상황
                    if(data.mssageId=='FC1001') {         //온라인기가입회원
                        alert(data.mssage);
                        goLogin();
                    }else if(data.mssageId=='FC1002') {
                        alert(data.mssage);
                    }else if(data.mssageId=='FC1003') {
                        //휴면회원일 경우
                        location.href = "/identify/releaseIdentifyIntro.do";
                    }else if(data.mssageId=='FC1011') {     //초기등급 없는 회원
                        $("#mberNo").val(data.mberNo);
                        goSmltTrasnPage();
                    }else if(data.mssageId=='FC1010') {    //오프라인회원

                        $("#mberNo").val(data.mberNo);

                        if(data.smltMemYn == "Y"){
                            //동시가입 -> 온라인 회원전환 이동
                            goSmltTrasnPage();
                        }else {
                            //오프->온라인 회원전환 이동
                            goOffOnTrasnPage();
                        }

                    }else {
                        alert(data.statusR +" : " +data.codeR+" : "+data.mssage);
                    }
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}
	
 	//전환가입 페이지 이동(멤버십 미가입자이며 as-is회원일 경우)
    function goConvertPage() {
    	jQuery("#formIdentify").attr("action", "/join/getCrmBasicInfo.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
 	
	//신규 회원가입 페이지 이동(멤버십 미가입자이며 as-is 비회원일 경우)
    function goJoinPage() {
    	jQuery("#formIdentify").attr("action", "/join/joinIntro.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	} 
	
    //오프라인-> 온라인 전환가입 페이지 이동
    function goOffOnTrasnPage() {
    	jQuery("#formIdentify").attr("action", "/join/joinOffForm.do");
	    jQuery("#formIdentify").attr("method", "post");
	    jQuery("#formIdentify").submit();
	}

    //동시가입 회원 -> 온라인 전환가입 페이지 이동
    function goSmltTrasnPage() {
        jQuery("#formIdentify").attr("action", "/join/joinSmltForm.do");
        jQuery("#formIdentify").attr("method", "post");
        jQuery("#formIdentify").submit();
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
      <input type="hidden" id="certiType" name="certiType" value="" />
      <!-- 멤버십 구매화면에서 회원가입 진입시 상품번호 세팅 -->
      <input type="hidden" id="bnefRegNo" name="bnefRegNo" value="" />
      <!-- 온라인 회원전환용 회원번호 전송 -->
      <input type="hidden" id="mberNo" name="mberNo" value="" />
      <!-- 2022-07-21  추천인 ID 파라미터 추가 -->
      <input type="hidden" id="recomdrId" name="recomdrId" value="" />
  </form>

  <!-- 본인인증 소스 include Start -->
 









<form method="post" name="reqPCCForm">
	<input type='hidden' name='reqInfo' value='0121A257781AD6C98B2FB0B89CCC04EA01F2C299B9079657F01AEBFEBD116CC035A2E4E6B18434C7E619DC2B5EF5094937D6FCA6D7AB126D4AF7A962A8913315522BF0973C327087DE5438C7F553C83C0DE5FDB710A27AF3501F6597133AE63F361A5C37FDF6836AFF923458BE72F8E6D938F29F35F960A70BF787F46F3D5FAE88583105C48E941263F3BBEF6922D50EF1EC122773E062C4EAE2ADB787FE0AD4F7EBFBD563BB60D9870794C987F1D9D07BC6305E958DCE4D4CC86E8FFDDBBB5D64511AE31E4E0AA3F109B4266BCF538F2FED8127E8C99925AD3ADCD784CC5CE4' /> 
	<input type='hidden' name='retUrl' value='32https://www.josunhotel.com/common/selfCrtfc/nameCallback.do?pageType=mem' /> 
	<input type='hidden' name='chk_type' value='' /> 
	<input type='hidden' name='rcv_method' value='' />
</form>


 <!-- 본인인증 소스 include End -->
 
		<div id="container" class="container join">
			<!-- 컨텐츠 S -->
			<h1 class="hidden">회원가입</h1>
			<div class="topArea">
				<div class="topInner">
					<h2 class="titDep1">Join Now</h2>
					<p class="pageGuide">조선호텔앤리조트에 오신 것을 환영합니다.</p><!-- 20200528 수정 : pageGuide(추가) -->
					<div class="stepWrap">
						<ol>
							<li class="on"><span class="hidden">현재단계</span><em>본인 인증</em></li>
							<li><em>약관동의 및 회원정보 입력</em></li>
						</ol>
					</div>
				</div>
			</div>
			<div class="inner">
				<div class="txtBox">
					<!-- ID 로그인 본인인증 -->
					<p class="txtBoxTitle">회원가입을 하시려면 휴대폰 본인 인증이 필요합니다.</p>
					<!-- 조선멤버스 본인인증 -->
					<!--<p class="txtBoxTitle">반갑습니다. <em>홍길동</em> 고객님<br>첫 온라인 계정을 이용하시려면 휴대폰 본인 인증이 필요합니다.</p>-->
					<p class="pageGuide">휴대폰 본인 인증은 회원 본인 명의의 휴대폰 번호를 통해서만 인증이 가능합니다.<br>회원님의 개인정보와 일치하지 않는 명의의 휴대폰 번호로는 본인 인증이 불가합니다</p>
					<div class="btnArea">
					<!-- 	<button type="button" onclick="gfncNameCert(); return false;" class="btnSC btnL active">휴대폰 본인 인증</button> -->
						<button type="button" id="join_auth" onclick="gfncNameCert(); return false;" class="btnSC btnL active">휴대폰 본인 인증</button>
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

