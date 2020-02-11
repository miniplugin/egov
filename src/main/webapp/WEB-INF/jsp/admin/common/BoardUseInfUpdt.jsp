<%--
  Class Name : BoardUseInfUpdt.jsp
  Description : 게시판  사용정보  조회화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.07  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardUseInf" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
    function fn_egov_updt_bbsUseInf(){
        /* 에러
    	if (!validateBoardUseInf(document.boardUseInf)){
            return;
        }
        */
        document.boardUseInf.action = "<c:url value='/admin/common/updateBBSUseInf.do'/>";
        document.boardUseInf.submit();
    }
    function fn_egov_select_bbsUseInfs(){
        document.boardUseInf.action = "<c:url value='/admin/common/selectBBSUseInfs.do'/>";
        document.boardUseInf.submit();      
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
					<h3 class="box-title">게시판 사용정보 수정</h3>
				</div>
				<!-- /.box-header -->

        <form name="boardUseInf" method="post" action="<c:url value='/admin/common/updateBBSUseInf.do'/>">
			<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="bbsId" value="<c:out value='${bdUseVO.bbsId}'/>" />
			<input type="hidden" name="trgetId" value="<c:out value='${bdUseVO.trgetId}'/>" />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsNm">게시판명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-6"><c:out value="${bdUseVO.bbsNm}" /></div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsIntrcn">커뮤니티/ 동호회명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-6">
					<c:choose>
			            <c:when test="${not empty bdUseVO.cmmntyNm}">
			                <c:out value="${bdUseVO.cmmntyNm}" />
			            </c:when>
			            <c:when test="${not empty bdUseVO.clbNm}">
			                <c:out value="${bdUseVO.clbNm}" />
			            </c:when>
			            <c:otherwise>(시스템  활용)</c:otherwise>
			        </c:choose>
			        </div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">사용여부<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/></label> 
					<div class="col-sm-6">
					<spring:message code="button.use" /> : <input type="radio" name="useAt" class="radio2" value="Y" <c:if test="${bdUseVO.useAt == 'Y'}"> checked="checked"</c:if>>&nbsp;
					<spring:message code="button.notUsed" /> : <input type="radio" name="useAt" class="radio2" value="N" <c:if test="${bdUseVO.useAt == 'N'}"> checked="checked"</c:if>>
					<form:errors path="useAt" /> 
					</div>
				</div>
				<c:choose>
				<c:when test="${not empty bdUseVO.provdUrl}">
				<div class="form-group col-sm-12">
					<label class="col-sm-3">제공 URL</label> 
					<div class="col-sm-9">
						<a href="<c:url value="${bdUseVO.provdUrl}" />" target="_blank">
					    	<c:url value="${bdUseVO.provdUrl}" />
					    </a>
					</div>
				</div>
				</c:when>
				</c:choose>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">답장가능여부</label> 
					<div class="col-sm-6">
						<c:choose>
			                <c:when test="${result.replyPosblAt == 'Y'}">
			                    <spring:message code="button.possible" /> 
			                </c:when>
			                <c:otherwise>
			                    <spring:message code="button.impossible" />
			                </c:otherwise>
			            </c:choose>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
				 <a class="btn btn-primary" href="<c:url value='/admin/common/updateBBSUseInf.do'/>" onclick="fn_egov_updt_bbsUseInf(); return false;">저장</a>
				 <a class="btn btn-default" href="<c:url value='/admin/common/selectBBSUseInfs.do'/>" onclick="fn_egov_select_bbsUseInfs(); return false;">목록</a>
			</div>
            </form>
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