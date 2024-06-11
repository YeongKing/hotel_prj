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

<title>객실 예약 - 객실 예약완료 | 앨리시안호텔</title>

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
	window.criteo_q = window.criteo_q || [];
	deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";

	jQuery(function(){
		jQuery(document).ready(function(){
			jQuery("#dateTxt").text(jQuery("#chkinDe").val() + " - " + jQuery("#chcktDe").val() + " ("+dUtils.dateDiff(jQuery("#chkinDe").val(), jQuery("#chcktDe").val())+"박)");
			jQuery("#dateTxtLayer").text(jQuery("#chkinDe").val() + " - " + jQuery("#chcktDe").val() + " ("+dUtils.dateDiff(jQuery("#chkinDe").val(), jQuery("#chcktDe").val())+"박)");
		});

		var transactionProducts = [];
		var criteoItem = [];
        var items = [];
		var totalTaxSumAmt = 0;
        var hotlSysCode = 'GJJ';
        var transactionId = '411665';
        var name = 'ROOM ONLY';
        var item_category ='DELUXE' + " " + 'STANDARD VIEW'

		var checkinDe = '20240716';       //체크인 일자
		var checkOutDe = '20240717';      //체크 아웃 일자

		//박수 구하기
		var checkinDeObj = new Date(checkinDe.slice(0, 4), parseInt(checkinDe.slice(4, 6)) - 1, checkinDe.slice(6));
		var checkOutDeObj = new Date(checkOutDe.slice(0, 4), parseInt(checkOutDe.slice(4, 6)) - 1, checkOutDe.slice(6));
		var timeDiff = checkOutDeObj.getTime() - checkinDeObj.getTime();
		var night = Math.ceil(timeDiff / (1000 * 3600 * 24));    //박수

		
			var totalAmt = '299200';
			var sku = transactionId+'_'+1;
			var roomTaxSumAmt = '27200';

			totalAmt = totalAmt > 0 ? totalAmt : 0;
			roomTaxSumAmt = roomTaxSumAmt > 0 ? parseInt(roomTaxSumAmt) : 0;
			totalTaxSumAmt += roomTaxSumAmt;

			//criteo script
			
				criteoItem.push({
					'id': sku,
					'price': totalAmt,
					'quantity': '1'
				})
			

            //2022-12-26 추가 ga4
            items.push({
                "item_name": name,
                "price": totalAmt,
                "quantity": night,
                "item_brand": hotlSysCode,
                "item_category": item_category
            })

		

		var sumAmt = '299200';
		sumAmt = sumAmt > 0 ? parseInt(sumAmt) : 0;

        //2022-12-26 추가 ga4
        gfncPushRoomResveSeoData(transactionId, totalTaxSumAmt, sumAmt, items);

		
			window.criteo_q.push(
					{ event: "setAccount", account: '2400618856'},
					{ event: "setEmail", email: 'whdcks208@naver.com' },
					{ event: "setSiteType", type: deviceType},
					{ event: "trackTransaction",
						id: transactionId,
						item: criteoItem
					}
			);
		
	});



</script>

