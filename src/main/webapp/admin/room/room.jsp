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
<link rel="shortcut icon"
	href="/hotel_prj/admin/assets/static/images/logo/favicon.ico"
	type="image/x-icon">
<!-- favicon E -->

<!-- template css S -->
<link rel="stylesheet" crossorigin
	href="/hotel_prj/admin/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin
	href="/hotel_prj/admin/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin
	href="/hotel_prj/admin/assets/compiled/css/iconly.css">
<!-- template css E -->

<!-- jQuery CDN S -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN E -->

<style type="text/css">
<!-- /*grid to table*/
.grid-thead {
	display: grid;
	grid-template-columns: 5% 45% 10% 10% 10% 10% 10%;
}

.grid-tbody {
	display: grid;
	grid-template-columns: 5% 45% 10% 10% 10% 10% 10%;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".sidebar-item.rm").addClass("active");

		$(document).on('click', '.sidebar-item', function() {
			// 모든 .sidebar-item 요소에서 active 클래스 제거
			$(".sidebar-item").removeClass("active");

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
							<h3>객실 관리</h3>
							<p class="text-subtitle text-muted">Powerful interactive
								tables with datatables (jQuery required).</p>
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
												<th>Num</th>
												<th>Name</th>
												<th>Email</th>
												<th>Phone</th>
												<th>City</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>1</th>
												<td>김무영</td>
												<td>vehicula.aliquet@semconsequat.co.uk</td>
												<td>076 4820 8838</td>
												<td>Offenburg</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>2</th>
												<td>이주희</td>
												<td>fringilla.euismod.enim@quam.ca</td>
												<td>0500 527693</td>
												<td>New Quay</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>3</th>
												<td>윤웅찬</td>
												<td>mi.Duis@diam.edu</td>
												<td>(012165) 76278</td>
												<td>Grumo Appula</td>
												<td><span class="badge bg-danger">Inactive</span></td>
											</tr>
											<tr>
												<th>4</th>
												<td>이조희</td>
												<td>velit@nec.com</td>
												<td>0309 690 7871</td>
												<td>Ways</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>

											<tr>
												<th>5</th>
												<td>Oleg</td>
												<td>rhoncus.id@Aliquamauctorvelit.net</td>
												<td>0500 441046</td>
												<td>Rossignol</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>6</th>
												<td>Kermit</td>
												<td>diam.Sed.diam@anteVivamusnon.org</td>
												<td>(01653) 27844</td>
												<td>Patna</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>7</th>
												<td>Jermaine</td>
												<td>sodales@nuncsit.org</td>
												<td>0800 528324</td>
												<td>Mold</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>8</th>
												<td>Ferdinand</td>
												<td>gravida.molestie@tinciduntadipiscing.org</td>
												<td>(016977) 4107</td>
												<td>Marlborough</td>
												<td><span class="badge bg-danger">Inactive</span></td>
											</tr>
											<tr>
												<th>9</th>
												<td>Kuame</td>
												<td>Quisque.purus@mauris.org</td>
												<td>(0151) 561 8896</td>
												<td>Tresigallo</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>10</th>
												<td>Deacon</td>
												<td>Duis.a.mi@sociisnatoquepenatibus.com</td>
												<td>07740 599321</td>
												<td>Karapınar</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>11</th>
												<td>Channing</td>
												<td>tempor.bibendum.Donec@ornarelectusante.ca</td>
												<td>0845 46 49</td>
												<td>Warrnambool</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>12</th>
												<td>Aladdin</td>
												<td>sem.ut@pellentesqueafacilisis.ca</td>
												<td>0800 1111</td>
												<td>Bothey</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>13</th>
												<td>Cruz</td>
												<td>non@quisturpisvitae.ca</td>
												<td>07624 944915</td>
												<td>Shikarpur</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>14</th>
												<td>Keegan</td>
												<td>molestie.dapibus@condimentumDonecat.edu</td>
												<td>0800 200103</td>
												<td>Assen</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>15</th>
												<td>Ray</td>
												<td>placerat.eget@sagittislobortis.edu</td>
												<td>(0112) 896 6829</td>
												<td>Hofors</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>16</th>
												<td>Maxwell</td>
												<td>diam@dapibus.org</td>
												<td>0334 836 4028</td>
												<td>Thane</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>17</th>
												<td>Carter</td>
												<td>urna.justo.faucibus@orci.com</td>
												<td>07079 826350</td>
												<td>Biez</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>18</th>
												<td>Stone</td>
												<td>velit.Aliquam.nisl@sitametrisus.com</td>
												<td>0800 1111</td>
												<td>Olivar</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>19</th>
												<td>Berk</td>
												<td>fringilla.porttitor.vulputate@taciti.edu</td>
												<td>(0101) 043 2822</td>
												<td>Sanquhar</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>20</th>
												<td>Philip</td>
												<td>turpis@euenimEtiam.org</td>
												<td>0500 571108</td>
												<td>Okara</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>21</th>
												<td>Kibo</td>
												<td>feugiat@urnajustofaucibus.co.uk</td>
												<td>07624 682306</td>
												<td>La Cisterna</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>22</th>
												<td>Bruno</td>
												<td>elit.Etiam.laoreet@luctuslobortisClass.edu</td>
												<td>07624 869434</td>
												<td>Rocca d"Arce</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>23</th>
												<td>Leonard</td>
												<td>blandit.enim.consequat@mollislectuspede.net</td>
												<td>0800 1111</td>
												<td>Lobbes</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>24</th>
												<td>Hamilton</td>
												<td>mauris@diam.org</td>
												<td>0800 256 8788</td>
												<td>Sanzeno</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>25</th>
												<td>Harding</td>
												<td>Lorem.ipsum.dolor@etnetuset.com</td>
												<td>0800 1111</td>
												<td>Obaix</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
											<tr>
												<th>26</th>
												<td>Emmanuel</td>
												<td>eget.lacus.Mauris@feugiatSednec.org</td>
												<td>(016977) 8208</td>
												<td>Saint-Remy-Geest</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</section>
				</div>


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

	<!--  추가 Script S -->
	<script src="/hotel_prj/admin/assets/extensions/jquery/jquery.min.js"></script>
	<script
		src="/hotel_prj/admin/assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/hotel_prj/admin/assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
	<script src="/hotel_prj/admin/assets/static/js/pages/datatables.js"></script>
	<!--  추가 Script E -->
</body>
</html>