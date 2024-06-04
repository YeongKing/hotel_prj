<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 자주찾는질문" %>
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

<link rel="stylesheet" href="/hotel_prj/admin/assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" crossorigin="" href="/hotel_prj/admin/assets/compiled/css/table-datatable-jquery.css">


<!-- template css S -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/iconly.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->







<style type = "text/css">
	    .form-group {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
    }
	
	
</style>

<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.qm").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".sidebar-item").removeClass("active");
	
	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
		});

	    
	    
	    
	    
	    // 테이블의 유저아이디 클릭시
	    $(document).on("click", ".qnaTitle", function() {
	    	var noticeNum = $(this).closest('tr').find('.hiddenQnaNum').val();
	    	var qnaType = $(this).closest('tr').find('.qnaType').text();
	        var qnaTitle = $(this).closest('tr').find('.qnaTitle').text();
	        //var noticeContent ;
	        //var adminId  ;
	        //var noticeViewCnt ;

	        
	        $("#inputQnaNum").val(noticeNum);
	        $("#inputQnaType").val(qnaType);
	        $("#inputQnaTitle").val(qnaTitle);
	        
	        $("#inputQnaType").empty();
	        $("#inputQnaType").append(new Option("계정", "계정"));
	        $("#inputQnaType").append(new Option("결제", "결제"));
	        $("#inputQnaType").append(new Option("예약", "예약"));
	        $("#inputQnaType").append(new Option("기타", "기타"));
	        
	        $("#inputQnaType").val(qnaType).prop("selected",true);
	        
	        //$("#inputAdminId").val(adminId);


	        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
	        // 모달 내의 모든 'is-invalid' 클래스 제거
	        $('#noticeDetail').find('.is-invalid').removeClass('is-invalid');
	        
	        
	        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
	        $('#noticeDetail').find('span.parsley-custom-error-message').remove();
	        
	        
	        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
	        $('#noticeDetail').modal('show');
	    });

	    
		
	}); // ready
	
	// 페이지 변경을 시뮬레이션하는 예제 함수
	function changePage(pageNumber) {
	    // 새로운 페이지 내용을 로드하는 로직
	    // 여기서는 시연을 위해 tbody의 내용을 변경합니다.
	    var tbody = $("#table1 tbody");
	    tbody.empty(); // 기존 행을 지웁니다.

	    // 선택된 페이지에 맞는 새로운 행을 시뮬레이션하여 로드합니다.
	    for (var i = 1; i <= 5; i++) {
	        var row = `<tr>
	            <th>${(pageNumber - 1) * 5 + i}</th>
	            <td class="roomId">아이디${(pageNumber - 1) * 5 + i}</td>
	            <td>email${(pageNumber - 1) * 5 + i}@example.com</td>
	            <td>전화번호${(pageNumber - 1) * 5 + i}</td>
	            <td>가입일자${(pageNumber - 1) * 5 + i}</td>
	            <td><span class="badge bg-success">Active</span></td>
	        </tr>`;
	        tbody.append(row);
	    }
	}
	</script>
		<script type="text/javascript">

	function deleteNotice(){
		var result = confirm("자주 찾는 질문을 정말로 삭제 하시겠습니까?");

	}

	</script>




	<script>
	document.getElementById('noticeDetailForm').onsubmit = function() {
	    
		if(confirm('자주 찾는 질문을 정말로 저장하시겠습니까?')){
		}

	};
	
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
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>자주 찾는 질문 관리</h3>
							<p class="text-subtitle text-muted">관리자 자주 찾는 질문 관리</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">DataTable
										jQuery</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div class="page-content mb-3">
					<!-- Basic Tables start -->
					<section class="section">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table" id="table1">
										<thead>
											<tr>
												<th>번호</th>
												<th>구분</th>
												<th>제목</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>1</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 1</a><input type="hidden" class="hiddenQnaNum" value="1"/></td>
												<!-- <td><span class="badge bg-success">Active</span></td> -->
												<!-- <td><span class="badge bg-danger">Inactive</span></td> -->
											</tr>
											<tr>
												<th>2</th>
												<td class="qnaType">결제</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 2</a><input type="hidden" class="hiddenQnaNum" value="2"/></td>
											</tr>
											<tr>
												<th>3</th>
												<td class="qnaType">예약</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 3</a><input type="hidden" class="hiddenQnaNum" value="3"/></td>
											</tr>
											<tr>
												<th>4</th>
												<td class="qnaType">기타</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 4</a><input type="hidden" class="hiddenQnaNum" value="4"/></td>
											</tr>

											<tr>
												<th>5</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 5</a><input type="hidden" class="hiddenQnaNum" value="5"/></td>
											</tr>
											<tr>
												<th>6</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 6</a><input type="hidden" class="hiddenQnaNum" value="6"/></td>
											</tr>
											<tr>
												<th>7</th>
												<td class="qnaType">결제</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 7</a><input type="hidden" class="hiddenQnaNum" value="7"/></td>
											</tr>
											<tr>
												<th>8</th>
												<td class="qnaType">예약</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 8</a><input type="hidden" class="hiddenQnaNum" value="8"/></td>
											</tr>
											<tr>
												<th>9</th>
												<td class="qnaType">기타</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 9</a><input type="hidden" class="hiddenQnaNum" value="9"/></td>
											</tr>
											<tr>
												<th>10</th>
												<td class="qnaType">기타</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 10</a><input type="hidden" class="hiddenQnaNum" value="10"/></td>
											</tr>
											<tr>
												<th>11</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 11</a><input type="hidden" class="hiddenQnaNum" value="11"/></td>
											</tr>
											<tr>
												<th>12</th>
												<td class="qnaType">결제</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 12</a><input type="hidden" class="hiddenQnaNum" value="12"/></td>
											</tr>
											<tr>
												<th>13</th>
												<td class="qnaType">예약</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 13</a><input type="hidden" class="hiddenQnaNum" value="13"/></td>
											</tr>
											<tr>
												<th>14</th>
												<td class="qnaType">기타</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 14</a><input type="hidden" class="hiddenQnaNum" value="14"/></td>
											</tr>
											<tr>
												<th>15</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 15</a><input type="hidden" class="hiddenQnaNum" value="15"/></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

					</section>
				</div>
				<!-- 모달창 -->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="noticeDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">자주 찾는 질문 상세조회</h5>
								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-danger" onclick="deleteNotice()">
										<i class="bx bx-x d-block d-sm-none"></i> 
										<span class="d-none d-sm-block">자주 찾는 질문 삭제</span>
									</button>
									<!-- 				                <button type="button" class="close rounded-pill" data-bs-dismiss="modal"
				                        aria-label="Close">
				                    <i data-feather="x"></i>
				                </button> -->

								</div>
							</div>
							<form id = "noticeDetailForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="inputQnaNum" style="flex: 1">번호</label> 
											<input type="text"
												id="inputQnaNum" 
												class="form-control"
												name="inputQnaNum" 
												placeholder="번호" 
												style="flex: 2 " 
												Disabled>

										</div>
									</div>
									<div class="col-md-9 col-12">
									</div>
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="inputQnaTitle" style="flex: 1 ">제목</label> 
											<input
						                        type="text"
						                        id="inputQnaTitle"
						                        class="form-control"
						                        placeholder="제목"
						                        name="inputQnaTitle"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="제목은 필수 입력입니다."
						                     />
										</div>
									</div>
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="inputQnaType" style="flex: 1">구분</label> 
						                     <select class="inputQnaType form-select" id="inputQnaType" style="flex:2 ">
						                     </select>
										</div>
									</div>
									
									
									
									
									
									<div class="col-md-9 col-12">
									</div>
									
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="inputQnaContent" style="flex: 1 ">내용</label> 
											<textarea
						                        id="inputQnaContent"
						                        class="form-control"
						                        placeholder="내용"
						                        rows="15"
						                        name="inputQnaContent"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="내용은 필수 입력입니다."
						                     ></textarea>
										</div>
									</div>
									
								
									
									
									

									<div style="height: 30px;"></div>
									<div class="col-12 d-flex justify-content-center">
										<button type="submit" class="btn btn-primary me-1 mb-1">저장</button>
										<button type="button" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">닫기</button>
									</div>
									<div style="height: 30px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- footer S -->
				<jsp:include page="/admin/footer.jsp"></jsp:include>
				<!-- footer E -->
			</div>
			<!-- main E -->

		</div>
	</div>


<!-- app E  -->


<!-- 공통 필요 Script S -->
<script src="/hotel_prj/admin/assets/static/js/components/dark.js"></script>
<script src="/hotel_prj/admin/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/hotel_prj/admin/assets/compiled/js/app.js"></script>
<!-- 공통 필요 Script E -->


<!-- 추가 Script S -->
<script src="/hotel_prj/admin/assets/extensions/jquery/jquery.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/parsleyjs/parsley.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/parsley.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/datatables.js"></script>
<!-- 추가 Script E -->




</body>
</html>