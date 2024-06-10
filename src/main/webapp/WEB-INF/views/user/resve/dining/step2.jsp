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

  <title></title>

  <link rel="canonical" href="https://josunhotel.com/resve/dining/step0.do"/>
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
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->





        <!--(페이지 URL)-->













<script type="text/javascript" src="/static/home/js/home.js"></script>
<script type="text/javascript">

    $(document).ready(function (){
        fncCatchDiningInfo();
    });

    // 캐치테이블 업장정보
    function fncCatchDiningInfo() {
        let shopId = $("#shopId").val();

        if (shopId == '') {
            $("#catchInfo").remove();
        }

        if (shopId != '') {
            jQuery.ajax({
                type: "GET",
                url: "/resve/dining/info.json",
                cache: false,
                dataType: "json",
                async: true,
                global: false,
                data: {
                    "shopId": shopId
                },
                beforeSend: function () {
                    commonJs.showLoadingBar(); //로딩바 show
                },
                complete: function () {
                    commonJs.closeLoadingBar(); //로딩바 hide
                },
                success: function (data) {
                    const langCode = jQuery("#searchLangCode").val();

                    $("#catchInfo").children().remove();
                    let catchInfoHtml = "";
                    let parkingGuide = "";
                    let bizHourGuide = "";

                    if (langCode == "ko") {
                        parkingGuide = data.result.data.parkingGuide != null ? data.result.data.parkingGuide.replace(/\n/g, "</br>") : "";
                        bizHourGuide = data.result.data.bizHourGuide != null ? data.result.data.bizHourGuide.replace(/\n/g, "</br>") : "";
                    } else {
                        parkingGuide = data.result.data.parkingGuideEn != null ? data.result.data.parkingGuideEn.replace(/\n/g, "</br>") : "";
                        bizHourGuide = data.result.data.bizHourGuideEn != null ? data.result.data.bizHourGuideEn.replace(/\n/g, "</br>") : "";
                    }

                    if (bizHourGuide != '' || bizHourGuide != null) {
                        catchInfoHtml += `</br><p style="font-weight: bold;">운영시간</p>
                                            <p>${bizHourGuide}</p>`; // 운영정보
                    }
                    if (parkingGuide != '' || parkingGuide != null) {
                        catchInfoHtml += `</br><p style="font-weight: bold;">주차정보</p>
                                            <p>${parkingGuide}</p>`; // 주차정보
                    }
                    if (parkingGuide == '' && bizHourGuide == '') {
                        $("#catchInfo").remove();
                    }

                    $("#catchInfo").append(catchInfoHtml);
                },
                error: function (data) {
                    $("#catchInfo").remove();
                }
            });
        }

    }

    //호텔 선택
    function fncSelectHotel(){
        var searchSysCode = jQuery("#hotelSel").val();
        jQuery("#searchSysCode").val(searchSysCode);
        jQuery.ajax({
            type : "GET",
            url : "/dining/getResveAbleList.json",
            cache : false,
            dataType : "json",
            async: true,
            data : {
                "searchSysCode" : searchSysCode
            },
            global : false,
            beforeSend: function() {
                commonJs.showLoadingBar(); //로딩바 show
            },
            complete: function() {
                commonJs.initSwipe(jQuery(".swipeWrap"));
                commonJs.closeLoadingBar(); //로딩바 hide
            },
            success : function(data){
                console.log(data);
                var diningCodeList = data.diningCodeList;

                //선택 호텔의 다이닝이 없을 경우, 이전 호텔의 값을 유지
                if(data.errMsg != null){
                    alert(data.errMsg); //선택하신 호텔은 예약 가능한 다이닝이 없습니다.
                    jQuery("#searchSysCode").val(jQuery("#prevSysCode").val());
                    jQuery("#hotelSel").val(jQuery("#prevSysCode").val());
                    jQuery("#hotelSel").seletMenuUpdate();

                    return false;
                }

                jQuery("#prevSysCode").val(searchSysCode);
                jQuery("#diningSel>option").remove();
                var html = "";
                for(var i=0; i < diningCodeList.length; i++){
                    if(i != 0){
                        html += '<option value='+diningCodeList[i].diningCode+'>'+ diningCodeList[i].diningNm +'</option>';
                    }else {
                        html += '<option value='+diningCodeList[i].diningCode+' selected>'+ diningCodeList[i].diningNm +'</option>';
                    }
                }
                jQuery("#diningSel").append(html);
                //select box 업데이트
                jQuery("#diningSel").seletMenuUpdate();

                fncSelectDining();
            },
            error:function(r, s, e){
                alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
            }

        })
    }

    //다이닝 선택
    function fncSelectDining(){
        //예약 버튼 제거
        // jQuery("#goResvBtnArea").empty();

        var searchSysCode = jQuery("#hotelSel").val();
        var searchDiningCode = jQuery("#diningSel").val();

        jQuery("#diningCode").val(searchDiningCode);
        jQuery.ajax({
            type : "GET",
            url : "/dining/get.json",
            cache : false,
            dataType : "json",
            async : true,
            data : {
                "searchSysCode" : searchSysCode,
                "diningCode" : searchDiningCode
            },
            global : false,
            beforeSend: function() {
                commonJs.showLoadingBar(); //로딩바 show
            },
            complete: function() {
                commonJs.closeLoadingBar(); //로딩바 hide
                // fncRenderStep2();
	            setTimeout(function(){
	                //스와이프 초기화
	                commonJs.initSwipe($('.swipeWrap'));
	            }, 200)

            },
            success : function(data){
                console.log(data);

                //선택된 data 초기화
                jQuery("#selDay").val("");

                //에러가 있을 경우
                if(data.errMsg != null){
                    alert(data.errMsg);
                    return false;
                }

                var diningInfoBean = data.diningInfoBean;
                var imgList = data.imgList;
                var diningCode = data.diningInfoBean.diningCode;
                var searchSysCode = data.diningInfoBean.sysCode;
                const resveKndCode = data.diningInfoBean?.resveKndCode;
                const resveLinkUrl = data.diningInfoBean?.resveLinkUrl;

                $("#shopId").val(data.diningInfoBean.tmpr2);
                jQuery("#diningNm").val(diningInfoBean.diningNm);

                var imgHtml = "";

                if(imgList.length > 1){
                    imgHtml += '<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>';
                }

                imgHtml += '<ul class="swipeCont">';
                for(var i=0; i < imgList.length; i++){
                    imgHtml += '<li class="swipeSlide">';
                    imgHtml += '	<img src="/util/file/download.do?fileSn='+imgList[i].fileSn+'&subFileSn='+imgList[i].subFileSn+'&sysCode='+diningInfoBean.sysCode +'" alt="'+diningInfoBean.imgDc+'">';
                    imgHtml += '</li>';
                }
                imgHtml += '</ul>';

                if(imgList.length > 1){
                    imgHtml += '<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>';
                }


                jQuery(".swipeWrap.gallery").html(imgHtml);

                var diningInfoHtml = "";
                jQuery(".roomIntro").children().remove();
                diningInfoHtml += '<dl>';
                diningInfoHtml += '<dt class="name">'+ diningInfoBean.diningNm +'</dt>';
                diningInfoHtml += '<dd class="txt" style="padding-bottom: 100px;">' + diningInfoBean.intrcnDc;
                diningInfoHtml += '<div class="addDiningOption" id="catchInfo"></div></dd>';
                diningInfoHtml += '<dd class="info" style="position: relative;">';
                diningInfoHtml += '	<ul>';
                diningInfoHtml += '		<li>';
                diningInfoHtml += '			<em>위치</em>';/* 위치 */
                diningInfoHtml += '			<span>' + diningInfoBean.adres + '</span>';
                diningInfoHtml += '		</li>';
                diningInfoHtml += '		<li>';
                diningInfoHtml += '			<em>문의</em>';/* 문의  */
                diningInfoHtml += '			<span>'+diningInfoBean.inquiryTelno+'</span>';
                diningInfoHtml += '		</li>';
                diningInfoHtml += '		<li>';
                diningInfoHtml += '			<em>좌석수</em>';/* 좌석수 */
                diningInfoHtml += '			<span>'+diningInfoBean.seatDc+'</span>';
                diningInfoHtml += '		</li>';
                if(diningInfoBean.menuUseYn === "Y"){
                    diningInfoHtml += '		<li>';
                    diningInfoHtml += '			<em>메뉴</em>';/* 메뉴 */
                    diningInfoHtml += '			<a href="#" class="btnLine" onclick="fncMenuShow(\''+searchSysCode+'\',\''+diningCode+'\'); return false;">메뉴 보기</a>';/* 메뉴 보기 */
                    diningInfoHtml += '		</li>';
                }
                diningInfoHtml += '	</ul>';
                diningInfoHtml += '</dd>';
                diningInfoHtml += '</dl>';

                jQuery(".roomIntro").append(diningInfoHtml);
				fncRenderResveBtn(resveKndCode, resveLinkUrl);
                fncCatchDiningInfo();

            },
            error:function(r, s, e){
                alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
            }

        })
    }
    /**
     * 예약 구분 코드에 따라 예약 버튼 랜더링
     * */
    function fncRenderResveBtn(resveKndCode, resveLinkUrl){
        //<button id="btnResve" type="button" class="btnSC btnL active" onclick="fncPingCheck();">예약하기</button>
	    const $resveBtn = jQuery("#btnResve");
        $resveBtn.show();
        if(resveKndCode === "00"){
            $resveBtn.attr("onclick", "fncPingCheck();");
        }else if(resveKndCode === "01"){
            $resveBtn.attr("onclick", `window.open('${resveLinkUrl}')`);
        }else {
            $resveBtn.attr("onclick", "");
            $resveBtn.hide();
        }
    }

    // 캐치테이블 연결 매장
    function fncCatchTableResveDining(sysCode , diningCode){
        var flag = true;

        var resvList = [
            /*{ sysCode : "JPY", diningCode : ["001","002","003"] }, // 조선 팰리스 (콘스탄스, 더그레이트 홍연, 이타닉가든)
            { sysCode : "GJJ", diningCode : ["001","002"] }, // 그랜드 조선 제주 (ARIA, 루브리카)
            { sysCode : "GJB", diningCode : ["001","003"] }, // 그랜드 조선 부산 (ARIA, 팔레드신)
            { sysCode : "GRP", diningCode : ["001", "003"] }, // 그래비티 판교 (앤디쉬, 호무랑)
            { sysCode : "LESCAPE", diningCode : ["001","002"] }, // 리스케이프 (Palais de Chine, 라망시크레)
            { sysCode : "TWC", diningCode : ["001","003","004"] }, // 웨스틴 조선 서울 (THE NINTH GATE, ARIA, RUBRICA)
            { sysCode : "TWCB", diningCode : ["001","003","008"] }, // 웨스틴 조선 부산 (까밀리아, 셔블, 오킴스)
            { sysCode : "FPBSS", diningCode : ["001"] }, // 포포인츠 바이 쉐라톤 조선 서울역 (THE EATERY)
            { sysCode : "FPBSM", diningCode : ["001"] }, // 포포인츠 바이 쉐라톤 조선 명동 (EVOLUTION)
            { sysCode : "JOSUNHOTEL", diningCode : ["006"] }, // 조선호텔앤리조트 (MOTT 32)*/

            { sysCode : "TWC", diningCode : ["003"] }, // 웨스틴 조선 서울 (ARIA)
            { sysCode : "LESCAPE", diningCode : ["002"] }, // 리스케이프 (라망시크레)


        ];

        var resvHotel = resvList.find(item =>item.sysCode == sysCode);
        if(resvHotel != null){
            flag = resvHotel.diningCode.some(code => code == diningCode);
        } else {
            flag = false;
        }
        return flag;
    }

    // healthCheck
    function fncPingCheck() {
        jQuery.ajax({
            type : "GET",
            url : "/resve/dining/catch/healthcheck.json",
            cache : false,
            dataType : "json",
            async : true,
            data : {
            },
            global : false,
            beforeSend: function() {
                commonJs.showLoadingBar(); //로딩바 show
            },
            complete: function() {
                commonJs.closeLoadingBar(); //로딩바 hide
            },
            success : function(data){
                if (typeof data.result.data.status != 'undefined') {
                    if (data.result.data.status == 200) {
                        fncGoStep1();
                    } else {
                        commonJs.popShow(jQuery('#healthCheckPop'));
                    }
                }
            },
            error : function() {
                commonJs.popShow(jQuery('#healthCheckPop'));
        }});
    }

    // 예약하기
    function fncGoStep1() {
        var searchSysCode = jQuery("#hotelSel").val();
        var searchDiningCode = jQuery("#diningSel").val();

        //비회원시에 예약
        
        
        fncNotLoginResv();
        

    }

    function fncNotLoginResv(){
        $("#form").attr("action", "/resve/dining/step1.do");
        $("#form").attr("method", "get");
        $("#form").submit();
    }

    function fncLoginResv(){
        //로그인 page로 이동
        var searchSysCode = nvl(jQuery("#searchSysCode").val(),"");
        var diningCode = nvl(jQuery("#diningCode").val(),"");

        var nextUrl = "/resve/dining/step0.do?searchSysCode="+searchSysCode+"&diningCode="+diningCode ;

        jQuery("#nextURL").val(nextUrl);
        jQuery("#loginForm").attr("action", "/login/loginForm.do");
        jQuery("#loginForm").attr("method", "get");
        jQuery("#loginForm").submit();	//검색 시 true값으로 설정-validation 체크를 하지 않음
    }

    function fncBrAlert(){
        var text = '선택하신 다이닝은 예약이 불가합니다. 고객센터로 문의해주세요.';	//선택하신 다이닝은 예약이 불가합니다. 고객센터로 문의해주세요.
        var msg = text.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        alert(msg);
    }

    function fncClosePopup() {
        commonJs.popClose(jQuery('#healthCheckPop'));
    }

    function nvl(str, newStr){
        if(isNull(str)||isUndefined(str)){
            return newStr;
        }else {
            return str;
        }
    }

    function isNull(value){
        var _chkStr = value+"";
        if(_chkStr == "" || _chkStr == null || _chkStr == "null"){
            return true;
        }else {
            return false;
        }
    }

    function isUndefined(value){
        if(typeof(value) == undefined || typeof(value) == "undefined" || value == "undefined" || value == undefined){
            return true;
        }else{
            return false;
        }
    }

