<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 객실 예약 관리" %>
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

<!-- datatable css S -->
<link rel="stylesheet" href="/hotel_prj/admin/assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" crossorigin="" href="/hotel_prj/admin/assets/compiled/css/table-datatable-jquery.css">
<!-- datatable css E -->

<!-- template css S -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type = "text/css">
#table1_wrapper {
	width:1470px;
}
</style>

<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.rem").addClass("active");
		$(".submenu-item.rrm").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".sidebar-item").removeClass("active");

	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
	    });
	    
	    $(document).on('click', '.submenu-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".submenu-item").removeClass("active");

	        // 클릭된 요소에만 active 클래스 추가
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
	    <h3>Room Reservation Management</h3>
	</div> 
	
	<!-- Basic Tables start -->
    <section class="section">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="table1">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>예약상태</th>
                                <th>상품명</th>
                                <th>체크인</th>
                                <th>체크아웃</th>
                                <th>예약일</th>
                                <th>예약자 영문이름</th>
                                <th>연락처</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

    </section>
    <!-- Basic Tables end -->

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
<script src="/hotel_prj/admin/assets/extensions/jquery/jquery.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/datatables.js"></script>

<script type="text/javascript">
	$(function() {
		var table = $('#table1').DataTable();

		// DataTable 인스턴스 제거
		table.destroy();
		
		var table = $('#table1').DataTable({
			ajax: {
		       'url':'DATA.json', 
		       //'type': 'POST',
		       'dataSrc':''
		    },
			columns: [
				{"data": "res_num", "width": "150px"},
				{"data": "room_res_status", "width": "130px"},
				{"data": "room", "width": "300px"}, 
				{"data": "check_in", "width": "120px"},
				{"data": "check_out", "width": "120px"},
				{"data": "room_res_date", "width": "120px"},
				{"data": "eng_name", "width": "150px"},
				{"data": "guest_phone", "width": "150px"}
			],
			dom:
				"<'row'<'col-sm-12 col-md-11'f><'col-sm-12 col-md-1'l>>" +
				"<'row dt-row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
			language: {
		        emptyTable: "데이터가 없습니다.",
		        zeroRecords: "데이터가 없습니다.",
		        lengthMenu: "_MENU_ 개",
		        search: "검색 ",
		        searchPlaceholder: "검색어를 입력하세요.",
		        paginate: {
		            "next": "다음",
		            "previous": "이전"
		        },
		        info: "현재 _START_ - _END_ / 총 _TOTAL_건",
		        infoEmpty: "데이터 없음",
		        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
		        loadingRecords: "로딩중...",
		        processing:     "잠시만 기다려 주세요..."
		    }
		});
		
		$('#table1_wrapper').find('input[type="search"]').removeClass('form-control-sm');
		
		$('#table1_filter').prepend('검색 조건<select id="select" class="form-select" style="width: 200px; display: inline; margin: 0px 20px 0px 10px;"></select>');
	    $('#table1 > thead > tr').children().each(function (indexInArray, valueOfElement) { 
	        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
	    });
		
	    $('.dataTables_filter input').unbind().bind('keyup cut', function () {
	        var colIndex = document.querySelector('#select').selectedIndex;
	        table.column(colIndex).search(this.value).draw();
	    });
	})
</script>
</body>
</html>