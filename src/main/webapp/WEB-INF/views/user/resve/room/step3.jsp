<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>객실 예약 - 고객 정보 입력 | 엘리시안호텔</title>

<!-- iam port 결제 등록 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


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
















<script type="text/javascript">


function getTokenAndPayment(pg, pay_method){
    $.ajax({
        url: "http://localhost/hotel_prj/user/getToken.do",
        method: 'GET',
        success: function(response) {
            //$('#tokenDisplay').text('받아온 토큰: ' + response);
            payment(pg, pay_method, response); // 토큰을 받은 후 결제 호출
        },
        error: function() {
        	alert("토큰 받기 실패")
            //$('#tokenDisplay').text('토큰을 받아오는데 실패했습니다.');
        }
    });
}

function payment(pg, pay_method, token){
    IMP.init('imp25425801');
    IMP.request_pay({
        pg: pg,
        pay_method: pay_method,
        amount: ${rrVO.payPrice * rrVO.night}, // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_name: '${umd.name}', // 변수 값을 적절히 삽입하는 방법 확인 필요
        buyer_email: jQuery("#email").val(),
        buyer_tel: jQuery("#phone").val(),
        name: '객실예약'
    }, function(response) {
        // 결제 후 호출되는 callback함수
        if (response.success) { // 결제 성공
            //console.log(response);
        	commonJs.showLoadingBar();
            sendPaymentData(response, token);
        } else {
            alert('결제실패 : ' + response.error_msg);
            commonJs.closeLoadingBar();
			$(".btnArea").find("a").css({
			    'pointer-events': '',
			    'cursor': '',
			    'opacity': ''
			});
			
            
        }
    });
}

function sendPaymentData(paymentData, token) {
    const impUid = paymentData.imp_uid;
   // alert(JSON.stringify(paymentData));
    $.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/payment.do",
        data: JSON.stringify({
            imp_uid: impUid,
            payment_data: paymentData,
            token: token
        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            //alert("결제 데이터가 성공적으로 전송되었습니다!");
            //displayPaymentInfo(data); // 결제 정보 화면에 출력
            insertPaymentInfo(data); // 결제 정보 DB저장
        },
        error: function(err) {
            let errorMessage = "결제 데이터 전송 오류: " + err.status + " " + err.statusText + " - " + err.responseText;
            alert(errorMessage);
            console.log("에러 상세: ", err);
        }
    });
}

// 결제 정보를 화면에 출력하는 함수
function displayPaymentInfo(paymentInfo) {
    var paymentInfoText =
        '상태: ' + paymentInfo.status + '\n' +
        '금액: ' + paymentInfo.amount + '\n' +
        '구매자 이름: ' + paymentInfo.buyer_name + '\n' +
        '구매자 전화번호: ' + paymentInfo.buyer_phone + '\n' +
        '구매자 이메일: ' + paymentInfo.member_email + '\n' +
        '결제 시간: ' + paymentInfo.paid_at + '\n' +
        '상품명: ' + paymentInfo.buy_product_name + '\n' +
        '구매자 ID: ' + paymentInfo.buyer_buyid + '\n' +
        'Merchant ID: ' + paymentInfo.buyer_merid + '\n' +
        '카드 번호: ' + paymentInfo.buyer_card_num + '\n' +
        '결제 상태: ' + paymentInfo.buyer_pay_ok;

    alert(paymentInfoText);
}

// 결제 정보를 DB에 저장하는 함수
function insertPaymentInfo(paymentInfo) {
	//alert("DB저장함수 진입");
	var cardNum = paymentInfo.buyer_card_num
	
	
    if (!cardNum || cardNum.length !== 16) {
    	
    	var random16Digits = generateRandomNumber(16);
    	
         cardNum = random16Digits.substring(0, 6) + '*********' + random16Digits.substring(15);
    	
        
    }//end if
	
	
    
    var payPrice = ${rrVO.payPrice * rrVO.night};

    
    var payStatus = 'Y';
    var payTime = paymentInfo.paid_at;
    var impUid = paymentInfo.buyer_buyid;

    $.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/insertPayInfo.do",
        data: JSON.stringify({
        	cardNum : cardNum,
        	payPrice : payPrice,
        	payStatus : payStatus,
        	payTime : payTime,
        	impUid : impUid

        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
			//alert("payNum : " + data.payNum);
			insertRoomRes(data.payNum);

            
        }
    });
}

