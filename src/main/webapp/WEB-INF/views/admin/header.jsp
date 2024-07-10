<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function confirmLogout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        alert("정상적으로 로그아웃 되었습니다.");
        window.location.href = "http://localhost/hotel_prj/admin/logout.do";
    }
    return false;
}
</script>

<header>
	<div class="row">
		<div class="col-12 col-lg-12 d-flex justify-content-between align-items-center">
			<div class="float-start">
				<a href="#" class="burger-btn d-block d-xl-none">
					<i class="bi bi-justify fs-3"></i>
				</a>
			</div>
			
			<div class="middle-content d-flex justify-content-start align-items-center">
				<div class="avatar avatar-md">
                    <img src="/hotel_prj/admin/assets/compiled/jpg/1.jpg" alt="Face 1">
                </div>
                <div class="ms-1">
					<h5 class="font-bold px-2 py-2 mb-0"><c:out value="${sessionScope.adminId}"/>(<c:out value="${sessionScope.adminAuthority}"/> 관리자)님 로그인 중</h5>
                </div>
			</div>
			
			<div class="float-end mr-0">
				<a href="#" class="btn icon icon-left btn-outline-warning btn-sm rounded-pill"
					onclick="return confirmLogout();">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
				stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
				<circle cx="12" cy="7" r="4"></circle></svg>
			    Log out</a>
			</div>
		</div>
	</div>
</header>