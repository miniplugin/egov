<%--
  Class Name : BoardUseInfList.jsp
  Description : 게시판  사용정보  목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.11  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript">
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_bbsUseInfs('1');
        }
    }

    function fn_egov_select_bbsUseInfs(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/admin/common/selectBBSUseInfs.do'/>";
        document.frm.submit();
    }
    function fn_egov_insert_addbbsUseInf(){
        document.frm.action = "<c:url value='/admin/common/addBBSUseInf.do'/>";
        document.frm.submit();      
    }
    function fn_egov_select_bbsUseInf(bbsId, trgetId){
        document.frm.bbsId.value = bbsId;
        document.frm.trgetId.value = trgetId;
        document.frm.action = "<c:url value='/admin/common/selectBBSUseInf.do'/>";
        document.frm.submit();
    }

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="frm" method="post" action = "<c:url value='/admin/common/selectBBSUseInf.do'/>">
    	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
		<input type="hidden" name="bbsId" >
		<input type="hidden" name="trgetId" >
        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">게시판사용관리</h3>
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-2">
		                <select class="btn btn-warning dropdown-toggle" id="search_select" name="searchCnd" title="검색유형선력">
			               <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
	                    </select>
                    </div>
                    <div class="col-sm-6">
                    	<input class="form-control" name="searchWrd" type="text" title="명" value='<c:out value="${searchVO.searchWrd}" />'  maxlength="35" onkeypress="press(event);">
                    </div>
                    <div class="col-sm-4">
                    	<a class="btn btn-default" href="<c:url value='/admin/common/selectBBSUseInfs.do'/>" onclick="fn_egov_select_bbsUseInfs('1'); return false;">조회</a>
                        <a class="btn btn-default" href="<c:url value='/admin/common/addBBSUseInf.do'/>" onclick="fn_egov_insert_addbbsUseInf(); return false;">등록</a>
                    </div>
                    </div>
				</div>
			</div>
			<div class="box">
				<div class="box-body">
				
				<table class="table table-bordered">
					<tr>
						<th style="width: 50px">번호</th>
	                    <th>게시판명</th>
	                    <th>사용 커뮤니티 명</th>
	                    <th>사용 동호회 명</th>
	                    <th>등록일시</th>
	                    <th>사용여부</th>
					</tr>
				
				<c:if test="${fn:length(resultList) == 0}">
                <tr> 
                      <td colspan="6">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="result" items="${resultList}" varStatus="status">
                	<input type=hidden name="bbsId" value="<c:out value="${result.bbsId}"/>">
				    <input type=hidden name="trgetId" value="<c:out value="${result.trgetId}"/>">
                    <tr>
                        <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
                        <td style="cursor:pointer;cursor:hand" >
                            <span class="link">
                            <a href="<c:url value='/admin/common/selectBBSUseInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>&amp;trgetId=<c:out value='${result.trgetId}'/>">
                            <c:out value="${result.bbsNm}"/></a></span>
                        </td>
                        <td><c:out value="${result.cmmntyNm}"/></td>
					    <td><c:out value="${result.clbNm}"/></td>
					    <td><c:out value="${result.frstRegisterPnttm}"/></td>
					    <td>
					    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
				            <c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>   
					    </td>  
                    </tr>
                    </c:forEach>
				</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a class="btn btn-primary" href="<c:url value='/admin/common/addBBSUseInf.do'/>" onclick="fn_egov_insert_addbbsUseInf(); return false;"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_bbsUseInfs" />
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