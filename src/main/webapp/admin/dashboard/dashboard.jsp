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
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/iconly.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.db").addClass("active");
		
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
	    <h3>DashBoard</h3>
	</div> 
	
	<div class="page-content mb-3"> 
	    <section class="row">
	        <div class="col-12 col-lg-9">
	            <div class="row">
	                <div class="col-6 col-lg-3 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon purple mb-2">
	                                        <i class="iconly-boldShow"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">Profile Views</h6>
	                                    <h6 class="font-extrabold mb-0">112.000</h6>
	                                </div>
	                            </div> 
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-3 col-md-6">
	                    <div class="card"> 
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon blue mb-2">
	                                        <i class="iconly-boldProfile"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">Followers</h6>
	                                    <h6 class="font-extrabold mb-0">183.000</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-3 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon green mb-2">
	                                        <i class="iconly-boldAdd-User"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">Following</h6>
	                                    <h6 class="font-extrabold mb-0">80.000</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-3 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon red mb-2">
	                                        <i class="iconly-boldBookmark"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">Saved Post</h6>
	                                    <h6 class="font-extrabold mb-0">112</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4>Profile Visit</h4>
	                        </div>
	                        <div class="card-body">
	                            <div id="chart-profile-visit"></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12 col-xl-4">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4>Profile Visit</h4>
	                        </div>
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-7">
	                                    <div class="d-flex align-items-center">
	                                        <svg class="bi text-primary" width="32" height="32" fill="blue"
	                                            style="width:10px">
	                                           <use
	                                               xlink:href="/hotel_prj/admin/assets/static/images/bootstrap-icons.svg#circle-fill" />
	                                       </svg>
	                                       <h5 class="mb-0 ms-3">Europe</h5>
	                                   </div>
	                               </div>
	                               <div class="col-5">
	                                   <h5 class="mb-0 text-end">862</h5>
	                               </div>
	                               <div class="col-12">
	                                   <div id="chart-europe"></div>
	                               </div>
	                           </div>
	                           <div class="row">
	                               <div class="col-7">
	                                   <div class="d-flex align-items-center">
	                                       <svg class="bi text-success" width="32" height="32" fill="blue"
	                                           style="width:10px">
	                                           <use
	                                               xlink:href="/hotel_prj/admin/assets/static/images/bootstrap-icons.svg#circle-fill" />
	                                       </svg>
	                                       <h5 class="mb-0 ms-3">America</h5>
	                                   </div>
	                               </div>
	                               <div class="col-5">
	                                   <h5 class="mb-0 text-end">375</h5>
	                               </div>
	                               <div class="col-12">
	                                   <div id="chart-america"></div>
	                               </div>
	                           </div>
	                           <div class="row">
	                               <div class="col-7">
	                                   <div class="d-flex align-items-center">
	                                       <svg class="bi text-success" width="32" height="32" fill="blue"
	                                           style="width:10px">
	                                           <use
	                                               xlink:href="/hotel_prj/admin/assets/static/images/bootstrap-icons.svg#circle-fill" />
	                                       </svg>
	                                       <h5 class="mb-0 ms-3">India</h5>
	                                   </div>
	                               </div>
	                               <div class="col-5">
	                                   <h5 class="mb-0 text-end">625</h5>
	                               </div>
	                               <div class="col-12">
	                                   <div id="chart-india"></div>
	                               </div>
	                           </div>
	                           <div class="row">
	                               <div class="col-7">
	                                   <div class="d-flex align-items-center">
	                                       <svg class="bi text-danger" width="32" height="32" fill="blue"
	                                           style="width:10px">
	                                            <use
	                                                xlink:href="/hotel_prj/admin/assets/static/images/bootstrap-icons.svg#circle-fill" />
	                                        </svg>
	                                        <h5 class="mb-0 ms-3">Indonesia</h5>
	                                    </div>
	                                </div>
	                                <div class="col-5">
	                                    <h5 class="mb-0 text-end">1025</h5>
	                                </div>
	                                <div class="col-12">
	                                    <div id="chart-indonesia"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-xl-8">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4>Latest Comments</h4>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-hover table-lg">
	                                    <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>Comment</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="col-3">
	                                                <div class="d-flex align-items-center">
	                                                    <div class="avatar avatar-md">
	                                                        <img src="/hotel_prj/admin/assets/compiled/jpg/5.jpg">
	                                                    </div>
	                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
	                                                </div>
	                                            </td>
	                                            <td class="col-auto">
	                                                <p class=" mb-0">Congratulations on your graduation!</p>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="col-3">
	                                                <div class="d-flex align-items-center">
	                                                    <div class="avatar avatar-md">
	                                                        <img src="/hotel_prj/admin/assets/compiled/jpg/2.jpg">
	                                                    </div>
	                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
	                                                </div>
	                                            </td>
	                                            <td class="col-auto">
	                                                <p class=" mb-0">Wow amazing design! Can you make another tutorial for
	                                                    this design?</p>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="col-3">
	                                                <div class="d-flex align-items-center">
	                                                    <div class="avatar avatar-md">
	                                                        <img src="/hotel_prj/admin/assets/compiled/jpg/8.jpg">
	                                                    </div>
	                                                    <p class="font-bold ms-3 mb-0">Singh Eknoor</p>
	                                                </div>
	                                            </td>
	                                            <td class="col-auto">
	                                                <p class=" mb-0">What a stunning design! You are so talented and creative!</p>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="col-3">
	                                                <div class="d-flex align-items-center">
	                                                    <div class="avatar avatar-md">
	                                                        <img src="/hotel_prj/admin/assets/compiled/jpg/3.jpg">
	                                                    </div>
	                                                    <p class="font-bold ms-3 mb-0">Rani Jhadav</p>
	                                                </div>
	                                            </td>
	                                            <td class="col-auto">
	                                                <p class=" mb-0">I love your design! It’s so beautiful and unique! How did you learn to do this?</p>
	                                            </td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-12 col-lg-3">
	            <div class="card">
	                <div class="card-body py-4 px-4">
	                    <div class="d-flex align-items-center">
	                        <div class="avatar avatar-xl">
	                            <img src="/hotel_prj/admin/assets/compiled/jpg/1.jpg" alt="Face 1">
	                        </div>
	                        <div class="ms-3 name">
	                            <h5 class="font-bold">John Duck</h5>
	                            <h6 class="text-muted mb-0">@johnducky</h6>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="card">
	                <div class="card-header">
	                    <h4>Recent Messages</h4>
	                </div>
	                <div class="card-content pb-4">
	                    <div class="recent-message d-flex px-4 py-3">
	                        <div class="avatar avatar-lg">
	                            <img src="/hotel_prj/admin/assets/compiled/jpg/4.jpg">
	                        </div>
	                        <div class="name ms-4">
	                            <h5 class="mb-1">Hank Schrader</h5>
	                            <h6 class="text-muted mb-0">@johnducky</h6>
	                        </div>
	                    </div>
	                    <div class="recent-message d-flex px-4 py-3">
	                        <div class="avatar avatar-lg">
	                            <img src="/hotel_prj/admin/assets/compiled/jpg/5.jpg">
	                        </div>
	                        <div class="name ms-4">
	                            <h5 class="mb-1">Dean Winchester</h5>
	                            <h6 class="text-muted mb-0">@imdean</h6>
	                        </div>
	                    </div>
	                    <div class="recent-message d-flex px-4 py-3">
	                        <div class="avatar avatar-lg">
	                            <img src="/hotel_prj/admin/assets/compiled/jpg/1.jpg">
	                        </div>
	                        <div class="name ms-4">
	                            <h5 class="mb-1">John Dodol</h5>
	                            <h6 class="text-muted mb-0">@dodoljohn</h6>
	                        </div>
	                    </div>
	                    <div class="px-4">
	                        <button class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>Start Conversation</button>
	                    </div>
	                </div>
	            </div> 
	            <div class="card">
	                <div class="card-header">
	                    <h4>Visitors Profile</h4>
	                </div>
	                <div class="card-body">
	                    <div id="chart-visitors-profile"></div>
	                </div>
	            </div>
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
     
<!-- Need: Apexcharts -->
<script src="/hotel_prj/admin/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/dashboard.js"></script>

</body>
</html>