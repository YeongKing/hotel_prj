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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".sidebar-item").removeClass("active");
	
	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
		});
		
		loadData();
	}); // ready
	
	// 대시보드 데이터 부르는 ajax
	function loadData() {
		$.ajax({
			url: 'dashboardData.do',
			type: 'GET',
			dataType: 'json',
			data: '',
			error: function(xhr) {
				console.log(xhr.status);
				alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
			},
			success: function(data) {
				// 상단 텍스트 데이터 설정
				$("#todayRoomResCnt").text(data.todayRoomResCnt);
				$("#oneMonthRoomResCnt").text(data.oneMonthRoomResCnt);
				$("#allMemberCnt").text(data.allMemberCnt);
				$("#todayJoinCnt").text(data.todayJoinCnt);
				$("#expectedCheckinCnt").text(data.expectedCheckinCnt);
				$("#checkinCnt").text(data.checkinCnt);
				$("#expectedCheckoutCnt").text(data.expectedCheckoutCnt);
				$("#checkoutCnt").text(data.checkoutCnt);
				
				// 차트데이터 로드
				loadRoomChartData();
				loadDiningChartData();
			}
		}); // ajax
	} // loadData
</script>
</head>

<body>
<script src="/hotel_prj/admin/assets/static/js/initTheme.js"></script>

<!-- app S -->
<div id="app">
	<!-- sidebar S -->
	<jsp:include page="../sidebar.jsp"></jsp:include>
	<!-- sidebar E -->
		
	<!-- main S -->
	<div id="main">
	
	<!-- header S -->
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- header E -->
            
	<div class="page-heading">
	    <h3>DashBoard</h3>
	</div> 
	
	<div class="page-content mb-3"> 
	    <section class="row">
	        <div class="col-12 col-lg-12">
	            <div class="row">
		            <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon red mb-2">
	                                        <i class="fas fa-calendar-plus"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">오늘 예약 건수</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="todayRoomResCnt"></span>건</h6>
	                                </div>
	                            </div> 
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card"> 
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon purple mb-2">
	                                        <i class="fas fa-calendar-alt"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">이번 달 예약 건수</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="oneMonthRoomResCnt"></span>건</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon green mb-2">
	                                        <i class="fas fa-user-friends"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">총 회원 수</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="allMemberCnt"></span>명</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon red mb-2">
	                                        <i class="fas fa-check-square"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">오늘 체크인</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="expectedCheckinCnt"></span>건(예정) / <span id="checkinCnt"></span>건(완료)</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                    <div class="stats-icon blue mb-2">
	                                        <i class="fas fa-minus-square"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">오늘 체크아웃</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="expectedCheckoutCnt"></span>건(예정) / <span id="checkoutCnt"></span>건(완료)</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-6 col-lg-4 col-md-6">
	                    <div class="card">
	                        <div class="card-body px-4 py-4-5">
	                            <div class="row">
	                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
	                                   	<div class="stats-icon red mb-2">
	                                        <i class="iconly-boldAdd-User"></i>
	                                    </div>
	                                </div>
	                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
	                                    <h6 class="text-muted font-semibold">오늘의 가입자 수</h6>
	                                    <h6 class="font-extrabold mb-0"><span id="todayJoinCnt"></span>명</h6>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
               	<div class="row">
               		<div class="col-12 col-lg-6 col-md-12">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4>객실 주간 예약 현황(%)</h4>
	                        </div>
	                        <div class="card-body">
	                            <div id="room-resv-weekly"></div>
	                        </div>
	                    </div>
               		</div>
               		<div class="col-12 col-lg-6 col-md-12">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4>다이닝 주간 예약 현황(%)</h4>
	                        </div>
	                        <div class="card-body">
	                            <div id="dining-resv-weekly"></div>
	                        </div>
	                    </div>
               		</div>
                </div>
	        </div>
	    </section>
	</div>

	<!-- footer S -->
	<jsp:include page="../footer.jsp"></jsp:include>
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
<script src="/hotel_prj/admin/assets/extensions/dayjs/dayjs.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/dashboard_custom.js"></script>

</body>
</html>