</script>
<div id="container" class="container">
    <input type="hidden" id="prevSysCode" value='TWC'/>	
    <input type="hidden" id="searchLangCode" name="searchLangCode" value="ko"/>
    <input type="hidden" id="diningNm" name="diningNm" value="ARIA" />
    <form id="form" name="form">
        <input type="hidden" id="searchSysCode" name="searchSysCode" value='TWC'/>
        <input type="hidden" id="diningCode" name="diningCode" value='003'/>
        <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ" />
    </form>
    <form name="loginForm" id="loginForm">
        <input type="hidden" name="nextURL" id="nextURL" />
    </form>
    <!-- 컨텐츠 S -->
    <h1 class="hidden">예약<!-- 예약 --></h1>
    <div class="topArea">
        <div class="topInner">
            <h2 class="titDep1">Booking</h2>
            <p class="pageGuide">조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p><!-- 조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
        </div>
    </div>
    <!-- //topArea -->
    <div class="inner">
        <div class="diningContainer drDining_st01">
            <strong class="listTit">호텔 & 다이닝 선택<!-- 호텔 &amp; 다이닝 선택 --></strong>
            <div class="diningSelectCont ">
                <div class="lCont">
                    <div class="intInner duobuleSelect">
                        <div class="intArea selectWrap" style="width:508px">
                            <select id="hotelSel" name="searchSysCode" data-height="150px" data-direction="down" aria-required="true" onchange="fncSelectHotel();">
                                
                                    <option value="JPY"  >조선 팰리스</option>
                                
                                    <option value="TWC" selected='selected' >웨스틴 조선 서울</option>
                                
                                    <option value="TWCB"  >웨스틴 조선 부산</option>
                                
                                    <option value="GJB"  >그랜드 조선 부산</option>
                                
                                    <option value="GJJ"  >그랜드 조선 제주</option>
                                
                                    <option value="LESCAPE"  >레스케이프</option>
                                
                                    <option value="GRP"  >그래비티 서울 판교</option>
                                
                                    <option value="FPBSS"  >포포인츠 바이 쉐라톤 조선 서울역</option>
                                
                                    <option value="FPBSM"  >포포인츠 바이 쉐라톤 조선, 서울 명동</option>
                                
                                    <option value="PPJ"  >파라스파라 서울</option>
                                
                                    <option value="YYH"  >코랄로 바이 조선</option>
                                
                                    <option value="JOSUNHOTEL"  >조선호텔앤리조트</option>
                                
                            </select>
                        </div>
                        <div class="intArea selectWrap" style="width:508px">
                            <select id="diningSel" name="diningCode" data-height="150px" data-direction="down" aria-required="true" onchange="fncSelectDining();">
                                
                                    <option value="001" >THE NINTH GATE</option>
                                
                                    <option value="003" selected="selected">ARIA</option>
                                
                                    <option value="004" >RUBRICA</option>
                                
                                    <option value="011" >SUSHI CHO</option>
                                
                                    <option value="015" >HONGYUAN</option>
                                
                                    <option value="099" >LOUNGE &amp; BAR</option>
                                
                                    <option value="100" >JOSUN DELI</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="swipeWrapArea">
                        <div class="swipeWrap gallery">
                            <button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>
                            <ul class="swipeCont">
                                
                                    <li class="swipeSlide"><img src="/util/file/download.do?fileSn=263788&subFileSn=264355&sysCode=TWC" alt="아리아 이미지"></li>
                                
                            </ul>
                            <button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>
                        </div>
                        <div class="indicator">
                            <button type="button" class="num on">
                                <em class="hidden">현재 이미지</em>01
                            </button>
                            <button type="button" class="num">02</button>
                            <button type="button" class="num">03</button>
                        </div>
                    </div>
                </div>
                <!-- //lCont -->
                <div class="rCont">
                    <div class="roomIntro">
                        <dl>
                            <dt class="name">ARIA</dt>
                            <dd class="txt">
                                오페라의 영혼을 셰프와 함께 실시간으로 느낄 수 있는 뷔페 레스토랑<br><br>