<div id="container" class="container">
	<!-- 컨텐츠 S -->
	<h1 class="hidden">예약</h1>
	<div class="topArea">
		<div class="topInner">
			<p class="f75">예약이 완료되었습니다.</p>
			<div class="revNumber">예약번호<em>411665</em></div>
			<p class="pageGuide">요청하신 예약은 정상적으로 처리되었으며, 예약번호는 예약 조회 및 취소 시<br> 반드시 필요하니, 프린트 또는 메모해 주시기 바랍니다.</p>
			<!-- 20200420 수정 -->
			<button type="button" class="btnPrint" onClick="commonJs.popShow(jQuery('#layerPop1'))">인쇄하기</button>
			<!-- //20200420 수정 -->
		</div>
	</div>
	<!-- //topArea -->
	<div class="inner">
		<h2 class="titDep2">예약 정보</h2>
		<div class="commWrap rsvInfo">
			<dl class="commlist">
				<dt>엘리시안 서울</dt>
				<dd>
					<span class="txt">
						서울특별시 중문관광로 72번길 60
					</span>
					<span class="thum">
						<img src="http://localhost/hotel_prj/static/home/images/ko/pc/HOTEL/img_visual_jjchosun.png" alt="그랜드 조선 제주 전경 이미지">
					</span>
				</dd>
			</dl>
			<dl class="commlist">
				<dt>예약 상세 정보</dt>
				<dd>
					
					
					<input type="hidden" id="chkinDe" value="2024.07.16" />
					<input type="hidden" id="chcktDe" value="2024.07.17" />
					<span class="txt" id="dateTxt"></span>
					<span class="txt">ROOM ONLY</span>
					<span class="txt">1 Rooms</span>
					<span class="txt">
						DELUXE /
						2DOUBLE /  
						STANDARD VIEW 
					</span>
					<span class="txt">2 Adults, 0 Children</span>
				</dd>
			</dl>
			<dl class="commlist">
				<dt>고객정보</dt>
				<dd>
					<span class="txt">
						
							
								김무영
							
							
						
					</span>
					<span class="txt">010-7427-0406</span>
					<span class="txt">whdcks208@naver.com</span>
				</dd>
			</dl>
		</div>
		<!-- //rsvInfo -->

		<h2 class="titDep2">객실 상세 내역</h2>
		<ul class="toggleList rsvList">
			
				<li class="toggleOn">
					<strong class="listTit">객실 1</strong>
					<span class="opValue">2 Adults, 0 Children</span>
					<em class="intValue pay">
						299,200<em class="unit">KRW</em>
					</em> 
					<button type="button" class="btnToggle">
						<span class="hidden">상세내용 보기</span>
					</button>
					<div class="toggleCont">
						<div class="toggleInner">
							<div class="commWrap">
								<dl class="commlist">
									<dt>객실 금액</dt>
									<dd>
										<ul class="infoData">
											
												<li>
													<span class="lfData">2024.07.16</span>
													<span class="rtData">272,000</span>
												</li>
											
										</ul>
									</dd>
								</dl>
								<dl class="commlist">
									<dt>옵션 금액</dt>
									<dd>
										<ul class="infoData">
											
											
											
										</ul>
									</dd>
								</dl>
								<dl class="commlist">
									
										
										
											<dt>세금</dt>
											<dd>
												<ul class="infoData">
													<li>
														<span class="lfData">세금(10%)</span>
														<span class="rtData">27,200</span>
													</li>
													<!-- <li>
														<span class="lfData">봉사료(10%)</span>
														<span class="rtData"></span>
													</li> -->
												</ul>
											</dd>
										
									
								</dl>
							</div>
							
                               
                               
						</div>
					</div>
				</li>
			
		</ul>
		<!-- //toggleList -->
		<!-- 비회원 예약 일 경우 -->
		<div class="total noMember">
			<div class="totalWrap type02">
				<span class="tit">총 예약금액</span>
				<strong class="pay"><em>299,200</em>KRW</strong>
			</div>
		</div>
		<!-- //비회원 예약 일 경우 -->

		<!-- 포인트 할인 적용 일 경우 -->
		<!-- <div class="total">
			<div class="totalWrap">
				<span class="tit">예약 금액</span><strong class="pay"><em>1,964,050</em></strong>
			</div>
			<div class="totalWrap">
				<span class="tit">포인트 할인</span><strong class="pay"><em>230,000</em></strong>
			</div>
			<div class="totalWrap type02">
				<span class="tit">최종 결제 금액</span><strong class="pay"><em>1,734,050</em>KRW</strong>
			</div>
		</div> -->
		<!-- //포인트 할인 적용 일 경우 -->
		<!-- <p class="txtGuide">상기 요금은 포인트 사용 시 예상되는 결제 금액으로 실제와는 다를 수 있습니다.</p> -->

		<div class="btnArea">
			<a href="/main.do" class="btnSC btnL">
				메인
			</a>
			
				<a href="https://josunhotel.com/cnfirm/mber/room/reserveList.do" class="btnSC btnL active">
					예약내역 확인
				</a>
			
			
		</div>

		
		
		

		<div class="lineBanner" style="width:100%;margin:70px 0 -100px;">
			<a href="https://pf.kakao.com/_EnFPj/friend" target="_blank">
				<img src="/static/home/images/ko/pc/common/img_line_banner_kakao_event.jpg" alt="조선호텔앤리조트 카카오톡채널을 추가하고, 채널 친구만을 위한 특별한 혜택을 가장 먼저 만나보세요!">
			</a>
		</div>

		<div class="promotion">	<h2 class="titDep2">추천 이벤트</h2>	<div class="swipeWrapArea">		<button type="button" class="btnSwipe btnPrev"><span class="hidden">이전</span></button>		<div class="swipeWrap swipeGroup">			 <ul class="swipeCont promList">				<li class="swipeSlide">					<a href="/event/get.do?eventSn=2006035&searchSysCode=GJJ">						<strong class="tit">조선호텔 프리미엄 김치</strong>						<p class="txt">조선호텔앤리조트의 전통으로 이어온 명품 한식
