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
        
        .addQna {
            display: flex; 
            justify-content: flex-end;
            padding-bottom: 30px;
            padding-right: 10px;
        }
        
        .buttons {
            display: flex; 
            padding-top: 30px;
        }


        
        
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

	    
	    
	    
	    
	    // 테이블의 자주 찾는 질문 클릭시
	    $(document).on("click", ".qnaTitle", function() {
	    	var qnaNum = $(this).closest('tr').find('.hiddenQnaNum').val();
	    	
		        $.ajax({
		        	url:'qnaDetail.do',
		        	type:'POST',
		        	contentType:'application/json',
		        	dataType:'JSON',
		        	data:JSON.stringify({ qnaNum: qnaNum }),
		        	error:function(xhr){
		        		console.log(xhr.status)
		        		alert("문제가 발생했습니다.")
		        	},
		        	success:function(jsonObj){
		        		
	    	        	$("#updateQnaNum").val(jsonObj.qnaNum);
		          		$("#updateQnaType").val(jsonObj.qnaType); 
		    	        $("#updateQnaTitle").val(jsonObj.qnaTitle);
		    	        $("#updateQnaContent").val(jsonObj.qnaContent);

		        		
		        	}
		        	
		        	
		        	
		        })//ajax
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	


	        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
	        // 모달 내의 모든 'is-invalid' 클래스 제거
	        $('#updateQnaModal').find('.is-invalid').removeClass('is-invalid');
	        
	        
	        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
	        $('#updateQnaModal').find('span.parsley-custom-error-message').remove();
	        
	        
	        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
	        $('#updateQnaModal').modal('show');
	    });

	    
	 // 자주 찾는 질문 등록 클릭 시
	    $("#addQnaBtn").click(function() {
	    	// 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
	        // 모달 내의 모든 'is-invalid' 클래스 제거
	        $('#addQnaModal').find('.is-invalid').removeClass('is-invalid');
	        
	        $("#addQnaType").empty();
	        $("#addQnaType").append(new Option("계정", "계정"));
	        $("#addQnaType").append(new Option("결제", "결제"));
	        $("#addQnaType").append(new Option("예약", "예약"));
	        $("#addQnaType").append(new Option("기타", "기타"));
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
	        $('#addQnaModal').find('span.parsley-custom-error-message').remove();
	        $('#addQnaModal').modal('show');
	        
	        
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
			<h3>자주 찾는 질문 관리</h3>
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
<c:if test="${ empty requestScope.qnaList }">
<tr>
<td colspan="3" style="text-align: center;">
자주 찾는 질문 정보가 존재하지 않습니다.
</td>
</tr>
</c:if>	                            
<c:forEach var="qld" items="${ requestScope.qnaList }" varStatus="i">
<tr>
	<td><c:out value="${ i.count }"/></td>
	<td class="qnaType"><c:out value="${ qld.qnaType }"/></td>
	<td><a href="#" class="qnaTitle"><c:out value="${ qld.qnaTitle }"/></a><input type="hidden" class="hiddenQnaNum" value="${ qld.qnaNum }"/></td>

</tr>

</c:forEach>			
										
										
<!-- 											<tr>
												<th>1</th>
												<td class="qnaType">계정</td>
												<td><a href="#" class="qnaTitle" >자주 찾는 질문 제목 1</a><input type="hidden" class="hiddenQnaNum" value="1"/></td>
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
											</tr> -->

										</tbody>
									</table>
                                <div class="addQna">
                                    <a href="#" class="btn btn-info" id="addQnaBtn">자주 찾는 질문 등록</a>
                                </div>
								</div>
							</div>
						</div>

					</section>
				</div>
		
				<!-- 등록 모달창 S -->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="addQnaModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">자주 찾는 질문 상세조회</h5>
								<div class="d-flex justify-content-end">
								</div>
							</div>
							<form id = "addQnaForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="addQnaNum" style="flex: 1">번호</label> 
											<input type="text"
												id="addQnaNum" 
												class="form-control"
												name="addQnaNum" 
												placeholder="번호" 
												style="flex: 2 " 
												Disabled>

										</div>
									</div>
									<div class="col-md-9 col-12">
									</div>
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="addQnaTitle" style="flex: 1 ">제목</label> 
											<input
						                        type="text"
						                        id="addQnaTitle"
						                        class="form-control"
						                        placeholder="제목"
						                        name="addQnaTitle"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="제목은 필수 입력입니다."
						                     />
										</div>
									</div>
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="addQnaType" style="flex: 1">구분</label> 
						                     <select class="addQnaType form-select" id="addQnaType" style="flex:2 ">
						                     </select>
										</div>
									</div>
									
									
									
									
									
									<div class="col-md-9 col-12">
									</div>
									
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="addQnaContent" style="flex: 1 ">내용</label> 
											<textarea
						                        id="addQnaContent"
						                        class="form-control"
						                        placeholder="내용"
						                        rows="15"
						                        name="addQnaContent"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="내용은 필수 입력입니다."
						                     ></textarea>
										</div>
									</div>
									
								
									
									
									

									<div style="height: 15px;"></div>
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
					id="updateQnaModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">자주 찾는 질문 상세조회</h5>
								<div class="d-flex justify-content-end">
                                <button type="button" id="chkDeleteBtn" class="btn btn-danger">
                                    <i class="bx bx-x d-block d-sm-none"></i> 
                                    <span class="d-none d-sm-block">자주 찾는 질문 삭제</span>
                                </button>
								</div>
							</div>
							<form id = "updateQnaForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="updateQnaNum" style="flex: 1">번호</label> 
											<input type="text"
												id="updateQnaNum" 
												class="form-control"
												name="updateQnaNum" 
												placeholder="번호" 
												style="flex: 2 " 
												Disabled>

										</div>
									</div>
									<div class="col-md-9 col-12">
									</div>
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="updateQnaTitle" style="flex: 1 ">제목</label> 
											<input
						                        type="text"
						                        id="updateQnaTitle"
						                        class="form-control"
						                        placeholder="제목"
						                        name="updateQnaTitle"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="제목은 필수 입력입니다."
						                     />
										</div>
									</div>
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="updateQnaType" style="flex: 1">구분</label> 
						                     <select 
						                     class="updateQnaType form-select"
						                      id="updateQnaType" 
						                      style="flex:2 ">
						                      <option>계정</option>
						                      <option>결제</option>
						                      <option>예약</option>
						                      <option>기타</option>
						                     </select>
										</div>
									</div>
									
									
									
									
									
									<div class="col-md-9 col-12">
									</div>
									
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="updateQnaContent" style="flex: 1 ">내용</label> 
											<textarea
						                        id="updateQnaContent"
						                        class="form-control"
						                        placeholder="내용"
						                        rows="15"
						                        name="updateQnaContent"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="내용은 필수 입력입니다."
						                     ></textarea>
										</div>
									</div>
									
								
									
									
									<div style="height: 15px;"></div>
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