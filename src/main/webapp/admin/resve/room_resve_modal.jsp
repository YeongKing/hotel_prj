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
					<label for="roomResNum">예약번호</label>
					<input type="text" class="form-control" id="roomResId" value="R2024052400001" disabled>
				</div>
							
				<div class="form-group">
					<label for="roomId">배정객실</label>
					<div class="row">
					<div class="col-12 col-lg-3">
					<select class="form-select" id="roomFloor">
								<option>32층</option>
						<option>33층</option>
						<option>34층</option>
					</select>
					</div>
																	
					<div class="col-12 col-lg-9">
					<select class="form-select" id="roomId">
								<option>3201호(SUITE | 2 KING | POOLSIDE VIEW)</option>
						<option>3202호(DELUXE | 1 KING | CITY VIEW)</option>
						<option>3203호(STANDARD | 1 QUEEN | GARDEN VIEW)</option>
					</select>
					</div>
					</div>
				</div>
                            
				<div class="form-group">
					<label for="roomResStatus">예약상태</label>
					<select class="form-select" id="roomResStatus">
						<option>RESERVED</option>
						<option>CHECK IN</option>
						<option>CHECK OUT</option>
						<option>CANCELED</option>
						<option>NO SHOW</option>
					</select>
				</div>
                            
				<div class="form-group row">
 					<div class="col-12 col-lg-6">
					<label for="adultNum">인원(성인)</label>
					<select class="form-select" id="adultNum">
						<option>1명</option>
						<option>2명</option>
						<option>3명</option>
						<option>4명</option>
						<option>5명</option>
 						<option>6명</option>
					</select>
					</div>
					
 					<div class="col-12 col-lg-6">
					<label for="adultNum">인원(어린이)</label>
					<select class="form-select" id="adultNum">
						<option>0명</option>
						<option>1명</option>
						<option>2명</option>
					</select>
					</div>
				</div>
                            
				<div class="form-group">
					<label>예약자 정보</label>
					<div class="table-responsive">
						<table class="table table-bordered modal-table">
							<tr>
							<th>영문 이름</th>
							<td><input type="text" class="form-control" value="WOONGCHAN YOON"></td>
							</tr>

							<tr>
							<th>연락처</th>
							<td><input type="text" class="form-control" value="010-1234-5678"></td>
							</tr>
                         			
							<tr>
							<th>이메일</th>
							<td><input type="text" class="form-control" value="ywcsuwon@gmail.com"></td>
							</tr>

							<tr>
							<th>요청사항</th>
							<td><input type="text" class="form-control" value="공기청정기 please"></td>
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
                			<td>국민</td>
                			</tr>

                			<tr>
                			<th>신용카드 번호</th>
                			<td>************0050</td>
                			</tr>
                			
                			<tr>
                			<th>결제금액</th>
                			<td>211,200원</td>
                			</tr>

                			<tr>
                			<th>예약일</th>
                			<td>2024.05.24</td>
                			</tr>
                		</table>
					</div>
				</div>
						
				<div class="buttons row">
					<div class="col-12 col-lg-3">
					</div>
					
					<div class="col-12 col-lg-7">
						<a href="#" class="btn icon icon-left btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>예약 수정</a>
						<a href="#" class="btn icon icon-left btn-danger"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>예약 취소</a>
						<a href="#" class="btn icon icon-left btn-info"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>체크아웃 처리</a>
						<a href="#" class="btn icon icon-left btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>닫기</a>
					</div>
					
					<div class="col-12 col-lg-1">
					</div>
				</div>
            </form>
			</div>
		</div>
	</div>
</div>