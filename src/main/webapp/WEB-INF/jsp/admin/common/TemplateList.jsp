<%--
  Class Name : TemplateList.jsp
  Description : 템플릿 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.13  KIK          최초 생성
 
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
            fn_egov_select_tmplatInfo('1');
        }
    }

    function fn_egov_insert_addTmplatInfo(){    
        document.frm.action = "<c:url value='/admin/common/addTemplateInf.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_tmplatInfo(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/admin/common/selectTemplateInfs.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_tmplatInfor(tmplatId){
        document.frm.tmplatId.value = tmplatId;
        document.frm.action = "<c:url value='/admin/common/selectTemplateInf.do'/>";
        document.frm.submit();          
    }
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="frm" action ="<c:url value='/admin/common/selectTemplateInfs.do'/>" method="post">
    	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
		<input type="hidden" name="tmplatId" value="" />
        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
        <input type="submit" id="invisible" class="invisible"/>
                        
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">템플릿 목록</h3>
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-2">
		                <select class="btn btn-warning dropdown-toggle" id="search_select" name="searchCnd" title="검색유형선력">
			               <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >템플릿명</option>
						   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >템플릿구분</option>
	                    </select>
                    </div>
                    <div class="col-sm-6">
                    	<input class="form-control" name="searchWrd" type="text" title="검색어" value='<c:out value="${searchVO.searchWrd}" />'  maxlength="35" onkeypress="press(event);">
                    </div>
                    <div class="col-sm-4">
                        <a class="btn btn-default" href="<c:url value='/admin/common/selectTemplateInfs.do'/>" onclick="javascript:fn_egov_select_tmplatInfo('1'); return false;">조회</a>
                        <a class="btn btn-default" href="<c:url value='/admin/common/addTemplateInf.do'/>" onclick="javascript:fn_egov_insert_addTmplatInfo(); return false;">등록</a>
                    </div>
                    </div>
				</div>
			</div>
			<div class="box">
				<div class="box-body">
				
				<table class="table table-bordered">
					<tr>
						<th style="width: 50px">번호</th>
	                    <th>템플릿명</th>
	                    <th>템플릿구분</th>
	                    <th>템플릿경로</th>
	                    <th>사용여부</th>
	                    <th>등록일자</th>
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
                            <a href="<c:url value='/admin/common/selectTemplateInf.do'/>?tmplatId=<c:out value='${result.tmplatId}'/>">
			                    <c:out value="${result.tmplatNm}"/>
			                </a>
                            </span>
                        </td>
                        <td><c:out value="${result.tmplatSeCodeNm}"/></td>
                        <td><c:out value="${result.tmplatCours}"/></td>
					    <td>
					    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
			                <c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>   
					    </td>
					    <td><c:out value="${result.frstRegisterPnttm}"/></td>
                    </tr>
                    </c:forEach>
				</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a class="btn btn-primary" href="<c:url value='/admin/common/addTemplateInf.do'/>" onclick="javascript:fn_egov_insert_addTmplatInfo(); return false;"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_tmplatInfo" />
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