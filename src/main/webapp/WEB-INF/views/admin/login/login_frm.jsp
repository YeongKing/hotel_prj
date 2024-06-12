<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 대쉬보드" %>
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
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/auth.css">
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

<!-- auth S -->
<div id="auth">
        
<div class="row h-100">
    <div class="col-lg-5 col-12">
        <div id="auth-left">
            <div class="auth-logo mb-3">
                <a href="http://localhost/hotel_prj/admin/index.do">
                <img src="/hotel_prj/admin/assets/static/images/logo/logo.png" alt="Logo"></a>
            </div>
            <h1 class="auth-title">Log in</h1>
            <p class="auth-subtitle mb-5">엘리시안 관리자 사이트 이용을 위해 로그인해주세요.</p>

            <form action="http://localhost/hotel_prj/admin/dashboard.do"  class="mb-5">
                <div class="form-group position-relative has-icon-left mb-4">
                    <input type="text" class="form-control form-control-xl" placeholder="id">
                    <div class="form-control-icon">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <div class="form-group position-relative has-icon-left mb-4">
                    <input type="password" class="form-control form-control-xl" placeholder="Password">
                    <div class="form-control-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                </div>
                <button class="btn btn-outline-warning btn-block btn-lg shadow-lg mt-5">Log in</button>
            </form>
	        <div class="d-flex align-items-center justify-content-center">
	        <a href="http://localhost/hotel_prj/user/index.do" class="btn btn-outline-secondary btn-block">엘리시안 호텔 홈페이지 바로가기</a>
	        </div>
        </div>
    </div>
    
    <div class="col-lg-7 d-none d-lg-block">
        <div id="auth-right">

        </div>
    </div>
</div>

</div>
<!-- auth E -->
</body>