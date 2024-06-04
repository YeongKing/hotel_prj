<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 회원 관리"%>
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
        
       .grid-thead {
            display: grid;
            grid-template-columns: 20% 10% 20% 20% 20% 10%
        } 
        .grid-tbody {
            display: grid;
            grid-template-columns: 20% 10% 20% 20% 20% 10%
        }



</style>

	<script type="text/javascript">
$(document).ready(function() {
    $(".sidebar-item.mm").addClass("active");

    $(document).on('click', '.sidebar-item', function() {
        // 모든 .sidebar-item 요소에서 active 클래스 제거
        $(".sidebar-item").removeClass("active");

        // 클릭된 요소에만 active 클래스 추가
        $(this).addClass("active");
    });

    
    
    
    
    // 테이블의 유저아이디 클릭시
    $(document).on("click", ".userId", function() {
        var userId = $(this).text();
        var userName = $(this).closest('tr').find('.userName').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userPhone = $(this).closest('tr').find('.userPhone').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴
        var userSignUpDate = $(this).closest('tr').find('.userSignUpDate').text(); // 같은 행(row) 내에서 .userName을 찾아 텍스트를 가져옴

        $("#userId").val(userId);
        $("#userName").val(userName);
        $("#userPhone").val(userPhone);
        $("#userSignUpDate").val(userSignUpDate);

        // 이 부분에서 모달이 열리기 전에 모든 'is-invalid' 클래스를 제거합니다.
        // 모달 내의 모든 'is-invalid' 클래스 제거
        $('#userDetail').find('.is-invalid').removeClass('is-invalid');
        
        
        // 모달 내의 모든 'parsley-custom-error-message' 클래스를 가진 span 태그 제거
        $('#userDetail').find('span.parsley-custom-error-message').remove();
        
        
        // Bootstrap 모달 메소드를 사용하여 모달을 보여줍니다.
        $('#userDetail').modal('show');
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
            <td class="userId">아이디${(pageNumber - 1) * 5 + i}</td>
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
	




function deleteUserDetail(){
	var result = confirm("회원정보를 정말로 삭제 하시겠습니까?");

}


</script>



<script type="text/javascript">
    /*---------------주소검색 시작--------------------------------- */
    var themeObj = {
        bgColor: "#162525", //바탕 배경색
        searchBgColor: "#162525", //검색창 배경색
        contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
        pageBgColor: "#162525", //페이지 배경색
        textColor: "#FFFFFF", //기본 글자색
        queryTextColor: "#FFFFFF", //검색창 글자색
        //postcodeTextColor: "", //우편번호 글자색
        //emphTextColor: "", //강조 글자색
        outlineColor: "#444444" //테두리
    };

    //신주소 입력
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userZipCode').value = data.zonecode;
                document.getElementById("userAdress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAdress2").focus();
            }
        }).open();
    }

    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }


    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition() {
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
    }

    /*---------------주소검색 종료--------------------------------- */
