<%--
  Class Name : BoardMstrListPop.jsp
  Description : 게시판 속성 조회 팝업
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

<c:import url="/EgovPageLink.do?link=admin/include/common_top" />

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_brdMstr('1');
        }
    }
    function fn_egov_select_brdMstr(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/admin/board/SelectBBSMasterInfsPop.do'/>";
        document.frm.submit();                  
    }
    
    function fn_egov_select_brdMstrInfo(bbsId, bbsNm){
        var retVal = bbsId +"|"+bbsNm;
        parent.fn_egov_returnValue(retVal);
    }
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	
			<!-- box general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">게시판 정보</h3>
				</div>
				<!-- /.box-header -->
				
				<form name="frm" method="post" action="<c:url value='/admin/board/SelectBBSMasterInfsPop.do'/>">
				    <input type="submit" value="실행" onclick="fn_egov_select_brdMstr('1'); return false;" id="invisible" class="invisible" />
				    <input type="hidden" name="bbsId" value="">
				    <!-- 검색 필드 박스 시작 -->
				    <div class='box'>
						<div class='box-body'>
							<div class="form-group">
								<div class="col-sm-2">
				                <select class="btn btn-warning dropdown-toggle" id="searchCnd" name="searchCnd" title="검색유형선력">
					               <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
					               <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>   
		                        </select>
				                </div>
				                <div class="col-sm-6">
				                	<input class="form-control" id="searchWrd" name="searchWrd" title="검색어" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);">
				                </div>
				                <div class="col-sm-4">
				                  <a class="btn btn-default" href="<c:url value='/admin/board/SelectBBSMasterInfsPop.do'/>" onclick="javascript:fn_egov_select_brdMstr('1'); return false;">조회</a>
				                  <a class="btn btn-default" href="#LINK" onclick="javascript:parent.close(); return false;"><spring:message code="button.close" /></a>
				                </div>
				           </div>
						</div>
					</div>
				    <!-- //검색 필드 박스 끝 -->
                  
				    <!-- table add start -->
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
					            <th>선택</th>  
							</tr>
						
				            <c:forEach var="result" items="${resultList}" varStatus="status">
				        	  <!-- loop 시작 -->                                
							  <tr>
							   <td><strong><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></strong></td>          
							   <td><c:out value="${result.bbsNm}"/></td>
							   <td><c:out value="${result.bbsTyCodeNm}"/></td>
							   <td><c:out value="${result.bbsAttrbCodeNm}"/></td>
							   <td><c:out value="${result.frstRegisterPnttm}"/></td>
							   <td>
							       <c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
							       <c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
							   </td>  
							   <td>
							       <input class="btn btn-default" type="button" value="선택" onClick="javascript:fn_egov_select_brdMstrInfo('<c:out value="${result.bbsId}"/>','<c:out value="${result.bbsNm}"/>');" />         
							   </td>  
							 </tr>
						  </c:forEach>
						  <c:if test="${fn:length(resultList) == 0}">
						       <tr>
						           <td nowrap colspan="6" ><spring:message code="common.nodata.msg" /></td>  
						       </tr>      
						  </c:if>
						</table>
				
						</div>
						<!-- /.box-body -->
						
						<div class="text-center">
							<div class="pagination" id="paging_div">
							   <ul class="paging_align">
				               	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
				               </ul>
				            </div> 
						</div>
						<!-- /.box-footer-->
					</div>
				    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				</form>
			</div>
			<!-- /.box -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
