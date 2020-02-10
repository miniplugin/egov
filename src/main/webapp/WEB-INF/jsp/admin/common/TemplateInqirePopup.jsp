<%--
  Class Name : TemplateInqirePopup.jsp
  Description : 템플릿 선택
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
<c:set var="ImgUrl" value="/images/egovframework/admin/common/"/>

<c:import url="/EgovPageLink.do?link=admin/include/common_top" />

<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_tmplatInfo('1');
		}
	}
	function fn_egov_select_tmplatInfo(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/admin/common/selectTemplateInfsPop.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_returnTmplatInfo(tmplatId, tmplatNm){
		getDialogArguments();
		var retVal = tmplatId +"|"+tmplatNm;
		
		setReturnValue(retVal);
		 
		parent.window.returnValue = retVal;
		parent.window.close();
	}

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	
			<!-- box general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">템플릿 목록</h3>
				</div>
				<!-- /.box-header -->
				
				<form name="frm" action ="<c:url value='/admin/common/selectTemplateInfsPop.do'/>" method="post">
				    <input type="hidden" name="tmplatId" value="" />
				    <input type="submit" id="invisible" class="invisible"/>
				
				    <!-- 검색 필드 박스 시작 -->
				    <div class='box'>
						<div class='box-body'>
							<div class="form-group">
								<div class="col-sm-2">
				                <select class="btn btn-warning dropdown-toggle" name="searchCnd" class="select" title="검색조건 선택">
							         <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >템플릿명</option>
							         <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >템플릿구분</option>   
				                </select>
				                </div>
				                <div class="col-sm-6">
				                	<input class="form-control" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
				                </div>
				                <div class="col-sm-4">
				                  <a class="btn btn-default" href="<c:url value='/admin/common/selectTemplateInfsPop.do'/>" onclick="javascript:fn_egov_select_tmplatInfo('1'); return false;">조회</a>
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
					            <th>템플릿명</th>
					            <th>템플릿구분</th>
					            <th>템플릿경로</th>
					            <th>사용여부</th>
					            <th>등록일자</th>
					            <th>선택</th>  
							</tr>
						
				            <c:forEach var="result" items="${resultList}" varStatus="status">
				        	  <!-- loop 시작 -->                                
							  <tr>
							   <td><strong><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></strong></td>          
							   <td><c:out value="${result.tmplatNm}"/></td>
							   <td><c:out value="${result.tmplatSeCodeNm}"/></td>
							   <td><c:out value="${result.tmplatCours}"/></td>
							   <td>
							       <c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
							       <c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
							   </td>  
							   <td><c:out value="${result.frstRegisterPnttm}"/></td    >     
							   <td>
							       <c:if test="${result.useAt == 'Y'}">
							           <input class="btn btn-default" type="button" name="selectTmplat" value="선택" 
							               onClick="javascript:fn_egov_returnTmplatInfo('<c:out value="${result.tmplatId}"/>','<c:out value="${result.tmplatNm}"/>')" />
							       </c:if>         
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
				               	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_tmplatInfo" />
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
