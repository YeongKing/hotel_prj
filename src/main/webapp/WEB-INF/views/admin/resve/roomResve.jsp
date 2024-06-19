<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "관리자 객실 예약 관리" %>
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

<!-- datatable css S -->
<link rel="stylesheet" href="/hotel_prj/admin/assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" crossorigin="" href="/hotel_prj/admin/assets/compiled/css/table-datatable-jquery.css">
<!-- datatable css E -->

<!-- template css S -->
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<!-- template css E -->

<link rel="stylesheet" href="/hotel_prj/admin/assets/extensions/flatpickr/flatpickr.min.css">
<!-- jQuery CDN S -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type = "text/css">
#table1_wrapper {
	width:1470px;
}
</style>

<script type = "text/javascript">
	$(function() {
		$(".sidebar-item.rem").addClass("active");
		$(".submenu-item.rrm").addClass("active");
		
		$(document).on('click', '.sidebar-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".sidebar-item").removeClass("active");

	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
	    });
	    
	    $(document).on('click', '.submenu-item', function() {
	        // 모든 .sidebar-item 요소에서 active 클래스 제거
	        $(".submenu-item").removeClass("active");

	        // 클릭된 요소에만 active 클래스 추가
	        $(this).addClass("active");
	    });
	}); // ready
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
	    <h3>객실 예약 관리</h3>
	</div> 
	
	<!-- page content S -->
	<div class="page-content mb-3">
	<!-- Basic Tables S -->
    <section class="section">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="table1">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>예약번호</th>
                                <th>예약상태</th>
                                <th>상품명</th>
                                <th>체크인</th>
                                <th>체크아웃</th>
                                <th>예약일</th>
                                <th>예약자 영문이름</th>
                                <th>연락처</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!-- Basic Tables E -->
	</div>
	<!-- page content E -->
	
	<!-- modal S -->
	<jsp:include page="/WEB-INF/views/admin/resve/roomResveModal.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/modal/checkModal.jsp"></jsp:include>
	<!-- modal E -->

	<!-- footer S -->
	<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>
	<!-- footer E -->
            
    </div>
    <!-- main E -->
    
</div>
<!-- app E  -->

<!-- 공통 필요 Script S -->
<script src="/hotel_prj/admin/assets/static/js/components/dark.js"></script>
<script src="/hotel_prj/admin/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/hotel_prj/admin/assets/compiled/js/app.js"></script>
<!-- 공통 필요 Script E -->

<script src="/hotel_prj/admin/assets/extensions/jquery/jquery.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/hotel_prj/admin/assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/datatables.js"></script>

