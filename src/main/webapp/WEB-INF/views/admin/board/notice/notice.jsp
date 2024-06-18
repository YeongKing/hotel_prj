<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 공지사항 관리" %>
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





<style type="text/css">
.form-group {
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
}

.addNotice {
	display: flex;
	justify-content: flex-end;
	padding-bottom: 30px;
	padding-right: 10px;
}
</style>

<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.nm").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".sidebar-item").removeClass("active");
	
	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
		});

	    
	    
	    // 공지사항 제목 클릭시
	    $(document).on("click", ".noticeTitle", function() {
	    	var noticeNum = $(this).closest('tr').find('.hiddenNoticeNum').val();
	    	
	        $.ajax({
	        	url:'noticeDetail.do',
	        	type:'POST',
	        	contentType:'application/json',
	        	dataType:'JSON',
	        	data:JSON.stringify({ noticeNum: noticeNum }),
	        	error:function(xhr){
	        		console.log(xhr.status)
	        		alert("문제가 발생했습니다.")
	        	},
	        	success:function(jsonObj){
	        		
	        		

	        		$("#updateNoticeNum").val(jsonObj.noticeNum);
	        		$("#updateNoticeInputdate").val(jsonObj.noticeInputDate);
	        		$("#updateNoticeTitle").val(jsonObj.noticeTitle);
	        		$("#updateNoticeContent").val(jsonObj.noticeContent);
	        	}
	        	
	        })//ajax
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	


	        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
	        // 모달 내의 모든 'is-invalid' 클래스 제거
	        $('#noticeDetailModal').find('.is-invalid').removeClass('is-invalid');
	        
	        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
	        $('#noticeDetailModal').find('span.parsley-custom-error-message').remove();
	        
	        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
	        $('#noticeDetailModal').modal('show');
	    });

	    $("#addNotice").click(function(){
	       	// 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
            // 모달 내의 모든 'is-invalid' 클래스 제거
            $('#addNoticeModal').find('.is-invalid').removeClass('is-invalid');
            
            // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
            $('#addNoticeModal').find('span.parsley-custom-error-message').remove();
            $('#addNoticeModal').modal('show');
	    })
		
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

/*         function deleteAction() {
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
        } */

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

