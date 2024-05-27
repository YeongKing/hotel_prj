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

  <title>객실 예약 - 고객 정보 입력 | 조선호텔앤리조트</title>
  <meta name="keywords" content="조선호텔앤리조트객실, 조선호텔앤리조트예약, 조선호텔앤리조트 할인">
  <meta name="description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:title" content="객실 예약 - 고객 정보 입력 | 조선호텔앤리조트">
  <meta property="og:description" content="조선호텔앤리조트의 다양하고 감각적인 인테리어와 특별한 여유를 느낄 수 있는 객실에서 잊을 수 없는 여행의 경험을 선사합니다.">
  <meta property="og:url" content="https://josunhotel.com/resve/room/step3.do">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/resve/room/step3.do"/>
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
<jsp:include page="/user/header.jsp"></jsp:include>
<!--E header  -->
		
		
		
        <!--(페이지 URL)-->











<script type="text/javascript">
jQuery(function(){
	jQuery(document).ready(function(){
		
		if("" != ""){
			alert("");
		}
		
		//체크인 체크아웃 날짜 html 주입 
		jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")
		
		//카드번호, 생년월일  maxlength만큼 입력 시 다음 input 으로 이동
		jQuery("input[id^='cardNo'], input[type='text'][id^='birth']").keyup(function(idx){
	        var charLimit = jQuery(this).attr("maxlength");
	        if(jQuery(this).attr("role") != "last"){
		        if(this.value.length >= charLimit) {
		        	jQuery(this).parent().next().find("input").focus();
		            return false;
		        }
	        }
	    });
		
		//카드번호, 생년월일  maxlength만큼 입력 시 다음 input 으로 이동
		jQuery("input[id^='moblphonTelno']").keyup(function(idx){
	        var charLimit;
	        var id = jQuery(this).attr("id");
	        if(id == "moblphonTelno"){
	        	charLimit = 3;
	        }else{
	        	charLimit = 4;
	        }
	        if(jQuery(this).attr("role") != "last"){
		        if(this.value.length >= charLimit) {
		        	jQuery(this).parent().next().next().find("input").focus();
		            return false;
		        }
	        }
	    });
		
		/*
			이메일 도메인 정보 수정 시
			직접입력인 경우 email2 input disabled 제거
			도메인 선택 시 도메인 email2 input에 주입 후 disabled
		*/
		jQuery("[name='emailType']").on("change", function(){
			var value = jQuery(this).val();
			if(value == ""){
				jQuery("#email2").val("");
				jQuery("#email2").prop("readonly", false);
			}else{
				jQuery("#email2").val(value);
				jQuery("#email2").prop("readonly", true);
			}
		});
		
		// 마케팅 동의여부 클릭시 하위 체크박스 전체선택, 해제
		jQuery("#marketingYn").click(function(){
			if(jQuery(this).is(":checked")){
				jQuery("#chldCheckbox").find("span").each(function(){
					jQuery(this).find("input").prop("checked", true);
				});
			}else{
				jQuery("#chldCheckbox").find("span").each(function(){
					jQuery(this).find("input").prop("checked", false);
				});
			}
		});
		
		// 마케팅 동의여부 하위 체크박스 전체선택된경우 마케팅 동의여부 체크박스 선택, 해제 
		jQuery("#chldCheckbox").find("span > input").click(function(){
			if(jQuery("#chldCheckbox").find("span > input:checked").length > 0){
				jQuery("#marketingYn").prop("checked", true);
			}else{
				jQuery("#marketingYn").prop("checked", false);
			}
		});
		
		jQuery("input[type='text'],input[type='password'], select").on("keyup change", function(){
			var validFlag = true;
			jQuery(this).closest("li").find("input[type='text'],input[type='password'], select").each(function(idx){
				if(jQuery(this).val() == "" && jQuery(this).attr("id") != "emailType"){
					validFlag = false;
				}	
			});
		
			if(validFlag && jQuery(this).closest("li").hasClass("error")){
				jQuery(this).closest("li").removeClass("error");
				jQuery(this).closest("li").find(".alertMessage").hide();
			}
		});

        //카드 타입에 따라 생년월일 영역 변경
        $('.cardTypeDepth.depth2').hide();
        $('input[type=radio][name=cardType2]').change(function() {
            if (this.value == 'cardtp03') {
                $(".cardTypeDepth").hide();
                $(".cardTypeDepth.depth2").show();
                $("#creditCardAgree").closest("ul").hide();
                $("#businessNumber").attr("data-valid", "Y");
                $("#birthArea input").each(function(){
                    $(this).attr("data-valid", "N");
                })
            }else{
                $(".cardTypeDepth").hide();
                $(".cardTypeDepth.depth1").show();
                $("#creditCardAgree").closest("ul").show();
                $("#businessNumber").attr("data-valid", "N");
                $("#birthArea input").each(function(){
                    $(this).attr("data-valid", "Y");
                })
            }
        });


	});
});



/* 
function validateCardNumber(cardNumber){
	var flag = true;
    var match = /^(?:(94[0-9]{14})|(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2}|2[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardNumber);
    if(match) {
        for(var i = 1; i < match.length; i++) {
            if(match[i]) {
                flag = true;
                break;
            }
        }
        flag = luhn(cardNumber);
    } else {
        flag = false;
    }
    return flag;
}

function luhn(cardNumber){
    var digits = cardNumber.split('');
    for (var i = 0; i < digits.length; i++) {
        digits[i] = parseInt(digits[i], 10);
    }
    var sum = 0;
    var alt = false;
    for (var i = digits.length - 1; i >= 0 ; i-- ) {
        if (alt) {
            digits[i] *= 2;
            if(digits[i] > 9) {
                digits[i] -= 9;
            }
        }
        sum += digits[i];
        alt = !alt;
    }
    if(sum % 10 == 0) {
        return true;
    } else {
        return false;
    }
}
 */