국내산 최상의 원재료만을 사용하여 조선호텔 셰프들의 노하우로 
정성을 더하여 맛과 멋을 담았습니다. 
</p>						<p class="date">							<span><em>기간</em>2024.04.15 - 2024.12.31</span>							<span><em>장소</em>본관 1층 조선 델리 Josun Deli</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=2006036&sysCode=GJJ" alt="조선호텔 김치 정기구독 쓱닷컴 조선호텔 김치 호텔 김치">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1910962&searchSysCode=GJJ">						<strong class="tit">[SPRING MEMORIES] 그랜드 조선 제주 추천 포토스팟</strong>						<p class="txt">Spring Memories 패키지를 이용하는 고객님들을 위해 준비한 
그랜드 조선 제주만의 특별한 포토스팟과 산책로 속 히든스팟을 소개합니다.</p>						<p class="date">							<span><em>기간</em>2024.03.09 - 2024.05.31</span>							<span><em>장소</em><Spring Memories> 패키지 이용 고객님</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1912116&sysCode=GJJ" alt="그랜드 조선 제주 후지필름 퀵스냅 제공 패키지 포토스팟">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1877027&searchSysCode=GJJ">						<strong class="tit">[Rubrica] Grilled Box</strong>						<p class="txt">호텔 루프탑에 위치해 있어 끝없이 펼쳐진 중문 뷰와 함께 그릴박스를 즐겨보세요.
</p>						<p class="date">							<span><em>기간</em>2024.01.01 - 2025.01.01</span>							<span><em>장소</em>루브리카 Rubrica</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1877028&sysCode=GJJ" alt="-">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1876486&searchSysCode=GJJ">						<strong class="tit">Grand Josun Jeju Burger</strong>						<p class="txt">그랜드 조선 제주에서만 만나볼 수 있는 귀여운 흑돼지 수제버거</p>						<p class="date">							<span><em>기간</em>2024.01.30 - 2025.01.01</span>							<span><em>장소</em>라운지앤바 Lounge&Bar, 잇투오 Eeat2O</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1876487&sysCode=GJJ" alt="-">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1864416&searchSysCode=GJJ">						<strong class="tit">Special Bingsu</strong>						<p class="txt">그랜드 조선 제주에서만 만나볼 수 있는 구성으로 이루어진 프리미엄 빙수를 즐겨보세요.</p>						<p class="date">							<span><em>기간</em>2024.05.20 - 2024.08.31</span>							<span><em>장소</em>라운지앤바 Lounge&Bar, 그랑 제이 Gran J</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=2042283&sysCode=GJJ" alt="-">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1713387&searchSysCode=GJJ">						<strong class="tit">[JOSUN DELI] Special Cake</strong>						<p class="txt">그랜드 조선 제주에서 파티셰의 정성이 담긴 스페셜 케이크를 선보입니다.</p>						<p class="date">							<span><em>기간</em>2024.01.01 - 2024.12.31</span>							<span><em>장소</em>라운지앤바 Loung&Bar</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1713871&sysCode=GJJ" alt="-">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1522543&searchSysCode=GJJ">						<strong class="tit">[ARIA] 돌잔치 ♥ 가족연</strong>						<p class="txt">푸른 정원이 보이는 아리아 프라이빗 룸에서 소중한 날을 기록해보세요.</p>						<p class="date">							<span><em>기간</em>2023.04.01 - 2024.12.31</span>							<span><em>장소</em>아리아 Aria</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1522544&sysCode=GJJ" alt="그랜드 조선 제주 아리아 돌잔치 연회">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=1468805&searchSysCode=GJJ">						<strong class="tit">Holistic Wellness Program</strong>						<p class="txt">힐 스위트 고객 전용 홀리스틱 웰니스 프로그램을 통해 온전한 휴식을 경험해보세요.</p>						<p class="date">							<span><em>기간</em>2024.02.01 - 2024.12.31</span>							<span><em>장소</em>힐 스위트 투숙 고객</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1468806&sysCode=GJJ" alt="힐 스위트 고객 전용, 무료 웰니스 프로그램">						</span>					</a>				</li>				<li class="swipeSlide">					<a href="/event/get.do?eventSn=439348&searchSysCode=GJJ">						<strong class="tit">J - Basket </strong>						<p class="txt">나만의 인룸 나이트 피크닉을 즐겨보세요.</p>						<p class="date">							<span><em>기간</em>2021.02.01 - 2024.12.31</span>							<span><em>장소</em>인룸다이닝 In room Dining</span>						</p>						<span class="thum">							<img src="/util/file/download.do?fileSn=1876098&sysCode=GJJ" alt="인룸다이닝 J바스켓 나이트 피크닉">						</span>					</a>				</li>			 </ul>		</div>		<button type="button" class="btnSwipe btnNext"><span class="hidden">다음</span></button>		<div class="indicator"><button type="button" class="num on"><em class="hidden">현재 이미지</em>01</button></div>	</div></div><script>$(window).on('load', function () {	commonJs.initSwipe($('.swipeWrap')); });</script>

	</div>
	<!-- //inner -->
	<!-- 컨텐츠 E -->
