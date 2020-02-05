<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">멤버 검색</h3>
				</div>
				<div class='box-body'>
					<!-- 
						...310p.
						value / 의미
						n / 검색조건 없음.
						t / user_id로 검색.
						c / user_name으로 검색.
						w / email로 검색.
						tc / user_id or user_name로 검색.
						cw / user_name or email로 검색.
						tcw / 아이디 or 이름 or 이메일로 검색. 
						테스트URI: listAll?page=3&perPageNum=10&searchType=t&keyword=user02
					-->
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---
						</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							user_id
						</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							user_name
						</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							email
						</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							user_id OR user_name
						</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							user_name OR email
						</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							아이디 OR 이름 OR 이메일
						</option>
					</select>
					
					<input type="text" name='keyword' id="keywordInput"
										value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='newBtn'>새사용자등록</button>

				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">user_id</th>
		<th>user_name[point]</th>
		<th>email</th>
		<th>Use</th>
		<th>REGDATE</th>
		<th style="width: 40px">level</th>
	</tr>


<c:forEach items="${list}" var="memberVO">

	<tr>
		<td>${memberVO.user_id}</td>
		<td><a href='/admin/member/read${pageMaker.makeSearch(pageMaker.cri.page)}&user_id=${memberVO.user_id}'>${memberVO.user_name}&nbsp;<strong>[ ${memberVO.point} ]</strong></a></td>
		<td>${memberVO.email}</td>
		<td>${memberVO.enabled}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${memberVO.reg_date}" /></td>
		<td><span class="badge bg-red">${memberVO.level }</span></td>
	</tr>

</c:forEach>

</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">CREATE</button>
				</div>
				
				<div class="text-center">
					<ul class="pagination">
	
						<c:if test="${pageMaker.prev}">
							<li>
								<!-- 
								<a href="/admin/member/listAll?page=${pageMaker.startPage - 1}">&laquo;</a>
								<a href="/admin/member/listAll${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a>
								-->
								<a href="/admin/member/listAll${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
							</li>
						</c:if>
	
						<c:forEach begin="${pageMaker.startPage }"
								   end="${pageMaker.endPage }" 
								   var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<!-- 
								<a href="/admin/member/listAll?page=${idx}">${idx}</a>
								<a href="/admin/member/listAll${pageMaker.makeQuery(idx)}">${idx}</a>
								-->
								<a href="/admin/member/listAll${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li>
								<!-- 
								<a href="/admin/member/listAll?page=${pageMaker.endPage + 1}">&raquo;</a>
								<a href="/admin/member/listAll${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
								-->
								<a href="/admin/member/listAll${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
							</li>
						</c:if>
	
					</ul>
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
	var msg = '${msg}';
	if(msg == "success"){
		alert("처리가 완료되었습니다.");
	}
	$(document).ready(function(){
			
		$(".btn-primary").on("click", function(){
			self.location = "/admin/member/create";
		});
		
	});
</script>
<!-- 
	...319p.PageMaker.makeQuery()를 이용해서 처리함 : makeQuery()는 검색 조건이 없는 상황에서 사용하는 메서드임.
	...즉, 검색조건이 없는 링크를 생성하고, 필요한 링크를 뒤에 연결시키는 방식임.
 -->
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "listAll"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "create";

				});

			});
</script>
<%@include file="../include/footer.jsp"%>