<%--
  Class Name : UserManage.jsp
  Description : 사용자관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.07  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript">
function fnCheckAll() {
    var checkField = document.listForm.checkField;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}
function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/admin/member/MberDelete.do'/>";
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
	document.listForm.selectedId.value = id;
	array = id.split(":");
	if(array[0] == "") {
	} else {
	    userTy = array[0];
	    userId = array[1];    
	}
	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/admin/member/MberSelectUpdtView.do'/>";
    document.listForm.submit();
}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/admin/member/MberInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/admin/member/MberManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/admin/member/MberManage.do'/>";
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="listForm" action="/admin/member/EgovMberManage.do" method="post">
    <input name="selectedId" type="hidden" />
    <input name="checkedIdForDel" type="hidden" />
    <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
    
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">멤버 검색</h3>
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-4">
					<select class="btn btn-warning dropdown-toggle" name="sbscrbSttus" id="sbscrbSttus" title="조회조건1">
                        <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
                        <option value="A" <c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >가입신청</option>
                        <option value="D" <c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option>
                        <option value="P" <c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option>
                        </select>
                    <select class="btn btn-warning dropdown-toggle" name="searchCondition" id="searchCondition" title="조회조건2">
                        <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >ID</option>
                        <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >Name</option>
                    </select>
                    </div>
                    <div class="col-sm-4">
                    <input class="form-control" name="searchKeyword" id="searchKeyword" title="검색" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" />
                    </div>
                    <div class="col-sm-4">
                    <!-- 검색 -->
                    <input class="btn" type="submit" value="<spring:message code="button.search" />" onclick="fnSearch(); return false;" />
                    <!-- 삭제 -->
                    <a class="btn" href="#LINK" onclick="fnDeleteUser(); return false;"><spring:message code="button.delete" /></a>
                    <!-- 목록 -->
                    <a class="btn" href="<c:url value='/admin/member/MberManage.do'/>" ><spring:message code="button.list" /></a>
                    <!-- 등록 -->
                    <a class="btn" href="<c:url value='/admin/member/MberInsertView.do'/>" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a>
                    </div>
                    </div>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">사용자수 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></h3>
				</div>
				<div class="box-body">
				
				<table class="table table-bordered">
					<tr>
						<th style="width: 10px">No.</th>
	                    <th>
	                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
	                    </th>
	                    <th>아이디</th>
	                    <th>사용자이름</th>
	                    <th>사용자이메일</th>
	                    <th>전화번호</th>
	                    <th>등록일</th>
	                    <th>가입상태</th>    
					</tr>
				
				<c:if test="${fn:length(resultList) == 0}">
                <tr> 
                      <td colspan="8">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="result" items="${resultList}" varStatus="status">
                    <tr>
                        <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
                        <td>
                            <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
                            <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                        </td>
                        <td style="cursor:pointer;cursor:hand" >
                            <span class="link"><a href="<c:url value='/admin/member/MberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>"  onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;"><c:out value="${result.mberId}"/></a></span>
                        </td>
                        <td><c:out value="${result.mberNm}"/></td>
                        <td><c:out value="${result.mberEmailAdres}"/></td>
                        <td><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></td>
                        <td><c:out value="${result.sbscrbDe}"/></td>
                        <td class="badge bg-red" >
                            <c:forEach var="entrprsMberSttus_result" items="${entrprsMberSttus_result}" varStatus="status">
                                <c:if test="${result.mberSttus == entrprsMberSttus_result.code}"><c:out value="${entrprsMberSttus_result.codeNm}"/></c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    </c:forEach>
				
				</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a class="btn btn-primary" href="<c:url value='/admin/member/MberInsertView.do'/>" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage" />
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