/**
객실 재검색 이동
*/
function fncResvReset(){
	if(confirm("다시 검색하시겠습니까?")){ 
		location.href = "/resve/room/step0.do";
		return false;
	}
}

function checkInputValid(){

    /*
		사용자 입력정보 VALIDATION 체크
		data-valid 가 Y 인 경우에만 체크
		해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
	*/

    $(".intList li").each(function(){

        var isValid = true;
        var $this = $(this);
        $(this).find("[data-valid='Y'], select").not("#emailType").each(function(){

            if(jQuery(this).val() == ""){
                isValid = false;
            }
        });

        if(!isValid){
            $this.addClass("error");
            $this.find(".alertMessage").show();
        }else {
            $this.removeClass("error");
            $this.find(".alertMessage").hide();
        }
    })

    if($(".error").length != 0){
        $(".error").first().attr("tabindex" , -1 ).focus();
        return false;
    }else {
        return true;
    }


}

/**
	예약!		
*/
let RESV_STATUS = false;
function fncGoResv(){

    if (RESV_STATUS == true) {
        alert("이미 처리중입니다. 잠시만 기다려 주세요. ");
        return false;
    }

	

    //입력 폼 검증
    if(!checkInputValid()){
        return false;
    }
	
	
		if(!jQuery("#cancelAgree").is(":checked")){
			alert("취소 규정 항목 동의는 필수 입니다."); 
			jQuery("#cancelAgree").focus();
			return false;
		}

        if(!jQuery("#policyAgree").is(":checked")){
            alert("개인정보 수집 및 이용 약관에 동의해주세요."); 
            jQuery("#policyAgree").focus();
            return false;
        }
		
	
	
	

    //2022-08-30 추가
    //사업자 등록번호 입력시
	if($('input[type=radio][name=cardType2]:checked').val() == "cardtp03"){
        if(jQuery("#businessNumber").val().length != 10){
            alert("사업자 등록번호를 확인해 주세요."); 
            return false;
        }

        jQuery("#idNo").val(jQuery("#businessNumber").val());	//사업자 등록 번호
    }else {
        var birthExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
        var birthMonth = parseInt(jQuery("#birth2").val()) > 9 ? jQuery("#birth2").val() : "0" + parseInt(jQuery("#birth2").val());
        var birthDay = parseInt(jQuery("#birth3").val()) > 9 ? jQuery("#birth3").val() : "0" + parseInt(jQuery("#birth3").val());
        var birth = jQuery("#birth1").val()+birthMonth+birthDay;

        if(!birthExp.test(birth)){
            alert("생년월일을 확인해주세요."); 
            return false;
        }

        jQuery("#birth").val(birth);
        jQuery("#idNo").val(birth);	//생년월일 취합
    }

	
	jQuery("#email").val(jQuery("#email1").val().trim()+"@"+jQuery("#email2").val().trim());	// 이메일 취합
	jQuery("#cardNo").val(jQuery("#cardNo1").val()+"-"+jQuery("#cardNo2").val()+"-"+jQuery("#cardNo3").val()+"-"+jQuery("#cardNo4").val()); //카드번호 취합
	/* 
	if(!validateCardNumber(jQuery("#cardNo").val())){
		alert("유효한 카드번호가 아닙니다.\n다시 확인해주세요.");
		jQuery("#cardNo1").focus();
		return false;
	}
	 */

	
	/*
		예약 유효성 검사
	*/
	
	$(".btnArea").find("a").css({
	    'pointer-events': 'none',
	    'cursor': 'default',
	    'opacity': '0.6'
	});
	
	jQuery.ajax({
		type : "POST",
		url : "/resve/room/resveValid.json",
		cache : false,
		dataType : "json",
		data : jQuery("#step3Form").serialize(),
		global : false,
		beforeSend : function(xhr, opts) {
            RESV_STATUS = true;
			$(".btnArea").find("a").css({
			    'pointer-events': 'none',
			    'cursor': 'default',
			    'opacity': '0.6'
			});
	    },
		complete : function(){
          RESV_STATUS = false;
		},
		success : function(data){
			var resultCode = data.resultCode;
			var resultMsg = data.resultMsg;
			
			if(resultCode == "SUCCESS"){
				commonJs.showLoadingBar();
				jQuery("input[type='radio']").prop("disabled", false);
				jQuery("#bidRegistReqSn").val(data.bidRegistReqSn);		//빌링 키 세팅
				jQuery("#operaCardCode").val(data.operaCardCode );
				jQuery("#step3Form").attr("action", "/resve/room/save.do");
				jQuery("#step3Form").submit();
			}else{
				
				$(".btnArea").find("a").css({
				    'pointer-events': '',
				    'cursor': '',
				    'opacity': ''
				});
				
				alert(resultMsg);
			}
		},
		error:function(r, s, e){
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
		}
	});
	
}
</script>

