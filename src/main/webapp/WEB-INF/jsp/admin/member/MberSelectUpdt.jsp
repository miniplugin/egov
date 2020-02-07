<%--
  Class Name : MberSelectUpdt.jsp
  Description : 일반회원상세조회, 수정 JSP
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
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/admin/member/MberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
    if(confirm("<spring:message code='common.delete.msg' />")){
        document.mberManageVO.checkedIdForDel.value=checkedIds;
        document.mberManageVO.action = "<c:url value='/admin/member/MberDelete.do'/>";
        document.mberManageVO.submit(); 
    }
}
function fnPasswordMove(){
    document.mberManageVO.action = "<c:url value='/admin/member/MberPasswordUpdtView.do'/>";
    document.mberManageVO.submit();
}
function fnUpdate(){
	document.mberManageVO.action = "<c:url value='/admin/member/MberSelectUpdt.do'/>";
    if(validateMberManageVO(document.mberManageVO)){
        document.mberManageVO.submit();
    }
}
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
					<h3 class="box-title">회원수정</h3>
				</div>
				<!-- /.box-header -->

<form:form commandName="mberManageVO" name="mberManageVO"  method="post" >
            
            <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
            <input name="checkedIdForDel" type="hidden" />
            <!-- 검색조건 유지 -->
            <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
            <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
            <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
            <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
            <!-- 우편번호검색 -->
            <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
            <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
            <input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberId">회원아이디<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<form:input path="mberId" id="mberId" cssClass="col-sm-6" readonly="readonly" maxlength="20" />
                    <form:errors path="mberId" cssClass="error" />
                    <form:hidden path="uniqId" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberNm">회원이름<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<form:input path="mberNm" id="mberNm" cssClass="col-sm-6" maxlength="60" />
                    <form:errors path="mberNm" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="passwordHint">비밀번호힌트<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label> 
					
					<form:select path="passwordHint" id="passwordHint" cssClass="col-sm-6">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="passwordHint" cssClass="error"/>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="passwordCnsr">비밀번호정답<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<form:input path="passwordCnsr" id="passwordCnsr" cssClass="col-sm-6" maxlength="100" />
                    <form:errors path="passwordCnsr" cssClass="error"/>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="sexdstnCode">성별구분코드</label> 
					<form:select path="sexdstnCode" id="sexdstnCode" class="col-sm-6">
                         <form:option value="" label="--선택하세요--"/>
                         <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                     </form:select>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-3" for="areaNo">전화번호</label>
					<div class="col-sm-9">
					<form:input path="areaNo" id="areaNo" maxlength="4" />
                     - <form:input path="middleTelno" id="middleTelno" maxlength="4" />
                     - <form:input path="endTelno" id="endTelno" maxlength="4" />
                     <form:errors path="areaNo" cssClass="error" />
                     <form:errors path="middleTelno" cssClass="error" />
                     <form:errors path="endTelno" cssClass="error" />
                     </div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberFxnum">팩스번호</label>
					<form:input path="mberFxnum" id="mberFxnum" cssClass="col-sm-6"  maxlength="15" />
                    <form:errors path="mberFxnum" cssClass="error" />
				</div>
				
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="moblphonNo">핸드폰번호</label>
					<form:input path="moblphonNo" id="moblphonNo" cssClass="col-sm-6" maxlength="15" />
                    <form:errors path="moblphonNo" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberEmailAdres">이메일주소</label>
					<form:input path="mberEmailAdres" id="mberEmailAdres" cssClass="col-sm-6" maxlength="50" />
                    <form:errors path="mberEmailAdres" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="zip_view">우편번호</label>
					<input name="zip_view" id="zip_view" type="text"  value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly="readonly" />
                    <form:hidden path="zip" />
                        <!-- <a href="#LINK" onclick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);">
                            <img src="<c:url value='/images/img_search.gif'/>" alt="우편번호 검색"/>(우편번호 검색)
                        </a> -->
                    <form:errors path="zip" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="adres">주소</label>
					<form:input path="adres" id="adres" cssClass="col-sm-6" maxlength="100" readonly="true" />
                    <form:errors path="adres" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="detailAdres">상세주소</label>
					<form:input path="detailAdres" id="detailAdres" cssClass="col-sm-6" maxlength="100" />
                    <form:errors path="detailAdres" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="groupId">그룹아이디<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목"/></label>
					
					<form:select path="groupId" id="groupId">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="groupId" cssClass="error"/>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="mberSttus">일반회원상태코드<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목"/></label>
					
					<form:select path="mberSttus" id="mberSttus">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="mberSttus" cssClass="error"/>
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
                <!-- 삭제 -->
                <a class="btn btn-primary" href="<c:url value='/admin/member/MberManage.do'/>" onclick="fnDeleteMber('<c:out value='${mberManageVO.userTy}'/>:<c:out value='${mberManageVO.uniqId}'/>'); return false;"><spring:message code="button.delete" /></a>
                <!-- 목록 -->
                <a class="btn btn-primary" href="<c:url value='/admin/member/MberManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a>
                <!-- 암호변경 -->
                <a class="btn btn-primary" href="<c:url value='/admin/member/MberPasswordUpdtView.do'/>" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate" /></a>
                <!-- 취소 -->
                <a class="btn btn-default" href="#LINK" onclick="javascript:document.mberManageVO.reset();"><spring:message code="button.reset" /></a>
			</div>
			<form:hidden path="password" />
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