<div class="mainDiningHidden">
<p style="font-weight: bold;">가격 안내</p>
<p>[아침]</p>
<p>성인 70,000 KRW / 어린이 35,000 KRW 
<p>[주중 점심]</p>
<p>성인 165,000 KRW / 어린이 80,000 KRW 
<p>[주중 저녁]</p>
<p>성인 190,000 KRW / 어린이 80,000 KRW 
<p>[주말/공휴일]</p>
<p>성인 190,000 KRW / 어린이 80,000 KRW
<p>*어린이: 37개월 이상 ~ 12세 이하 (초등학생까지)<br><br>
<div class="mainDiningHidden">
<p><p style="font-weight: bold;">콜키지 안내</p>
<p>- 테이블 당 1병 10만원 (와인 750ml 기준)</p>
<p>※ 규정 외 주류는 업장에 문의 부탁드립니다.<br><br>
<div class="mainDiningHidden">
<p><p style="font-weight: bold;">뷔페 상품권 안내</p>
<p>웨스틴 조선 서울 아리아에서 준비한 뷔페 상품권으로</p>
<p>소중한 분께 감사의 마음을 전하시기 바랍니다.</p>
<p>- 아리아 뷔페 1인 식사권</p>
<p>- 아리아 뷔페 2인 식사권</p>
<p>※ 갈라디너 등 이벤트일 및 12월 사용 시 추가 요금이 발생될 수 있습니다.</p>
                                    <!-- 230102 api 추가 옵션 부분 :: 추가옵션 없으면 addDiningOption 전부 지워주세요 -->
                                <div class="addDiningOption" id="catchInfo">
                                    <!-- option01 -->


                                    <!-- // option01 -->
                                    <!-- option02 -->





                                    <!-- // option02 -->
                                </div>
                                    <!-- // 230102 api 추가 옵션 부분 -->
                            </dd>
                            <dd class="info">
                                <ul>
                                    <li>
                                        <em>위치<!-- 위치 --></em>
                                        <span>웨스틴 조선 서울 저층 로비</span>
                                    </li>
                                    <li>
                                        <em>문의<!-- 문의 --></em>
                                        <span>02-317-0357</span>
                                    </li>
                                    <li>
                                        <em>좌석수<!-- 좌석수 --></em>
                                        <span>총 240석 별실 3개(최대 10명 수용 가능) <br> * 별실 이용 시 룸 차지(50,000원) 부과 </span>
                                    </li>
                                    
                                </ul>
                            </dd>
                        </dl>
                    </div>
                    
                        
                            
                            <button id="btnResve" type="button" class="btnSC btnL active" onclick="fncPingCheck();">예약하기</button><!-- 예약하기 -->
                        
                        
                        
                    

                </div>
                <!-- //rCont -->
            </div>
            <!-- //diningSelectCont -->
        </div>
    </div>
    <!-- //inner -->
    <!-- 컨텐츠 E -->
