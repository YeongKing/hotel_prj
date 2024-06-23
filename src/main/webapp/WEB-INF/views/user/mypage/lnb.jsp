<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
 info="" %>
 <script type="text/javascript">
	//LNB정보(이름)조회 API호출
	function fncLnbInfoApi() {
		$.ajax({
			url : "mypage/lnbInfoApi.do",
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				//회원명 세팅
				var nameHtml = ''+data.userName;
				$('#nm1').html(nameHtml);
			},
			error:function(xhr){
				console.log(xhr.status);
				alert("관리자에게 문의하세요.");
			}
		});
	} // fncLnbInfoApi
</script>
 
 <div class="lnbArea">
	
	<div class="myInfo">
		<p class="name"><a href="http://localhost/hotel_prj/user/mypage.do"><em id="nm1"></em>님</a></p>
	</div>
	
	<ul class="lnb">
	<li>예약확인
		<ul>
			<li><a href="http://localhost/hotel_prj/user/roomResList.do">객실 예약 내역</a></li>
			<li><a href="http://localhost/hotel_prj/user/diningResList.do">다이닝 예약 내역</a></li>
		</ul>
	</li>
	
    <li>개인정보관리
		<ul>
			<li><a href="http://localhost/hotel_prj/user/myInfoForm.do">회원 정보 수정 </a></li>
			<li><a href="http://localhost/hotel_prj/user/pwChngForm.do">비밀번호 변경</a></li>
			<li><a href="http://localhost/hotel_prj/user/withdraPwCfmForm.do">회원 탈퇴</a></li>
		</ul>
	</li>
	</ul>
	
</div>