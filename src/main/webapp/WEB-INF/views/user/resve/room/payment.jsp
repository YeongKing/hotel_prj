<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- iam port 결제 등록 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script type="text/javascript">
	$(function(){
		$("#kakaoPayment").click(function(){
			getTokenAndPayment(); //호출
		})//kakaoPayment
		
		$("#getToken").click(function(){
			getToken(); 
		})//getToken
	})//ready	
	
	function getTokenAndPayment(){
        $.ajax({
            url: "http://localhost/hotel_prj/user/getToken.do",
            method: 'GET',
            success: function(response) {
                $('#tokenDisplay').text('받아온 토큰: ' + response);
                payment(response); // 토큰을 받은 후 결제 호출
            },
            error: function() {
                $('#tokenDisplay').text('토큰을 받아오는데 실패했습니다.');
            }
        });
    }
	
	function payment(token){
		IMP.init('imp25425801');
		IMP.request_pay({
			pg: 'kakaopay.TC0ONETIME',
			pay_method: 'kakaopay',
			amount : 1000,
			buyer_name : '김무영',
			buyer_email  : 'sist@naver.com',
			buyer_tel  : '010-8623-5905',
			buyer_addr  : '쌍용교육센터 7강의실',
			name : '결제테스트'
		}, function(response) {
			//결제 후 호출되는 callback함수
			if ( response.success ) { //결제 성공
				console.log(response);
				sendPaymentData(response,token);
			} else {
				alert('결제실패 : ' + response.error_msg);
			}
		})
	}
	
	<!--paymentService 로 데이터 전송 ajax-->
	function sendPaymentData(paymentData,token) {
		const impUid = paymentData.imp_uid;
		alert( JSON.stringify(paymentData)  )
		$.ajax({
			type: "POST",
			url: "http://localhost/hotel_prj/user/payment.do",
			data: JSON.stringify({
				imp_uid: impUid,
				payment_data: paymentData,
				token: token
			}),
			dataType:"JSON",
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				alert("결제 데이터가 성공적으로 전송되었습니다!");
                //displayPaymentInfo(data); // 결제 정보 화면에 출력
			},
			error: function(err) {
				let errorMessage = "결제 데이터 전송 오류: " + err.status + " " + err.statusText + " - " + err.responseText;
				alert(errorMessage);
				console.log("에러 상세: ", err);
			}
		});
	}
	
	<!--토큰 발급 서비스 이동 ajax-->
	function getToken(){
        $.ajax({
            url: "http://localhost/hotel_prj/user/getToken.do",
            method: 'GET',
            success: function(response) {
                $('#tokenDisplay').text('받아온 토큰: ' + response);
            },
            error: function() {
                $('#tokenDisplay').text('토큰을 받아오는데 실패했습니다.');
            }
        });
	}
	
    // 결제 정보를 화면에 출력하는 함수
    function displayPaymentInfo(paymentInfo) {
        $('#paymentInfo').html(
            '<p>상태: ' + paymentInfo.status + '</p>' +
            '<p>금액: ' + paymentInfo.amount + '</p>' +
            '<p>구매자 이름: ' + paymentInfo.buyer_name + '</p>' +
            '<p>구매자 전화번호: ' + paymentInfo.buyer_phone + '</p>' +
            '<p>구매자 이메일: ' + paymentInfo.member_email + '</p>' +
            '<p>구매자 주소: ' + paymentInfo.buyer_addr + '</p>' +
            '<p>결제 시간: ' + paymentInfo.paid_at + '</p>' +
            '<p>상품명: ' + paymentInfo.buy_product_name + '</p>' +
            '<p>구매자 ID: ' + paymentInfo.buyer_buyid + '</p>' +
            '<p>Merchant ID: ' + paymentInfo.buyer_merid + '</p>' +
            '<p>카드 번호: ' + paymentInfo.buyer_card_num + '</p>' +
            '<p>결제 상태: ' + paymentInfo.buyer_pay_ok + '</p>'
        );
    }

</script>

<script type="text/javascript">
$(function(){
	
$("#KGPayment").click(function(){
	getTokenAndPaymentKG();
	
})

})

	function getTokenAndPaymentKG(){
        $.ajax({
            url: "http://localhost/hotel_prj/user/getToken.do",
            method: 'GET',
            success: function(response) {
                $('#tokenDisplay').text('받아온 토큰: ' + response);
                paymentKG(response); // 토큰을 받은 후 결제 호출
            },
            error: function() {
                $('#tokenDisplay').text('토큰을 받아오는데 실패했습니다.');
            }
        });
    }
    
function paymentKG(token){
	IMP.init('imp25425801');
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		amount : 100,
		buyer_name : '김무영',
		buyer_email  : 'sist@naver.com',
		buyer_tel  : '010-8623-5905',
		buyer_addr  : '쌍용교육센터 7강의실', 
		name : '결제테스트'
	}, function(response) {
		//결제 후 호출되는 callback함수
		if ( response.success ) { //결제 성공
			console.log(response);
			sendPaymentDataKG(response,token);
		} else {
			alert('결제실패 : ' + response.error_msg);
		}
	})
}

<!--paymentService 로 데이터 전송 ajax-->
function sendPaymentDataKG(paymentData,token) {
	const impUid = paymentData.imp_uid;
	alert( JSON.stringify(paymentData)  )
	$.ajax({
		type: "POST",
		url: "http://localhost/hotel_prj/user/payment.do",
		data: JSON.stringify({
			imp_uid: impUid,
			payment_data: paymentData,
			token: token
		}),
		dataType:"JSON",
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			alert("결제 데이터가 성공적으로 전송되었습니다!");
			//displayPaymentInfoKG(data); // 결제 정보 화면에 출력
		},
		error: function(err) {
			let errorMessage = "결제 데이터 전송 오류: " + err.status + " " + err.statusText + " - " + err.responseText;
			alert(errorMessage);
			console.log("에러 상세: ", err);
		}
	});
}

// 결제 정보를 화면에 출력하는 함수
function displayPaymentInfoKG(paymentInfo) {
    $('#paymentInfo').html(
        '<p>상태: ' + paymentInfo.status + '</p>' +
        '<p>금액: ' + paymentInfo.amount + '</p>' +
        '<p>구매자 이름: ' + paymentInfo.buyer_name + '</p>' +
        '<p>구매자 전화번호: ' + paymentInfo.buyer_phone + '</p>' +
        '<p>구매자 이메일: ' + paymentInfo.member_email + '</p>' +
        '<p>구매자 주소: ' + paymentInfo.buyer_addr + '</p>' +
        '<p>결제 시간: ' + paymentInfo.paid_at + '</p>' +
        '<p>상품명: ' + paymentInfo.buy_product_name + '</p>' +
        '<p>구매자 ID: ' + paymentInfo.buyer_buyid + '</p>' +
        '<p>Merchant ID: ' + paymentInfo.buyer_merid + '</p>' +
        '<p>카드 번호: ' + paymentInfo.buyer_card_num + '</p>' +
        '<p>결제 상태: ' + paymentInfo.buyer_pay_ok + '</p>' +
        '<p>승인 번호: ' + paymentInfo.apply_num + '</p>'
    );
}



</script>
</head>

<body>

<div class="ka_pay_btn">
  <button type="button" id="kakaoPayment">카카오페이</button>
  <button type="button" id="KGPayment">KG이니시스</button>
  <button type="button" id=getToken>토큰발급</button>
</div>
 <p id="tokenDisplay">여기에 토큰이 표시됩니다.</p>
<div id="paymentInfo">여기에 결제 정보가 표시됩니다.</div>
</body>
</html>