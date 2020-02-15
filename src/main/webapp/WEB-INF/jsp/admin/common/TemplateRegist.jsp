<%--
  Class Name : TemplateRegist.jsp
  Description : 템플릿 속성 등록화면
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
    function fn_egov_regist_tmplatInfo(){
        if (!validateTemplateInf(document.templateInf)){
            return;
        }
        
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.templateInf.action = "<c:url value='/admin/common/insertTemplateInf.do'/>";
            document.templateInf.submit();
        }
    }
    
    function fn_egov_select_tmplatInfo(){
        document.templateInf.action = "<c:url value='/admin/common/selectTemplateInfs.do'/>";
        document.templateInf.submit();  
    }

    function fn_egov_selectTmplatType(obj){
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
					<h3 class="box-title">템플릿 등록</h3>
				</div>
				<!-- /.box-header -->

			<form:form commandName="templateInf" name="templateInf" method="post" >
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-4" for="tmplatNm"><spring:message code="cop.tmplatNm" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-8">
					<input class="form-control" name="tmplatNm" type="text" value="" maxlength="60" id="tmplatNm"  title="템플릿명">
					<form:errors path="tmplatNm" /> 
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-4" for="tmplatSeCode"><spring:message code="cop.tmplatSeCode" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-8">
					<select class="form-control" name="tmplatSeCode" class="select" onchange="fn_egov_selectTmplatType(this)" id="tmplatSeCode" title="템플릿구분">
			               <option selected value=''>--선택하세요--</option>
			            <c:forEach var="result" items="${resultList}" varStatus="status">
			                <option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
			            </c:forEach>
			        </select>&nbsp;&nbsp;&nbsp;<span id="sometext"></span>
			        <form:errors path="tmplatSeCode" />
			        </div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2" for="tmplatCours"><spring:message code="cop.tmplatCours" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-10">
					<input class="form-control" name="tmplatCours" type="text" value="" maxlength="60" id="tmplatCours"  title="템플릿경로">
					<form:errors path="tmplatCours" /> 
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-4"><spring:message code="cop.useAt" /><img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/></label>
					<div class="col-sm-8">
						Y : <input type="radio" name="useAt" class="radio2" value="Y" checked="checked">&nbsp;
					    N : <input type="radio" name="useAt" class="radio2" value="N">
					    <form:errors path="useAt" />
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
				 <a class="btn btn-primary" href="<c:url value='/admin/common/insertTemplateInf.do'/>" onclick="fn_egov_regist_tmplatInfo(); return false;">저장</a> 
                 <a class="btn btn-default" href="<c:url value='/admin/common/selectTemplateInfs.do'/>" title="목록" >목록</a>
                 <a class="btn btn-default" href="#LINK" onclick="fn_egov_previewTmplat();" title="새창" >미리보기</a>
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