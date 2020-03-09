<%--
  Class Name : AuthorRoleRegist.jsp
  Description : 권한 생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.03.09  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value='/js/EgovMultiFiles.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="authorRole" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectAuthorRoleList() {
    var varFrom = document.getElementById("authorRole");
    varFrom.action = "<c:url value='/admin/authorrole/selectAuthorRoleList.do'/>";
    varFrom.submit();       
}

function fncAuthorRoleInsert() {
    var varFrom = document.getElementById("authorRole");
    varFrom.action = "<c:url value='/admin/authorrole/addAuthorRole.do'/>";

    if(confirm("저장 하시겠습니까?")){/*  */
        if(!validateAuthorRole(varFrom)){           
            return;
        }else{
           varFrom.submit();
        } 
    }
}

function fncAuthorRoleDelete() {
    var varFrom = document.getElementById("authorRole");
    varFrom.action = "<c:url value='/admin/authorrole/removeAuthorRole.do'/>";
    if(confirm("삭제 하시겠습니까?")){/*  */
        varFrom.submit();
    }
}

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">권한 관리 등록</h3><!-- -->
				</div>
				<!-- /.box-header -->

			<form:form commandName="authorRole" method="post" action="${pageContext.request.contextPath}/admin/authorrole/addAuthorRole.do' />">
       		<input type="hidden" name="authorRoleId" value="1" />
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="rolePttrn">권한패턴 <span class="pilsu">*</span></label><!--  -->
					
                    <input class="form-control" id="rolePttrn" type="text" name="rolePttrn" value="<c:out value='${authorRole.rolePttrn}'/>" title="권한패턴" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="authorCode">권한코드 <span class="pilsu">*</span></label><!--  -->
					<!-- <input class="form-control" id="authorCode" type="text" name="authorCode" value="<c:out value='${authorRole.authorCode}'/>" title="권한코드" /> -->
					<%-- 기본 forEach 방식 
					<select name="authorCode" id="authorCode" class="form-control">
                        <option value="" label="--선택하세요--"/>
                        <c:forEach var="groupId" items="${groupId_result}" varStatus="status">
                        	<option value="${groupId.codeNm}" ${groupId.codeNm == authorRole.authorCode ? 'selected="selected"' : '' }>${groupId.codeNm}</option>
                        </c:forEach>
                    </select>
                   --%>
                   <form:select path="authorCode" id="authorCode" class="form-control">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="codeNm" itemLabel="codeNm"/>
                   </form:select>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="authorRoleDc">권한설명 <span class="pilsu">*</span></label><!--  -->
					<input class="form-control" id="authorRoleDc" type="text" name="authorRoleDc" value="<c:out value='${authorRole.authorRoleDc}'/>" title="권한설명" />
					<form:errors path="authorRoleDc" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="sortOrder">적용순서 <span class="pilsu">*</span></label><!--  -->
					<input class="form-control" id="sortOrder" type="text" name="sortOrder" title="적용순서" value="<c:out value='${authorRole.sortOrder}'/>" maxLength="5" />
					<form:errors path="sortOrder" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="useAt">사용여부 <span class="pilsu">*</span></label><!--  -->
					<select class="form-control" id="useAt" name="useAt" title="사용여부">
						<option value="Y" <c:if test="${authorRole.useAt == 'Y'}">selected</c:if> >Y</option>
						<option value="N" <c:if test="${authorRole.useAt == 'N'}">selected</c:if> >N</option>
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
				 <input class="btn btn-primary" type="submit" value="<spring:message code="button.save" />" onclick="fncAuthorRoleInsert(); return false;" />
				 <a class="btn btn-default" href="<c:url value='/admin/authorrole/selectAuthorRoleList.do'/>?pageIndex=<c:out value='${authorRoleVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${authorRoleVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectAuthorRoleList(); return false;"><spring:message code="button.list" /></a></span>
			</div>
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${authorRoleVO.searchCondition}'/>" >
			<input type="hidden" name="searchKeyword" value="<c:out value='${authorRoleVO.searchKeyword}'/>" >
			<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleVO.pageIndex}'/>" >
			<!-- 검색조건 유지 -->
            </form:form>
            
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<c:import url="/EgovPageLink.do?link=admin/include/footer" />