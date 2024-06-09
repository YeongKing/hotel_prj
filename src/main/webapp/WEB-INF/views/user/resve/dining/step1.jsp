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
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta property="og:title" content="">
  <meta property="og:description" content="">
  <meta property="og:url" content="https://josunhotel.com/resve/dining/step1.do?searchSysCode=TWC&diningCode=003&shopId=pQUWDMHkPf2II_uVDPCFFQ">
  <meta property="og:image" content="https://josunhotel.com/static/home/images/josunhotel_og.png">
  <meta property="og:type" content="website"/>
  <meta property="og:site_name" content="Josun Hotels & Resorts"/>

  <link rel="canonical" href="https://josunhotel.com/resve/dining/step1.do?searchSysCode=TWC&diningCode=003&shopId=pQUWDMHkPf2II_uVDPCFFQ"/>
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

    $(document).ready(function() {
        // 예약 가능일 조회
        fncSearchAvailTimesWeekly();
    });

    // 예약 시작 가능일 조회 api
    function fncAvailTimesWeekly(visitDateTime) {
        return new Promise(function (resolve, reject) {
            let shopId = $("#shopId").val();
            let personCount = $("#personCountSelect").val();

            if (personCount != '' && visitDateTime != '') {
                jQuery.ajax({
                    type : "GET",
                    url : "/resve/dining/time/weekly.json",
                    cache : false,
                    dataType : "json",
                    async : true,
                    data : {
                        "shopId" : shopId,
                        "personCount" : personCount,
                        "visitDateTime" : visitDateTime
                    },
                    global : false,
                    beforeSend: function() {
                        commonJs.showLoadingBar(); //로딩바 show
                    },
                    complete: function() {
                        commonJs.closeLoadingBar(); //로딩바 hide
                    },
                    success : function(data){
                        if (typeof data.result != 'undefined') {
                            if (typeof data.result.slotStatusMsg != 'undefined') {
                                alert(data.result.slotStatusMsg);
                                return;
                            } else if (typeof data.result.resultMsg != 'undefined'){
                                alert(data.result.resultMsg);
                            }
                        } else {
                            alert(data.resultMsg);
                        }
                        resolve(data);
                    }});
            }
        });
    }

    // 예약 시작 가능일 조회 화면
    async function fncSearchAvailTimesWeekly() {
        let availCheck = false;
        let openDate = "";
        let week = 0;
        let maxWeek = 2; // 최대 검색 주 수 (해당 주 수 만큼 검색해서 없으면 오늘날짜 선택)

        function fncWeeklyDate(week) {
            let date = new Date();
            date.setDate(date.getDate()+(week*7));
            let YY = date.getFullYear();
            let mm = date.getMonth() >= 9 ? (date.getMonth()+1) : "0"+(date.getMonth()+1);
            let dd = date.getDate() >= 10 ? date.getDate() : "0"+date.getDate();
            let visitDateTime = YY+"-"+mm+"-"+dd;
            return visitDateTime;
        }

        while (!availCheck) {

            // 최대 검색 주 수 안에 없으면 오늘날짜로 선택
            if (week == maxWeek) {
                openDate = fncWeeklyDate(0);
                break;
            }

            let visitDateTime = fncWeeklyDate(week);

            let data = await fncAvailTimesWeekly(visitDateTime);

            if (typeof data.result.data != 'undefined') {
                let dateList = data.result.data;

                for (let i = 0; i < dateList.length; i++) {
                    let slots = dateList[i].slots;
                    for (let j = 0; j < slots.length; j++) {
                        let isAvailable = slots[j].isAvailable;
                            if (isAvailable) {
                                availCheck = true;
                                break;
                            }
                    }
                    if (availCheck) {
                        openDate = dateList[i].date;
                        break;
                    }
                }
            }
            week++;
        }
        openDate = openDate.replaceAll("-", ".");
        // 달력 그리기
        commonJs.initResvCalendar(jQuery("#diningCal"), openDate);
        // 해당 날짜로 예약가능일 조회
        await fncSearchAvailTimes();

    }

    // 달력 그리기
    commonJs.initResvCalendar = function (calendarEl, selectableDay){

        if (!calendarEl.length) {
            return;
        }

        // 예약 가능일 조회해서 받았을때 달력 그림
        // 30은 js때문에 추가
        if (selectableDay == 30 || selectableDay == '' || typeof selectableDay == 'undefined') {
            return;
        } else {
            var option = {};

            if (calendarEl.hasClass('calSingle')) {
                let selectedDate = selectableDay;
                var promotionDate = [];

                option = {
                    chkInTitle: '선택 됨',
                    numberOfMonths: 1,
                    showMonthAfterYear: true,
                    monthNames: [
                        "01", "02", "03", "04", "05", "06",
                        "07", "08", "09", "10", "11", "12"
                    ],
                    dayNamesMin: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
                    // minDate: 0,
                    minDate: selectedDate,
                    dateFormat: 'yy.mm.dd',
                    // onChangeMonthYear: function (year, month, inst) {
                    //     setPromotionDate(year, month);
                    // },
                    beforeShowDay: function (date) {
                        var calDate = dUtils.getToDate(date);
                        // select
                        if (selectedDate == calDate) {
                            // $('.calNotiCont').hide();
                            if (promotionDate.indexOf(calDate) != -1) {
                                // $('.calNotiCont').show();
                                return [true, 'sel revOn promotion'];
                            }
                            return [true, 'sel revOn'];
                        }
                        //promotion
                        if (promotionDate.indexOf(calDate) != -1) {
                            return [true, 'promotion'];
                        }

                        return [true];
                    },
                    onSelect: function (date, inst) {
                        selectedDate = date;
                        //다이닝 경우 선택 시 default 클래스 삭제
                        $('.default').removeClass('default');
                        fncSearchAvailTimes();

                    }
                };
                // function setPromotionDate(year, month) {
                //     //date push
                //     promotionDate = [];
                //     //test dummy
                //     var i = 20;
                //     while (i < 30) {
                //         promotionDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                //         i++;
                //     }
                // }
                calendarEl.datepicker(option);
                //초기 프로모션 데이트 설정
                // setPromotionDate(
                //     calendarEl.datepicker('getDate').getFullYear(),
                //     calendarEl.datepicker('getDate').getMonth() + 1
                // );
                calendarEl.datepicker('refresh');
            }
        }
    }

    // 예약 가능 시간 리스트 조회 api
    function fncAvailTimes() {
        return new Promise(function (resolve, reject) {
            let shopId = $("#shopId").val();
            let personCount = $("#personCountSelect").val();
            let visitDateTime = $("#diningCal").val().replaceAll(".", "-");

            if (personCount != '' && visitDateTime != '') {
                if (personCount != 'callResve') {
                    jQuery.ajax({
                        type : "GET",
                        url : "/resve/dining/time.json",
                        cache : false,
                        dataType : "json",
                        async : true,
                        data : {
                            "shopId" : shopId,
                            "personCount" : personCount,
                            "visitDateTime" : visitDateTime
                        },
                        global : false,
                        beforeSend: function() {
                            commonJs.showLoadingBar(); //로딩바 show
                        },
                        complete: function() {
                            commonJs.closeLoadingBar(); //로딩바 hide
                        },
                        success : function(data){
                            if (typeof data.result != 'undefined') {
                                if (typeof data.result.slotStatusMsg != 'undefined') {
                                    alert(data.result.slotStatusMsg);
                                } else if (typeof data.result.resultMsg != 'undefined'){
                                    alert(data.result.resultMsg);
                                }
                            } else {
                                alert(data.resultMsg);
                            }
                            resolve(data);
                        }
                    });
                } else if (personCount == 'callResve') {
                    resolve("callResve");
                }

            }
        });
    }

    // 예약 가능 시간 리스트 조회 화면
    async function fncSearchAvailTimes() {
        $("#selectInfoWrap").hide();
        $("#availSlotToken").val("");
        $("#visitTime").val("");
        $("#selectInfoWrap").children().remove();
        $('#allTimeSwitch').prop("checked", false);

        let data = await fncAvailTimes();

        if (data != "callResve") {
            $(".timeWrap").show();
            $("#groupPerson").hide();
            if (typeof data.result.data != 'undefined') {
                let dateList = data.result.data.slots;
                $("#confirmReservationUseYn").val(data.result.data.confirmReservationUseYn);

                let amCount = 0;
                let pmCount = 0;
                let amNoCount = 0;
                let pmNoCount = 0;

                $("#timeUlAm").html("");
                $("#timeUlPm").html("");
                var liAmHtml = '';
                var liPmHtml = '';

                let visitDateTime = data.result.data.visitDateTime;
                let periodGroups = data.result.data.periodGroups;

                let allTimeList = []; // 전체 시간
                let availTimeList = []; // 예약 가능 시간
                let sortedAllTimeList = []; // 전체시간 + 예약가능시간 + 중복제거, 정렬 완료 리스트

                // 운영시간 시간 순차정렬
                periodGroups.sort(function(a, b) {
                    let dateA = new Date(visitDateTime.substring(0, 11)+a.startTime+visitDateTime.substring(16, visitDateTime.length));
                    let dateB = new Date(visitDateTime.substring(0, 11)+b.startTime+visitDateTime.substring(16, visitDateTime.length));
                    return dateA - dateB;
                });

                // 운영시간 리스트 생성
                periodGroups.forEach(function (item, idx) {
                    let endTime = new Date(visitDateTime.substring(0, 11)+item.endTime+visitDateTime.substring(16, visitDateTime.length));
                    let startTime = new Date(visitDateTime.substring(0, 11)+item.startTime+visitDateTime.substring(16, visitDateTime.length));
                    const timeCnt = parseInt(((endTime - startTime) / (60 * 1000)) / Number(item.minuteTerm));

                    for (let i = 0; i <= timeCnt; i++) {
                        if (i > 0) {
                            startTime.setMinutes(startTime.getMinutes() + item.minuteTerm);
                        }
                        allTimeList.push(new Date(startTime));
                    }
                });

                // periodGroup 기준 전체 시간에 availDateTime 추가
                if (dateList.length > 0) {
                    dateList.forEach(function (item, idx) {
                        allTimeList.push(new Date(item.availDateTime));
                    });
                };

                // 정렬
                allTimeList.sort(function (a, b) {
                    return a - b;
                });

                // 비교를 위해 String 변환
                allTimeList.forEach(function (item) {
                    sortedAllTimeList.push(item.toString());
                });

                // 중복제거
                sortedAllTimeList = Array.from(new Set(sortedAllTimeList));

                // 예약 가능 시간 (비교를 위한 리스트)
                if (dateList.length > 0) {
                    dateList.forEach(function (item, idx) {
                        availTimeList.push(new Date(item.availDateTime).toString());
                    });
                };

                sortedAllTimeList.forEach(function(timeItem) {

                    if (dateList.length > 0) {
                        dateList.forEach(function (item, idx) {

                            if (availTimeList.includes(timeItem)) {

                                let date = new Date(item.availDateTime);
                                let hh = date.getHours();
                                hh = hh % 12;
                                hh = hh ? hh : 12;
                                let mm = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();

                                if (timeItem == date.toString()) {

                                    let time = "";
                                    let ampm = "";
                                    if (date.getHours() != 0 && date.getHours() < 12) {
                                        ampm = "am";
                                        time = '오전'+" "+hh+":"+mm;
                                    }else {
                                        ampm = "pm";
                                        time = '오후'+" "+hh+":"+mm;
                                    }
                                    let html = `<li class="frmRadio"><input type="radio" id="time${idx}" name="frmRdo" data-ampm="${ampm}"  data-token="${item.availSlotToken}" onclick="fncSelectTime(this);"><label for="time${idx}">${time }</label></li>`;

                                    // 예약 가능한 시간
	                                //2023-04-10 점심 / 저녁 으로 변경에 따라 기준시간 17시로 변경
                                    if(date.getHours() != 0 && date.getHours() < 17){
                                        liAmHtml += html;
                                        amCount++;
                                    } else {
                                        liPmHtml += html;
                                        pmCount++;
                                    }
                                }
                            }

                            if (!availTimeList.includes(timeItem)) {
                                let date = new Date(timeItem);

                                let hh = date.getHours();
                                hh = hh % 12;
                                hh = hh ? hh : 12;
                                let mm = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();

                                if (idx == 0) {

                                    let time = "";
                                    let ampm = "";
                                    if (date.getHours() != 0 && date.getHours() < 12) {
                                        ampm = "am";
                                        time = '오전'+" "+hh+":"+mm;
                                    }else {
                                        ampm = "pm";
                                        time = '오후'+" "+hh+":"+mm;
                                    }
                                    let html = `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${time }</label></li>`;

                                    // 예약 가능한 시간
	                                //2023-04-10 점심 / 저녁 으로 변경에 따라 기준시간 17시로 변경
                                    if(date.getHours() != 0 && date.getHours() < 17){
                                        liAmHtml += html;
                                        amNoCount++;
                                    } else {
                                        liPmHtml += html;
                                        pmNoCount++;
                                    }

/*
                                    if(date.getHours() != 0 && date.getHours() < 12){
                                        liAmHtml += `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${hh}:${mm}</label></li>`;
                                        amNoCount++;
                                    } else {
                                        liPmHtml += `<li class="frmRadio" style="display: none;"><input type="radio" name="frmRdo" disabled><label for="time${idx}">${hh}:${mm}</label></li>`;
                                        pmNoCount++;
                                    }
*/
                                }
                            }
                        });
                    }

                });

                // 예약 가능한 시간 없는경우
                // 비활성화된 슬롯 있는 경우
                if (amCount == 0 && amNoCount > 0) {
                    liAmHtml += '<li class="emptyTime emptyDesc">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                // 비활성화된 슬롯 없는경우
                } else if (amCount == 0 && amNoCount == 0) {
                    liAmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                // 비활성화된 슬롯 있는 경우
                if (pmCount == 0 && pmNoCount > 0) {
                    liPmHtml += '<li class="emptyTime emptyDesc">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                // 비활성화된 술롯 없는 경우
                } else if (pmCount == 0 && pmNoCount == 0) {
                    liPmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                // 시간 slot 비어있는 경우
                if (dateList.length <= 0) {
                    liAmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                    liPmHtml = '<li class="emptyTime emptyAll">예약 가능한 시간이 없습니다.</li>';<!-- 예약 가능한 시간이 없습니다. -->
                }

                $("#timeUlAm").append(liAmHtml);
                $("#timeUlPm").append(liPmHtml);

            }
        }
        // 유선문의
        if (data == "callResve") {
            $("#groupPerson").html("");
            let callResveDiv = `<div class="txt">11명 이상 단체예약은 해당 업장에 유선문의 부탁 드립니다.</div>`;<!-- 11명 이상 단체예약은 해당 업장에 유선문의 부탁 드립니다. -->
            // $(".timeWrap").after(callResveDiv);
            $("#groupPerson").html(callResveDiv);
            $("#groupPerson").show();
            $(".timeWrap").hide();
        }
    }

    // 모든 시간보기
    function fncShowAllTimes() {
        if ($('#allTimeSwitch').prop("checked")) {
            $(".emptyDesc").hide();
            $(".emptyAll").show();
        } else {
            $(".emptyDesc").show();
            $(".emptyAll").show();
        }
    }

    // 선택 정보 화면
    function fncSelectTime(timeHtml) {
        $("#selectInfoWrap").hide();
        $("#selectInfoWrap").children().remove();

        let date = $("#diningCal").val()
        let week = ['일', '월', '화', '수', '목', '금', '토']; // '일', '월', '화', '수', '목', '금', '토'
        let day = week[new Date(date.replaceAll('.', '/')).getDay()]; // ios에서 날짜형식 YYYY/MM/DD (모두가능)
        let ampm = $(timeHtml).attr("data-ampm") == 'am' ? '오전' : '오후'; // 오전 : 오후
        let time = $(timeHtml).next().html();
        let personCount = $("#personCountSelect").val();
        let availSlotToken = $(timeHtml).attr("data-token");
        let visitTime = time;
        let visitDate = date + "(" + day + ")";

        let confirmReservationUseYn = $("#confirmReservationUseYn").val();

        $("#availSlotToken").val(availSlotToken);
        $("#visitTime").val(visitTime);
        $("#visitDate").val(visitDate);

        let infoHtml = ` <p class="tit">예약 정보</p><!-- 예약 정보 -->
                    <div class="colorBox">
                        <div class="selectInfo">
                            <div>
                                <p>날짜</p><!-- 날짜 -->
                                <em>${date}<span>(${day})</span></em>
                            </div>
                            <div>
                                <p>시간</p><!-- 시간 -->
                                <em>${time}</em>
                            </div>
                            <div>
                                <p>인원수</p><!-- 인원수 -->
                                <em>${"방문인원 총 {1}명".replace('{1}', personCount)}</em><!-- 방문인원 총 2명 -->
                            </div>
                        </div>
                        <div class="manualInfoWrap" id="manualInfoWrap"></div>
                    </div>`;

        let confirmHtml = `<div class="txtWrap">
                                <strong>선택하신 예약일시는 다이닝 업장의 좌석 확인이 필요한 예약입니다.<br/>예약확정까지 다소 시간이 소요됩니다.</strong><!-- 선택하신 예약일시는 다이닝 업장의 좌석 확인이 필요한 예약입니다.<br/>예약확정까지 다소 시간이 소요됩니다. -->
                                <div class="order_txt">① 예약신청 > ② 업장 예약 가능 여부 확인 > ③ 예약확정</div><!-- ① 예약신청 > ② 업장 예약 가능 여부 확인 > ③ 예약확정 -->
                                <p class="txtGuide">예약 진행 과정은 알림톡/SMS로 안내해 드립니다.</p><!-- 예약 진행 과정은 알림톡/SMS로 안내해 드립니다. -->
                            </div>`;

        $("#selectInfoWrap").append(infoHtml);
        $("#selectInfoWrap").show();

        if (confirmReservationUseYn == "Y") {
            $("#manualInfoWrap").children().remove();
            $("#manualInfoWrap").append(confirmHtml);
        } else {
            $("#manualInfoWrap").remove();
        }
    }

    // availSlotToken 세션에 저장
    function fncSetSessionAvailToken() {
        return new Promise(function (resolve, reject) {
            let visitDate = $("#diningCal").val();
            let personCount = $("#personCountSelect").val();
            let availSlotToken = $("#availSlotToken").val();
            let hotelCode = $("#searchSysCode").val();

            if (visitDate == '' || visitDate == null) {
                alert("방문(예약)일을 선택해 주세요.") // 방문일은 필수 입니다.
            } else if (personCount == '' || personCount == null) {
                alert("총 방문인원을 선택해 주세요.") // 인원은 필수 입니다.
            } else if (availSlotToken == '' || availSlotToken == null) {
                alert("방문(예약) 시간을 선택해 주세요.") // 방문시간은 필수 입니다.
            } else {
                $("#personCount").val(personCount);

                jQuery.ajax({
                    type : "GET",
                    url : "/resve/dining/token.json",
                    cache : false,
                    dataType : "json",
                    async : true,
                    global : false,
                    data : {
                        "personCount": personCount,
                        "availSlotToken": availSlotToken,
                        "hotelCode" : hotelCode
                    },
                    beforeSend: function() {
                        commonJs.showLoadingBar(); //로딩바 show
                    },
                    complete: function() {
                        commonJs.closeLoadingBar(); //로딩바 hide
                    },
                    success : function(data){
                        resolve(data);
                    }});
            }
        });
    }

    async function fncGoStep2() {
        let data = await fncSetSessionAvailToken();

        if (data.resultMsg == "OK") {
            $("#form").attr("action", "/resve/dining/step2.do");
            $("#form").attr("method", "post");
            $("#form").submit();
        }
    }

    function fncGoStep0() {
        let searchSysCode = $("#searchSysCode").val();
        let diningCode = $("#diningCode").val();
        location.href = "/resve/dining/step0.do?searchSysCode="+searchSysCode+"&diningCode="+diningCode ;
    }

</script>
<form id="form" name="form">
    <input type="hidden" id="searchSysCode" name="searchSysCode" value='TWC'/>
    <input type="hidden" id="diningCode" name="diningCode" value='003'/>
    <input type="hidden" id="searchLangCode" name="searchLangCode" value=""/>

    <input type="hidden" id="shopId" name="shopId" value="pQUWDMHkPf2II_uVDPCFFQ" />
    <input type="hidden" id="personCount" name="personCount" value=''/>
    <input type="hidden" id="availSlotToken" name="availSlotToken" value=''/>
    <input type="hidden" id="visitTime" name="visitTime" value=''/>
    <input type="hidden" id="visitDate" name="visitDate" value=''/>
    <input type="hidden" id="confirmReservationUseYn" name="confirmReservationUseYn" value=''/>
    <div id="container" class="container">
        <!-- 컨텐츠 S -->
        <h1 class="hidden">날짜, 시간, 인원 선택</h1><!-- 예약-날짜 및 인원체크 -->
        <div class="topArea">
            <div class="topInner">
                <h2 class="titDep1">Booking</h2>
                <p class="pageGuide">조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요.</p><!-- 조선호텔앤리조트의 다이닝과 함께 차원이 다른 미식을 경험해 보세요. -->
                <div class="stepWrap">
                    <ol>
                        <li class="on"><span class="hidden">현재단계</span><em>날짜, 시간, 인원 선택</em></li><!-- 날짜, 시간, 인원 선택 -->
                        <li><em>예약정보 상세</em></li><!-- 예약정보 상세 -->
                    </ol>
                </div>
            </div>
        </div>
        <!-- //topArea -->
        <div class="inner">
            <div class="diningContainer drDining_st02">
                <div class="chkValue"><span>웨스틴 조선 서울<!--  그랜드 조선 부산 --></span><span>ARIA <!-- The Ninth Gate --></span></div>
                <div class="diningSelectCont calCont">
                    <div class="lCont" id="calDiv">
                        <!-- 달력 한개 짜리 -->
                        <div class="calContainer calSingle calInner" id="diningCal"></div>
                        <!-- //달력 한개 짜리 -->
                    </div>
                    <div class="rCont">
                        <div class="tit">방문인원</div><!-- 방문인원 -->
                        <div class="intArea selectWrap" style="width:385px">
                            <select id="personCountSelect" data-height="150px" data-direction="down" aria-required="true" onchange="fncSearchAvailTimes();">
                                
                                    <option value="1" >1명</option><!-- 명 -->
                                
                                    <option value="2" selected='selected'>2명</option><!-- 명 -->
                                
                                    <option value="3" >3명</option><!-- 명 -->
                                
                                    <option value="4" >4명</option><!-- 명 -->
                                
                                    <option value="5" >5명</option><!-- 명 -->
                                
                                    <option value="6" >6명</option><!-- 명 -->
                                
                                    <option value="7" >7명</option><!-- 명 -->
                                
                                    <option value="8" >8명</option><!-- 명 -->
                                
                                    <option value="9" >9명</option><!-- 명 -->
                                
                                    <option value="10" >10명</option><!-- 명 -->
                                
                                <option value="callResve">11명 이상</option><!-- 11명 이상 -->
                            </select>
                        </div>
                        <div class="allTimeWrap" id="timeListDiv"><!-- 221130 allTimeWrap 클래스추가 : 날짜 인원 선택후 나옴 -->
                            <div class="tit">시간 선택<!-- 시간 선택 -->
                                <div class="allTimeSwitch">
                                    <fieldset>
                                        <label>
                                            <span>모든 시간 보기</span><!-- 모든 시간 보기 -->
                                            <input role="switch" type="checkbox" id="allTimeSwitch" onchange="fncShowAllTimes();"/>
                                        </label>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="timeWrap"><!-- 221221 div 넣음 / 단체일때 display:none  -->
                                <strong class="timeTit">점심</strong><!-- 점심 -->
                                <div class="timeSel morning"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlAm">









                                    </ul>
                                </div>
                                <strong class="timeTit">저녁</strong><!-- 저녁 -->
                                <div class="timeSel afternoon"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlPm">











                                    </ul>
                                </div>
                            </div>
                            <!-- 221221 단체일때 보여짐 -->
                            <div class="groupPerson" id="groupPerson">

                            </div>

                            <div class="timeGuideWrap">
                                <ul>
                                    <li class="tg01">선택</li><!-- 선택 -->
                                    <li class="tg02">선택불가</li><!-- 선택불가 -->
                                    <li class="tg03">선택가능</li><!-- 선택가능 -->
                                </ul>
                            </div>
                        </div>
                    </div><!-- // rCont -->
                </div>
                <script>
                    /*221206 script 추가 및 수정*/

                    //모든시간보기함수추가
                    function empty_time(time, act){
                        var empty = $(time).find('input:enabled').parent('li.frmRadio').length;
                        if(act == "default" && empty == 0){
                            $(time).find('input:disabled').parents('li.frmRadio').hide();
                        }else if(act == "default" && empty != 0){
                            $(time).find('.emptyTime').hide();

                        }else if(empty == 0 && act =="hide"){
                            $(time).find('.emptyTime').hide();
                        }else if(empty == 0 && act =="show"){
                            $(time).find('.emptyTime').show();
                        }
                    }

                    //모든시간보기 default
                    var allTimeSwitchchk = $('#allTimeSwitch').is(':checked');
                    if(!allTimeSwitchchk){
                        $(".timeSel").find('input:disabled').parents('li.frmRadio').hide();
                        $(".timeGuideWrap").find(".tg02").hide();
                    }
                    empty_time(".morning", "default");
                    empty_time(".afternoon", "default");


                    //모든시간보기 클릭시
                    $( "#allTimeSwitch" ).click(function() {
                        var allTimeSwitchchk = $(this).is(':checked');
                        if(allTimeSwitchchk){ //모든시간보기 on
                            empty_time(".morning","hide");
                            empty_time(".afternoon","hide");
                            $(".timeSel").find('input:disabled').parents('li.frmRadio').show();
                            $(".timeGuideWrap").find(".tg02").show();
                        }else{ //모든시간보기 off
                            $(".timeSel").find('input:disabled').parents('li.frmRadio').hide();
                            $(".timeGuideWrap").find(".tg02").hide();
                            empty_time(".morning","show");
                            empty_time(".afternoon","show");
                        }
                    });
                    /*// 221206 script 추가 및 수정*/
                </script>
                <!-- 선택힌 예약 정보 -->
                <div class="selectInfoWrap" id="selectInfoWrap" style="display: none">
                    
                    <!-- // 221230 div 추가 -->
                </div>
                <!-- // 선택힌 예약 정보 -->
                <div class="btnArea">
                    <a href="javascript:void(0)" class="btnSC btnL" onclick="fncGoStep0();">이전</a><!-- 이전 -->
                    <a href="javascript:void(0)" class="btnSC btnL active" onclick="fncGoStep2();">다음</a><!-- 다음 -->
                </div>
            </div>
        </div>
        <!-- //inner -->
        <!-- 컨텐츠 E -->
    </div>
    <!-- //container -->
</form>








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

