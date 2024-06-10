<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 다이닝 관리" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style type="text/css">
    /* textarea 높이 조정 */
    .custom-textarea {
        height: 400px; /* 원하는 높이로 조정 */
    }
    .buttons {
        margin-top: 40px;
    }
</style>

<script type="text/javascript">
	$(function() {
		$(".sidebar-item.dm").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        $(".sidebar-item").removeClass("active");
	        $(this).addClass("active");
		});
	});
</script>
</head>

<body>
<script src="/hotel_prj/admin/assets/static/js/initTheme.js"></script>

<!-- app S -->
<div id="app">
	<!-- sidebar S -->
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
	<!-- sidebar E -->

	<!-- main S -->
	<div id="main">

	<!-- header S -->
	<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	<!-- header E -->

	<div class="page-heading">
	    <h3>다이닝 등록</h3>
	</div>
	
	
	<div class="page-content mb-3"> 
	    <section class="row">
	        <section class="section">
        <div class="card">
            <div class="card-body">
                <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="col-md-10">
                        <div class="form-group">
                            <label for="disabledInput">매장아이디</label>
                            <input type="text" class="form-control" id="diningId" placeholder="Dining01" disabled="">
                        </div>
                        <div class="form-group">
                            <label for="basicInput">매장명</label>
                            <input type="text" class="form-control" id="diningName" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="basicInput">매장구분</label>
                            <fieldset class="form-group">
                            <select class="form-select" id="diningType">
                           		<option>양식</option>
                            	<option>중식</option>
                            	<option>일식</option>
                            	<option>다이닝바</option>
                            	<option>베이커리</option>
                            </select>
                            </fieldset>
                        </div>

                        <div class="form-group">
                            <label for="basicInput">홀테이블</label>
                            <input type="text" class="form-control" id="hallTable" placeholder="0">
                        </div>

                        <div class="form-group">
                            <label for="basicInput">룸테이블</label>
                            <input type="text" class="form-control" id="roomTable" placeholder="0">
                        </div>
                        <div class="form-group">
                            <label for="basicInput">영업시작시간</label>
                            <input type="text" class="form-control" id="openTime" placeholder="00:00">
                        </div>
                        <div class="form-group">
                            <label for="basicInput">영업종료시간</label>
                            <input type="text" class="form-control" id="closeTime" placeholder="00:00">
                        </div>
                        <div class="form-group">
                            <label for="basicInput">위치</label>
                            <input type="text" class="form-control" id="location">
                        </div>

                        <div class="form-group">
                            <label for="helperText">예약금</label>
                            <input type="text" id="deposit" class="form-control" placeholder="0">
                            <p><small class="text-muted">인당</small></p>
                        </div>
                        <div class="form-group">
                            <label for="disabledInput">매장 대표 이미지</label>
                   			<fieldset>
                    		 	<div class="input-group">
                     		 		<input type="file" class="form-control" id="diningImg" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                    		 		<button class="btn btn-primary" type="button" id="inputGroupFileAddon04">Upload</button>
                    			</div>
                    		  </fieldset>
                 		</div>
                 		<div class="buttons">
                 		<a href="#" class="btn icon icon-left btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                등록</a>
                        </div>
                    </div>
                    </div>
                    <div class="col-12 col-lg-8">
                    <div class="col-md-27">
                        <div class="form-group">
                            <label for="basicInput">매장 소개</label>
                            <textarea class="form-control custom-textarea" id="diningComment"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="basicInput">메뉴 소개</label>
                            <textarea class="form-control custom-textarea" id="menu"></textarea>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	    </section>
	</div>

	<!-- footer S -->
	<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>
	<!-- footer E -->

    </div>
    <!-- main E -->

</div>
<!-- app E -->

<!-- 공통 필요 Script S -->
<script src="/hotel_prj/admin/assets/static/js/components/dark.js"></script>
<script src="/hotel_prj/admin/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/hotel_prj/admin/assets/compiled/js/app.js"></script>
<!-- 공통 필요 Script E -->



</body>
</html>
