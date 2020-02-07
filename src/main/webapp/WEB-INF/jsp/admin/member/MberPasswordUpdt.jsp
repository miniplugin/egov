<%--
  Class Name : MberPasswordUpdt.jsp
  Description : 일반회원암호수정 JSP
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/admin/member/EgovMberManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
        document.passwordChgVO.submit();
    }
}
<c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
//-->
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">암호변경</h3>
				</div>
				<!-- /.box-header -->

			<form name="passwordChgVO" method="post" action="<c:url value="${'/admin/member/MberPasswordUpdt.do'}"/>" >
            
            <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	        <input name="checkedIdForDel" type="hidden" />
	        <!-- 검색조건 유지 -->
	        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
	        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
	        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
	        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	        <!-- 우편번호검색 -->
	        <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberId">회원아이디<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<input class="col-sm-6" name="mberId" id="mberId" type="text" size="20" value="<c:out value='${mberManageVO.mberId}'/>"  maxlength="20" readonly />
			        <input name="uniqId" id="uniqId" type="hidden" size="20" value="<c:out value='${mberManageVO.uniqId}'/>" />
			        <input name="userTy" id="userTy" type="hidden" size="20" value="<c:out value='${mberManageVO.userTy}'/>" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="oldPassword">기존 비밀번호<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label> 
					
					<input class="col-sm-6" name="oldPassword" id="oldPassword" type="password" value=""  maxlength="100" />
                    <form:errors path="passwordHint" cssClass="error"/>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="newPassword">비밀번호<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<input class="col-sm-6" name="newPassword" id="newPassword" type="password" value=""  maxlength="100" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="newPassword2">비밀번호확인<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<input class="col-sm-6" name="newPassword2" id="newPassword2" type="password" value=""  maxlength="100" />
				</div>
			</div>
			<!-- /.box-body -->
		
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
                <!-- 수정 -->
                <input class="btn btn-warning" type="submit" value="<spring:message code="button.save" />" onclick="fnUpdate(); return false;" />
                <!-- 목록 -->
                <a class="btn btn-default" href="<c:url value='/admin/member/EgovMberManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a>
                <!-- 취소 -->
                <a class="btn btn-default" href="#LINK" onclick="javascript:document.passwordChgVO.reset();"><spring:message code="button.reset" /></a>
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