// 랜덤 숫자 생성 함수
function generateRandomNumber(length) {
    let result = '';
    const characters = '0123456789';
    const charactersLength = characters.length;
    
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    
    return result;
}

//객실예약 함수
function insertRoomRes(payNumber) {
	//alert("객실예약 함수 진입");
    var payNum = payNumber;
    var roomId = 0;
    var roomResStatus = 'RESERVED';
    var guestEmail = jQuery("#email").val();
    var guestPhone = jQuery("#phone").val();
    var guestBirthday = "${umd.birthday}"; 

   
    
    jQuery.ajax({
        type: "POST",
        url: "http://localhost/hotel_prj/user/resveValid.do",
        cache: false,
        dataType: "json",
        global: false,
        beforeSend: function(xhr, opts) {
            RESV_STATUS = true;
            $(".btnArea").find("a").css({
                'pointer-events': 'none',
                'cursor': 'default',
                'opacity': '0.6'
            });
        },
        complete: function() {
            RESV_STATUS = false;
        },
        success: function(response) {
            // 여기서 roomid 값을 받아오는 부분을 정확히 처리해야 합니다.
            roomId = response; // 예약 가능한 객실의 ID를 받아온다고 가정합니다. 실제로는 서버 응답에 따라 수정 필요
            if (roomId != 0) {
                // 예약 가능한 객실이 있을 경우
                $.ajax({
                    type: "POST",
                    url: "http://localhost/hotel_prj/user/insertRoomRes.do",
                    data: JSON.stringify({
                        payNum: payNum,
                        roomId: roomId,
                        roomResStatus: roomResStatus,
                        guestEmail: guestEmail,
                        guestPhone: guestPhone,
                        guestBirthday: guestBirthday
                    }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result) {
                        //alert(payNum + " 으로 " + roomId + " 번 객실 객실등록 완료");
                		jQuery("#step3Form").attr("action", "http://localhost/hotel_prj/user/room4.do");
                		jQuery("#step3Form").submit();
                        
                        
                    },
                    error: function(xhr, status, error) {
                        alert("객실 등록에 실패했습니다: " + error);
                    }
                });
            } else {
                // 예약 가능한 객실이 없을 경우
                $(".btnArea").find("a").css({
                    'pointer-events': '',
                    'cursor': '',
                    'opacity': ''
                });
                alert("입실 가능한 객실이 존재하지 않습니다.");
            }
        },
        error: function(xhr, status, error) {
            alert("객실 예약 유효성 체크 중 오류가 발생했습니다: " + error);
            $(".btnArea").find("a").css({
                'pointer-events': '',
                'cursor': '',
                'opacity': ''
            });
        }
    });
}





jQuery(function(){
	jQuery(document).ready(function(){
		
		//체크인 체크아웃 날짜 html 주입
		jQuery("#dateText").html(jQuery("#ckinDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckinDate").val()) +"&nbsp;-&nbsp;"+ jQuery("#ckoutDate").val() + "&nbsp;" + dUtils.getDateToDay(jQuery("#ckoutDate").val())+"<span>"+jQuery("#night").val()+"&nbsp;박</span>")

	});
});






















</script>






		
		
		<!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
<!--E header  -->
		
		
		
        <!--(페이지 URL)-->











<script type="text/javascript">