</script>
<script>
document.getElementById('userDetailForm').onsubmit = function() {
    
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
							<h3>회원 관리</h3>
							<p class="text-subtitle text-muted">관리자 회원 관리</p>
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
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>가입일자</th>
												<th>최근 로그인 일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>1</th>
												<td><a href="#" class="userId">andud</a></td>
												<td class="userName">김무영</td>
												<td class="userPhone">010-1111-1111</td>
												<td class="userSignUpDate">2024-01-01</td>
												<td class="userLoginDate">2024-06-01 15:37:20</td>
												<!-- <td><span class="badge bg-success">Active</span></td> -->
												<!-- <td><span class="badge bg-danger">Inactive</span></td> -->
											</tr>
											<tr>
												<th>2</th>
												<td><a href="#" class="userId">wngml</a></td>
												<td class="userName">이주희</td>
												<td class="userPhone">010-1111-1112</td>
												<td class="userSignUpDate">2024-01-03</td>
												<td class="userLoginDate">2024-06-01 16:37:30</td>
											</tr>
											<tr>
												<th>3</th>
												<td><a href="#" class="userId">dndcks</a></td>
												<td class="userName">윤웅찬</td>
												<td class="userPhone">010-1111-1113</td>
												<td class="userSignUpDate">2024-01-05</td>
												<td class="userLoginDate">2024-06-01 17:37:24</td>
											</tr>
											<tr>
												<th>4</th>
												<td><a href="#" class="userId">whgml</a></td>
												<td class="userName">이조희</td>
												<td class="userPhone">010-1111-1114</td>
												<td class="userSignUpDate">2024-01-07</td>
												<td class="userLoginDate">2024-06-01 18:37:28</td>
											</tr>

											<tr>
												<th>5</th>
												<td><a href="#" class="userId">cksdbs</a></td>
												<td class="userName">웅찬윤</td>
												<td class="userPhone">010-2222-1111</td>
												<td class="userSignUpDate">2024-01-09</td>
												<td class="userLoginDate">2024-06-01 19:37:21</td>
											</tr>
											<tr>
												<th>6</th>
												<td><a href="#" class="userId">anzld</a></td>
												<td class="userName">영무킹</td>
												<td class="userPhone">010-1111-2323</td>
												<td class="userSignUpDate">2024-01-20</td>
												<td class="userLoginDate">2024-06-01 20:37:37</td>
											</tr>
											<tr>
												<th>7</th>
												<td><a href="#" class="userId">alsths</a></td>
												<td class="userName">지민손</td>
												<td class="userPhone">010-1134-1111</td>
												<td class="userSignUpDate">2024-02-01</td>
												<td class="userLoginDate">2024-06-01 11:37:50</td>
											</tr>
											<tr>
												<th>8</th>
												<td><a href="#" class="userId">wlals</a></td>
												<td class="userName">손지민</td>
												<td class="userPhone">010-1445-1131</td>
												<td class="userSignUpDate">2024-02-05</td>
												<td class="userLoginDate">2024-06-01 13:37:29</td>
											</tr>
											<tr>
												<th>9</th>
												<td><a href="#" class="userId">Tkddyd</a></td>
												<td class="userName">쌍용</td>
												<td class="userPhone">010-1321-1671</td>
												<td class="userSignUpDate">2024-03-04</td>
												<td class="userLoginDate">2024-06-01 17:37:30</td>
											</tr>
											<tr>
												<th>10</th>
												<td><a href="#" class="userId">dydTkd</a></td>
												<td class="userName">용쌍</td>
												<td class="userPhone">010-1871-1651</td>
												<td class="userSignUpDate">2024-03-01</td>
												<td class="userLoginDate">2024-06-01 18:37:13</td>
											</tr>
											<tr>
												<th>11</th>
												<td><a href="#" class="userId">rlfehd</a></td>
												<td class="userName">홍길동</td>
												<td class="userPhone">010-2341-1511</td>
												<td class="userSignUpDate">2024-05-02</td>
												<td class="userLoginDate">2024-06-01 19:37:10</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

					</section>
				</div>
				<!-- 수정 모달창 S-->
				<div class="modal fade text-left modal-borderless modal-xl "
					id="userDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">회원 상세조회</h5>
								<div class="d-flex justify-content-end">
                                <button type="button" id="chkDeleteBtn" class="btn btn-danger">
                                    <i class="bx bx-x d-block d-sm-none"></i> 
                                    <span class="d-none d-sm-block">회원정보 삭제</span>
                                </button>
									<!-- 				                <button type="button" class="close rounded-pill" data-bs-dismiss="modal"
				                        aria-label="Close">
				                    <i data-feather="x"></i>
				                </button> -->

								</div>
							</div>
							<form id = "userDetailForm" action="#"  class="form px-5" data-parsley-validate>
								<div class="row">
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userId">아이디</label> 
											<input type="text"
												id="userId" class="form-control"
												name="userId" placeholder="아이디" Disabled>

										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userEmail">이메일</label> 
											<input
						                        type="text"
						                        id="userEmail"
						                        class="form-control"
						                        placeholder="test@test.test"
						                        name="userEmail"
						                        data-parsley-required="true"
						                        data-parsley-type="email"
						                        data-parsley-error-message="유효한 이메일 주소를 입력하세요."
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userName">이름</label> 
											<input
						                        type="text"
						                        id="userName"
						                        class="form-control"
						                        placeholder="이름"
						                        name="userName"
						                        data-parsley-required="true"
						                        data-parsley-error-message="회원명은 필수 입력입니다."
						                     />
												
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userGender">성별</label>
											 <input type="text"
												id="userGender" class="form-control" Disabled
												name="userGender" placeholder="성별">
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userEnLastName">영문 성</label>
											<input
						                        type="text"
						                        id="userEnLastName"
						                        class="form-control"
						                        placeholder="영문 성"
						                        name="userEnLastName"
						                        data-parsley-required="true"
						                        data-parsley-error-message="영문 성은 필수 입력입니다."
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userEnFirstName">영문 이름</label>
											<input
						                        type="text"
						                        id="userEnFirstName"
						                        class="form-control"
						                        placeholder="영문 이름"
						                        name="userEnFirstName"
						                        data-parsley-required="true"
						                        data-parsley-error-message="영문 이름은 필수 입력입니다."
						                     />
										</div>
									</div>

									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userZipCode">우편번호</label>
											<input
						                        type="text"
						                        id="userZipCode"
						                        class="form-control"
						                        placeholder="클릭시 우편번호 검색"
						                        name="userZipCode"
						                        data-parsley-required="true"
						                        data-parsley-error-message="우편번호는 필수 입력입니다."
						                     	readonly
						                     	onclick="execDaumPostcode()"/>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userPhone">전화번호</label>
											<input
						                        type="text"
						                        id="userPhone"
						                        class="form-control"
						                        placeholder="000-0000-0000"
						                        name="userPhone"
						                        data-parsley-required="true"
						                        data-parsley-error-message="전화번호는 필수 입력입니다."
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userAdress1">주소</label>
											<input
						                        type="text"
						                        id="userAdress1"
						                        class="form-control"
						                        placeholder="주소"
						                        name="userAdress1"
						                        data-parsley-required="true"
						                        data-parsley-error-message="주소는 필수 입력입니다."
						                        Disabled
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
										
											<label for="userBirthday">생년월일</label>
											 <input type="date"
												id="userBirthday" class="form-control" name="userBirthday"
												placeholder="생년월일" Disabled>
												
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userAdress2">상세주소</label>
											<input
						                        type="text"
						                        id="userAdress2"
						                        class="form-control"
						                        placeholder="상세주소"
						                        name="userAdress2"
						                        data-parsley-required="true"
						                        data-parsley-error-message="상세주소는 필수 입력입니다."
						                       
						                     />
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="userSignUpDate">가입일자</label> 
											<input type="date"
												id="userSignUpDate" class="form-control"
												name="userSignUpDate" placeholder="가입일자" Disabled>
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

				<!-- 수정 모달창 E -->>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 추가 Script E -->






</body>
</html>