/*         // 삭제 버튼 클릭 시
        $('#chkDeleteBtn').on('click', function() {
            showModal('삭제 확인', '삭제하시겠습니까?', '예', function() {
                deleteAction();
                alert('삭제 동작 수행');
            });
        }); */

        // 수정 버튼 클릭 시
        $('#chkUpdateBtn').on('click', function() {
            showModal('수정 확인', '수정하시겠습니까?', '예', function() {
                updateAction();
                alert('수정 동작 수행');
            });
        });
        
        
        //esc 클릭 이벤트 
        $(document).keydown(function(event) {
            // ESC 키 입력 감지
            if (event.keyCode == 27 || event.which == 27) {
                // 수정 모달 열려있는지 확인
                $('#confirmModal').modal('hide');
            }
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

	<script>
	document.getElementById('noticeDetailForm').onsubmit = function() {
	    
		if(confirm('공지사항을 정말로 저장하시겠습니까?')){
		}

	};
	
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
		<h3>공지사항 관리</h3>
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
												<th>제목</th>
												<th>작성일</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
<c:if test="${ empty requestScope.noticeList }">
<tr>
<td colspan="5" style="text-align: center;">
공지사항 정보가 존재하지 않습니다.
</td>
</tr>
</c:if>	                            
<c:forEach var="nld" items="${ requestScope.noticeList }" varStatus="i">
<tr>
	<td><c:out value="${ i.count }"/></td>
	<td><a href="#" class="noticeTitle" >${ nld.noticeTitle }</a><input type="hidden" class="hiddenNoticeNum" value="${ nld.noticeNum }"/></td>
	<td class="noticeInputdate">${ nld.noticeInputDate }</td>
	<td class="adminId">${ nld.adminId }</td>
	<td class="noticeViewCnt">${ nld.noticeViewCount }</td>
</tr>

</c:forEach>	
										


										</tbody>
									</table>
									<div class="addNotice">
                                    <a href="#" class="btn btn-info" id="addNotice">공지사항 등록</a>
                               		 </div>
								</div>
							</div>
						</div>

					</section>
				</div>
				
				<!-- 등록 모달창 start-->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="addNoticeModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">공지사항 등록</h5>
							</div>
							<form id = "noticeDetailForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="inputNoticeNum" style="flex: 1">번호</label> 
											<input type="text"
												id="inputNoticeNum" 
												class="form-control"
												name="inputNoticeNum" 
												placeholder="번호" 
												style="flex: 2 " 
												Disabled>

										</div>
									</div>
									<div class="col-md-3 col-12">
									</div>
									
									
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="inputNoticeInputdate" style="flex: 1">작성일</label> 
												<input
						                        type="text"
						                        id="inputNoticeInputdate"
						                        class="form-control"
						                        placeholder="작성일"
						                        name="inputNoticeInputdate"
						                        style="flex: 2 "
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-3 col-12">
									</div>
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="inputNoticeTitle" style="flex: 1 ">제목</label> 
											<input
						                        type="text"
						                        id="inputNoticeTitle"
						                        class="form-control"
						                        placeholder="제목"
						                        name="inputNoticeTitle"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="제목은 필수 입력입니다."
						                     />
										</div>
									</div>
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="inputNoticeContent" style="flex: 1 ">내용</label> 
											<textarea
						                        id="inputNoticeContent"
						                        class="form-control"
						                        placeholder="내용"
						                        rows="15"
						                        name="inputNoticeContent"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="내용은 필수 입력입니다."
						                     ></textarea>
										</div>
									</div>
									<div style="height: 30px;"></div>
									<div class="col-12 d-flex justify-content-center">
										     <div class="buttons">
                                        <button type="button" id="chkAddBtn" class="btn icon icon-left btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                                <path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg> 등록
                                        </button>
                                    </div>
									</div>
									<div style="height: 30px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 등록 모달창 end-->
				
				
				
				<!-- 수정 모달창 start-->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="noticeDetailModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">공지사항 상세조회</h5>
								<div class="d-flex justify-content-end">
<!-- 									<button type="button" class="btn btn-danger" id="chkDeleteBtn">
										<i class="bx bx-x d-block d-sm-none"></i> 
										<span class="d-none d-sm-block">공지사항 삭제</span>
									</button> -->
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
											<label for="updateNoticeNum" style="flex: 1">번호</label> 
											<input type="text"
												id="updateNoticeNum" 
												class="form-control"
												name="updateNoticeNum" 
												placeholder="번호" 
												style="flex: 2 " 
												Disabled>

										</div>
									</div>
									<div class="col-md-3 col-12">
									</div>
									
									
									<div class="col-md-3 col-12">
										<div class="form-group">
											<label for="updateNoticeInputdate" style="flex: 1">작성일</label> 
												<input
						                        type="text"
						                        id="updateNoticeInputdate"
						                        class="form-control"
						                        placeholder="작성일"
						                        name="updateNoticeInputdate"
						                        style="flex: 2 "
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-3 col-12">
									</div>
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="updateNoticeTitle" style="flex: 1 ">제목</label> 
											<input
						                        type="text"
						                        id="updateNoticeTitle"
						                        class="form-control"
						                        placeholder="제목"
						                        name="updateNoticeTitle"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="제목은 필수 입력입니다."
						                     />
										</div>
									</div>
									
									
									<div class="col-md-12 col-12">
										<div class="form-group">
											<label for="updateNoticeContent" style="flex: 1 ">내용</label> 
											<textarea
						                        id="updateNoticeContent"
						                        class="form-control"
						                        placeholder="내용"
						                        rows="15"
						                        name="updateNoticeContent"
						                        style="flex: 13 "
						                        data-parsley-required="true"
						                        data-parsley-error-message="내용은 필수 입력입니다."
						                     ></textarea>
										</div>
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
				<!-- 수정 모달창 end-->
				
				<!-- 공통 확인 모달 start-->
         		<jsp:include page="/WEB-INF/views/admin/modal/checkModal.jsp"/>       
           		 <!-- 공통 확인 모달 end-->
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