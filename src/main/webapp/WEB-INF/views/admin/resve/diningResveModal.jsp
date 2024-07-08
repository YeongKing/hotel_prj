<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<!-- 모달 CSS S -->
<style type="text/css">
.modal-table>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}
.modal-table>tbody>tr>td {
	text-align: center;
	vertical-align: middle;
}
.modal-body{
    max-height: calc(100vh - 200px);
    overflow-y: auto;
}
.buttons{
	text-align: center;
}
</style>
<!-- 모달 CSS E -->

<div class="modal fade text-right modal-borderless" id="diningResDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">예약 다이닝 정보</h5>
			</div>
			
			<div class="modal-body">
            <form id="diningResDetailForm" action="#" class="form px-5" data-parsley-validate>
            <div class="row">
            	<div class="col-12 col-lg-6">
					<div class="form-group">
						<label for="payNum">예약번호</label>
						<input type="text" class="form-control" id="payNum" disabled>
					</div>
								
					<div class="form-group">
						<label for="diningName">매장명</label>
						<input type="text" class="form-control" id="diningName" disabled>
					</div>
					
					<div class="form-group">
						<label for="visitDate">방문일</label>
						<input type="text" id="visitDate" class="form-control flatpickr-basic flatpickr-input" disabled>
					</div>
				</div>
				
				<div class="col-12 col-lg-6">
					<div class="form-group">
						<label for="diningResStatus">예약상태</label>
						<input type="text" class="form-control" id="diningResStatus" disabled>
					</div>
					
					<div class="form-group">
						<label for="visitPeople">방문인원</label>
						<input type="text" class="form-control" id="visitPeople" disabled>
					</div>
					
					<div class="form-group">
						<label for="visitTime">방문시간</label>
						<input type="text" id="visitTime" class="form-control flatpickr-time-picker-24h flatpickr-input" disabled>
					</div>
				</div>
				
				<div class="col-12 col-lg-4">
					<label for="adultsCnt">어른인원</label>
					<input type="text" class="form-control" id="adultsCnt" disabled>
				</div>
				
				<div class="col-12 col-lg-4">
					<label for="childCnt">어린이인원</label>
					<input type="text" class="form-control" id="childCnt" disabled>
				</div>
				<div class="col-12 col-lg-4">
					<label for="babyCnt">영유아인원</label>
					<input type="text" class="form-control" id="babyCnt" disabled>
				</div>
				</div>
                            
				<div class="form-group mt-3">
					<label>방문자 정보</label>
					<div class="table-responsive">
						<table class="table table-bordered modal-table">
							<tr>
							<th>방문자 이름</th>
							<td><input type="text" class="form-control" id="visitorName"></td>
							</tr>

							<tr>
							<th>연락처</th>
							<td><input type="text" class="form-control" id="visitorPhone"></td>
							</tr>
                         			
							<tr>
							<th>이메일</th>
							<td><input type="text" class="form-control" id="visitorEmail"></td>
							</tr>

							<tr>
							<th>요청사항</th>
							<td><input type="text" class="form-control" id="visitorRequest"></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group">
					<label>결제 정보</label>
					<div class="table-responsive">
                		<table class="table table-bordered modal-table">
                			<!-- <tr>
                			<th>카드사</th>
                			<td><input type="text" class="form-control" id="cardName" disabled></td>
                			</tr> -->

                			<tr>
                			<th>신용카드 번호</th>
                			<td><input type="text" class="form-control" id="cardNum" disabled></td>
                			</tr>
                			
                			<tr>
                			<th>결제금액</th>
                			<td><input type="text" class="form-control" id="payPrice" disabled></td>
                			</tr>

                			<tr>
                			<th>예약일</th>
                			<td><input type="text" class="form-control flatpickr-time-picker-24h flatpickr-input" id="diningResDate" disabled></td>
                			</tr>
                		</table>
					</div>
				</div>
						
				<div class="buttons">
					<button type="button" id="chkUpdateBtn" class="btn btn-primary me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
							<path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline>
						</svg> 예약 수정
					</button>
					
					<button type="button" id="chkCompleteBtn" class="btn btn-success me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
							<path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline>
						</svg> 이용완료 처리
					</button>
					
					<button type="button" id="chkCancelBtn" class="btn btn-danger me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"><circle cx="12" cy="12" r="10"></circle>
						<line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line>
						</svg> 예약 취소
					</button>
					
					<button type="button" id="closeBtn" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
 								<path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline>
						</svg> 닫기
					</button>
				</div>
            </form>
			</div>
		</div>
	</div>
</div>