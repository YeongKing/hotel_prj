<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
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