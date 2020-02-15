<%--
  Class Name : TemplateUpdt.jsp
  Description : 템플릿 속성 수정화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="templateInf" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
    function fn_egov_update_tmplatInfo() {
        if (!validateTemplateInf(document.templateInf)){
            return;
        }
        
        if (confirm('<spring:message code="common.update.msg" />')) {
            document.templateInf.action = "<c:url value='/admin/common/updateTemplateInf.do'/>";
            document.templateInf.submit();
        }
    }
    
    function fn_egov_delete_tmplatInfo() {
        if (!validateTemplateInf(document.templateInf)){
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.templateInf.action = "<c:url value='/admin/common/deleteTemplateInf.do'/>";
            document.templateInf.submit();
        }
    }
    
    function fn_egov_select_tmplatInfo() {
        document.templateInf.action = "<c:url value='/admin/common/selectTemplateInfs.do'/>";
        document.templateInf.submit();  
    }
    
    function fn_egov_selectTmplatType(obj) {
        if (obj.value == 'TMPT01') {
            document.getElementById('sometext').innerHTML = "게시판 템플릿은 CSS만 가능합니다.";
        } else if (obj.value == '') {
            document.getElementById('sometext').innerHTML = "";
        } else {
            document.getElementById('sometext').innerHTML = "사이트 템플릿은 do 액션만 가능합니다. ex) /main/template/mainPage.do";
        }       
    }

    function fn_egov_previewTmplat() {
        var frm = document.templateInf;
        
        var url = frm.tmplatCours.value;

        var target = "";
        var width = "";

        if (frm.tmplatSeCode.value == 'TMPT01') {
            target = "<c:url value='/main/template/previewBoardList.do'/>";
            width = "1024";
        } else {
        	alert('<spring:message code="cop.tmplatCours" /> 지정 후 선택해 주세요.');
        }

        if (target != "") {
            window.open(target + "?searchWrd="+url, "preview", "width=" + width + "px, height=500px;");
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
					<h3 class="box-title">템플릿 등록정보 수정</h3>
				</div>
				<!-- /.box-header -->

        <form:form commandName="templateInf" name="templateInf" method="post" >
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input name="tmplatNm" type="hidden" value='<c:out value="${TemplateInfVO.tmplatNm}"/>' />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="tmplatId"><spring:message code="cop.tmplatNm" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<input class="form-control" id="tmplatId" name="tmplatId" type="hidden" value='<c:out value="${TemplateInfVO.tmplatId}"/>'  maxlength="60" >
					<c:out value="${TemplateInfVO.tmplatNm}"/>
					<form:errors path="tmplatId" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-4" for="tmplatSeCode"><spring:message code="cop.tmplatSeCode" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-8">
						<select class="form-control" id="tmplatSeCode" name="tmplatSeCode" class="select" onchange="fn_egov_selectTmplatType(this)">
				               <option selected value=''>--선택하세요--</option>
				            <c:forEach var="result" items="${resultList}" varStatus="status">
				                <option value='<c:out value="${result.code}"/>' <c:if test="${TemplateInfVO.tmplatSeCode == result.code}">selected="selected"</c:if> ><c:out value="${result.codeNm}"/></option>
				            </c:forEach>    
				        </select>&nbsp;&nbsp;&nbsp;<span id="sometext"></span>
				        <form:errors path="tmplatSeCode" /> 
			        </div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2" for="tmplatCours"><spring:message code="cop.tmplatCours" /><img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/></label> 
					<div class="col-sm-10">
					<input class="form-control" id="tmplatCours" name="tmplatCours" type="text" value='<c:out value="${TemplateInfVO.tmplatCours}"/>' maxlength="60">
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-4"><spring:message code="cop.useAt" /><img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/></label>
					<div class="col-sm-8">
						Y : <input type="radio" name="useAt" class="radio2" value="Y"  <c:if test="${TemplateInfVO.useAt == 'Y'}"> checked="checked"</c:if> >&nbsp;
					    N : <input type="radio" name="useAt" class="radio2" value="N" <c:if test="${TemplateInfVO.useAt == 'N'}"> checked="checked"</c:if>>
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
				 <a class="btn btn-primary" href="#LINK" onclick="javascript:fn_egov_update_tmplatInfo(); return false;"><spring:message code="button.save" /></a>
				 <c:if test="${TemplateInfVO.tmplatSeCode != 'TMPT01'}">
				 <a class="btn btn-warning" href="#LINK" onclick="javascript:fn_egov_delete_tmplatInfo(); return false;"><spring:message code="button.delete" /></a>
                 </c:if>
                 <a class="btn btn-default" href="<c:url value='/admin/common/selectTemplateInfs.do'/>" onclick="javascript:fn_egov_select_tmplatInfo(); return false;"><spring:message code="button.list" /></a>
                 <a class="btn btn-default" href="#LINK" onclick="javascript:fn_egov_previewTmplat(); return false;" title="새창" ><spring:message code="cop.preview" /></a>
			</div>
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