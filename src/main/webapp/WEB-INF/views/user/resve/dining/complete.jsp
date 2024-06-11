<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- view-source:https://www.josunhotel.com/resve/dining/complete.do?reservationId=zfRwJnbl7cF6OEiZ6uQo0w-->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>다이닝 예약 - 예약 완료 | 엘리시안호텔</title>

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











<script>
    $(function(){
        getDetail();
    });

    function getDetail() {


        jQuery.ajax({
            type : "GET",
            url : "/resve/dining/completeInfo.json",
            cache : false,
            dataType : "json",
            data : {
                reservationId: jQuery("#reservationId").val()
            },
            global : false,
	        beforeSend: function() {
				commonJs.showLoadingBar(); //로딩바 show
			},
			complete: function() {
				commonJs.closeLoadingBar(); //로딩바 hide
			},
            success : function(data){
                const result = data.result;

                if (data.resultCode != "SUCCESS") {
                    alert(data.resultMsg);
                }else {
                    const hotelNm = result.hotelNm;
                    const visitFullDate = result.visitFullDate;
                    const visitDate = visitFullDate.split("|")[0].trim();
                    const visitDateTime = visitFullDate.split("|")[1].trim();
                    const personCount = result.personCount;         //방문 인원
                    const deposit = result.deposit;
                    const status = result.status;

                    if(status === "W"){
                        jQuery(".resveMsg").prepend(`
	                        <p class="f75">예약신청이 완료되었습니다. </p>
							<div class="manualInfoWrap">
								<div class="txtWrap">
									<strong>선택하신 예약일시는 다이닝 업장의 좌석 확인이 필요한 예약입니다.<br/>예약확정까지 다소 시간이 소요됩니다. </strong>
									<div class="order_txt">① 예약신청 &gt; ② 예약 가능 여부 확인 &gt; ③ 예약확정 </div>
									<p class="txtGuide">예약 진행 과정은 알림톡/SMS로 안내해 드립니다. </p>
								</div>
							</div>
                        `);
                    }else {
	                    
	                    
                            jQuery(".resveMsg").prepend(`
	                            <p class="f75">예약이 완료되었습니다. </p>
								<p class="pageGuide">요청하신 예약은 정상적으로 처리되었으며,<br>예약조회 및 취소, 방문자 정보수정은 MY PAGE에서 가능합니다. </p>
	                        `);
	                    
                    }


                    //예약자 정보
                    const booker = result.booker;
                    const bookerEmail = booker.email;
                    const bookerName = booker.name;
                    const bookerPhone = booker.phone;

                    //방문자 정보
                    const visitor = result.visitor;
                    const visitorEmail = visitor.email;
                    const visitorName = visitor.name;
                    const visitorPhone = visitor.phone;

                    const requests = result.requests;

                    jQuery(".visitDate").text(visitDate);
                    jQuery(".visitDateTime").text(visitDateTime);
                    const visitorCount = '방문 인원 {1}명'.replace("{1}", personCount.toString());
                    jQuery(".person").text(visitorCount);

                    //예약자
                    jQuery(".bookerName").text(bookerName+"(예약자)");
                    jQuery(".bookerPhone").text(bookerPhone);
                    jQuery(".bookerEmail").text(bookerEmail);

                    //방문자
                    jQuery(".visitorName").text(visitorName+"(방문자)");
                    jQuery(".visitorPhone").text(visitorPhone);
                    jQuery(".visitorEmail").text(visitorEmail);

                    jQuery(".requests").text(requests);

                    if(deposit != null){
                        jQuery(".depositArea").show();
                        jQuery(".deposit").text(fncComma(deposit.amount)+" KRW");
                    }

                    let visitFullDateAndPersonCount =  visitDate + " "+ visitDateTime + " "+visitorCount;
                    gfncPushDiningResveSeoData($("#diningSysCode").val(),$("#diningNm").val(), visitFullDateAndPersonCount);
                }
            },

            error:function(r, s, e){
                alert('Ajax 통신중 에러가 발생하였습니다\nError Code : \"{1}\"\nError : \"{2}\"'.replace("{1}", r.status).replace("{2}", r.responseText));
            }
        })

    }



</script>
<input type="hidden" id="reservationId" value="zfRwJnbl7cF6OEiZ6uQo0w"/>
<input type="hidden" id="diningSysCode" value="TWC">
<input type="hidden" id="diningNm" value="ARIA">

