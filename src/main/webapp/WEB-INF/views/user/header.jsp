<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
<!-- header type02 추가 되는 경우 mainArea02, mainArea03, mainArea05  -->
	<div class="headArea">
	<strong class="logo"><a href="http://localhost/hotel_prj/user/index.do">ELYSIAN HOTEL Official Website</a></strong>
	<button type="button" class="btnMenu">메뉴 열기</button> <!-- 클릭하면 menuOn 클래스 추가, 메뉴 닫기 텍스트 변경 -->
				
		<div class="allMenu"> <!-- 화면 높이값 계산 height:적용, body:overflow:hidden -->
		<div class="inner">

		<ul class="menuDepth01">
			<li>ABOUT US
			<ul class="menuDepth02">
				<li><a href="http://localhost/hotel_prj/user/index.do">ELYSIAN HOTEL</a>
				<ul class="menuDepth03">
					<li><a href="http://localhost/hotel_prj/user/aboutUs.do">기업소개</a></li>
					<li><a href="http://localhost/hotel_prj/user/location.do">오시는길</a></li>
				</ul>
				</li>
			</ul>
			</li>

			<li>HOTELS
			<ul class="menuDepth02">
				<li><a href="http://localhost/hotel_prj/user/index.do">엘리시안 서울</a></li>
			</ul>
			</li>
							
			<li>MY PAGE
			<ul class="menuDepth02">
				<li><a href="http://localhost/hotel_prj/user/mypage.do">MY PAGE</a></li>
				<li><a href="http://localhost/hotel_prj/user/roomResList.do">예약확인</a></li>
				<li><a href="http://localhost/hotel_prj/user/myInfoPwCfmForm.do">개인정보관리</a></li>
			</ul>
			</li>
							
			<li>CUSTOMER SERVICE
			<ul class="menuDepth02">
				<li><a href="http://localhost/hotel_prj/user/notice.do">공지사항</a></li>
				<li><a href="http://localhost/hotel_prj/user/qna.do">QNA</a></li>
				<li><a href="http://localhost/hotel_prj/user/event.do">EVENT</a></li>
			</ul>
			</li>
		</ul>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'))">닫기</button>
		</div>
		</div>

		<!-- //allMenu -->
		<div class="gnbUtil">
		<ul>
		<c:choose>
            <c:when test="${not empty userId}">
                <li><a href="http://localhost/hotel_prj/user/logout.do" id="logout">로그아웃</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="http://localhost/hotel_prj/user/login.do" id="login">로그인</a></li>
            </c:otherwise>
        </c:choose>
		<c:if test="${not empty error}">
    		<script type="text/javascript">
        		alert('${error}');
    		</script>
		</c:if>

			<li><a href="http://localhost/hotel_prj/user/join.do" id="join">회원가입</a></li>
			<li><a href="http://localhost/hotel_prj/user/mypage.do" id="mypage">마이페이지</a></li>
			<li><a href="http://localhost/hotel_prj/user/roomResList.do" id="confirmReserv">예약확인</a></li>
		</ul>
					
		<div class="resvBtn">
		<div class="dropdown_list" aria-expanded="false">
		<div class="dropdown_value">
			<input type="text" role="combobox" value="RESERVATION" aria-expanded="false" tabindex="-1" readonly>
			<button type="button" aria-label="목록열기" class="btn_opener"></button>
		</div>
		
		<ul class="item_list" role="listbox">
			<li role="option"><a href="http://localhost/hotel_prj/user/room.do" id="roomSearchGNB">ROOM</a></li>
			<li role="option"><a href="http://localhost/hotel_prj/user/dining.do" id="diningSearchGNB">DINING</a></li>                             
		</ul>
		</div>
		</div>
		</div>
		<!-- //gnbUtil -->
	</div>
</div>