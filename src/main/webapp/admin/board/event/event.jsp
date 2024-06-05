<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 이벤트" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>엘리시안 호텔 관리자 페이지</title>

<!-- favicon -->
<link rel="shortcut icon" href="/hotel_prj/admin/assets/static/images/logo/favicon.ico" type="image/x-icon">

<!-- template css -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/hotel_prj/admin/assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" crossorigin="" href="/hotel_prj/admin/assets/compiled/css/table-datatable-jquery.css">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
.grid-thead {
	display: grid;
	grid-template-columns: 25% 25% 50%;
}
.grid-tbody {
	display: grid;
	grid-template-columns: 25% 25% 50%
}
.modal.fade.text-left.modal-borderless.modal-full {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}


.modal-xl {
  max-width: 90%;
}
.addEvent{
	display: flex; 
	justify-content: flex-end;
	padding-bottom: 30px;
	padding-right: 10px;
}

.buttons{
	display: flex; 
	padding-top: 15px;
}
</style>

<script type="text/javascript">

</script>
</head>

<body>
<script src="/hotel_prj/admin/assets/static/js/initTheme.js"></script>

<!-- app -->
<div id="app">
	<!-- sidebar -->
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>

	<!-- main -->
	<div id="main">
		<!-- header -->
		<jsp:include page="/admin/header.jsp"></jsp:include>

		<div class="page-heading">
		    <h3>이벤트 관리</h3>
		</div>

		<div class="page-content mb-3">
			<section class="row">
				<div class="card">
	                <div class="card-header">
	                    <h5 class="card-title">jQuery Datatable</h5>
	                </div>
	                <div class="card-body">
	                    <div class="table-responsive">
	                        <table class="table dataTable no-footer" id="table1">
	                            <thead>
	                                <tr>
	                                    <th>이벤트번호</th>
	                                    <th>이벤트명</th>
	                                    <th>등록일</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0001</a></td>
	                                    <td class="text-bold-500">2024 SUMMBER ART FESTIBAL</td>
	                                    <td>2024.06.03</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0002</a></td>
	                                    <td class="text-bold-500">THE, SPECIAL SUMMBER</td>
	                                    <td>2024.05.28</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0003</a></td>
	                                    <td class="text-bold-500">DELIGHTFUL DISCOVER IN ELYSIAN</td>
	                                    <td>2024.05.25</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0004</a></td>
	                                    <td class="text-bold-500">ELYSIAN DELY SPECIAL BRUNCH GIFT</td>
	                                    <td>2024.05.15</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Event0005</a></td>
	                                    <td class="text-bold-500">MINDFUL STAY SPECAIL EVENT</td>
	                                    <td>2024.05.05</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0006</a></td>
	                                    <td class="text-bold-500">카카오페이 2박 3일 패키지</td>
	                                    <td>2024.04.10</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0007</a></td>
	                                    <td class="text-bold-500">우아한 민족, 엘리시안 콤보 세트 이벤트</td>
	                                    <td>2024.04.03</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="eventNumber">Event0008</a></td>
	                                    <td class="text-bold-500">2024 MIDNIGHT POOL PARTY</td>
	                                    <td>2024.02.03</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                        <div class="addEvent">
	                        <a href="#" class="btn btn-info" id="addEventBtn">이벤트 등록</a>
	                    	</div>
	                    </div>
	                </div>
	            </div>
			</section>
		</div>
		
	<!-- 이벤트 등록 start -->
	<div class="modal fade text-left modal-borderless" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">이벤트 등록</h5>
            </div>
            <form id="evnetDetailForm" action="#" class="form px-5" data-parsley-validate>
                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div>
                            <div class="form-group">
                                <label for="diningId">이벤트 아이디</label>
                                <input type="text" class="form-control" id="diningId" placeholder="Dining01" disabled>
                            </div>
                            <div class="form-group">
                                <label for="diningName">이벤트명</label>
                                <input type="text" class="form-control" id="diningName" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="openTime">이벤트 시작일</label>
                                <input type="text" class="form-control" id="openTime" placeholder="00:00">
                            </div>
                            <div class="form-group">
                                <label for="closeTime">이벤트 종료일</label>
                                <input type="text" class="form-control" id="closeTime" placeholder="00:00">
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-lg-6">
						<div class="form-group">
   							 <label for="diningDescription">이벤트 내용</label>
   							 <textarea class="form-control" id="diningDescription" rows="10" style="max-height: 200px; overflow-y: auto;"></textarea>
						</div>
						<div class="form-group">
                               <label for="diningImg">이벤트 대표 이미지</label>
                               <div class="input-group">
                                   <input type="file" class="form-control" id="diningImg" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                   <button class="btn btn-primary" type="button" id="inputGroupFileAddon04">Upload</button>
                                </div>
                        </div>	<div class="form-group">
                               <label for="diningImg">이벤트 부 이미지</label>
                               <div class="input-group">
                                   <input type="file" class="form-control" id="diningImg" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                   <button class="btn btn-primary" type="button" id="inputGroupFileAddon04">Upload</button>
                                </div>
                        </div>
						<div class="buttons">
                                <button type="button" id="chkAddBtn" class="btn icon icon-left btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                        <path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                    </svg> 등록
                                </button>
                          </div>
						
						
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
	<!-- 이벤트 등록 end-->
	