</div>
<!-- //container -->

<!-- 헬스체크 Layer -->
<div id="healthCheckPop" class="layerPop">
    <div class="layerCont" style="top: 50%; left: 50%; margin-top: -175px; margin-left: -350px">
        <h2 class="compTit">다이닝 예약 안내</h2><!--다이닝 예약 안내-->
        <div class="compLayer reserveOpArea" style="width:560px">
            <p class="txt">현재 다이닝 예약 시스템 점검 중으로 온라인 예약이 불가합니다.</p><!--현재 다이닝 예약 시스템 점검 중으로 온라인 예약이 불가합니다.-->
            <strong class="txtConfirm">각 다이닝 업장으로 유선문의 부탁 드립니다.</strong><!--각 다이닝 업장으로 유선문의 부탁 드립니다.-->
            <p class="txt">서비스 이용에 불편을 드려 죄송합니다.</p><!-- 서비스 이용에 불편을 드려 죄송합니다. -->
            <div class="btnArea">
                <button type="button" class="btnSC btnM active" onclick="fncClosePopup();">확인</button><!-- 확인 -->
            </div>
        </div>
    </div>
</div>

<!-- //헬스체크 Layer -->

<!-- 비회원 예약 Layer -->
<div id="layerPop1" class="layerPop">
    <div class="layerCont" style="top: 50%; left: 50%; margin-top: -175px; margin-left: -350px">
        <h2 class="compTit">비회원 예약<!-- 비회원 예약 --></h2>
        <div class="compLayer reserveOpArea" style="width:560px">
            <p class="txt">현재 비회원으로 예약 진행 중입니다<!-- 현재 비회원으로 예약 진행 중입니다 --></p>
            <strong class="txtConfirm">회원이신 고객은 로그인 후, 예약을 진행 하시겠습니까?<!-- 회원이신 고객은 로그인 후, 예약을 진행 하시겠습니까? --></strong>
            <p class="txt">※ 회원 가입시 포인트적립이 가능합니다.<!-- 회원 가입시 포인트적립이 가능합니다. --></p>
            <div class="btnArea">
                <button type="button" class="btnSC btnM" onclick="fncNotLoginResv();">비회원 예약<!-- 비회원 예약 --></button>
                <button type="button" class="btnSC btnM active" onclick="fncLoginResv();">로그인<!-- 로그인 --></button>
                <button type="button" class="btnSC btnM active" onclick="location.href='/identify/identifyIntro.do'">회원가입<!-- 회원가입 --></button>
            </div>
        </div>
        <!-- 230103 팝업 닫기 버튼 추가 -->
        <button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'))">닫기</button>
        <!-- // 230103 팝업 닫기 버튼 추가 -->
    </div>
