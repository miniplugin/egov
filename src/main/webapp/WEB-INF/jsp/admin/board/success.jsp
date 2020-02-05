<!-- ...203p. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
<!-- left column -->
<div class="col-md-12">
	<!-- general form elements -->

	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">SUCCESS PAGE</h3>
		</div>
		<div class="box-body">${msg}!!!</div>
		<!-- /.box-body -->
		<div class="box-footer">
			<button type="button" class="btn btn-primary">LIST ALL</button>
		</div>
		<!-- /.box-footer-->
	</div>
</div>
<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>				
	$(document).ready(function(){
			
		$(".btn-primary").on("click", function(){
			self.location = "/admin/board/listAll";
		});
		
	});
</script>
<%@include file="../include/footer.jsp"%>