<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>

<div class="header">
<!-- header type02 추가 되는 경우 mainArea02, mainArea03, mainArea05  -->
	<div class="headArea">
	<strong class="logo"><a href="/hotel_prj/index.jsp">ELYSIAN HOTEL Official Website</a></strong>
	<button type="button" class="btnMenu">메뉴 열기</button> <!-- 클릭하면 menuOn 클래스 추가, 메뉴 닫기 텍스트 변경 -->
				
		<div class="allMenu"> <!-- 화면 높이값 계산 height:적용, body:overflow:hidden -->
		<div class="inner">

		<ul class="menuDepth01">
			<li>ABOUT US
			<ul class="menuDepth02">
				<li><a href="/hotel_prj/index.jsp">ELYSIAN HOTEL</a>
				<ul class="menuDepth03">
					<li><a href="/about/hotel.do">기업소개</a></li>
					<li><a href="/about/location.do">오시는길</a></li>
				</ul>
				</li>
													
				<li><a href="/press/actReport.do">NEWS</a>
				<ul class="menuDepth03">
					<li><a href="/press/actReport.do">주요소식</a></li>
					<li><a href="/press/social.do">소셜 미디어</a></li>
				</ul>
				</li>
													
				<li><a href="/recruit/employment.do">RECRUIT</a></li>
			</ul>
			</li>

			<li>HOTELS
			<ul class="menuDepth02">
				<li><a href="/hotel_prj/index.jsp">엘리시안 서울</a></li>
			</ul>
			</li>
							
			<li>OFFERS
			<ul class="menuDepth02">
				<li><a href="/package/list.do">PACKAGE</a></li>
				<li><a href="/event/list.do">EVENT</a></li>
			</ul>
			</li>

			<li>MEMBERSHIP
			<ul class="menuDepth02">
				<li><a href="/membership/ed2_product.do">CLUB JOSUN</a></li>
				<li><a href="/membership/event.do">EVENT</a></li>
				<li><a href="/membership/news.do">NEWS</a></li>
			</ul>
			</li>
							
			<li>MY PAGE
			<ul class="menuDepth02">
				<li><a href="/hotel_prj/user/mypage/main.jsp">MY PAGE</a></li>
				<li><a href="/hotel_prj/user/cnfirm/mber/room/reserveList.jsp">예약확인</a></li>
				<li><a href="/hotel_prj/user/mypage/myInfoForm.jsp">개인정보관리</a></li>
			</ul>
			</li>
							
			<li>CUSTOMER SERVICE
			<ul class="menuDepth02">
				<li><a href="#">FAQ</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
			</li>
		</ul>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'))">닫기</button>
		</div>
		</div>

		<!-- //allMenu -->
		<div class="gnbUtil">
		<ul>
			<li><a href="/hotel_prj/user/login/loginForm.jsp" id="login">로그인</a></li>
			<li><a href="/hotel_prj/user/identify/identifyIntro.jsp" id="join">회원가입</a></li>
			<li><a href="/hotel_prj/user/cnfirm/mber/room/reserveList.jsp" id="confirmReserv">예약확인</a></li>
		</ul>
					
		<div class="resvBtn">
		<div class="dropdown_list" aria-expanded="false">
		<div class="dropdown_value">
			<input type="text" role="combobox" value="RESERVATION" aria-expanded="false" tabindex="-1" readonly>
			<button type="button" aria-label="목록열기" class="btn_opener"></button>
		</div>
		
		<ul class="item_list" role="listbox">
			<li role="option"><a href="/hotel_prj/user/resve/room/step0.jsp" id="roomSearchGNB">ROOM</a></li>
			<li role="option"><a href="/hotel_prj/user/resve/dining/resveForm.jsp?searchSysCode=TWC&searchDiningCode=003" id="diningSearchGNB">DINING</a></li>                             
			<li role="option"><a href="/hotel_prj/user/mypage/myCouponaForm.do">MEMBERSHIP</a></li>
		</ul>
		</div>
		</div>
		</div>
		<!-- //gnbUtil -->
	</div>
</div>