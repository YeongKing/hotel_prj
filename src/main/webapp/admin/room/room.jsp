<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 객실 관리"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>엘리시안 호텔 관리자 페이지</title>

<!-- favicon S -->
<link rel="shortcut icon"href="/hotel_prj/admin/assets/static/images/logo/favicon.ico" type="image/x-icon">
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

<style type="text/css">
        .addRoom {
            display: flex; 
            justify-content: flex-end;
            padding-bottom: 30px;
            padding-right: 10px;
        }
        
        .buttons {
            display: flex; 
            padding-top: 30px;
        }


</style>

	<script type="text/javascript">
$(document).ready(function() {
    $(".sidebar-item.rm").addClass("active");

    $(document).on('click', '.sidebar-item', function() {
        // 모든 .sidebar-item 요소에서 active 클래스 제거
        $(".sidebar-item").removeClass("active");

        // 클릭된 요소에만 active 클래스 추가
        $(this).addClass("active");
    });

    
    
    
    
    // 테이블의 유저아이디 클릭시
    $(document).on("click", ".roomId", function() {
        var roomId = $(this).text();
        var roomRankName = $(this).closest('tr').find('.roomRankName').text(); // 같은 행(row) 내에서 .roomRankName을 찾아 텍스트를 가져옴
        var bedName = $(this).closest('tr').find('.bedName').text(); // 같은 행(row) 내에서 .roomRankName을 찾아 텍스트를 가져옴
        var viewName = $(this).closest('tr').find('.viewName').text(); // 같은 행(row) 내에서 .roomRankName을 찾아 텍스트를 가져옴
        
        var roomFloor;
        if (roomId.length == 3) {
            roomFloor = roomId.substr(0, 1);
        } else if (roomId.length == 4) {
            roomFloor = roomId.substr(0, 2);
        }

        $("#roomId").val(roomId);
        $("#roomFloor").val(roomFloor+"층");
        $("#roomRankName").val(roomRankName);
       /*  $("#bedName").val(bedName); */
        $("#viewName").val(viewName);
        
        $("#bedName").empty();
        $("#bedName").append(new Option("KING", "KING"));
        $("#bedName").append(new Option("TWIN", "TWIN"));
        
        
        
        

        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
        // 모달 내의 모든 'is-invalid' 클래스 제거
        $('#roomDetail').find('.is-invalid').removeClass('is-invalid');
        
        
        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
        $('#roomDetail').find('span.parsley-custom-error-message').remove();
        
        
        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
        $('#roomDetail').modal('show');
    });

    var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));

    function showModal(title, body, actionText, actionCallback) {
        $('#confirmModalLabel').text(title);
        $('#confirmModalBody').text(body);
        $('#confirmActionBtn').text(actionText);
        $('#confirmActionBtn').off('click').on('click', function() {
            actionCallback();
            confirmModal.hide();
        });
        confirmModal.show();
    }

    function deleteAction() {
        console.log('삭제 동작 수행');
        // 서버로 삭제 요청 보내기
        // $.ajax({
        //     url: 'delete_url',
        //     method: 'POST',
        //     data: { id: itemId },
        //     success: function(response) {
        //         console.log('삭제 성공');
        //     },
        //     error: function(error) {
        //         console.log('삭제 실패', error);
        //     }
        // });
    }

    function updateAction() {
        console.log('수정 동작 수행');
        // 서버로 수정 요청 보내기
        // $.ajax({
        //     url: 'update_url',
        //     method: 'POST',
        //     data: { id: itemId, data: newData },
        //     success: function(response) {
        //         console.log('수정 성공');
        //     },
        //     error: function(error) {
        //         console.log('수정 실패', error);
        //     }
        // });
    }

    function registerAction() {
        console.log('등록 동작 수행');
        // 서버로 등록 요청 보내기
        // $.ajax({
        //     url: 'register_url',
        //     method: 'POST',
        //     data: { data: newData },
        //     success: function(response) {
        //         console.log('등록 성공');
        //     },
        //     error: function(error) {
        //         console.log('등록 실패', error);
        //     }
        // });
    }

    // 등록 버튼 클릭 시
    $('#chkAddBtn').on('click', function() {
        showModal('등록 확인', '등록하시겠습니까?', '예', function() {
            registerAction();
            alert('등록 동작 수행');
        });
    });

    // 삭제 버튼 클릭 시
    $('#chkDeleteBtn').on('click', function() {
        showModal('삭제 확인', '삭제하시겠습니까?', '예', function() {
            deleteAction();
            alert('삭제 동작 수행');
        });
    });

    // 수정 버튼 클릭 시
    $('#chkUpdateBtn').on('click', function() {
        showModal('수정 확인', '수정하시겠습니까?', '예', function() {
            updateAction();
            alert('수정 동작 수행');
        });
    });
    
    
    
    
    
    
    
    
    
    
    
    
    

});//ready


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

