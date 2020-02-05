<!-- ...201p. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<!-- 첨부파일 업로드 css -->
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
   .popup {position: absolute;}
   .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
   .front { 
      z-index:1110; opacity:1; boarder:1px; margin: auto; 
     }
    .show{
      position:relative;
      max-width: 1200px; 
      max-height: 800px; 
      overflow: auto;       
    }   	
</style>
<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;">
 <img id="popup_img">
</div>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">UPDATE Member</h3>
				</div>
				<!-- /.box-header -->

<!-- 202p. form::action 속성이 지정되지 않으면 현재 경로를 그대로 action의 대상 경로로 잡음. -->
<form role="form" method="post">
	<!-- 페이지 넘버링 처리 -->
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<!-- 페이지 검색 처리 
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">
	-->
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">user_id</label><br>
			<c:out value="${memberVO.user_id}" />
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">user_pw</label> 
			<input type="text"
				name='user_pw' class="form-control" placeholder="Enter user_pw" value="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">user_name</label> 
			<input type="text"
				name="user_name" class="form-control" placeholder="Enter user_name" value="${memberVO.user_name}">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">email</label> 
			<input type="text"
				name="email" class="form-control" placeholder="Enter email" value="${memberVO.email}">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">point</label> 
			<input type="text"
				name="point" class="form-control" placeholder="Enter point" value="${memberVO.point}">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">enabled</label><br>
			<select name="enabled">
				<option value="0"
					<c:out value="${memberVO.enabled eq 'false'?'selected':''}"/>>
					false
				</option>
				<option value="1"
					<c:out value="${memberVO.enabled eq 'true'?'selected':''}"/>>
					true
				</option>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">level</label><br>
			<select name="level">
				<option value="ROLE_USER"
					<c:out value="${memberVO.level eq 'ROLE_USER'?'selected':''}"/>>
					ROLE_USER
				</option>
				<option value="ROLE_ADMIN"
					<c:out value="${memberVO.level eq 'ROLE_ADMIN'?'selected':''}"/>>
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
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		/*
		$(".btn-warning").on("click", function(){
			formObj.submit();
		});
		*/
		formObj.submit(function(event){
			event.preventDefault();
			var that = $(this);
			that.get(0).submit();
		});
		/*
		$(".btn-primary").on("click", function(){
			self.location = "/admin/board/listAll";
		});
		*/
		$(".btn-primary").on("click", function(){
			self.location = "/admin/member/listAll?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";//검색기능 추가
		});
	});
</script>

<%@include file="../include/footer.jsp"%>