</div>
<!-- //wrapper -->
<div id="layerPop1" class="layerPop">
	<div class="layerCont printLayer">
		<div class="printCont">
			<div class="printIntro">
				본 페이지를 인쇄합니다.
				<a href="#none" class="btnPrint02">인쇄하기</a>
			</div>
			<div class="topArea">
				<div class="topInner">
					<p class="f75">예약이 완료되었습니다.</p>
					<div class="revNumber">예약번호<em>411665</em></div>
					<p class="pageGuide">요청하신 예약은 정상적으로 처리되었으며, 예약번호는 예약 조회 및 취소 시<br> 반드시 필요하니, 프린트 또는 메모해 주시기 바랍니다.</p>
				</div>
			</div>
			<!-- //topArea -->
			<div class="inner">
				<h2 class="titDep2">예약 정보</h2>
				<div class="commWrap rsvInfo">
					<dl class="commlist">
						<dt>그랜드 조선 제주<!-- 그랜드 조선 부산 --></dt>
						<dd>
							<span class="txt">제주특별자치도 서귀포시 중문관광로 72번길 60<!-- 부산광역시 해운대구 해운대해변로 292 --></span>
							<span class="thum">
								<img src="/static/home/images/ko/pc/HOTEL/img_visual_jjchosun.png " alt="그랜드 조선 제주 전경 이미지">
							</span>
						</dd>
					</dl>
					<dl class="commlist">
						<dt>예약 상세 정보</dt>
						<dd>
							<span class="txt" id="dateTxtLayer"></span>
							<span class="txt">ROOM ONLY</span>
							<span class="txt">1 Rooms</span>
							<span class="txt">
								DELUXE /
								2DOUBLE /  
								STANDARD VIEW
							</span>
							<span class="txt">2 Adults, 0 Children</span>
						</dd>
					</dl>
					<dl class="commlist">
						<dt>고객정보</dt>
						<dd>
							<span class="txt">
								
									
										김무영
									
									
								
							</span>
							<span class="txt">010-7427-0406</span>
							<span class="txt">whdcks208@naver.com</span>
						</dd>
					</dl>
				</div>
				<!-- //rsvInfo -->

				<h2 class="titDep2">객실 상세 내역</h2>
				<ul class="toggleList rsvList">
					
						<li class="toggleOn">
							<strong class="listTit">객실 1</strong>
							<span class="opValue">2 Adults, 0 Children</span>
							<em class="intValue pay">
								299,200<em class="unit">KRW</em>
							</em> 
							<div class="toggleCont">
								<div class="toggleInner">
									<div class="commWrap">
										<dl class="commlist">
											<dt>객실 금액</dt>
											<dd>
												<ul class="infoData">
													
														<li>
															<span class="lfData">2024.07.16</span>
															<span class="rtData">272,000</span>
														</li>
													
												</ul>
											</dd>
										</dl>
										<dl class="commlist">
											<dt>옵션 금액</dt>
											<dd>
												<ul class="infoData">
													
													
													
												</ul>
											</dd>
										</dl>
										<dl class="commlist">
											
												
												
													<dt>세금</dt>
													<dd>
														<ul class="infoData">
															<li>
																<span class="lfData">세금(10%)</span>
																<span class="rtData">27,200</span>
															</li>
														</ul>
													</dd>
												
											
										</dl>
									</div>
									
	                                
	                                
								</div>
							</div>
						</li>
					
				</ul>
				<!-- //toggleList -->
				<!-- 비회원 예약 일 경우 -->
				<div class="total noMember">
					<div class="totalWrap type02">
						<span class="tit">총 예약금액</span>
						<strong class="pay"><em>299,200</em>KRW</strong>
					</div>
				</div>
				<!-- //비회원 예약 일 경우 -->

				<!-- 포인트 할인 적용 일 경우 -->
				<!-- <div class="total">
					<div class="totalWrap">
						<span class="tit">예약 금액</span><strong class="pay"><em>1,964,050</em></strong>
					</div>
					<div class="totalWrap">
						<span class="tit">포인트 할인</span><strong class="pay"><em>230,000</em></strong>
					</div>
					<div class="totalWrap type02">
						<span class="tit">최종 결제 금액</span><strong class="pay"><em>1,734,050</em>KRW</strong>
					</div>
				</div> -->
				<!-- //포인트 할인 적용 일 경우 -->
				<!-- <p class="txtGuide">상기 요금은 포인트 사용 시 예상되는 결제 금액으로 실제와는 다를 수 있습니다.</p> -->
			</div>
			<!-- //inner -->
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose(jQuery('#layerPop1'))">
			닫기
		</button> 
	</div>
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