function deleteRoom(){
	var result = confirm("객실을 정말로 삭제 하시겠습니까?");

}

</script>




<script>
document.getElementById('roomDetailForm').onsubmit = function() {
    
	if(confirm('회원정보를 정말로 저장하시겠습니까?')){
	alert('회원정보저장 시작')
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
							<h3>객실 관리</h3>
							<p class="text-subtitle text-muted">관리자 객실 관리</p>
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
												<th>객실ID</th>
												<th>객실등급</th>
												<th>침대유형</th>
												<th>뷰</th>
												<th>방크기(m^2)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>1</th>
												<td><a href="#" class="roomId">101</a></td>
												<td class="roomRankName">STANDARD</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">30</td>
												<!-- <td><span class="badge bg-success">Active</span></td> -->
												<!-- <td><span class="badge bg-danger">Inactive</span></td> -->
											</tr>
											<tr>
												<th>2</th>
												<td><a href="#" class="roomId">102</a></td>
												<td class="roomRankName">STANDARD</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">30</td>
											</tr>
											<tr>
												<th>3</th>
												<td><a href="#" class="roomId">103</a></td>
												<td class="roomRankName">STANDARD</td>
												<td class="bedName">KING</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">30</td>
											</tr>
											<tr>
												<th>4</th>
												<td><a href="#" class="roomId">104</a></td>
												<td class="roomRankName">STANDARD</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">30</td>
											</tr>

											<tr>
												<th>5</th>
												<td><a href="#" class="roomId">105</a></td>
												<td class="roomRankName">STANDARD</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">POOLSIDE</td>
												<td class="roomSize">30</td>
											</tr>
											<tr>
												<th>6</th>
												<td><a href="#" class="roomId">201</a></td>
												<td class="roomRankName">DELUXE</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">45</td>
											</tr>
											<tr>
												<th>7</th>
												<td><a href="#" class="roomId">202</a></td>
												<td class="roomRankName">DELUXE</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">45</td>
											</tr>
											<tr>
												<th>8</th>
												<td><a href="#" class="roomId">203</a></td>
												<td class="roomRankName">DELUXE</td>
												<td class="bedName">KING</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">45</td>
											</tr>
											<tr>
												<th>9</th>
												<td><a href="#" class="roomId">204</a></td>
												<td class="roomRankName">DELUXE</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">45</td>
											</tr>
											<tr>
												<th>10</th>
												<td><a href="#" class="roomId">205</a></td>
												<td class="roomRankName">DELUXE</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">POOLSIDE</td>
												<td class="roomSize">45</td>
											</tr>
											<tr>
												<th>11</th>
												<td><a href="#" class="roomId">301</a></td>
												<td class="roomRankName">SUITE</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">90</td>
											</tr>
											<tr>
												<th>12</th>
												<td><a href="#" class="roomId">302</a></td>
												<td class="roomRankName">SUITE</td>
												<td class="bedName">KING</td>
												<td class="viewName">STANDARD</td>
												<td class="roomSize">90</td>
											</tr>
											<tr>
												<th>13</th>
												<td><a href="#" class="roomId">303</a></td>
												<td class="roomRankName">SUITE</td>
												<td class="bedName">KING</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">90</td>
											</tr>
											<tr>
												<th>14</th>
												<td><a href="#" class="roomId">304</a></td>
												<td class="roomRankName">SUITE</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">GARDEN</td>
												<td class="roomSize">90</td>
											</tr>
											<tr>
												<th>15</th>
												<td><a href="#" class="roomId">305</a></td>
												<td class="roomRankName">SUITE</td>
												<td class="bedName">TWIN</td>
												<td class="viewName">POOLSIDE</td>
												<td class="roomSize">90</td>
											</tr>

										</tbody>
									</table>
                                <div class="addRoom">
                                    <a href="#" class="btn btn-info" id="addRoomBtn">객실 등록</a>
                                </div>
								</div>
							</div>
						</div>

					</section>
				</div>
				<!-- 수정 모달창 -->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="roomDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">객실 상세조회</h5>
								<div class="d-flex justify-content-end">
                                <button type="button" id="chkDeleteBtn" class="btn btn-danger">
                                    <i class="bx bx-x d-block d-sm-none"></i> 
                                    <span class="d-none d-sm-block">다이닝삭제</span>
                                </button>
									<!-- 				                <button type="button" class="close rounded-pill" data-bs-dismiss="modal"
				                        aria-label="Close">
				                    <i data-feather="x"></i>
				                </button> -->

								</div>
							</div>
							<form id = "roomDetailForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomId">객실 아이디</label> 
											<input type="text"
												id="roomId" class="form-control"
												name="roomId" placeholder="객실아이디" Disabled>

										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomBasicCapacity">객실 기본 인원</label> 
												<input
						                        type="text"
						                        id="roomBasicCapacity"
						                        class="form-control"
						                        placeholder="객실 기본 인원"
						                        name="roomBasicCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomFloor">객실 층</label> 
											<input
						                        type="text"
						                        id="roomFloor"
						                        class="form-control"
						                        placeholder="객실 층"
						                        name="roomFloor"
						                        Disabled
						                     />
										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomMaxCapacity">객실 최대 인원</label> 
											<input
						                        type="text"
						                        id="roomMaxCapacity"
						                        class="form-control"
						                        placeholder="객실 최대 인원"
						                        name="roomMaxCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomRankName">객실 등급</label> 
											<input
						                        type="text"
						                        id="roomRankName"
						                        class="form-control"
						                        placeholder="객실 등급"
						                        name="roomRankName"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomBasicPrice">기본 요금</label>
											<input
						                        type="text"
						                        id="roomBasicPrice"
						                        class="form-control"
						                        placeholder="기본 요금"
						                        name="roomBasicPrice"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="bedName">침대 유형</label>
						                     <select class="bedName form-select" id="bedName">
						                     </select>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomAddPrice">추가 요금</label>
											<input
						                        type="text"
						                        id="roomAddPrice"
						                        class="form-control"
						                        placeholder="추가 요금"
						                        name="roomAddPrice"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="viewName">뷰 유형</label> 
											<input
						                        type="text"
						                        id="viewName"
						                        class="form-control"
						                        placeholder="뷰 유형"
						                        name="viewName"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="amenity"> </label> 
											<input
						                        type="button"
						                        id="amenity"
						                        class="form-control"
						                        name="amenity"
												value="어메니티"
						                     />
										</div>
									</div>	
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="roomSize">방 크기</label>
											<input
						                        type="text"
						                        id="roomSize"
						                        class="form-control"
						                        placeholder="방 크기"
						                        name="roomSize"
						                        Disabled
						                     />
										</div>
									</div>					
									<div class="col-md-6 col-12">
									</div>				
									
									
									
									

									<div style="height: 30px;"></div>
									<div class="col-12 d-flex justify-content-center">
                                        <button type="button" id="chkUpdateBtn" class="btn btn-primary me-1 mb-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                                <path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg> 저장
                                        </button>
                                        <button type="button" id="closeBtn" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                                <path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg> 닫기
                                        </button>
									</div>
									<div style="height: 30px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 수정 모달창 E -->
				
            <!-- 공통 확인 모달 start-->
            <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmModalLabel"></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p id="confirmModalBody"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                            <button type="button" class="btn btn-danger" id="confirmActionBtn"></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 공통 확인 모달 end-->
				
				
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
	<script
		src="/hotel_prj/admin/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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