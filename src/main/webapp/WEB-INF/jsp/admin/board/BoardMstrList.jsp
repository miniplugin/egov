<%--
  Class Name : BoardMstrList.jsp
  Description : 게시판관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.10  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}
	
	function fn_egov_insert_addBrdMstr(){	
		document.frm.action = "<c:url value='/admin/board/addBBSMaster.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/admin/board/SelectBBSMasterInfs.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_inqire_brdMstr(bbsId){
		document.frm.bbsId.value = bbsId;
		document.frm.action = "<c:url value='/admin/board/SelectBBSMasterInf.do'/>";
		document.frm.submit();			
	}
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="frm" action="<c:url value='/admin/board/SelectBBSMasterInfs.do'/>" method="post">
    <input type="hidden" name="bbsId">
	<input type="hidden" name="trgetId">
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">게시판생성관리</h3>
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-2">
						<select class="btn btn-warning dropdown-toggle" id="searchCnd" name="searchCnd" title="검색유형선력">
		                   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
		                   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>   
		                </select>
                    </div>
                    <div class="col-sm-6">
                    	<input class="form-control" title="검색값입력" id="searchWrd" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}" />' maxlength="35" onkeypress="press(event);">
                    </div>
                    <div class="col-sm-4">
                    <a class="btn btn-default" href="<c:url value='/admin/board/SelectBBSMasterInfs.do'/>" onclick="fn_egov_select_brdMstr('1'); return false;">조회</a>
                    <a class="btn btn-default" href="<c:url value='/admin/board/addBBSMaster.do'/>" onclick="fn_egov_insert_addBrdMstr(); return false;"><spring:message code="button.create"/></a>
                    <input class="btn" type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_select_brdMstr('1'); return false;" id="invisible" class="invisible" />
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
	                    <th>게시판유형</th>
	                    <th>게시판속성</th>
	                    <th>생성일</th>
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
                    <tr>
                        <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
                        <td style="cursor:pointer;cursor:hand" >
                            <span class="link">
                            <a href="<c:url value='/admin/board/SelectBBSMasterInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>">
                            <c:out value="${result.bbsNm}"/></a></span>
                        </td>
                        <td><c:out value="${result.bbsTyCodeNm}"/></td>
					    <td><c:out value="${result.bbsAttrbCodeNm}"/></td>
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
					<a class="btn btn-primary" href="<c:url value='/admin/board/addBBSMaster.do'/>" onclick="fn_egov_insert_addBrdMstr(); return false;"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
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