<script type="text/javascript">
	$(function() {
		var table = $('#table1').DataTable();

		// 기존 DataTable 인스턴스 제거
		table.destroy();
		
		// 현재 페이지 DataTable 인스턴스 생성
		var table = $('#table1').DataTable({
			processing: true,
			serverSide: false,
			ajax: {
		       'url':'roomResList.do', 
		       'type': 'POST',
		       'dataSrc':''
		    },
		    
		    // 컬럼 설정
			columns: [
				{"data": "num", "width": "35px"},
				{"data": "payNum", "width": "150px"},
				{"data": "roomResStatus", "width": "130px"},
				{"data": "room", "width": "300px"}, 
				{"data": "checkInStr", "width": "120px"},
				{"data": "checkOutStr", "width": "120px"},
				{"data": "roomResDateStr", "width": "120px"},
				{"data": "engName", "width": "150px"},
				{"data": "guestPhone", "width": "150px"}
			],
			
			// 돔 설정
			dom:
				"<'row'<'col-sm-12 col-md-11'f><'col-sm-12 col-md-1'l>>" +
				"<'row dt-row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				
			// 언어 변경
			language: {
		        emptyTable: "데이터가 없습니다.",
		        zeroRecords: "데이터가 없습니다.",
		        lengthMenu: "_MENU_ 개",
		        search: "검색 ",
		        searchPlaceholder: "검색어를 입력하세요.",
		        paginate: {
		            "next": "다음",
		            "previous": "이전"
		        },
		        info: "현재 _START_ - _END_ / 총 _TOTAL_건",
		        infoEmpty: "데이터 없음",
		        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
		        loadingRecords: "로딩중...",
		        processing:     "잠시만 기다려 주세요..."
		    }
		});
		
		// 검색 input 사이즈 조절
		$('#table1_wrapper').find('input[type="search"]').removeClass('form-control-sm').attr('style', 'width:300px;');
		
	    // 날짜 기간 조회를 위한 input 추가
		$('#table1_filter').prepend('<input type="text" id="toDate" placeholder="연.월.일" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" style="width: 150px; margin: 0px 20px 0px 0px;"> ');
		$('#table1_filter').prepend('<input type="text" id="fromDate" placeholder="연.월.일" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" style="width: 150px;"> ~ ');
		
		// 예약 상태 select 추가
		$('#table1_filter').prepend('<select id="res_status" class="form-select" style="width: 150px; display: inline; margin: 0px 20px 0px 10px;"></select>');
		$('#res_status').append('<option value="">예약상태 선택</option>')
						.append('<option value="RESERVED">RESERVED</option>')
						.append('<option value="CHECK IN">CHECK IN</option>')
						.append('<option value="CHECK OUT">CHECK OUT</option>')
						.append('<option value="CANCELED">CANCELED</option>')
						.append('<option value="NO SHOW">NO SHOW</option>');

		// 검색 조건 select 추가
		$('#table1_filter').prepend('검색 조건<select id="select" class="form-select" style="width: 170px; display: inline; margin: 0px 20px 0px 10px;"></select>');
		$('#table1 > thead > tr').children().each(function (indexInArray, valueOfElement) { 
			// 필요 컬럼 선택 
			var requiredColumns = [1, 3, 4, 5, 6, 7, 8];
		    
		    // 현재 인덱스가 배열에 있는지 확인
		    if (requiredColumns.includes(indexInArray)) {
		        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
		    }
		});
		
	    // 검색 input에 이벤트 리바인딩
		$('.dataTables_filter input').unbind().bind('keyup keydown input', function () {
			var colIndex = document.querySelector('#select').selectedIndex;
			
			// 선택한 인덱스와 실제 테이블 인덱스 번호 맞추기
			switch(colIndex) {
			case 0 : colIndex = 1; break;
			case 1 : colIndex = 3; break;
			case 2 : colIndex = 4; break;
			case 3 : colIndex = 5; break;
			case 4 : colIndex = 6; break;
			case 5 : colIndex = 7; break;
			case 6 : colIndex = 8; break;
			}
			//console.log(colIndex);
			table.column(colIndex).search(this.value).draw();
		});
		
	    // 날짜에 이벤트 리바인딩
		$('#toDate, #fromDate').unbind().bind('keyup change', function(){
	        table.draw();
	    });
	    
		// 예약 상태 변경 시 필터 적용
		$('#res_status').on('change', function() {
			var status = $(this).val();
			table.column(2).search(status).draw();
		});
	    
	    // 검색 조건 select에 chagne 이벤트 추가
	    $("#select").on('change', function() {
			var columnIndex = $("#select option").index($("#select option:selected"));
			// 선택된 select이 날짜 관련(체크인, 체크아웃, 예약일) 인덱스일 경우만 함수 실행
			if(columnIndex == 2 || columnIndex == 3 || columnIndex == 4) {
				// 선택한 인덱스와 실제 테이블 인덱스 번호 맞추기
				columnIndex = columnIndex + 2;
				// 기존 필터 제거
				$.fn.dataTable.ext.search.pop();
				// 새 필터 추가
				$.fn.dataTable.ext.search.push(createDateRangeFilter(columnIndex));
				// 테이블 갱신
				table.draw();
			} // end if
		});

	    // select이 날짜 관련(체크인, 체크아웃, 예약일)일 때 실행되는 함수
		// return이 true이면 검색 수행, false이면 무시
		function createDateRangeFilter(columnIndex) {
			return function(settings, data, dataIndex){
				var fromDate = new Date($("#fromDate").val());
				fromDate.setDate(fromDate.getDate());
				
				var min = Date.parse(fromDate);
				var max = Date.parse($('#toDate').val());
				var tableDate = Date.parse(data[columnIndex]);
		
				if( (isNaN(min) && isNaN(max)) || 
					(isNaN(min) && tableDate <= max) || 
					(tableDate >= min && isNaN(max)) ||
					(tableDate >= min && tableDate <= max) ){ 
						return true;
					}
				return false;
			}
		} // createDateRangeFilter
	    
	 	// 테이블의 예약번호 클릭시
	    $(document).on('click', '.payNum', function() {
	    	var payNum = $(this).text();
	    	
	    	loadData(payNum);
	    	
	    	// 모달 내의 모든 'is-invalid' 클래스 제거
	         $('#roomResDetail').find('.is-invalid').removeClass('is-invalid');
	         
	         // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
	         $('#roomResDetail').find('span.parsley-custom-error-message').remove();
	        
	        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
	        $('#roomResDetail').modal('show');
	    });
		
		function loadData(payNum) {
			$.ajax({
				url: 'roomResDetail.do',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'JSON',
				data: JSON.stringify({payNum: payNum}),
				error: function(xhr) {
					console.log(xhr.status);
					alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
				},
				success: function(jsonObj) {
					// roomId의 앞 두 자리를 통해 roomFloor 설정
					var roomFloor = String(jsonObj.roomId).substr(0, 2);
					var roomId = jsonObj.roomId;
					var roomInfo = jsonObj.room;
	    			
					$("#payNum").val(jsonObj.payNum);
					$("#roomFloor").val(roomFloor+"층");
	    			
					$("#roomResStatus").val(jsonObj.roomResStatus);
					$("#adultsNum").val(jsonObj.adultsNumStr);
					$("#kidsNum").val(jsonObj.kidsNumStr);
					$("#checkIn").val(jsonObj.checkInStr);
					$("#checkOut").val(jsonObj.checkOutStr);
	    			
					// flatpickr 인스턴스를 가져와서 업데이트
					$("#checkIn").flatpickr().setDate(jsonObj.checkInStr);
					$("#checkOut").flatpickr().setDate(jsonObj.checkOutStr);
	    			
					// flatpickr 인스턴스 생성 시 초기 값 설정
					$("#checkIn").flatpickr({
						defaultDate: jsonObj.checkInStr,
						dateFormat: "Y.m.d"
					});

					$("#checkOut").flatpickr({
						defaultDate: jsonObj.checkOutStr,
						dateFormat: "Y.m.d"
					});
	    			
					$("#engName").val(jsonObj.engName);
					$("#guestPhone").val(jsonObj.guestPhone);
					$("#guestEmail").val(jsonObj.guestEmail);
					$("#guestRequest").val(jsonObj.guestRequest);
					$("#cardName").val(jsonObj.cardName);
					$("#cardNum").val(jsonObj.cardNum);
					$("#payPrice").val(jsonObj.payPriceStr);
					$("#payTime").val(jsonObj.payTimeStr);
	    			
					var checkIn = $("#checkIn").val();
					var checkOut = $("#checkOut").val();
					
					$.ajax({
						url: 'roomInfo.do',
						type: 'POST',
						contentType: 'application/json',
						dataType: 'JSON',
						data: JSON.stringify({checkIn : checkIn, checkOut : checkOut}),
						error: function(xhr) {
							console.log(xhr.status);
							alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
							},
						success: function(jsonObj) {
							$("#roomInfo").empty();
							var roomFlag = false;
							jsonObj.forEach(function(room) {
								if(room.roomId == roomId) {
									roomFlag = true;
								} // end if
								
								$("#roomInfo").append("<option value=\"" + room.roomId + "\">" + room.roomInfo + "</option>");
							})
							
							if(roomFlag == false) {
								$("#roomInfo").append("<option value=\"" + roomId + "\">" + roomId + "호(" + roomInfo + ")" + "</option>");
							} // end if
							
							sortSelectOptions();
							$("#roomInfo").val(roomId);
						}
					}); // ajax
				}
			}); // ajax
		} // loadData
		
		// 셀렉 옵션 정렬 함수
		function sortSelectOptions() {
			var selectElement = $("#roomInfo");
			var options = selectElement.find('option');
			
			// 옵션을 값 기준으로 정렬
			options.sort(function(a, b){
				return a.value.localeCompare(b.value); // 문자열 비교에 따라 정렬
			})
			
			selectElement.html('').append(options);
		} // sortSelectOptions
		
		// 셀렉 값 변할 때 층 바꾸는 함수
		$(document).on('change', '#roomInfo', function() {
			// roomId의 앞 두 자리를 통해 roomFloor 설정
			var roomId = $("#roomInfo").val();
			var roomFloor = roomId.substr(0, 2);
			$("#roomFloor").val(roomFloor + "층");
		}); // change
	 	
	 	// 확인 모달창 불러오기
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

	    // 예약 수정 버튼 클릭 시
	    $('#chkUpdateBtn').on('click', function() {
	        showModal('예약 수정 확인', '예약 정보를 수정하시겠습니까?', '예', function() {
	        	var roomResStatus = $("#roomResStatus").val();
	        	
	        	if(roomResStatus !== 'RESERVED') {
	    			alert("예약 수정은 예약(RESERVED) 상태에서만 가능합니다.");
	    			return;
	    		} // end if
	        	
	            updateAction();
	        });
	    });
	    
	    // 체크인 처리 버튼 클릭 시
	    $("#chkCheckinBtn").on('click', function() {
	    	showModal('체크인 확인', '체크인 처리하시겠습니까?', '예', function() {
	    		var roomResStatus = $("#roomResStatus").val();
	    		var checkIn = new Date($("#checkIn").val());
	    		var today = new Date();
	    		
	    		if(roomResStatus !== 'RESERVED') {
	    			alert("체크인 처리는 예약(RESERVED) 상태에서만 가능합니다.");
	    			return;
	    		} // end if
	    		
	    		if(checkIn !== today) {
	    			alert("체크인 가능한 날짜가 아닙니다.");
	    			return;
	    		} // end if
	    		
	    		checkinAction();
	    	});
	    });
	 	
	 	// 체크아웃 처리 버튼 클릭 시
	    $('#chkCheckoutBtn').on('click', function() {
	        showModal('체크아웃 확인', '체크아웃 처리하시겠습니까?', '예', function() {
	        	var roomResStatus = $("#roomResStatus").val();
	        	
	        	if(roomResStatus !== 'CHECK IN') {
	        		alert("체크아웃 처리는 체크인 상태에서만 가능합니다.");
	        		return;
	        	} // end if
	        	
	            checkoutAction();
	        });
	    });
	 	
	 	// 예약 취소 버튼 클릭 시
	    $('#chkCancelBtn').on('click', function() {
	        showModal('예약 취소 확인', '예약을 취소처리하시겠습니까?', '예', function() {
				var roomResStatus = $("#roomResStatus").val();
	    		
	    		if(roomResStatus !== 'RESERVED') {
	    			alert("예약 취소는 예약(RESERVED) 상태에서만 가능합니다.");
	    			return;
	    		} // end if
	        	
	        	cancelAction();
	        });
	    });
	 	
	 	// 모달이 닫혔을 때 데이터 테이블 다시 로드
	 	$("#roomResDetail").on('hidden.bs.modal', function() {
	 		$("#table1").DataTable().ajax.reload(null, false); // false는 페이징 유지
	 	});

	 	// 예약 정보 수정 처리 함수
	    function updateAction() {
	 		// 모달 내 체크되어 있는 상세 정보 가공
	 		var payNum = $("#payNum").val();
	    	var roomId = $("#roomInfo").val();
	    	var guestPhone = $("#guestPhone").val();
	    	var guestEmail = $("#guestEmail").val();
	    	var guestRequest = $("#guestRequest").val();
	    	
	    	if(guestPhone === '') {
	    		alert("예약자의 연락처를 입력해주세요.");
	    		return;
	    	} // end if
	    	
	    	var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{4}$/;
	    	
	    	if(!patternPhone.test(guestPhone)) {
	    		alert("연락처의 형식(010-1234-5678)을 확인해주세요.");
	    		return;
	    	} // end if
	    	
	    	if(guestEmail === '') {
	    		alert("예약자의 이메일을 입력해주세요.");
	    		return;
	    	} // end if
	    	
	    	var patternEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	    	
	    	if(guestEmail.length < 6 || !patternEmail.test(guestEmail)) {
	    		alert("이메일 형식이 맞지 않습니다. 확인해주세요.");
	    		return;
	    	} // end if
	    	
	    	var roomResVO = {
	    		payNum: payNum,
	    		roomId: roomId,
	    		guestPhone: guestPhone,
	    		guestEmail: guestEmail,
	    		guestRequest: guestRequest
	    	}
	    	
	    	$.ajax({
	    		url: 'modifyRoomRes.do',
	    		type: 'POST',
	    		contentType: 'application/json',
	    		dataType: 'JSON',
	    		data: JSON.stringify(roomResVO),
	    		error: function(xhr) {
	    			console.log(xhr.status);
	    			alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
	    		},
	    		success: function(jsonObj) {
	    			alert("예약 정보가 정상적으로 수정되었습니다.");
	    		}
	    	}); // ajax
	    } // updateAction
	    
	    // 체크인 처리 함수
	    function checkinAction() {
	    	var payNum = $("#payNum").val();
			$.ajax({
				url: 'checkin.do',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'JSON',
				data: JSON.stringify({payNum : payNum}),
				error: function(xhr) {
					console.log(xhr.status);
					alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
				},
				success: function(jsonObj) {
		            alert("체크인 처리되었습니다.");
					loadData(payNum);
				},
				complete: function() {
					$("#roomResStatus").load(location.href + ' #roomResStatus');
				}
			}); // ajax
	    } // checkinAction
	    
	    // 체크아웃 처리 함수
	    function checkoutAction() {
	    	var payNum = $("#payNum").val();
			$.ajax({
				url: 'checkout.do',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'JSON',
				data: JSON.stringify({payNum : payNum}),
				error: function(xhr) {
					console.log(xhr.status);
					alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
				},
				success: function(jsonObj) {
		            alert("체크아웃 처리되었습니다.");
		            loadData(payNum);
				},
				complete: function() {
					$("#roomResStatus").load(location.href + ' #roomResStatus');
				}
			}); // ajax
	    } // checkoutAction

	    // 예약 취소 처리 함수
	    function cancelAction() {
	    	var payNum = $("#payNum").val();
			$.ajax({
				url: 'cancelRes.do',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'JSON',
				data: JSON.stringify({payNum : payNum}),
				error: function(xhr) {
					console.log(xhr.status);
					alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
				},
				success: function(jsonObj) {
		            alert("예약 취소 처리되었습니다.");
		            loadData(payNum);
				},
				complete: function() {
					$("#roomResStatus").load(location.href + ' #roomResStatus');
				}
			}); // ajax
	    } // cancelAction
	 	
		// 동적으로 생성된 input type="text"에 flatpickr 스크립트 파일을 적용하기 위해 파일 추가
		$.getScript("/hotel_prj/admin/assets/extensions/flatpickr/flatpickr.min.js")
		.done(function() {
			// flatpickr 스크립트 파일이 로드된 후에 initFlatpickr 함수 실행
			initFlatpickr();
		}).fail(function() {
			console.error("flatpickr 스크립트 파일을 불러올 수 없습니다.");
		});

		// flatpickr 스크립트 파일을 추가한 후에 실행될 함수 정의
		function initFlatpickr() {
			flatpickr('#toDate', {
				enableTime: false,
				dateFormat: "Y.m.d",
			});

			flatpickr('#fromDate', {
				enableTime: false,
				dateFormat: "Y.m.d",
			});
		} // initFlatpickr
		
	}); // ready
	
</script>
<script src="/hotel_prj/admin/assets/extensions/flatpickr/flatpickr.min.js"></script>
<script src="/hotel_prj/admin/assets/static/js/pages/date-picker.js"></script>
</body>
</html>