/**
객실 재검색 이동
*/
function fncResvReset(){
	if(confirm("다시 검색하시겠습니까?")){ 
		location.href = "http://localhost/hotel_prj/resve/room/step0.do";
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
function fncGoPay(){

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
		
	


	
	jQuery("#email").val(jQuery("#email1").val().trim()+"@"+jQuery("#email2").val().trim());	// 이메일 취합

	
	jQuery("#phone").val(jQuery("#moblphonTelno").val().trim()+"-"+jQuery("#moblphonTelno1").val().trim()+"-"+jQuery("#moblphonTelno2").val().trim());	// 이메일 취합


	
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
		url : "http://localhost/hotel_prj/user/resveValid.do",
		cache : false,
		dataType : "json",
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
		success : function(roomId){
			
			//alert(roomId);

			
			if(roomId!=0){
				//commonJs.showLoadingBar();
				
				var pay_type = $('input[name="payType2"]:checked').val()
				
				if(pay_type=="kakaopay"){
					
					//alert("카카오페이");
					
					getTokenAndPayment('kakaopay.TC0ONETIME', 'kakaopay'); // 카카오페이
					
					
				}else if(pay_type=="inicis"){
					
					//alert("이니시스");
					
					getTokenAndPayment('html5_inicis', 'card'); // KG 이니시스
					
				}
				
				
				
				
				
			}else{
				
				$(".btnArea").find("a").css({
				    'pointer-events': '',
				    'cursor': '',
				    'opacity': ''
				});
				
				alert("입실가능한 객실이 존재하지않습니다.");
			}
		},
		error:function(r, s, e){
			alert("실패");
			
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
	<input type="hidden" name="hotlSysCode" id="hotlSysCode" value="ELS" /> 
	<input type="hidden" name="ckinDate" id="ckinDate" value="${rrVO.ckinDate}" /> 			
	<input type="hidden" name="ckoutDate" id="ckoutDate" value="${rrVO.ckoutDate}" /> 		
	<input type="hidden" name="night" id="night" value="${rrVO.night}" /> 					
	<input type="hidden" name="roomCnt" id="roomCnt" value="1" />			
	
		<input type="hidden" name="adltCntArr" value="${rrVO.adultsNum}"/>						

	
		<input type="hidden" name="chldCntArr" value="${rrVO.kidsNum}"/>						
					
	
	<input type="hidden" name="adltSum" id="adltSum" value="${rrVO.adultsNum}"/>				
	<input type="hidden" name="chldSum" id="chldSum" value="${rrVO.kidsNum}"/>				
	
		<input type="hidden" name="optAArr" value="BK"/>								
	
	
		<input type="hidden" name="optCArr" value="CHBK"/>								
	
	
		<input type="hidden" name="optEArr" value="0"/>								
							

		<input type="hidden" name="optAQtyArr" value="2"/>						
	
	
		<input type="hidden" name="optCQtyArr" value="0"/>						
	
	
		<input type="hidden" name="optEQtyArr" value="0"/>						
						
	
		<input type="hidden" name="email" id="email" value="" />												
		<input type="hidden" name="phone" id="phone" value="" />												
	
	
	
		<input type="hidden" name="contArr" value=""/>								
	
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
			
			<input type="hidden" name="gender" value="${ umd.gender}" />
			<input type="hidden" name="korNm" value="${ umd.name}" />
			<input type="hidden" name="countryCode" value="${ umd.nationalCode}" />
			<input type="hidden" name="lastName" value="${ umd.engLname}">
			<input type="hidden" name="firstName" value="${umd.engFname}">
	

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
						<dd>엘리시안 서울</dd>
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
						<dd>${rrVO.adultsNum}</dd>
					</dl>
					<dl class="dlType03">
						<dt>CHILDREN</dt>
						<dd>${rrVO.kidsNum}</dd>
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
						${rrVO.roomRankName} /	${rrVO.bedName}	/	${rrVO.viewName}	
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
										
											
												<input type="text" class="readOn" data-valid="Y" style="width:440px" aria-required="true" value="${umd.name} (${umd.engFname } ${umd.engLname }) / ${umd.gender} / ${umd.nationalCode } " readonly>
											
										
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
								
								<c:set var="phone" value="${umd.phone}" />
								
								<%-- 첫 번째 부분: "010" --%>
								<c:set var="phonePart1" value="${fn:substring(phone, 0, fn:indexOf(phone, '-'))}" />
								
								<%-- 나머지 부분 추출 --%>
								<c:set var="remainingPhone" value="${fn:substring(phone, fn:indexOf(phone, '-') + 1, fn:length(phone))}" />
								
								<%-- 두 번째 부분: "7427" --%>
								<c:set var="phonePart2" value="${fn:substring(remainingPhone, 0, fn:indexOf(remainingPhone, '-'))}" />
								
								<%-- 세 번째 부분: "0406" --%>
								<c:set var="phonePart3" value="${fn:substring(remainingPhone, fn:indexOf(remainingPhone, '-') + 1, fn:length(remainingPhone))}" />
								
								
								
								
								
									<input type="text" id="moblphonTelno" name="moblphonTelno" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" value="${phonePart1}">
								</span>
								<span class="dash"></span>
								<span class="intArea">
									<input type="text" id="moblphonTelno1" name="moblphonTelno1" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" value="${phonePart2}">
								</span>
								<span class="dash"></span>
								<span class="intArea">
									<input type="text" id="moblphonTelno2" name="moblphonTelno2" data-valid="Y" style="width:145px" aria-required="true" onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '');" role="last" value="${phonePart3}">
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
							
								<c:set var="email" value="${umd.email}" />
								
								<%-- 첫 번째 부분: "아이디" --%>
								<c:set var="emailPart1" value="${fn:substring(email, 0, fn:indexOf(email, '@'))}" />
								
								<%-- 나머지 부분 추출 : "이메일"--%>
								<c:set var="emailPart2" value="${fn:substring(email, fn:indexOf(email, '@') + 1, fn:length(email))}" />

							
							
							
							
							
							
								<span class="intArea"><input type="text" id="email1" style="width:273px" data-valid="Y" aria-required="true" onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');" value="${emailPart1}"></span>
								<span class="dash">@</span>
								<span class="intArea"><input type="text" id="email2" style="width:273px" data-valid="Y" aria-required="true" onkeyup="this.value=this.value.replace((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/), '');" value="${emailPart2}"/></span>
								<div class="intArea selectWrap" style="width:273px">	
									
									<select name="emailType" id="emailType" class="form-control"    >
									<option value="">직접 입력</option>
									<option value="naver.com" >naver.com</option>
									<option value="hanmail.net" >hanmail.net</option>
									<option value="hotmail.com" >hotmail.com</option>
									<option value="nate.com" >nate.com</option>
									<option value="gmail.com" >gmail.com</option>
									<option value="sist.co.kr" >gmail.com</option>
									</select>
								</div>
								<span class="alertMessage">이메일을 입력해주세요.</span>
							</div>
						</li>
                        
                             <li>
                                <div class="intWrap"><span class="tit"><label for="payType2">PAY TYPE</label><span class="essential">필수</span></span></div>
                                <div class="intInner">
									<div class="intArea">
									    <div class="intBox">
									        <span class="frm">
									            <input type="radio" id="payType01" name="payType2" value="kakaopay" checked="checked">
									            <label for="payType01">카카오페이</label>
									            <input type="radio" id="payType02" name="payType2" value="inicis">
									            <label for="payType02">KG이니시스</label>
									        </span>
									    </div>
									</div>
                                    <span class="alertMessage">결제 타입을 선택해 주세요.</span>
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
									객실
									<span class="price" id="roomAmount0"><em>
									<fmt:formatNumber value="${rrVO.payPrice}" pattern="#,##0"/>
									</em>KRW</span>
								</strong>
								<button type="button" class="btnToggle"><span class="hidden">상세내용 보기</span></button>
								<div class="toggleCont" style="display: block;">
									<div class="toggleInner">
										<div class="optionTotal scrollWrap">
											<ul class="infoData">
												
													
													<li>
														<span class="lfData"><fmt:formatNumber value="${rrVO.payPrice}" pattern="#,##0"/> KRW * ${rrVO.night} 박</span>
													</li>
												
											</ul>
											
											
										</div>
									</div>
								</div>
							</li>	
						
					</ul>
					<div class="totalCont"><!-- 20200420 수정 -->
						<div class="totalPrice"><!-- saleTxt가 있을땐 type02 -->
							<span class="txt">총 예약금액</span>
							
								
								
								
							
							<span class="price"><em>
							<fmt:formatNumber value="${rrVO.payPrice * rrVO.night}" pattern="#,##0"></fmt:formatNumber>
							</em>KRW</span>
						</div>
						<div class="btnArea">
							<div><a href="#none" class="btnSC btnL active" onclick="fncGoPay();">결제</a></div> <!-- 결제 -->
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

