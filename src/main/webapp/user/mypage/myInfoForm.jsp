<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>












<!--( 템플릿 명(PC 기본 템플릿) 최종수정일 : 2024-03-07 17:08)-->
















  










	
        
		
		
		
		
		
		
        
        
	
	

 
<!DOCTYPE html>
<html lang="ko">
 <head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="7cc31c414eda7a3ea7b7a0bbb9c0a5c624370a87"/>

  <title>개인정보관리 - 회원정보수정 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트회원, 조선호텔앤리조트마이페이지, 조선호텔앤리조트회원정보수정">
  <meta name="description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:title" content="개인정보관리 - 회원정보수정 | 조선호텔앤리조트">
  <meta property="og:description" content="멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.">
  <meta property="og:url" content="https://josunhotel.com/mypage/myInfoForm.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/mypage/myInfoForm.do"/>
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
		
		
			//국문에서 또는 국문으로 변경 시 로그아웃
			if(currentLang == "ko" || changeLang == "ko"){
				if (confirm("언어를 변경하시면, 자동 로그아웃 됩니다.\n변경 하시겠습니까?\n\nIf you change the language, you will be logged out 		automatically.\nDo you want to proceed?")) {
					$(location).attr("href", "/login/logout.do?nextURL=/login/loginForm.do&locale=" + changeLang);
				}
			}else {
				$(location).attr("href", "/intro.do?locale=" + changeLang);
			}
			
		
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
<jsp:include page="/user/footer.jsp"></jsp:include>
<!--E header  -->





        <!--(페이지 URL)-->







 
 
 <head>
 <script type="text/javascript" src="/static/home/js/home.js"></script> 
 </head>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	/*document.domain = "josunhotel.com"*/
  
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

		//마케팅항목 처리
		var $frmChk01 = $('#frmChk01');
	 	$frmChk01.change(function () {
		    var $this = $(this);
		    var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
		    $('input[name="mrkTyChk"]').prop('checked', checked);
		}); 
		 
		var agres = $('input[name="mrkTyChk"]');
		agres.change(function () {
		    // 두 번째 방법
		    var agresLength = agres.length;
		    // 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
		    var checkedLength = $('input[name="mrkTyChk"]:checked').length;
		    if( checkedLength > 0) {
		    	 $frmChk01.prop('checked', true);
		    }
		    if(checkedLength == 0) {
		    	$frmChk01.prop('checked', false);
		    }
		});
		 
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
	
	// 자녀정보 추가버튼
	var sonCnt = 0;
	function fncAddson() {
		
		    //조회된 자녀정보가 존재할시 라인카운트 처리 
		    if(parseInt(jQuery("#chldrnListCnt").val()) > 0) { 
		      sonCnt = parseInt(jQuery("#chldrnListCnt").val());
		    }
		      sonCnt += 1;	
		  
			if(sonCnt > 9) {
				alert("자녀정보는 10명까지 입력가능합니다.");
				return;
			}
			
			var sonDiv = "sonDiv"+ sonCnt;
			var html = "";
			 html = '<div id="sonDiv'+ sonCnt +'" class="addItem">';
			 html +=     '<div class="frmInfo">';
			 html +=         '<ul class="intList">';
			 html +=             '<li>';
			 html +=                     '<div class="intWrap"><span class="tit"><label for="male-02">'+sonCnt+'.Gender</label></span></div>';
			 html +=                     '<div class="intBox">';
			 html +=                          '<span class="frm">';
		     html +=                              '<input type="radio" id="male'+ sonCnt +'" name="gender'+ sonCnt +'" value="01"><label for="male'+ sonCnt +'">남자</label>'; 
			 html +=                          '</span>';
			 html +=                          '<span class="frm">';
			 html +=                                '<input type="radio" id="female'+ sonCnt +'" name="gender'+ sonCnt +'" value="02" ><label for="female'+ sonCnt +'">여자</label>'; 
			 html +=                          '</span>';
			 html +=                     '</div>';
			 html +=             '</li>';
			 html +=              '<li>';
			 html +=                     '<div class="intWrap"><span class="tit"><label for="familyBirth">DAY OF BIRTH</label></span></div>';
			 html +=                     '<div class="intInner">';
			 html +=                          '<span class="intArea"><input type="text" id="birthYyyy'+ sonCnt +'" name="birthYyyy" title="년도" style="width:224px" maxlength="4" placeholder="YYYY" onkeyup="this.value=this.value.replace(/[^0-9]/g, \'\');"></span>';
			 html +=                          '<span class="intArea"><input type="text" id="birthMm'+ sonCnt +'" name="birthMm" title="월" style="width:224px" maxlength="2"  placeholder="MM" onkeyup="this.value=this.value.replace(/[^0-9]/g, \'\');"></span>';
			 html +=                          '<span class="intArea"><input type="text" id="birthDd'+ sonCnt +'" name="birthDd" title="일" style="width:224px" maxlength="2"  placeholder="DD" onkeyup="this.value=this.value.replace(/[^0-9]/g, \'\');"></span>'; 
			 html +=                     '</div>';
			 html +=            '</li>';
			 html +=         '</ul>';
			 html +=     '</div>';
			 html +=     '<button type="button" class="btnIcon delete" onclick="fncDelson('+"'"+sonCnt+"'"+'); return false;"><span class="hidden">삭제</span></button>';
			 html +='</div> ';
             //자녀정보 입력란 추가
			 jQuery("#addSon").append(html);
			 
			 //자녀정보 시퀀스 관리
			 var sonSeqsInp = jQuery("#sonSeqs").val();
			 
			 if(sonSeqsInp.length>0) {
			     sonSeqsInp += "&" + sonCnt ;
			 }else {
				 sonSeqsInp +=  sonCnt ;
			 }
			 jQuery("#sonSeqs").val(sonSeqsInp);
	}
	
	//자녀정보 선택삭제
	function fncDelson(id) {
		$("div").remove("#sonDiv"+ id);
		return;
	}
	
	
	// 신용카드 삭제
	function fncDelCard() {
	   //삭제 여부 확인
		if(confirm("신용카드를 정보를 삭제하시겠습니까?")){
			
			jQuery("#formMypage").attr("action", "/mypage/deleteCreditcard.do");
		    jQuery("#formMypage").attr("method", "post");
		    jQuery("#formMypage").submit();	
		    
		}else{
			return false;
		}
	}
	
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
      
 	//sns연동 컨트롤
 	jQuery(function(){
 		winSize = 'width=550,height=650';
	
		jQuery(document).ready(function(){
		 	$("#snsChk-google").on("click", function() {
		 		if($("#snsChk-google").prop("checked") ) {
		 			//연동 결과에 따라 체크여부 세팅하기위해 
					$("#snsChk-google").prop("checked",false);
			 		$("#snsTyCode").val("GOOGLE");
			 	    lnkUrl = "/sns/googleLogin.do?fromPageType=SNS_SYNC";
			 		window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
		 		}else{
		 			$("#snsChk-google").prop("checked",true);
		 			$("#snsTyCode").val("GOOGLE");
	                //sns연동해제 API호출	 			
		 			fncSnsUnlink();
		 		}
		 	});
		 	
		 	$("#snsChk-facebook").on("click", function() {
		 		$("#snsChk-facebook").prop("checked",false);
		 		//alert("준비중입니다.");
		 		if($("#snsChk-facebook").prop("checked") ) {
		 			//연동 결과에 따라 체크여부 세팅하기위해 
					$("#snsChk-facebook").prop("checked",false);
		 		 	$("#snsTyCode").val("FACEBOOK");
		 	     	lnkUrl = "/sns/facebookLogin.do?fromPageType=SNS_SYNC";
		 		 	window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
		 		}else{
		 			$("#snsChk-facebook").prop("checked",true);
		 			$("#snsTyCode").val("FACEBOOK");
		 			//sns연동해제 API호출
		 			fncSnsUnlink();
		 		}
		 	});
		 	
		 	$("#snsChk-naver").on("click", function() {

		 		if($("#snsChk-naver").prop("checked") ) {
		 			//연동 결과에 따라 체크여부 세팅하기위해 
					$("#snsChk-naver").prop("checked",false);
		 		 	$("#snsTyCode").val("NAVER");
		 	     	lnkUrl = "/sns/naverLogin.do?callbackType=login&fromPageType=SNS_SYNC";
		 		 	window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
		 		}else{
		 			$("#snsChk-naver").prop("checked",true);
		 			$("#snsTyCode").val("NAVER");
		 			//sns연동해제 API호출
		 			fncSnsUnlink();
		 		}
		 	});
		 	
		 	$("#snsChk-kakao").on("click", function() {

		 		if($("#snsChk-kakao").prop("checked") ) {
		 			//연동 결과에 따라 체크여부 세팅하기위해 
					$("#snsChk-kakao").prop("checked",false);
		 		 	$("#snsTyCode").val("KAKAO");
		 	     	lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=SNS_SYNC";
		 		 	window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
		 		}else{
		 			$("#snsChk-kakao").prop("checked",true);
		 			$("#snsTyCode").val("KAKAO");
		 			//sns연동해제 API호출
		 			fncSnsUnlink();
		 		}
		 	});
		 	
		 	$("#snsChk-apple").on("click", function() {

		 		if($("#snsChk-apple").prop("checked") ) {
		 			//연동 결과에 따라 체크여부 세팅하기위해 
					$("#snsChk-apple").prop("checked",false);
		 		 	$("#snsTyCode").val("APPLE");
		 	     	lnkUrl = "/sns/appleLogin.do?fromPageType=SNS_SYNC";
		 		 	window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
		 		}else{
		 			$("#snsChk-apple").prop("checked",true);
		 			$("#snsTyCode").val("APPLE");
		 			//sns연동해제 API호출
		 			fncSnsUnlink();
		 		}
		 	});
			
		});
	});
 	
 	 //sns연동해제 API호출
 	function fncSnsUnlink() {
		var formData =  jQuery("#formMypage").serialize();
 		jQuery.ajax({
			type : "POST",
			url : "/mypage/snsUnlinkApi.do",
			cache : false,
			data : formData, 
			dataType : "json",
			global : false,
			success : function(data) {
				if(data.statusR==200 && data.codeR=='S00000') {
                    alert("연동해제 되었습니다.");  
                    var snsTyCode = $("#snsTyCode").val();
					$("#snsChk-"+snsTyCode.toLowerCase()).prop("checked", false);
				}else{
					alert(data.statusR + " : 관리자에게 문의하세요");
				}
			},
			error:function(){
				alert("관리자에게 문의하세요.");
			}
		});
 	}
 	 //sns연동결과 처리 연동성공시 해당 SNS연동 활성화
 	 function fncSnsLinkResult(){
 		 var snsTyCode = $("#snsTyCode").val();
 		 console.log(snsTyCode);
 		 $("#snsChk-"+snsTyCode.toLowerCase()).prop("checked", true);
 	 }
 	 
 	 //관심정보 초기화(선택해제)
 	function fncIntrstInit() {
 		  $('input:checkbox[name=instrstChk]').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
 			 this.checked = false;
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
         
		 /*----------마케팅/홍보 유형 start--------------  */
		 //마케팅/홍보 동의여부(체크박스) 수신방식 배열처리 [이메일/sms/우편물/전화]
		 var obj = $("[name=mrkTyChk]");
	     var mrkArray = new Array(); // 배열 선언
         $('input:checkbox[name=mrkTyChk]').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        	 if($(this).is(":checked")) { 
        		 mrkArray.push(this.value+"Y");
          	 }else {
          		mrkArray.push(this.value+"N");  
          	 }
         });
	     //이벤트동의 수신유형 배열데이터
         $('#mrkTyArrH').val(mrkArray);
         /*----------마케팅/홍보 유형 end--------------  */

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
         
		 //관심정보(체크박스) 배열처리
		 var obj = $("[name=instrstChk]");
	     var chkArray = new Array();        // 배열 선언
         $('input:checkbox[name=instrstChk]').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
         	 if($(this).is(":checked")) { 
               chkArray.push(this.value+"Y");
        	 }else {
        	   chkArray.push(this.value+"N");  
        	 } 
         });
	     //관심정보 배열데이터
         $('#instrstArrH').val(chkArray);
         
        /*----------자녀정보 배열처리 start--------------  */
         //자녀정보 성별 배열데이터
         var genArray = new Array();        // 배열 선언
         var child = document.getElementsByClassName('addItemArea disabled');
         $('input:radio[name!=addressType]').each(function() { // 선택된 라디오의 value 값을 가지고 온다.
         	 if($(this).is(":checked")) { 
         		genArray.push(this.value);
         	 }
         });
         //alert("자녀성별 size: " + genArray.length);
         
         //자녀생일 year 배열데이터
        var yearValue = $("input[name='birthYyyy']").length;
        var yearArr = new Array(yearValue);
         for(var i=0; i<yearValue; i++){                          
        	 yearArr[i] = $("input[name='birthYyyy']")[i].value;
              }
       
         //자녀생일 month 배열데이터
         var monValue = $("input[name='birthMm']").length;
         var monArr = new Array(monValue);
          for(var i=0; i<monValue; i++){                          
        	  monArr[i] = $("input[name='birthMm']")[i].value;
               }
          
          //자녀생일 day 배열데이터
          var dayValue = $("input[name='birthDd']").length;
          var dayArr = new Array(dayValue);
           for(var i=0; i<dayValue; i++){                          
        	   dayArr[i] = $("input[name='birthDd']")[i].value;
                }
           
           if (genArray.length > 0) {
               $('#childGenArrH').val(genArray);
               $('#childYearArrH').val(yearArr);
               $('#childMonArrH').val(monArr);
               $('#childDayArrH').val(dayArr);
           }
         /*----------자녀정보 배열처리 end--------------  */
         
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
  <!-- 신용카드 삭제시 사용 -->
  <input type="hidden" id="cardNoH" name="cardNoH" value="" />
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
  <input type="hidden" id="instrstArrH" name="instrstArrH" value="" />           <!-- 관심정보 선택항목 -->
  <input type="hidden" id="mrkTyArrH" name="mrkTyArrH" value="" />   <!-- 마케팅/홍보 전송유형  -->
  <!--수신동의 수신방식 배열데이터 (이메일/문자)  -->
  <input type="hidden" id="mberAgreArrH" name="mberAgreArrH" value=""  />
  
  <!-- 자녀정보 배열  -->
  <input type="hidden" id="childGenArrH" name="childGenArrH" value="" /> 
  <input type="hidden" id="childYearArrH" name="childYearArrH" value="" /> 
  <input type="hidden" id="childMonArrH" name="childMonArrH" value="" /> 
  <input type="hidden" id="childDayArrH" name="childDayArrH" value="" /> 
  <!-- 조회된 자녀정보 카운트  -->
  <input type="hidden" id="chldrnListCnt" name="chldrnListCnt" value="0"/>
  
  <!-- sns연동정보 -->
  <input type="hidden" id="googleTyCode" name="googleTyCode" value="" />
  <input type="hidden" id="googleSnsKey" name="googleSnsKey" value="" />
  <input type="hidden" id="googleSnsId" name="googleSnsId" value="" />
  
  <input type="hidden" id="facebookTyCode" name="facebookTyCode" value="" />
  <input type="hidden" id="facebookSnsKey" name="facebookSnsKey" value="" />
  <input type="hidden" id="facebookSnsId" name="facebookSnsId" value="" />
  
  <input type="hidden" id="naverTyCode" name="naverTyCode" value="" />
  <input type="hidden" id="naverSnsKey" name="naverSnsKey" value="" />
  <input type="hidden" id="naverSnsId" name="naverSnsId" value="" />
  
  <input type="hidden" id="kakaoTyCode" name="kakaoTyCode" value="" />
  <input type="hidden" id="kakaoSnsKey" name="kakaoSnsKey" value="" />
  <input type="hidden" id="kakaoSnsId" name="kakaoSnsId" value="" />
  
  <input type="hidden" id="appleTyCode" name="appleTyCode" value="" />
  <input type="hidden" id="appleSnsKey" name="appleSnsKey" value="" />
  <input type="hidden" id="appleSnsId" name="appleSnsId" value="" />
  <!-- 클릭한 sns유형 -->
  <input type="hidden" id="snsTyCode" name="snsTyCode" value="" />
  
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
                       <p class="name"> <a href="/mypage/main.do"><em id="nm1">  </em><!-- 님 -->영무짱님</a> </p>
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
                    <h3 class="titDep2"><!-- 회원 정보 수정 -->회원 정보 수정</h3>
                    
                    <!-- 필수정보수정 -->
                    <h4 class="titDep3 hidden"><!-- 회원 정보 수정 -->회원 정보 수정</h4>
                    <div class="frmInfo">
                        <ul class="intList">
                            <li>
                                <div class="defaultTit">MY INFORMATION</div>
                                <div class="defaultInfo">
                                   영무짱/1996.03.20/
                                    
                                    남자
                                    
                                    
                                </div>
                            </li>
                            <!-- 카드정보 -->
                             
                            <!-- //카드정보 -->
                            <li>
                                <div class="intWrap"><span class="tit"><label for="eName">ENGLISH NAME</label><span class="essential">필수</span></span></div>
                                <div class="intInner duobuleInp">
                                    <span class="intArea"><input type="text" id="eName1"  name="eName1"  style="width:490px" readonly aria-required="true" value="KIM" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();"><span class="alertMessage"><!-- 영문만 입력 가능하며, 띄어쓰기도 문자로 인식됩니다. -->영문만 입력 가능하며, 띄어쓰기도 문자로 인식됩니다.</span></span>
                                    <span class="intArea"><input type="text" id="eName2"  name="eName2" style="width:490px" readonly aria-required="true" value="MUYEONG" onkeyup="this.value=this.value.replace(/[^a-z]/gi, '').toUpperCase();"></span>
                                </div>
                            </li>
                            <li><!-- 20200528 수정 : 국적정보(추가) -->
                                <div class="intWrap"><span class="tit"><label for="national">NATIONALITY</label><span class="essential">필수</span></span></div>
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
                                <div class="intWrap"><span class="tit"><label for="phone">PHONE NUMBER</label><span class="essential">필수</span></span></div>
                                <div class="intInner phoneInp">
									<span class="intArea"><input type="text" id="telFrstNo" name="telFrstNo" title="first phone number" style="width:165px" aria-required="true" readonly value="010"></span>
									<span class="dash"></span>
									<span class="intArea"><input type="text" id="telMidNo" name="telMidNo" title="second phone number" style="width:165px" aria-required="true" readonly value="7427"></span>
									<span class="dash"></span>
                                    <span class="intArea"><input type="text" id="telIndNo" name="telIndNo" title="last phone number" style="width:165px" aria-required="true" readonly value="0406"></span>
                                    <button type="button" class="btnSC btnM" onclick="gfncNameCert(); return false;"><!-- 연락처 수정 -->연락처 수정</button>
								</div>
                            </li>
                            <li class="intList-address">
                                <div class="intWrap"><span class="tit"><label for="address">Address</label><span class="essential">필수</span></span></div>
                                <!-- 20200528 수정 : 주소옵션(추가) -->
                                <div class="intBox">
                                    <span class="frm">
                                        <input type="radio"id="address-01" name="addressType" value="01" checked ><label for="address-01"><!-- 자택 -->자택</label>
                                    </span>
                                </div>
                                <!-- //20200528 수정 : 주소옵션(추가) -->
                                <div class="intInner">
                                    <span class="intArea"><input type="text" id="postcode" name="postcode" style="width:305px" aria-required="true" readonly value="08793"></span>
                                    <button type="button" class="btnSC btnM" onclick="execDaumPostcode();"><!-- 우편번호 검색 -->우편번호 검색</button>
                                </div>
                                <div class="intInner duobuleInp">
                                    <span class="intArea"><input type="text" id="address" name="address" style="width:490px" title="주소" aria-required="true" value="서울 관악구 남부순환로"></span>
                                    <span class="intArea"><input type="text" id="detailAddress" name="detailAddress"  style="width:490px" title="상세주소" aria-required="true" value="999호"></span>
                                    <span class="alertMessage"><!-- 상세주소를 입력해주세요. -->상세주소를 입력해주세요.</span>
                                </div>
                            </li>                            
                            <li>
                                <div class="intWrap"><span class="tit"><label for="eMail">E-MAIL</label><span class="essential">필수</span></span></div>
                                <div class="intInner emailInp">
                                    <span class="intArea"><input type="text" id="email1" name="email1" style="width:244px" aria-required="true" value="whdcks208"></span>
                                    <span class="dash">@</span>
                                    <span class="intArea"><input type="text" id="email2" name="email2" style="width:244px" aria-required="true" title="이메일주소직접입력" value="naver.com"></span>
                                    <div class="intArea selectWrap" style="width:244px">
                                         
									     <select name="emailType" id="emailType" class="form-control"    ><option value="">직접 입력</option><option value="naver.com" >naver.com</option><option value="hanmail.net" >hanmail.net</option><option value="hotmail.com" >hotmail.com</option><option value="nate.com" >nate.com</option><option value="gmail.com" >gmail.com</option></select>
                                    </div>
                                    <button id="emlDupChkBtn" type="button" class="btnSC btnM" onclick="fncEmlDupChk(); return false;"><!-- 중복 확인 -->중복 확인</button><!-- 20200528 수정 : 버튼추가(중복 확인) + input(style="width:244px") -->
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- //필수정보수정 -->
                    <!-- SNS 연동 로그인 -->
                    <h4 class="titDep3"><!-- SNS 연동 로그인 -->SNS 연동 로그인</h4>
                    <ul class="frmList snsLogin">
                        <li class="frmCheck google"><input type="checkbox" id="snsChk-google" name="snsChk-google"   ><label for="snsChk-google">구글<!-- 구글 --></label></li>
                        <li class="frmCheck facebook"><input type="checkbox" id="snsChk-facebook" name="snsChk-facebook"  ><label for="snsChk-facebook">페이스북<!-- 페이스북 --></label></li>
                        <li class="frmCheck naver"><input type="checkbox" id="snsChk-naver" name="snsChk-naver"  ><label for="snsChk-naver">네이버<!-- 네이버 --></label></li>
                        <li class="frmCheck kakao"><input type="checkbox" id="snsChk-kakao" name="snsChk-kakao"  ><label for="snsChk-kakao">카카오톡<!-- 카카오톡 --></label></li>
                        <!-- 20200528 수정 : 버튼추가(애플) -->
                        <li class="frmCheck apple"><input type="checkbox" id="snsChk-apple" name="snsChk-apple"  ><label for="snsChk-apple">애플<!-- 애플 --></label></li>
                        <!-- //20200528 수정 : 버튼추가(애플) -->
                    </ul>
                    <ul class="txtGuide">
                    <li><!-- SNS 계정을 연동하시면, 로그인 시 해당 채널로 소셜 로그인 하실 수 있습니다. (소셜 로그인) -->SNS 계정을 연동하시면, 로그인 시 해당 채널로 소셜 로그인 하실 수 있습니다. (소셜 로그인)</li>
                    <li><!-- 로그인 연동은 Google, Facebook, Naver, Kakao Talk, Apple에 복수 연결이 가능합니다. -->로그인 연동은 Google, Facebook, Naver, Kakao Talk, Apple에 복수 연결이 가능합니다.</li><!-- 20200528 수정 : 문구추가(Apple) -->
                    <li><!-- SNS 계정 연결을 끊으시려면, 위에 연결된 채널의 버튼을 클릭하시면 연동이 해제됩니다. -->SNS 계정 연결을 끊으시려면, 위에 연결된 채널의 버튼을 클릭하시면 연동이 해제됩니다.</li>
                    </ul>                    
                    <!-- //SNS 연동 로그인 -->
                    



                    
                  
                    <div class="btnArea">
                        <button type="button" class="btnSC btnL active" onclick="fncMyInfoUpdApi();return false;"><!-- 저장 -->저장</button>
                    </div>
                </div>
                </div>
                <!-- //myContents -->
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
			</form>
		<!-- </div> -->
  

		<!-- //container -->

<!--S footer  -->
<jsp:include page="/user/footer.jsp"></jsp:include>
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