<!-- 이벤트 수정 start -->
<div class="modal fade text-left modal-borderless" id="eventDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">이벤트 상세 조회</h5>
							<div class="d-flex justify-content-end">
								<button type="button" id="chkDeleteBtn" class="btn btn-danger">
									<i class="bx bx-x d-block d-sm-none"></i> <span
										class="d-none d-sm-block">이벤트 삭제</span>
								</button>
							</div>
						</div>
						<form id="evnetDetailForm" action="#" class="form px-5"
							data-parsley-validate>
							<div class="row">
								<div class="col-12 col-lg-6">
									<div class="form-group">
										<label for="diningId">이벤트 아이디</label> <input type="text"
											class="form-control" id="diningId" placeholder="Dining01"
											disabled>
									</div>
									<div class="form-group">
										<label for="diningName">이벤트명</label> <input type="text"
											class="form-control" id="diningName" placeholder="">
									</div>
									<div class="form-group">
										<label for="openTime">이벤트 시작일</label> <input type="text"
											class="form-control" id="openTime" placeholder="00:00">
									</div>
									<div class="form-group">
										<label for="closeTime">이벤트 종료일</label> <input type="text"
											class="form-control" id="closeTime" placeholder="00:00">
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<div class="form-group">
										<label for="diningDescription">이벤트 내용</label>
										<textarea class="form-control" id="diningDescription"
											rows="10" style="max-height: 200px; overflow-y: auto;"></textarea>
									</div>
									<div class="form-group">
										<label for="diningImg">이벤트 대표 이미지</label>
										<div class="input-group">
											<input type="file" class="form-control" id="diningImg"
												aria-describedby="inputGroupFileAddon04" aria-label="Upload">
											<button class="btn btn-primary" type="button"
												id="inputGroupFileAddon04">Upload</button>
										</div>
									</div>
									<div class="form-group">
										<label for="diningImg">이벤트 부 이미지</label>
										<div class="input-group">
											<input type="file" class="form-control" id="diningImg"
												aria-describedby="inputGroupFileAddon04" aria-label="Upload">
											<button class="btn btn-primary" type="button"
												id="inputGroupFileAddon04">Upload</button>
										</div>
									</div>
                                    <div class="col-12 d-flex justify-content-center" >
									<button type="button" id="chkUpdateBtn"
										class="btn btn-primary me-1 mb-1">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-check-circle">
                                                <path
												d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline
												points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg>
										저장
									</button>
									<button type="button" id="closeBtn"
										class="btn btn-light-secondary me-1 mb-1"
										data-bs-dismiss="modal">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-check-circle">
                                                <path
												d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
                                                <polyline
												points="22 4 12 14.01 9 11.01"></polyline>
                                            </svg>닫기
									</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
</div>
<!-- 이벤트 수정 end -->
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
                            <button type="button" class="btn btn-danger" id="confirmActionBtn"></button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 공통 확인 모달 end-->

		


		<!-- footer -->
		<jsp:include page="/admin/footer.jsp"></jsp:include>
	</div>
</div>


	<script type="text/javascript">
$(document).ready(function() {
	$(".sidebar-item.em").addClass("active");
	
	$(document).on('click', '.sidebar-item', function() {
        $(".sidebar-item").removeClass("active");
        $(this).addClass("active");
	});
	
	
	//이벤트 등록 버튼 클릭시 등록 모달 표시
	$("#addEventBtn").click(function(){
		// 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
        // 모달 내의 모든 'is-invalid' 클래스 제거
        $('#addEventModal').find('.is-invalid').removeClass('is-invalid');
        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
        $('#addEventModal').find('span.parsley-custom-error-message').remove();
       // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
       $('#addEventModal').modal('show');
		
	})
	
	 // 테이블의 이벤트 번호 클릭시
    $(".eventNumber").click( function(){
    	
       /*  var userId = $(this).text();
        var userName = $(this).closest('tr').find('.userName').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userPhone = $(this).closest('tr').find('.userPhone').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userSignUpDate = $(this).closest('tr').find('.userSignUpDate').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
		*/
        // 모달 내 필드에 데이터 설정
      // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
         // 모달 내의 모든 'is-invalid' 클래스 제거
         $('#eventDetailModal').find('.is-invalid').removeClass('is-invalid');
         // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
         $('#eventDetailModal').find('span.parsley-custom-error-message').remove();
        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
        $('#eventDetailModal').modal('show');
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
    
    
    //esc 클릭 이벤트 
    $(document).keydown(function(event) {
        // ESC 키 입력 감지
        if (event.keyCode == 27 || event.which == 27) {
            // 수정 모달 열려있는지 확인
            $('#confirmModal').modal('hide');
        }
    });

});//ready
</script>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 추가 Script E -->

</body>
</html>