</div>

<!-- //비회원 예약 Layer -->









<script type="text/javascript" src="/revolution/js/bw.lab.alphanumeric-1.0.js"></script>
<script type="text/javascript" src="/revolution/js/bw.lab.money-1.0.js"></script>
<script>
	
	jQuery(function(){
		jQuery("#menuTab > li").on("click", function() {
			jQuery("#menuTab > li").removeClass("on");
			jQuery(this).addClass("on");
		});
	})
	function fncMenuShow(searchSysCode, diningCode) {
		
		jQuery("#menuPopDiningCode").val(diningCode);
		jQuery("#menuPopSysCode").val(searchSysCode);
		fncTabListJson(searchSysCode, diningCode);
		
	}
	
	
	function fncTabListJson(searchSysCode, diningCode) {
		
		jQuery.ajax({
			type : "GET",
			url : "/rstrntMenu/tabListJson.json",
			cache : false,
			dataType : "json",
			data : {
				"diningCode" : diningCode,
				"searchSysCode" : searchSysCode	
			},
			global : false,
			async : false,
			
			success : function(data){
				
				var _list = data.tabList;
				
				var rstrntLclas = "";
				var tabHtml = "";
				
				//다이닝 이름
				jQuery("#menuPopup .compTit").text(data.diningNm);
				jQuery("#popDiningNm").val(data.diningNm);
				
				if(_list != null && _list.length > 0){
					
					for(var i=0; i<_list.length; i++){
						
						if (i == 0) {
							rstrntLclas = _list[i].lclasCode;
						}
						tabHtml += '<li><a href="#'+ _list[i].lclasCode +'" onclick="fncSelectMenuTab(\''+_list[i].lclasCode+ '\')">' + _list[i].lclasNm + '</a></li>';
						
						
					}
					
				}
				jQuery("#menuTab").html(tabHtml);
				jQuery("#menuTab > li").first().addClass("on");
				fncMenuListJson(searchSysCode, diningCode);
			},
			
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
			
		});
	}
	
	
	function fncMenuListJson(searchSysCode, diningCode) {
		
		jQuery.ajax({
			type : "GET",
			url : "/rstrntMenu/menuListJson.json",
			cache : false,
			dataType : "json",
			data : {
				"diningCode" : diningCode,
				"searchSysCode" : searchSysCode
			},
			global : false,
			async : false,
			
			success : function(data){
				var _menuMapList = data;
				
				//등록된 메뉴가 있을때만 출력
				if(_menuMapList.length == 0 || _menuMapList == null){
					alert("등록된 메뉴가 없습니다."); //등록된 메뉴가 없습니다.
					return false;
				}
				
				jQuery(".menuCont").each(function(){
					jQuery(this).remove();
				});
				
				//첫번째 탭 value 세팅
				jQuery("#lclasCode").val(_menuMapList[0].lclasCode);
				
				for(var k=0; k< _menuMapList.length; k++){
				
				 	var _singleMenu = _menuMapList[k].singleMenu;			// 단품 메뉴
				 	var _lclasCode = _menuMapList[k].lclasCode;				// 대분류 코드
				 	var _lclasNm = _menuMapList[k].lclasNm;				// 대분류 명
				 	
				 	var _singleLclasMenuList = null;
					var _singleMenuOrigin = null;
					
				 	if(_singleMenu != null){
				 		_singleLclasMenuList = _singleMenu.lclasMenuList; // 단품 대분류
						_singleMenuOrigin = _singleMenu.origin.originCn;  //단품 원산지
					}
					
					var _setMenu = _menuMapList[k].setMenu;						// 세트 메뉴
					var _setLclasMenuList = null;
					var _setMenuOrigin = null;
					if(_setMenu != null){
						
						_setLclasMenuList = _setMenu.lclasMenuList; 		// 세트 대분류
						_setMenuOrigin = _setMenu.origin.originCn;			// 세트 원산지
					}
					
					
					
					var menuHtml = "";
					if(k == 0){
						menuHtml += '<div id='+ _lclasCode +' class="tabCont printCont menuCont" style="display:block">';
					}else {
						menuHtml += '<div id='+ _lclasCode +' class="tabCont printCont menuCont" style="display:none">';
					}
					menuHtml += '	<h3 class="hidden">'+ _lclasNm +'</h3>';
					menuHtml += '	<div class="scrollWrap menuPanView">';
					/* menuHtml += '		<div class="customScrollBox">'; */
					
					//세트 메뉴 세팅
					if(_setLclasMenuList != null && _setLclasMenuList.length > 0){
						
						for(var i=0; i<_setLclasMenuList.length; i++){
							
							var _setDetailMenu = _setLclasMenuList[i].detailMenuList[0]; //상세 메뉴
							
							
							menuHtml += '			<div class="menuPan type02">';
							menuHtml += '				<p class="tit">'+ _setDetailMenu.menuNm +'</p>';
							menuHtml += '				<ul class="menuList">';
							menuHtml += '				<li>';
							menuHtml += '					<div class="txt">';
							menuHtml += '						<span>'+ fncReplaceEnter(_setDetailMenu.contents) +'</span>';
							menuHtml += '					</div>';
							menuHtml += '				</li>';
							menuHtml += '				</ul>';
							menuHtml += '				<p class="bill">'+ fncReplaceEnter(_setDetailMenu.pcCndDc) +'</p>';
							menuHtml += '			</div>';
							
						}
						
						//세트 원산지 세팅
						if(_setMenuOrigin != null && _setMenuOrigin != ""){
							menuHtml += '			<div class="notiBox">';
							menuHtml += '				<strong class="hidden">원산지 표시 안내</strong>';
							menuHtml += fncReplaceEnter(_setMenuOrigin);
							menuHtml += '			</div>';
						}
					}
					
					//단품 메뉴 세팅
					if(_singleLclasMenuList != null && _singleLclasMenuList.length > 0){
						
						for(var i=0; i<_singleLclasMenuList.length; i++){
							
							var _detailMenuList = _singleLclasMenuList[i].detailMenuList; //상세 메뉴
							
							menuHtml += '			<div class="menuPan type01">';
							menuHtml += '				<p class="tit">'+ _singleLclasMenuList[i].singleSclasNm +'</p>';
							menuHtml += '				<ul class="menuList">';
							
							//상세 메뉴 세팅
							for(var j=0; j<_detailMenuList.length; j++){
								menuHtml += '				<li>';
								menuHtml += '					<span class="txt">'+ fncReplaceEnter(_detailMenuList[j].menuNm) +'</span>';
								menuHtml += '					<p class="bill">';
								menuHtml += '						'+ _detailMenuList[j].pcCndDc +'';
								menuHtml += '					</p>';
								menuHtml += '				</li>';
							}
							
							menuHtml += '				</ul>';
							menuHtml += '			</div>';
						}
						
						//단품 원산지 세팅
						if(_singleMenuOrigin != null && _singleMenuOrigin != ""){
							menuHtml += '			<div class="notiBox">';
							menuHtml += '				<strong class="hidden">원산지 표시 안내</strong>';
							menuHtml += fncReplaceEnter(_singleMenuOrigin);
							menuHtml += '			</div>';
						}
						
					}
					
					menuHtml += '		</div>';
					/* menuHtml += '	</div>'; */
					menuHtml += '</div>';
					
					jQuery(".menuPanArea").append(menuHtml);
				}
				commonJs.initDesignScroll($('.scrollWrap'));
				commonJs.initTab('.tabToggle');
				commonJs.popShow($('#menuPopup'));
				
			},
			
			error:function(r, s, e){
				alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		})
	}
	
	
	function fncSelectMenuTab(lclasCode){
		jQuery("#lclasCode").val(lclasCode);
	}
	
	
	function fncMenuDownload(){
		jQuery("#diningMenuPopForm").attr("action", "/rstrntMenu/menuDownload.do");
		jQuery("#diningMenuPopForm").attr("method", "get");
		jQuery("#diningMenuPopForm").submit();
	}
	
	
	
	function fncReplaceEnter(str) {
		if(str != "") {
			return str.split("\r\n").join("<br/>");
		} else {
			return "";
		}
	}
	
</script>

<form id="diningMenuPopForm" name="diningMenuPopForm">
	<input type="hidden" id="lclasCode" name="lclasCode" value="">
	<input type="hidden" id="menuPopSysCode" name="searchSysCode" value="">
	<input type="hidden" id="menuPopDiningCode" name="diningCode" value="">
	<input type="hidden" id="popDiningNm" name="diningNm" value="">
</form>

<!-- 메뉴 자세히 보기 Layer -->
<div id="menuPopup" class="layerPop">
	<div class="layerCont">
		<div class="menuPanArea">
			
			<h2 class="compTit"></h2>
			
			            
            <ul id="menuTab" class="tabType03 tabToggle"></ul>
            
            
            <div class="side">
				<button type="button" class="btnPrint02 btnLine">인쇄하기</button><!-- 인쇄하기 -->
				<button type="button" class="btnLine" onclick="fncMenuDownload();">다운로드</button><!-- 다운로드 -->
			</div>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#menuPopup'))">닫기</button><!-- 닫기 -->
	</div>
</div>
<!-- //메뉴 자세히 보기 Layer -->
<div id="dimmed" class="dimmed">

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

