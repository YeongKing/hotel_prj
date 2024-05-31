<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "403 페이지" %>
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
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/error.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(function() {

	}); // ready
</script>
</head>

<body>
<script src="/hotel_prj/admin/assets/static/js/initTheme.js"></script>
<div id="error">

<div class="error-page container">
	<div class="col-md-8 col-12 offset-md-2">
		<div class="text-center">
			<img class="img-error" src="/hotel_prj/admin/assets/compiled/svg/error-403.svg" alt="Forbidden">
			<h1 class="error-title">Forbidden</h1>
			<p class="fs-5 text-gray-600">이 페이지를 볼 수 있는 권한이 없습니다.</p>
		<a href="/hotel_prj/admin/index.jsp" class="btn btn-lg btn-outline-warning mt-3">돌아가기</a>
	    </div>
	</div>
</div>

</div>
</body>
</html>