<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ Member</h3>
				</div>
				<!-- /.box-header -->

<form role="form" method="post">
	<!-- 
		...220p.나중에 수정, 삭제 작업에 사용되므로 반드시 원래 게시물 번호인 bno를
		...가지고 있도록 hidden속성으로 user_id값을 처리함.
	 -->
	<input type='hidden' name='user_id' value="${memberVO.user_id}">
	<!-- 페이지 넘버링 처리 -->
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<!-- 페이지 검색 처리 -->
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">
</form>

<div class="box-body">
	<div class="form-group">
			<label for="exampleInputEmail1">user_id</label> 
			<br><c:out value="${memberVO.user_id}"></c:out>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">user_name</label> 
			<br><c:out value="${memberVO.user_name}"></c:out>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">email</label> 
			<br><c:out value="${memberVO.email}"></c:out>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">point</label> 
			<br><c:out value="${memberVO.point}"></c:out>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">enabled</label> 
			<br><c:out value="${memberVO.enabled}"></c:out>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">level</label> 
			<br><c:out value="${memberVO.level}"></c:out>
		</div>
</div>
<!-- /.box-body -->
<ul class="mailbox-attachments clearfix uploadedList"></ul>
<div class="box-footer">
	<button type="submit" class="btn btn-warning" id="modifyBtn">UPDATE</button>
	<button type="submit" class="btn btn-danger" id="deleteBtn">DELETE</button>
	<button type="submit" class="btn btn-primary" id="listBtn">LIST ALL</button>
</div>

<!-- 
	...222p.$("form[role='form']")로 선언된 formObj는 <form>태그를 의미함.
	...$(".btn-warning")이벤트 처리는 수정할 수 있는 페이지로 이동하도록 <form>태그 속성을
	...수정하고 전송하게 함.
 -->
<script>				
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//$(".btn-warning").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#modifyBtn").on("click", function(){
			formObj.attr("action", "/admin/member/update");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
		//$(".btn-danger").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#deleteBtn").on("click", function(){
			var replyCnt =  $("#reply_countSmall").html();		
			//alert("replyCnt : "+ replyCnt);
			if(replyCnt > 0 ){
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}	
			var arr = [];
			$(".uploadedList li").each(function(index){
				 arr.push($(this).attr("data-src"));
			});
			if(arr.length > 0){
				$.post("/deleteAllFiles",{files:arr}, function(){
					
				});
			}
			formObj.attr("action", "/admin/member/delete");
			formObj.submit();
		});
		
		//$(".btn-primary").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#listBtn").on("click", function(){
			//self.location = "/admin/member/listAll";
			formObj.attr("action", "/admin/member/listAll");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
	});
</script>


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

<%@include file="../include/footer.jsp"%>
