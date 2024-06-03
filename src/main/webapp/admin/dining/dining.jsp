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

<!-- favicon -->
<link rel="shortcut icon" href="/hotel_prj/admin/assets/static/images/logo/favicon.ico" type="image/x-icon">

<!-- template css -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/iconly.css">

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
		    <h3>다이닝 관리</h3>
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
	                                    <th>다이닝번호</th>
	                                    <th>구분</th>
	                                    <th>다이닝명</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0001</a></td>
	                                    <td>양식</td>
	                                    <td class="text-bold-500">Ramsey</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0002</a></td>
	                                    <td>프랑스 요리</td>
	                                    <td class="text-bold-500">Le Bernardin</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0003</a></td>
	                                    <td>이탈리아 요리</td>
	                                    <td class="text-bold-500">Osteria Francescana</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0004</a></td>
	                                    <td>일식</td>
	                                    <td class="text-bold-500">Sukiyabashi Jiro</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0005</a></td>
	                                    <td>현대 요리</td>
	                                    <td class="text-bold-500">The Fat Duck</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0006</a></td>
	                                    <td>미국 요리</td>
	                                    <td class="text-bold-500">Eleven Madison Park</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#" class="diningNumber">Dining0007</a></td>
	                                    <td>스페인 요리</td>
	                                    <td class="text-bold-500">El Celler de Can Roca</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
			</section>
		</div>

		<!-- 모달창 -->
		<div class="modal fade text-left modal-borderless modal-full"  id="diningDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header" >
						<h5 class="modal-title">다이닝 상세 조회</h5>
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-danger" onclick="deleteDiningDetail()">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">계정삭제</span>
							</button>
						</div>
					</div>
					<form id="diningDetailForm" action="#" class="form px-5" data-parsley-validate>
		                <div class="row">
		                <div class="col-12 col-md-20">
		                    <div>
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
		                 		<a href="#" class="btn icon icon-left btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg> 저장</a>
		                 		</div>
		                    </div>
		                </div>
		                <div class="col-12 col-md-20">
		                    
		                    <div class="form-group">
		                        <label for="helperText">레스토랑설명</label>
		                        <textarea class="form-control" id="diningDescription" rows="20"></textarea>
		                    </div>
		                </div>
		                </div>
	            	</form>
				</div>
			</div>
		</div>

		<!-- footer -->
		<jsp:include page="/admin/footer.jsp"></jsp:include>
	</div>
</div>


	<script type="text/javascript">
$(document).ready(function() {
	$(".sidebar-item.dm").addClass("active");
	
	$(document).on('click', '.sidebar-item', function() {
        $(".sidebar-item").removeClass("active");
        $(this).addClass("active");
	});

    
    
    // 테이블의 다이닝번호 클릭시
    $(".diningNumber").click( function(){
    	
   
    	alert("d");
;
       /*  var userId = $(this).text();
        var userName = $(this).closest('tr').find('.userName').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userPhone = $(this).closest('tr').find('.userPhone').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userSignUpDate = $(this).closest('tr').find('.userSignUpDate').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
		*/

        // 모달 내 필드에 데이터 설정


      
      // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
         // 모달 내의 모든 'is-invalid' 클래스 제거
         $('#diningDetail').find('.is-invalid').removeClass('is-invalid');
         
         
         // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
         $('#diningDetail').find('span.parsley-custom-error-message').remove();
         
        
        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
        $('#diningDetail').modal('show');
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
