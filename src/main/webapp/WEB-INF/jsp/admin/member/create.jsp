<!-- ...201p. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">CREATE Member</h3>
				</div>
				<!-- /.box-header -->

<!-- 202p. form::action 속성이 지정되지 않으면 현재 경로를 그대로 action의 대상 경로로 잡음. -->
<form role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">user_id</label>
			<input type="text"
				name='user_id' class="form-control" placeholder="Enter user_id" value="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">user_pw</label> 
			<input type="text"
				name='user_pw' class="form-control" placeholder="Enter user_pw" value="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">user_name</label> 
			<input type="text"
				name="user_name" class="form-control" placeholder="Enter user_name" value="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">email</label> 
			<input type="text"
				name="email" class="form-control" placeholder="Enter email" value="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">point</label> 
			<input type="text"
				name="point" class="form-control" placeholder="Enter point" value="0">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">enabled</label><br>
			<select name="enabled">
				<option value="0">
					false
				</option>
				<option value="1">
					true
				</option>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">level</label><br>
			<select name="level">
				<option value="ROLE_USER">
					ROLE_USER
				</option>
				<option value="ROLE_ADMIN">
					ROLE_ADMIN
				</option>
			</select>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		<button type="submit" class="btn btn-warning">Submit</button>
		<button type="button" class="btn btn-primary">LIST ALL</button>
	</div>
</form>


			</div>
			<!-- /.box -->
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
			self.location = "/admin/member/listAll";
		});
		
	});
</script>

<script>
var formObj = $("form[role='form']");
formObj.submit(function(event){
	event.preventDefault();
	var that = $(this);
	that.get(0).submit();
});
</script>
<%@include file="../include/footer.jsp"%>