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
					<h3 class="box-title">게시판 검색</h3>
				</div>
				<div class='box-body'>
					<!-- 
						...310p.
						value / 의미
						n / 검색조건 없음.
						t / 제목으로 검색.
						c / 내용으로 검색.
						w / 작성자로 검색.
						tc / 제목 or 내용으로 검색.
						cw / 내용 or 작성자로 검색.
						tcw / 제목 or 내용 or 작성자로 검색. 
						테스트URI: listAll?page=3&perPageNum=10&searchType=t&keyword=홈페이지
					-->
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---
						</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title
						</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content
						</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer
						</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content
						</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer
						</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer
						</option>
					</select>
					
					<input type="text" name='keyword' id="keywordInput"
										value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='newBtn'>새글쓰기</button>

				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>


<c:forEach items="${list}" var="boardVO">

	<tr>
		<td>${boardVO.bno}</td>
		<td><a href='/admin/board/read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}&nbsp;<strong>[ ${boardVO.reply_count} ]</strong></a></td>
		<td>${boardVO.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regdate}" /></td>
		<td><span class="badge bg-red">${boardVO.view_count }</span></td>
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
								<a href="/admin/board/listAll?page=${pageMaker.startPage - 1}">&laquo;</a>
								<a href="/admin/board/listAll${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a>
								-->
								<a href="/admin/board/listAll${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
							</li>
						</c:if>
	
						<c:forEach begin="${pageMaker.startPage }"
								   end="${pageMaker.endPage }" 
								   var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<!-- 
								<a href="/admin/board/listAll?page=${idx}">${idx}</a>
								<a href="/admin/board/listAll${pageMaker.makeQuery(idx)}">${idx}</a>
								-->
								<a href="/admin/board/listAll${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li>
								<!-- 
								<a href="/admin/board/listAll?page=${pageMaker.endPage + 1}">&raquo;</a>
								<a href="/admin/board/listAll${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
								-->
								<a href="/admin/board/listAll${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
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
			self.location = "/admin/board/create";
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