<div id="container" class="container">
    <!-- 컨텐츠 S -->
    <h1 class="hidden">예약</h1>
    <div class="topArea">
        <div class="topInner resveMsg">
            
            <button type="button" class="btnPrint" onClick="commonJs.popShow($('#layerPop1'))">인쇄하기 </button>
        </div>
    </div>
    <!-- //topArea -->
    <div class="inner">
        <h2 class="titDep2">예약 정보 </h2>
        <div class="commWrap rsvInfo drDining_st04">
            <dl class="commlist">
                <dt>ARIA</dt>
                <dd>
                    <span class="txt">웨스틴 조선 서울 저층 로비</span>
                    <span class="txt">02-317-0357</span>
                    <span class="thum"><img src="/util/file/download.do?fileSn=263788&subFileSn=264355&sysCode=TWC" alt="아리아 이미지"></span>
                </dd>
            </dl>
            <dl class="commlist">
                <dt>예약 상세 정보 </dt>
	            <dd>
                    <span class="txt visitDate" ></span>
                    <span class="txt visitDateTime" ></span>
                    <span class="txt person" ></span>
                </dd>
                <dt>추가 요청사항 </dt>
                <dd>
                    <span class="txt requests" >
                        
				</span>
                </dd>
            </dl>
            <dl class="commlist">
                <dt>고객 정보 </dt>
	            <dd>
                    <span class="txt bookerName"></span>
                    <span class="txt bookerPhone"></span>
                    <span class="txt bookerEmail"></span>
                </dd>
	            <br>
                <dd>
                    <span class="txt visitorName"></span>
                    <span class="txt visitorPhone"></span>
                    <span class="txt visitorEmail"></span>
                </dd>
            </dl>
            <dl class="commlist depositArea"  style="display: none;">
                <dt>결제 예약금 </dt>
                <dd>
                    <span class="txt deposit" ></span>
                </dd>
            </dl>
        </div>
        <div class="btnArea">
            <a href="/intro.do" class="btnSC btnL">메인 </a>
            
                <a href="/cnfirm/mber/dining/reserveList.do" class="btnSC btnL active">예약내역 확인<!-- 예약내역 확인 --></a>
            
            
        </div>
    </div>
    <!-- //inner -->
    <!-- 컨텐츠 E -->
</div>
<!-- //wrapper -->	

<!-- 20200420 추가 -->
<div id="layerPop1" class="layerPop">
    <div class="layerCont printLayer">
        <div class="printCont">
            <div class="printIntro">
                본 페이지를 인쇄합니다.<a href="#" class="btnPrint02">인쇄하기 </a>
            </div>
            <!-- 221228 내용 수정 -->
            <div class="topArea">
                <div class="topInner resveMsg">

                </div>
            </div><!-- //topArea -->
            <div class="inner">
                <h2 class="titDep2">예약 정보 </h2>
                <div class="commWrap rsvInfo">
                    <dl class="commlist">
                        <dt>ARIA</dt>
                        <dd>
                            <span class="txt">웨스틴 조선 서울 저층 로비</span>
                            <span class="txt">02-317-0357</span>
                        </dd>
                    </dl>
                    <dl class="commlist">
                        <dt>예약 상세 정보 </dt>
                        <dd>
                            <span class="txt visitDate"></span>
                            <span class="txt visitDateTime"></span>
                            <span class="txt person"></span>
                            <span class="txt pdtopAdd requests"></span>
                        </dd>
                    </dl>
                    <dl class="commlist">
                        <dt>고객 정보 </dt>
	                    <dd>
                            <span class="txt bookerName"></span>
                            <span class="txt bookerPhone"></span>
                            <span class="txt bookerEmail"></span>
                        </dd>
	                    <br>
                        <dd>
                            <span class="txt visitorName"></span>
                            <span class="txt visitorPhone"></span>
                            <span class="txt visitorEmail"></span>
                            <span class="txt pdtopAdd depositArea" style="display: none;">결제 예약금  <span class="deposit"></span></span>
                        </dd>
                    </dl>
                </div><!-- //rsvInfo -->
            </div>
            <!-- //inner -->
            <!-- //221228 내용 수정 -->
        </div>
        <button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'))">닫기</button>
    </div>
</div>
<div class="dimmed"></div>

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

