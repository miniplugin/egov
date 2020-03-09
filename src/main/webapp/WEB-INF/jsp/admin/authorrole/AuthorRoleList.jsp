<%--
  Class Name : AuthorRoleList.java
  Description : 권한관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.03.02  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javaScript" language="javascript" defer="defer">
function fncSelectAuthorRoleList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/admin/authorrole/selectAuthorRoleList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(authorRoleId) {
    document.listForm.authorRoleId.value = authorRoleId;
    document.listForm.action = "<c:url value='/admin/authorrole/getAuthorRole.do'/>";
    document.listForm.submit();
}

function fncAddAuthorRoleInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/admin/authorrole/addViewAuthorRole.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/admin/authorrole/selectAuthorRoleList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorRoleList('1');
    }
}
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="listForm" action="<c:url value='/admin/authorrole/selectAuthorRoleList.do'/>" method="post">
    <input type="hidden" name="authorRoleId" value="0" />
	<input type="hidden" name="pageIndex" value="<c:if test="${empty authorRoleVO.pageIndex }">1</c:if><c:if test="${!empty authorRoleVO.pageIndex }"><c:out value='${authorRoleVO.pageIndex}'/></c:if>">
	<input type="hidden" name="searchCondition" value="1">
    
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">권한관리 목록</h3><!--  -->
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-2">
						<label for="searchKeyword">권한코드 : </label><!--  -->
					</div>
					<div class="col-sm-6">
						<input class="vat form-control" id="searchKeyword" name="searchKeyword" type="text" value="<c:out value="${authorRoleVO.searchKeyword}"/>" onkeypress="press();" title="검색어" /><!--  -->
                    </div>
                    <div class="col-sm-4">
                    <input class="btn btn-default" type="submit" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" />" onclick="fncSelectAuthorRoleList('1'); return false;" />
					<a class="btn btn-default" href="<c:url value='/admin/authorrole/addViewAuthorRole.do'/>?pageIndex=<c:out value='${authorRoleVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${authorRoleVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddAuthorRoleInsert(); return false;" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a>
                    </div>
                    </div>
				</div>
			</div>
			<div class="box">
				<div class="box-body">
				
				<table class="table table-bordered">
					<tr>
	                   <th>권한 패턴</th><!--  -->
	                   <th>권한 코드</th><!--  -->
					   <th>권한 설명</th><!--  -->
					   <th>사용</th><!--  -->
					   <th>순위</th><!--  --> 
					</tr>
				
				<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
				<c:if test="${fn:length(authorRoleList) == 0}">
                <tr> 
                      <td colspan="5">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
				<tr>
					<td>
						<a href="#LINK" onclick="fncSelectAuthorRole('<c:out value="${authorRole.authorRoleId}"/>'); return false;">
						<c:out value="${authorRole.rolePttrn}"/>
						</a>
					</td><!-- 권한 패턴 -->
					<td class="left"><c:out value="${authorRole.authorCode}"/></td><!-- 권한 코드 -->
					<td><c:out value="${authorRole.authorRoleDc}"/></td><!-- 권한 설명 -->
					<td><c:out value="${authorRole.useAt}"/></td><!-- 사용 여부 -->
					<td><c:out value="${authorRole.sortOrder}"/></td><!-- 적용 순서 -->
				</tr>
				</c:forEach>
				</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a class="btn btn-primary" href="<c:url value='/admin/authorrole/addViewAuthorRole.do'/>?pageIndex=<c:out value='${authorRoleVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${authorRoleVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddAuthorRoleInsert(); return false;" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	                </ul>
	                </div> 
				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
	</form>    
    <!-- form end -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<c:import url="/EgovPageLink.do?link=admin/include/footer" />