<form action="" name="step3Form" id="step3Form" method="post">
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="GJJ" /> 
	<input type="hidden" name="ckinDate" id="ckinDate" value="2024.05.23" /> 			
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="2024.05.24" /> 		
	<input type="hidden" name="night" id="night" value="1" /> 					
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />			
	
		<input type="hidden" name="adltCntArr" value="2"/>						
	
		<input type="hidden" name="adltCntArr" value="0"/>						
	
		<input type="hidden" name="adltCntArr" value="0"/>						
	
	
		<input type="hidden" name="chldCntArr" value="0"/>						
	
		<input type="hidden" name="chldCntArr" value="0"/>						
	
		<input type="hidden" name="chldCntArr" value="0"/>						
	
	<input type="hidden" name="sortCd" id="sortCd" value=""/>				
	<input type="hidden" name="curruncyCd" id="curruncyCd" value=""/>	
	<input type="hidden" name="roomCode" id="roomCode" value="DST"/>			
	<input type="hidden" name="rateCode" id="rateCode" value="31BFR1N"/>			
	<input type="hidden" name="adltSum" id="adltSum" value="2"/>				
	<input type="hidden" name="chldSum" id="chldSum" value="0"/>				
	<input type="hidden" name="packageSn" id="packageSn" value="531357"/>		
	<input type="hidden" name="companyCode" id="companyCode" value="" />
	<input type="hidden" name="promotionCode" id="promotionCode" value="" />
	
		<input type="hidden" name="optAArr" value="BK"/>								
	
	
		<input type="hidden" name="optCArr" value="CHBK"/>								
	
	
		<input type="hidden" name="optEArr" value="0"/>								
	
		<input type="hidden" name="optEArr" value="0"/>								
	
		<input type="hidden" name="optEArr" value="0"/>								
	
	
		<input type="hidden" name="optAQtyArr" value="2"/>						
	
	
		<input type="hidden" name="optCQtyArr" value="0"/>						
	
	
		<input type="hidden" name="optEQtyArr" value="0"/>						
	
		<input type="hidden" name="optEQtyArr" value="0"/>						
	
		<input type="hidden" name="optEQtyArr" value="0"/>						
	
	<input type="hidden" name="email" id="email" value="" />												
	<input type="hidden" name="cardNo" id="cardNo" value="" />												
	<input type="hidden" name="birth" id="birth" value="" /> 												
    <input type="hidden" name="idNo" id="idNo" value="" /> 												    
	
		<input type="hidden" name="bpArr" value=""/>									
	
	
		<input type="hidden" name="bpNmArr" value=""/>								
	
	
		<input type="hidden" name="chldAgeArr" value=""/>						
	
	
		<input type="hidden" name="contArr" value=""/>								
	
	<input type="hidden" name="bidRegistReqSn" id="bidRegistReqSn" value="" /> 								
	<input type="hidden" name="operaCardCode" id="operaCardCode" value="" />
	<input type="hidden" name="mberNo" id="mberNo" value="2400618856" />
	 <!-- 한글 이름 -->
		<!-- 영문회원명(성)-->
	 <!-- 영문회원명(이름)-->
	 <!-- 대표카드번호  -->
	 <!-- 로그인ID -->
	 <!-- 국적코드 -->
	 <!-- 국가코드  -->
	 <!-- 국가코드  -->
	 <!-- 국가코드  -->
	 <!-- 전화국번호 -->
	 <!-- 전화중간번호 -->
	 <!-- 전화개별번호 --> 
	 <!-- String -->
	 <!-- 이메일 -->
	
	
	
		
		
	
	
		
			
				<input type="hidden" name="gender" value="Mr." />
				
			
			
		
			<input type="hidden" name="korNm" value="영무짱" />
			<input type="hidden" name="countryCode" value="KR" />
			<input type="hidden" name="lastName" value="KIM">
			<input type="hidden" name="firstName" value="MUYEONG">
	
	
		
			
			
		
		
		
		
		
		
	
	<div id="container" class="container">
		<!-- 컨텐츠 S -->
		<h1 class="hidden">예약</h1>
		<div class="topArea">
			<div class="topInner">
				<h2 class="titDep1">Booking</h2>
				<div class="stepWrap">
					<ol>
						<li class="prev">
							<em>객실, 요금 선택</em>
						</li>	
						<li class="prev">
							<em>옵션 선택</em>
						</li>
						<li class="on">
							<span class="hidden">
								현재단계
							</span>
							<em>예약자 정보 입력</em>
						</li> 
					</ol>
				</div>
			</div>
		</div>
		<!-- //topArea -->
		<div class="selResult">
			<div class="inner">
				<div class="infoArea">
					<dl class="dlType01">
						<dt>HOTEL</dt>
						<dd>그랜드 조선 제주</dd>
					</dl>
					<dl class="dlType02">
						<dt>DATE</dt>
						<dd id="dateText"></dd>
					</dl>
					<dl class="dlType03">
						<dt>ROOMS</dt>
						<dd>1</dd>
					</dl>
					<dl class="dlType03">
						<dt>ADULTS</dt>
						<dd>2</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>0</dd>
					</dl>
				</div>
				<a href="#none" class="btnSC btnM icoArr" onclick="fncResvReset();">객실 다시 검색</a>
			</div>
		</div>
		<!-- //selResult -->
		<div class="inner">
			<!-- rsvRoomWrap -->
			<div class="rsvRoomWrap">
				<div class="lCont">
					<h2 class="titDep2">ROOM ONLY</h2>
					<p class="categoryTxt">
						DELUXE /
						2DOUBLE /  
						STANDARD VIEW  
					</p>
					<ul class="intList">
						
						
							<li> <!-- 미입력 일 경우 error 클래스 추가 alertMessage 노출 -->
								<div class="intWrap"> 
									<span class="tit">
										<label for="kName">RESERVATION NAME</label>
										<span class="essential">필수</span>
									</span>
								</div>
								<div class="intInner">
									<span class="intArea">
										
											
												<input type="text" class="readOn" data-valid="Y" style="width:440px" aria-required="true" value="영무짱 (MUYEONG KIM) / MALE / 대한민국" readonly>
											
											
										
										
									</span>
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
								<div class="intArea selectWrap">
									<select id="cntryPhNbr" name="cntryPhNbr" style="width:319px;" > <!--  국가 코드 -->
										
									 		<option value="233" >가나(233)</option>
										
									 		<option value="241" >가봉(241)</option>
										
									 		<option value="592" >가이아나(592)</option>
										
									 		<option value="220" >감비아(220)</option>
										
									 		<option value="590" >과델로프(590)</option>
										
									 		<option value="502" >과테말라(502)</option>
										
									 		<option value="671" >괌(671)</option>
										
									 		<option value="39+6" >교황청(39+6)</option>
										
									 		<option value="1+809" >그레나다(1+809)</option>
										
									 		<option value="30" >그리스(30)</option>
										
									 		<option value="299" >그린랜드(299)</option>
										
									 		<option value="245" >기네비소(245)</option>
										
									 		<option value="224" >기니(224)</option>
										
									 		<option value="264" >나미비아(264)</option>
										
									 		<option value="674" >나우르(674)</option>
										
									 		<option value="234" >나이지리아(234)</option>
										
									 		<option value="27" >남아프리카(27)</option>
										
									 		<option value="31" >네덜란드(31)</option>
										
									 		<option value="977" >네팔(977)</option>
										
									 		<option value="47" >노르웨이(47)</option>
										
									 		<option value="687" >뉴 칼레도니아(687)</option>
										
									 		<option value="64" >뉴질랜드(64)</option>
										
									 		<option value="683" >니우에(683)</option>
										
									 		<option value="227" >니제르(227)</option>
										
									 		<option value="505" >니카라과(505)</option>
										
									 		<option value="886" >대만(886)</option>
										
									 		<option value="82" selected="selected">대한민국(82)</option>
										
									 		<option value="45" >덴마크(45)</option>
										
									 		<option value="1+809" >도미니카 공화국(1+809)</option>
										
									 		<option value="1+809" >도미니카(1+809)</option>
										
									 		<option value="49" >독일(49)</option>
										
									 		<option value="856" >라오스(856)</option>
										
									 		<option value="231" >라이베리아(231)</option>
										
									 		<option value="371" >라트비아(371)</option>
										
									 		<option value="7" >러시아(7)</option>
										
									 		<option value="961" >레바논(961)</option>
										
									 		<option value="266" >레소토(266)</option>
										
									 		<option value="40" >루마니아(40)</option>
										
									 		<option value="250" >루안다(250)</option>
										
									 		<option value="352" >룩셈부르그(352)</option>
										
									 		<option value="218" >리비아(218)</option>
										
									 		<option value="370" >리투아니아(370)</option>
										
									 		<option value="423" >리히텐슈타인(423)</option>
										
									 		<option value="261" >마다카스카르(261)</option>
										
									 		<option value="692" >마샬군도(692)</option>
										
									 		<option value="691" >마이크로네시아(691)</option>
										
									 		<option value="853" >마카오(853)</option>
										
									 		<option value="265" >말라위(265)</option>
										
									 		<option value="60" >말레이지아(60)</option>
										
									 		<option value="223" >말리(223)</option>
										
									 		<option value="52" >멕시코(52)</option>
										
									 		<option value="377" >모나코(377)</option>
										
									 		<option value="212" >모로코(212)</option>
										
									 		<option value="230" >모리셔스(230)</option>
										
									 		<option value="222" >모리타니(222)</option>
										
									 		<option value="258" >모잠비크(258)</option>
										
									 		<option value="373" >몰도바(373)</option>
										
									 		<option value="960" >몰디브(960)</option>
										
									 		<option value="356" >몰타(356)</option>
										
									 		<option value="976" >몽골(976)</option>
										
									 		<option value="1" >미국(1)</option>
										
									 		<option value="1+809" >미령 버진군도(1+809)</option>
										
									 		<option value="95" >미얀마(95)</option>
										
									 		<option value="678" >바누아투(678)</option>
										
									 		<option value="973" >바레인(973)</option>
										
									 		<option value="1+246" >바베이도스(1+246)</option>
										
									 		<option value="1+242" >바하마(1+242)</option>
										
									 		<option value="880" >방글라데시(880)</option>
										
									 		<option value="1+441" >버뮤다(1+441)</option>
										
									 		<option value="58" >베네주엘라(58)</option>
										
									 		<option value="229" >베닝(229)</option>
										
									 		<option value="375" >베라루스(375)</option>
										
									 		<option value="84" >베트남(84)</option>
										
									 		<option value="32" >벨기에(32)</option>
										
									 		<option value="501" >벨리제(501)</option>
										
									 		<option value="387" >보스니아-헤르체고비나(387)</option>
										
									 		<option value="267" >보츠와나(267)</option>
										
									 		<option value="591" >볼리비아(591)</option>
										
									 		<option value="257" >부룬디(257)</option>
										
									 		<option value="226" >부르키나 파소(226)</option>
										
									 		<option value="975" >부탄(975)</option>
										
									 		<option value="850" >북한(850)</option>
										
									 		<option value="359" >불가리아(359)</option>
										
									 		<option value="594" >불령 가이아나(594)</option>
										
									 		<option value="262" >불령 리유니온,코모도 제도(262)</option>
										
									 		<option value="55" >브라질(55)</option>
										
									 		<option value="673" >브루나이(673)</option>
										
									 		<option value="966" >사우디아라비아(966)</option>
										
									 		<option value="357" >사이프러스(357)</option>
										
									 		<option value="39" >산마리노(39)</option>
										
									 		<option value="221" >세네갈(221)</option>
										
									 		<option value="248" >세이쉘(248)</option>
										
									 		<option value="1+758" >세인트 루시아(1+758)</option>
										
									 		<option value="1+809" >세인트 빈센트 그레나딘(1+809)</option>
										
									 		<option value="1+809" >세인트 키츠 네비스(1+809)</option>
										
									 		<option value="290" >세인트 헬레나(290)</option>
										
									 		<option value="252" >소말리아(252)</option>
										
									 		<option value="677" >솔로몬 군도(677)</option>
										
									 		<option value="249" >수단(249)</option>
										
									 		<option value="597" >수리남(597)</option>
										
									 		<option value="94" >스리랑카(94)</option>
										
									 		<option value="268" >스와질랜드(268)</option>
										
									 		<option value="46" >스웨덴(46)</option>
										
									 		<option value="41" >스위스(41)</option>
										
									 		<option value="34" >스페인(34)</option>
										
									 		<option value="42" >슬로바키아(42)</option>
										
									 		<option value="386" >슬로베니아(386)</option>
										
									 		<option value="963" >시리아(963)</option>
										
									 		<option value="232" >시에라 리온(232)</option>
										
									 		<option value="65" >싱가포르(65)</option>
										
									 		<option value="971" >아랍에미리트 연합(971)</option>
										
									 		<option value="297+8" >아루바(297+8)</option>
										
									 		<option value="374" >아르메니아(374)</option>
										
									 		<option value="54" >아르헨티나(54)</option>
										
									 		<option value="684" >아메리칸 사모아(684)</option>
										
									 		<option value="354" >아이슬란드(354)</option>
										
									 		<option value="509" >아이티(509)</option>
										
									 		<option value="353" >아일랜드(353)</option>
										
									 		<option value="994" >아제르바이잔(994)</option>
										
									 		<option value="376" >안도라(376)</option>
										
									 		<option value="1+809" >안티가 바부다(1+809)</option>
										
									 		<option value="355" >알바니아(355)</option>
										
									 		<option value="213" >알제리(213)</option>
										
									 		<option value="244" >앙골라(244)</option>
										
									 		<option value="1+809" >앙귈라(1+809)</option>
										
									 		<option value="291" >에리트리아(291)</option>
										
									 		<option value="372" >에스토니아(372)</option>
										
									 		<option value="593" >에쿠아도르(593)</option>
										
									 		<option value="503" >엘살바도르(503)</option>
										
									 		<option value="44" >영국(44)</option>
										
									 		<option value="1+809" >영국령 버진군도(1+809)</option>
										
									 		<option value="1+345" >영령 캐이맨 군도(1+345)</option>
										
									 		<option value="968" >오만(968)</option>
										
									 		<option value="43" >오스트리아(43)</option>
										
									 		<option value="504" >온두라스(504)</option>
										
									 		<option value="962" >요르단(962)</option>
										
									 		<option value="256" >우간다(256)</option>
										
									 		<option value="598" >우루과이(598)</option>
										
									 		<option value="7" >우즈베키스탄(7)</option>
										
									 		<option value="7" >우크라이나(7)</option>
										
									 		<option value="251" >이디오피아(251)</option>
										
									 		<option value="964" >이라크(964)</option>
										
									 		<option value="98" >이란(98)</option>
										
									 		<option value="972" >이스라엘(972)</option>
										
									 		<option value="20" >이집트(20)</option>
										
									 		<option value="39" >이탈리아(39)</option>
										
									 		<option value="62" >인도네시아(62)</option>
										
									 		<option value="91" >인디아(91)</option>
										
									 		<option value="81" >일본(81)</option>
										
									 		<option value="876" >자마이카(876)</option>
										
									 		<option value="260" >잠비아(260)</option>
										
									 		<option value="240" >적도 기니(240)</option>
										
									 		<option value="86" >중국(86)</option>
										
									 		<option value="236" >중앙아프리카(236)</option>
										
									 		<option value="253" >지부티(253)</option>
										
									 		<option value="350" >지브랄타(350)</option>
										
									 		<option value="263" >짐바브웨(263)</option>
										
									 		<option value="235" >챠드(235)</option>
										
									 		<option value="42" >체코공화국(42)</option>
										
									 		<option value="56" >칠레(56)</option>
										
									 		<option value="237" >카메룬(237)</option>
										
									 		<option value="7" >카자흐(7)</option>
										
									 		<option value="974" >카타르(974)</option>
										
									 		<option value="855" >캄보디아(855)</option>
										
									 		<option value="1" >캐나다(1)</option>
										
									 		<option value="254" >케냐(254)</option>
										
									 		<option value="269" >코모로스(269)</option>
										
									 		<option value="61+916" >코스 군도(61+916)</option>
										
									 		<option value="506" >코스타리카(506)</option>
										
									 		<option value="225" >코트디봐르(225)</option>
										
									 		<option value="57" >콜롬비아(57)</option>
										
									 		<option value="242" >콩고(242)</option>
										
									 		<option value="53" >쿠바(53)</option>
										
									 		<option value="965" >쿠웨이트(965)</option>
										
									 		<option value="682" >쿡 아일랜드(682)</option>
										
									 		<option value="385" >크로아티아(385)</option>
										
									 		<option value="61+94" >크리스마스 아일랜드(61+94)</option>
										
									 		<option value="7" >키르기스(7)</option>
										
									 		<option value="686" >키리바티(686)</option>
										
									 		<option value="255" >탄자니아(255)</option>
										
									 		<option value="66" >태국(66)</option>
										
									 		<option value="90" >터키(90)</option>
										
									 		<option value="228" >토고(228)</option>
										
									 		<option value="676" >통가(676)</option>
										
									 		<option value="7" >투르크멘(7)</option>
										
									 		<option value="688" >투발루(688)</option>
										
									 		<option value="216" >튀니지(216)</option>
										
									 		<option value="507" >파나마(507)</option>
										
									 		<option value="595" >파라과이(595)</option>
										
									 		<option value="298" >파로에 군도(298)</option>
										
									 		<option value="92" >파키스탄(92)</option>
										
									 		<option value="675" >파푸아 뉴기니(675)</option>
										
									 		<option value="680" >팔라우(680)</option>
										
									 		<option value="51" >페루(51)</option>
										
									 		<option value="351" >포루투갈(351)</option>
										
									 		<option value="500" >포클랜드 군도(500)</option>
										
									 		<option value="48" >폴란드(48)</option>
										
									 		<option value="1+787" >푸에르토리코(1+787)</option>
										
									 		<option value="33" >프랑스(33)</option>
										
									 		<option value="679" >피지(679)</option>
										
									 		<option value="358" >핀란드(358)</option>
										
									 		<option value="63" >필리핀(63)</option>
										
									 		<option value="36" >헝가리(36)</option>
										
									 		<option value="61" >호주(61)</option>
										
									 		<option value="852" >홍콩(852)</option>
										
									</select>
								</div>
								<span class="intArea">
									<input type="text" id="moblphonTelno" name="moblphonTelno" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" value="010">
								</span>
								<span class="dash"></span>
								<span class="intArea">
									<input type="text" id="moblphonTelno1" name="moblphonTelno1" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" value="7427">
								</span>
								<span class="dash"></span>
								<span class="intArea">
									<input type="text" id="moblphonTelno2" name="moblphonTelno2" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" role="last" value="0406">
								</span>
								<span class="alertMessage">휴대폰 번호를 입력해주세요.</span>
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
								<span class="intArea"><input type="text" id="email1" style="width:273px" data-valid="Y" aria-required="true" onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');" value="whdcks208"></span>
								<span class="dash">@</span>
								<span class="intArea"><input type="text" id="email2" style="width:273px" data-valid="Y" aria-required="true" onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');" value="naver.com"/></span>
								<div class="intArea selectWrap" style="width:273px">	
									
									<select name="emailType" id="emailType" class="form-control"    ><option value="">직접 입력</option><option value="naver.com" >naver.com</option><option value="hanmail.net" >hanmail.net</option><option value="hotmail.com" >hotmail.com</option><option value="nate.com" >nate.com</option><option value="gmail.com" >gmail.com</option></select>
								</div>
								<span class="alertMessage">이메일을 입력해주세요.</span>
							</div>
						</li>
                        
                            <li>
                                <div class="intWrap"><span class="tit"><label for="cardType2">CREDIT CARD TYPE</label><span class="essential">필수</span></span></div>
                                <div class="intInner">
                                    <div class="intArea">
                                        <div class="intBox">
			                                <span class="frm">
												<input type="radio" id="cardType01" name="cardType2" value="cardtp01"><label for="cardType01">개인</label>
											</span>

                                        </div>
                                    </div>
                                    <span class="alertMessage">신용카드 타입을 선택해 주세요.</span>
                                </div>
                            </li>
                        
						<li>
							<div class="intWrap">
								<div class="titArea">
									<span class="tit">
										<label for="cardType">CREDIT CARD COMPANY</label>
										<span class="essential">필수</span>
									</span>
									
								</div>
							</div>
							<div class="intArea intInner">
								<div class="selectWrap" style="width:900px">
									
									<select name="cardCode" id="cardCode" class="form-control"    ><option value="">카드 선택</option><option value="01" >비씨</option><option value="02" >국민</option><option value="03" >하나(외환)</option><option value="04" >삼성</option><option value="06" >신한</option><option value="07" >현대</option><option value="08" >롯데</option><option value="09" >한미</option><option value="10" >신세계한미</option><option value="11" >시티</option><option value="12" >농협</option><option value="13" >수협</option><option value="14" >평화</option><option value="15" >우리</option><option value="16" >하나</option><option value="17" >동남(주택)</option><option value="18" >주택</option><option value="19" >조흥(강원)</option><option value="20" >축협(농협)</option><option value="21" >광주</option><option value="22" >전북</option><option value="23" >제주</option><option value="24" >산은</option><option value="37" >카카오뱅크</option><option value="26" >해외(MASTER)</option><option value="25" >해외(VISA)</option><option value="29" >해외(JCB)</option></select>
								</div>
								<span class="alertMessage">신용카드 종류를 선택해주세요.</span>
							</div>
						</li>
						<li>
							<div class="intWrap">
								<span class="tit">
									<label for="cdNum">CARD NUMBER</label>
									<span class="essential">필수</span>
								</span>
							</div>
							<div class="intInner duobuleInp">
								<span class="intArea"><input type="text" id="cardNo1" data-valid="Y" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" maxlength="4"></span>
								<span class="intArea"><input type="text" id="cardNo2" data-valid="Y" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" maxlength="4"></span>
								<span class="intArea"><input type="text" id="cardNo3" data-valid="Y" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" maxlength="4"></span>
								<span class="intArea"><input type="text" id="cardNo4" data-valid="Y" role="last" style="width:165px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" maxlength="4"></span>
								<span class="alertMessage">신용카드 번호를 입력해주세요.</span><!-- 20200420 수정 -->
							</div>
						</li>
						<li>
							<div class="intWrap">
								<span class="tit">
									<label for="cdMonth">EXPIRY DATE</label>
									<span class="essential">필수</span>
								</span>
							</div>
							<div class="intInner duobuleSelect">
								
									
										
									
									
									
								<div class="intArea selectWrap" style="width:440px">
			   						<select name="expMonth" id="expMonth" class="form-control"    ><option value="">월</option><option value="01" >1월</option><option value="02" >2월</option><option value="03" >3월</option><option value="04" >4월</option><option value="05" >5월</option><option value="06" >6월</option><option value="07" >7월</option><option value="08" >8월</option><option value="09" >9월</option><option value="10" >10월</option><option value="11" >11월</option><option value="12" >12월</option></select>
								</div>
								<div class="intArea selectWrap" style="width:440px">
									<select id="expYear" name="expYear">
										<option value="">년</option> 
										
											<option value="2024">2024년</option>												
										
											<option value="2025">2025년</option>												
										
											<option value="2026">2026년</option>												
										
											<option value="2027">2027년</option>												
										
											<option value="2028">2028년</option>												
										
											<option value="2029">2029년</option>												
										
											<option value="2030">2030년</option>												
										
											<option value="2031">2031년</option>												
										
											<option value="2032">2032년</option>												
										
											<option value="2033">2033년</option>												
										
											<option value="2034">2034년</option>												
										
									</select>
								</div>
								<span class="alertMessage">신용카드 유효기간을 선택해주세요.</span>
							</div>
						</li>
						<li>
							<div class="intWrap">
								<span class="tit">
									<label for="cdPassword">CARD PASSWORD</label>
									<span class="essential">필수필수</span>
								</span>
							</div>
							<div class="intInner">
								
								
								<span class="intArea">
									<input type="password" id="cardPw" name="cardPw" data-valid="Y" placeholder="비밀번호 앞 2자리" style="width:165px" aria-required="true" maxlength="2">
								</span>
								<span class="alertMessage">카드 비밀번호를 입력해주세요.(비밀번호 앞 2자리)</span><!-- 20200420 수정 --><!-- 카드 비밀번호를 입력해주세요.(비밀번호 앞 2자리) -->
							</div>
						</li>
                        <li class="cardTypeDepth depth1">
							<div class="intWrap">
								<span class="tit">
									<label for="dateBirth">DATE OF BIRTH</label>
		                            <span class="essential">필수필수</span>
								</span>
							</div>
							<div id="birthArea" class="intInner duobuleInp">
								<span class="intArea"><input type="text" id="birth1" data-valid="Y" placeholder="YYYY" style="width:165px" aria-required="true" maxlength="4" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"></span>
								<span class="intArea"><input type="text" id="birth2" data-valid="Y" placeholder="MM" style="width:165px" aria-required="true" maxlength="2" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"></span>
								<span class="intArea"><input type="text" id="birth3" data-valid="Y" placeholder="DD" style="width:165px" aria-required="true" maxlength="2" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');"></span>
								<span class="alertMessage">생년월일을 입력해주세요.</span><!-- 생년월일을 입력해주세요. -->
							</div>
						</li>
                        <li class="cardTypeDepth depth2">
                            <div class="intWrap">
									<span class="tit">
										<label for="businessNumber">BUSINESS REGISTRATION NUMBER</label>
										<span class="essential">필수</span>
									</span>
                            </div>
                            <div class="intInner">
                                <span class="intArea">
                                    <input type="text" id="businessNumber" data-valid="N" placeholder="사업자 등록 번호" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" style="width:440px" aria-required="true" maxlength="10">
                                </span>
                                <span class="alertMessage">사업자 등록 번호를 입력해주세요.</span>
                            </div>
                        </li>
					</ul>
					<p class="txtGuide">객실 재판매 행위는 법적 제재를 받을 수 있습니다.</p>
					
					<div class="notiContainer">
						
                            <h3 class="titDep3">개인정보 수집 &middot; 이용 동의</h3>
							<ul class="toggleList agreeCont">
								<li class="toggleOn">
									<span class="frm type02">
										<input type="checkbox" id="policyAgree" name="policyAgree">
										<label for="policyAgree">[필수] 개인정보 수집 · 이용에 동의합니다.</label> 
									</span>
									<button type="button" class="btnToggle"><span class="hidden">상세내용 닫기</span></button> <!-- 버튼 클릭 시 li에 toggleOn 클래스 추가되면서 toggleCont 펼쳐짐 -->
									





	
		<div class="toggleCont">
			<div class="toggleInner">												
				<table class="tblH">
					<colgroup>
						<col style="width:auto">
						<col style="width:33%" span="2">
					</colgroup>
					<caption>개인정보 수집 이용 목록</caption>
					<thead>
						<tr>
							<th scope="col">수집 항목</th>
							<th scope="col">수집 목적</th>
							<th scope="col">보유 기간</th>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td>이름(국문/영문),<br>휴대폰 번호, 이메일 주소, 성별</td>
						<td>서비스 이용자 식별 및 의사소통</td>
						<td rowspan="2"><strong class="f18">객실예약 후 5년</strong></td>
					</tr>
					<tr>
						<td>신용카드 종류, 번호, 유효기간, 비밀번호(앞2자리), 생년월일</td>
						<td>객실 및 부대시설<br>이용요금에 대한 보증</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	
	

								</li>

							</ul>
							<p class="txtGuide">
								위 개인정보 수집 · 이용에 대한 동의를 거부할 수 있으나 동의 거부 시 객실 예약이 불가합니다.
							</p>

                            <ul class="toggleList agreeCont" style="margin-top : 50px;">
                                <li class="toggleOn">
									<span class="frm type02">
										<input type="checkbox" id="creditCardAgree" name="creditCardAgree" value="Y">
										<label for="creditCardAgree">[선택] 다음번 신용카드정보 재사용을 위해 위 신용카드 정보를 저장하는데 동의하십니까?</label>
									</span>
                                </li>
                            </ul>
                            <p class="txtGuide">
                                동의 거부 시 신용카드정보 재사용이 제한됩니다.
                            </p>



							
							 
						
						
						<h3 class="titDep3">취소 규정</h3>
						<ul class="toggleList agreeCont">
							<li class="toggleOn">
								<span class="frm type02">
									<input type="checkbox" id="cancelAgree" name="cancelAgree" />
									<label for="cancelAgree">
										[필수] 취소 및 노쇼(No-show) 규정에 동의합니다.
									</label>
								</span>
								<button type="button" class="btnToggle">
									<span class="hidden">
										상세내용 보기
									</span>
								</button>
								<div class="toggleCont">
									<div class="toggleInner">
										<div class="scrollWrap">
											<ul class="listDep1">
												<li>체크인 7일 전 오후 6시 이전 : 위약금 없이 변경 및 취소 가능</li>
