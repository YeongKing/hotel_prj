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

<div class="modal fade text-right modal-borderless" id="roomResDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">예약 객실 정보</h5>
			</div>
			
			<div class="modal-body">
            <form id="roomResDetailForm" action="#" class="form px-5" data-parsley-validate>
				<div class="form-group">
					<label for="payNum">예약번호</label>
					<input type="text" class="form-control" id="payNum" disabled>
				</div>
							
				<div class="form-group">
					<label for="roomFloorAndInfo">배정객실</label>
					<div class="row">
					<div class="col-12 col-lg-3">
					<input type="text" class="form-control" id="roomFloor" disabled>
					</div>
																	
					<div class="col-12 col-lg-9">
					<select class="form-select" id="roomInfo">
					</select>
					</div>
					</div>
				</div>
                            
				<div class="form-group">
					<label for="roomResStatus">예약상태</label>
					<input type="text" class="form-control" id="roomResStatus" disabled>
				</div>
                            
				<div class="form-group row">
 					<div class="col-12 col-lg-6">
					<label for="adultsNum">인원(성인)</label>
					<input type="text" class="form-control" id="adultsNum" disabled>
					</div>
					
 					<div class="col-12 col-lg-6">
					<label for="kidsNum">인원(어린이)</label>
					<input type="text" class="form-control" id="kidsNum" disabled>
					</div>
				</div>
				
				<div class="form-group row">
 					<div class="col-12 col-lg-6">
					<label for="checkIn">체크인</label>
					<input type="text" id="checkIn" placeholder="연.월.일" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" disabled>
					</div>
					
 					<div class="col-12 col-lg-6">
					<label for="checkOut">체크아웃</label>
					<input type="text" id="checkOut" placeholder="연.월.일" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" disabled>
					</div>
				</div>
                            
				<div class="form-group">
					<label>예약자 정보</label>
					<div class="table-responsive">
						<table class="table table-bordered modal-table">
							<tr>
							<th>영문 이름</th>
							<td><input type="text" class="form-control" id="engName" disabled></td>
							</tr>

							<tr>
							<th>연락처</th>
							<td><input type="text" class="form-control" id="guestPhone"></td>
							</tr>
                         			
							<tr>
							<th>이메일</th>
							<td><input type="text" class="form-control" id="guestEmail"></td>
							</tr>

							<tr>
							<th>요청사항</th>
							<td><input type="text" class="form-control" id="guestRequest"></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group">
					<label>결제 정보</label>
					<div class="table-responsive">
                		<table class="table table-bordered modal-table">
                			<tr>
                			<th>카드사</th>
                			<td><input type="text" class="form-control" id="cardName" disabled></td>
                			</tr>

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
                			<td><input type="text" class="form-control" id="payTime" disabled></td>
                			</tr>
                		</table>
					</div>
				</div>
						
				<div class="buttons">
					<button type="button" id="chkUpdateBtn" class="btn btn-info me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
							<path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline>
						</svg> 예약 수정
					</button>
					
					<button type="button" id="chkCheckinBtn" class="btn btn-success me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
							<path d="M22 11.08V12a10 10 0 1 1-4-7.94"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline>
						</svg> 체크인 처리
					</button>
					
					<button type="button" id="chkCheckoutBtn" class="btn btn-primary me-1 mb-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle">
						<path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
						<line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line>
						</svg> 체크아웃 처리
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