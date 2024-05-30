<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 이벤트" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>엘리시안 호텔 관리자 페이지</title>
 
<!-- favicon S -->
<link rel="shortcut icon" href="/hotel_prj/admin/assets/static/images/logo/favicon.ico" type="image/x-icon">
<!-- favicon E -->

<!-- template css S -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/iconly.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type = "text/css">
</style>
<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.em").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스를 제거합니다.
	        $(".sidebar-item").removeClass("active");

	        // 클릭된 요소에만 active 클래스를 추가합니다.
	        $(this).addClass("active");
	    });
	}); // ready
</script>
</head>

<body>
<script src="/hotel_prj/admin/assets/static/js/initTheme.js"></script>

<!-- app S -->
<div id="app">
	<!-- sidebar S -->
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<!-- sidebar E -->
		
	<!-- main S -->
	<div id="main">
	
	<!-- header S -->
	<jsp:include page="/admin/header.jsp"></jsp:include>
	<!-- header E -->
            
	<div class="page-heading">
	    <h3>Event Management</h3>
	</div> 
	
	<div class="page-content mb-3"> 
	    <section class="row">
	        <div class="col-12 col-lg-9">
	        섹션을 12개 열로 나눴을 때 9개 정도<br>
	        섹션 나누지 않고 해도 괜찮음
	        </div>
	        <div class="col-12 col-lg-3">
	        섹션을 12개 열로 나눴을 때 3개 정도<br>
	        정확한건 대시보드 또는 데모페이지 참고
	        </div>
	    </section>
	</div>

	<!-- footer S -->
	<jsp:include page="/admin/footer.jsp"></jsp:include>
	<!-- footer E -->
            
    </div>
    <!-- main E -->
    
</div>
<!-- app E  -->

<!-- 공통 필요 Script S -->
<script src="/hotel_prj/admin/assets/static/js/components/dark.js"></script>
<script src="/hotel_prj/admin/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/hotel_prj/admin/assets/compiled/js/app.js"></script>
<!-- 공통 필요 Script E -->

</body>
</html>