<li>체크인 7일 전 오후 6시 이후 ~ 1일 전 오후 6시 이전 : 최초 1박 요금의 20% 부과</li>
<li>체크인 1일 전 오후 6시 이후 : 취소 및 No-show 위약금 발생
<ul class="listDep2">
<li>1박 투숙 : 객실료의 80% 위약금 부과</li>
<li>2박 이상 투숙 : 최초 1박 요금의 100% 부과</li>
</ul>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul>	
					</div>		
				</div>
				<div class="rCont floating">
					<ul class="toggleList rsvList">
						
						
							
							
							
							
                                
                                    
                                        
                                            
                                            
                                            
                                        
                                    
                                    
                                
							
                                
                                    
                                        
                                            
                                                
                                            
                                            
                                            
                                        
                                    
                                    
                                
							
                                
                                    
                                        
                                            
                                            
                                            
                                        
                                    
                                    
                                
							
							
							
								
									
								
								
							
							
							<li class="toggleOn"> <!-- 기본으로 펼쳐진 경우 toggleOn  추가 -->
								<strong class="listTit">
									객실1
									<span class="price" id="roomAmount0"><em>359,748</em>KRW</span>
								</strong>
								<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">
										<div class="optionTotal scrollWrap">
											<ul class="infoData">
												
													
													<li>
														<span class="lfData">2024.05.23</span>
														<span class="rtData">212,500</span>
													</li>
												
											</ul>
											
												<ul class="infoData" id="roomOptInfo0">
													
                                                        
                                                            
                                                                
                                                                    
                                                                    
                                                                    
                                                                
                                                            
                                                            
                                                        
													
                                                        
                                                            
                                                                
                                                                    
                                                                        <li>
                                                                            <span class="lfData">성인 조식</span> 
                                                                            <span class="rtData">114,544</span>
                                                                        </li>
                                                                    
                                                                    
                                                                    
                                                                
                                                            
                                                            
                                                        
													
                                                        
                                                            
                                                                
                                                                    
                                                                    
                                                                    
                                                                
                                                            
                                                            
                                                        
													
												</ul>
											
											<ul class="infoData" >
												<li><span class="lfData">세금</span><span class="rtData" id="roomTax0">32,704</span></li>
												<li style="display: none;"><span class="lfData">봉사료</span><span class="rtData" id="roomService0">0</span></li>
											</ul>
										</div>
									</div>
								</div>
							</li>	
						
					</ul>
					<div class="totalCont"><!-- 20200420 수정 -->
						<div class="totalPrice"><!-- saleTxt가 있을땐 type02 -->
							<span class="txt">총 예약금액</span>
							
								
									<span class="subTxt">+ 세금(10%)</span>
								
								
							
							<span class="price"><em>359,748</em>KRW</span>
						</div>
						<div class="btnArea">
							<div><a href="#none" class="btnSC btnL active" onclick="fncGoResv();">예약 완료</a></div> <!-- 예약완료 -->
						</div>
					</div>
				</div>
			</div>
			<!-- //rsvRoomWrap -->
		</div>
		<!-- //inner -->
		<!-- 컨텐츠 E -->
	</div>
</form>


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

