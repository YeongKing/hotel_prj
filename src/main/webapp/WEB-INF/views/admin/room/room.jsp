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

    
    
    
    
    // 테이블의 객실번호 클릭시
    $(document).on("click", ".roomId", function() {
        var roomId = $(this).text();
        $.ajax({
        	url:'roomDetail.do',
        	type:'POST',
        	contentType:'application/json',
        	dataType:'JSON',
        	data:JSON.stringify({ roomId: roomId }),
        	error:function(xhr){
        		console.log(xhr.status)
        		alert("문제가 발생했습니다.");
        	},
        	success:function(jsonObj){

				roomId = jsonObj.roomId.toString();
				
                    var roomFloor;
                    if (roomId.length == 3) {
                        roomFloor = roomId.substr(0, 1);
                    } else if (roomId.length == 4) {
                        roomFloor = roomId.substr(0, 2);
                    }


            	$("#updateRoomId").val(roomId);
            	$("#updateRoomBasicCapacity").val(jsonObj.roomBasicCapacity);
                $("#updateRoomRankName").val(jsonObj.roomRankName);
                $("#updateRoomMaxCapacity").val(jsonObj.roomMaxCapacity);
                $("#updateRoomBasicPrice").val(jsonObj.roomBasicPrice);
                
                $("#updateRoomAddPrice").val(jsonObj.roomAddPrice);
                $("#updateViewName").val(jsonObj.roomViewName);
                $("#updateRoomSize").val(jsonObj.roomSize);
    
                $("#updateRoomFloor").val(roomFloor+"층");
                
                $("#updateBedName").empty();
                $("#updateBedName").append(new Option("KING", "KING"));
                $("#updateBedName").append(new Option("TWIN", "TWIN")); 
                $("#updateBedName").append(new Option("DOUBLE", "DOUBLE")); 
                $("#updateBedName").val(jsonObj.roomBedName);
        		
        	}
        	
        	
        	
        })
        
        
        


      

        
        
        

        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
        // 모달 내의 모든 'is-invalid' 클래스 제거
        $('#updateRoomModal').find('.is-invalid').removeClass('is-invalid');
        
        
        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
        $('updateRoomModal').find('span.parsley-custom-error-message').remove();
        
        
        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
        $('#updateRoomModal').modal('show');
    });
    

    
    
    // 객실 등록 번호 클릭 시
    $("#addRoomBtn").click(function() {


    	// 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
        // 모달 내의 모든 'is-invalid' 클래스 제거
        $('#addRoomModal').find('.is-invalid').removeClass('is-invalid');
        
    	
    	
        $("#addRoomFloor").empty();
        $("#addRoomFloor").append(new Option("1", "1"));
        $("#addRoomFloor").append(new Option("2", "2"));
        $("#addRoomFloor").append(new Option("3", "3"));
        $("#addRoomFloor").append(new Option("4", "4"));
        $("#addRoomFloor").append(new Option("5", "5"));
    	
        $("#addRoomRankName").empty();
        $("#addRoomRankName").append(new Option("STANDARD", "STANDARD"));
        $("#addRoomRankName").append(new Option("DELUXE", "DELUXE"));
        $("#addRoomRankName").append(new Option("SUITE", "SUITE"));

    	
        $("#addRoomFloor").empty();
        $("#addRoomFloor").append(new Option("32", "32"));
        $("#addRoomFloor").append(new Option("33", "33"));
        $("#addRoomFloor").append(new Option("34", "34"));

    	
    	
        $("#addBedName").empty();
        $("#addBedName").append(new Option("KING", "KING"));
        $("#addBedName").append(new Option("TWIN", "TWIN"));
        $("#addBedName").append(new Option("DOUBLE", "DOUBLE"));
    	
        $("#addViewName").empty();
        $("#addViewName").append(new Option("STANDARD", "STANDARD"));
        $("#addViewName").append(new Option("GARDEN", "GARDEN"));
        $("#addViewName").append(new Option("POOLSIDE", "POOLSIDE"));
    	
        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
        $('#addRoomModal').find('span.parsley-custom-error-message').remove();
        $('#addRoomModal').modal('show');
        
        
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
				<h3>객실 관리</h3>
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
											<c:if test="${ empty requestScope.roomList }">
											<tr>
											<td colspan="6" style="text-align: center;">
											객실정보가 존재하지 않습니다.
											</td>
											</tr>
											</c:if>
											<c:forEach var="rld" items="${ requestScope.roomList }" varStatus="i">
											<tr>
												<td><c:out value="${ i.count }"/></td>
												<td><a href="#" class="roomId"><c:out value="${ rld.roomId }"/></a></td>
												<td class="roomRankName"><c:out value="${ rld.roomRankName }"/></td>
												<td class="bedName"><c:out value="${ rld.bedName }"/></td>
												<td class="viewName"><c:out value="${ rld.viewName }"/></td>
												<td class="roomSize"><c:out value="${ rld.roomSize }"/></td>
											</tr>
											
											
											</c:forEach>
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
				
			<!-- 등록 모달창 S -->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="addRoomModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">객실 등록</h5>
								<div class="d-flex justify-content-end">

								</div>
							</div>
							<form id = "addRoomForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomId">객실 아이디</label> 
											<input type="text"
												id="addRoomId"
												class="form-control"
												name="addRoomId"
												placeholder="객실아이디" Disabled>

										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomBasicCapacity">객실 기본 인원</label> 
												<input
						                        type="text"
						                        id="addRoomBasicCapacity"
						                        class="form-control"
						                        placeholder="객실 기본 인원"
						                        name="addRoomBasicCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomFloor">객실 층</label>
						                     <select 
						                     class="addRoomFloor form-select" 
						                     id="addRoomFloor">
						                     </select>
										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomMaxCapacity">객실 최대 인원</label> 
											<input
						                        type="text"
						                        id="addRoomMaxCapacity"
						                        class="form-control"
						                        placeholder="객실 최대 인원"
						                        name="addRoomMaxCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomRankName">객실 등급</label>
						                     <select 
						                     class="addRoomRankName form-select" 
						                     id="addRoomRankName">
						                     </select>
						                     
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomBasicPrice">기본 요금</label>
											<input
						                        type="text"
						                        id="addRoomBasicPrice"
						                        class="form-control"
						                        placeholder="기본 요금"
						                        name="addRoomBasicPrice"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addBedName">침대 유형</label>
						                     <select 
						                     class="addBedName form-select" 
						                     id="addBedName">
						                     </select>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomAddPrice">추가 요금</label>
											<input
						                        type="text"
						                        id="addRoomAddPrice"
						                        class="form-control"
						                        placeholder="추가 요금"
						                        name="addRoomAddPrice"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addViewName">뷰 유형</label>
						                     <select 
						                     class="addViewName form-select" 
						                     id="addViewName">
						                     </select>
										</div>
									</div>
									<div class="col-md-6 col-12">
									</div>	
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="addRoomSize">방 크기</label>
											<input
						                        type="text"
						                        id="addRoomSize"
						                        class="form-control"
						                        placeholder="방 크기"
						                        name="addRoomSize"
						                        Disabled
						                     />
										</div>
									</div>					
									<div class="col-md-6 col-12">
									</div>				
									
									
									
									

									<div style="height: 30px;"></div>
									<div class="col-12 d-flex justify-content-center">
                                        <button type="button" id="chkAddBtn" class="btn icon icon-left btn-success me-1 mb-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                                <path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg> 등록
                                        </button>
                                        <button type="button" id="closeBtn" class="btn btn-light-secondary icon icon-left me-1 mb-1" data-bs-dismiss="modal">
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
				<!-- 등록 모달창 E -->
				
				
				
				
				
				<!-- 수정 모달창 S -->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="updateRoomModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">객실 상세조회</h5>
								<div class="d-flex justify-content-end">
                                <button type="button" id="chkDeleteBtn" class="btn btn-danger">
                                    <i class="bx bx-x d-block d-sm-none"></i> 
                                    <span class="d-none d-sm-block">객실 삭제</span>
                                </button>
								</div>
							</div>
							<form id = "updateRoomForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomId">객실 아이디</label> 
											<input type="text"
												id="updateRoomId" class="form-control"
												name="updateRoomId" placeholder="객실아이디" Disabled>

										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomBasicCapacity">객실 기본 인원</label> 
												<input
						                        type="text"
						                        id="updateRoomBasicCapacity"
						                        class="form-control"
						                        placeholder="객실 기본 인원"
						                        name="updateRoomBasicCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomFloor">객실 층</label> 
											<input
						                        type="text"
						                        id="updateRoomFloor"
						                        class="form-control"
						                        placeholder="객실 층"
						                        name="updateRoomFloor"
						                        Disabled
						                     />
										</div>
									</div>
									
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomMaxCapacity">객실 최대 인원</label> 
											<input
						                        type="text"
						                        id="updateRoomMaxCapacity"
						                        class="form-control"
						                        placeholder="객실 최대 인원"
						                        name="updateRoomMaxCapacity"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomRankName">객실 등급</label> 
											<input
						                        type="text"
						                        id="updateRoomRankName"
						                        class="form-control"
						                        placeholder="객실 등급"
						                        name="updateRoomRankName"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomBasicPrice">기본 요금</label>
											<input
						                        type="text"
						                        id="updateRoomBasicPrice"
						                        class="form-control"
						                        placeholder="기본 요금"
						                        name="updateRoomBasicPrice"
						                        Disabled
						                     />
										</div>
									</div>
									
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateBedName">침대 유형</label>
						                     <select 
						                      class="updateBedName form-select"
						                      id="updateBedName">
						                     </select>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomAddPrice">추가 요금</label>
											<input
						                        type="text"
						                        id="updateRoomAddPrice"
						                        class="form-control"
						                        placeholder="추가 요금"
						                        name="updateRoomAddPrice"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateViewName">뷰 유형</label> 
											<input
						                        type="text"
						                        id="updateViewName"
						                        class="form-control"
						                        placeholder="뷰 유형"
						                        name="updateViewName"
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateAmenity"> </label> 
											<input
						                        type="button"
						                        id="updateAmenity"
						                        class="form-control"
						                        name="updateAmenity"
												value="어메니티"
						                     />
										</div>
									</div>	
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="updateRoomSize">방 크기</label>
											<input
						                        type="text"
						                        id="updateRoomSize"
						                        class="form-control"
						                        placeholder="방 크기"
						                        name="updateRoomSize"
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
				
				
				
				<!--  공통 컨펌 모달창 S  -->
				
				<jsp:include page="/WEB-INF/views/admin/modal/checkModal.jsp"/>
				
				<!--  공통 컨펌 모달창 E  -->
				
				
				<!-- footer S -->
				<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>
				<!-- footer E -->

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