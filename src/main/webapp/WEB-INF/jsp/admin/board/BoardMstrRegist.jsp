<%--
  Class Name : BoardMstrRegist.jsp
  Description : 게시판 생성 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardMaster" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/showModalDialog.js'/>" ></script>
<script type="text/javascript">
    function fn_egov_regist_brdMstr(){
        if (!validateBoardMaster(document.boardMaster)){
            return;
        }

        if (confirm('<spring:message code="common.regist.msg" />')) {
            form = document.boardMaster;
            form.action = "<c:url value='/admin/board/insertBBSMasterInf.do'/>";
            form.submit();
        }
    }
    
    function fn_egov_select_brdMstrList(){
        form = document.boardMaster;
        form.action = "<c:url value='/admin/board/SelectBBSMasterInfs.do'/>";
        form.submit();  
    }
    
    function fn_egov_inqire_tmplatInqire(){
        form = document.boardMaster;
        var retVal;
        var url = "<c:url value='/admin/common/openPopup.do?requestUrl=/admin/common/selectTemplateInfsPop.do&typeFlag=BBS&width=850&height=430'/>";      
        //var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
        var openParam = "dialogWidth: 870px; dialogHeight: 450px; resizable: 0, scroll: 1, center: 1";

        retVal = window.showModalDialog(url,"p_tmplatInqire", openParam);
        
        if(retVal != null){
            var tmp = retVal.split("|");
            form.tmplatId.value = tmp[0];
            form.tmplatNm.value = tmp[1];
        }
    }
    
    function showModalDialogCallback(retVal) {
    	if(retVal != null){
            var tmp = retVal.split("|");
            form.tmplatId.value = tmp[0];
            form.tmplatNm.value = tmp[1];
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
					<h3 class="box-title">게시판 생성</h3>
				</div>
				<!-- /.box-header -->

			<form:form commandName="boardMaster" name="boardMaster" method="post" action="admin/board/SelectBBSMasterInfs.do">
			<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsNm">게시판명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
                    <form:input title="게시판명입력" path="bbsNm" cssClass="form-control" />
                    <form:errors path="bbsNm" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsIntrcn">게시판 소개<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<form:textarea path="bbsIntrcn" cssClass="form-control" rows="4" />
                    <form:errors path="bbsIntrcn" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">게시판 유형</label> 
					<form:select path="bbsTyCode" title="게시판유형선택" cssClass="form-control">
		                <form:option value='' label="--선택하세요--" />
		                <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
		            </form:select>
		           <form:errors path="bbsTyCode" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">게시판 속성</label> 
					<form:select path="bbsAttrbCode" title="게시판속성선택" cssClass="form-control">
		                <form:option value='' label="--선택하세요--" />
		                <form:options items="${attrbList}" itemValue="code" itemLabel="codeNm"/>
		            </form:select>      
		            <form:errors path="bbsAttrbCode" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">답장가능여부</label> 
					<spring:message code="button.possible" /> : <form:radiobutton path="replyPosblAt"  value="Y" />&nbsp;
		            <spring:message code="button.impossible" /> : <form:radiobutton path="replyPosblAt"  value="N" />
		            <form:errors path="replyPosblAt" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsIntrcn">파일첨부가능여부<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<spring:message code="button.possible" /> : <form:radiobutton path="fileAtchPosblAt"  value="Y" 
		               onclick="document.boardMaster.posblAtchFileNumber.disabled='';" />&nbsp;
		            <spring:message code="button.impossible" /> : <form:radiobutton path="fileAtchPosblAt"  value="N" 
		               onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';" />
		             <form:errors path="fileAtchPosblAt" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="posblAtchFileNumber">첨부가능파일 숫자</label>
					<form:select path="posblAtchFileNumber" title="첨부가능파일 숫자선택" cssClass="form-control" >
		               <form:option value="0"  label="---선택하세요--" />
		               <form:option value='1'>1개</form:option>
		               <form:option value='2'>2개</form:option>
		               <form:option value='3'>3개</form:option>
		           </form:select>
		           <form:errors path="posblAtchFileNumber" />
				</div>
				<div class="form-group col-sm-6">
					<div style="width:70%;display:inline-block;">
						<label class="col-sm-6" for="tmplatNm">템플릿 정보<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
						<form:input path="tmplatNm" readonly="true" title="템플릿정보입력" cssClass="form-control"/>
				         <form:hidden path="tmplatId"  />
				         <form:errors path="tmplatId" />
					</div>
					<div style="width:20%;display:inline-block;">
						<a class="btn btn-default" style="margin-bottom:5px;" href="#LINK" onclick="fn_egov_inqire_tmplatInqire(); return false;">검색</a>
					</div>
				</div>
				<c:if test="${addedOptions == 'true'}">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="option">추가 선택사항</label>
					<form:select path="option" title="추가선택사항선택" >
	                   <form:option value=""  label="미선택" />
	                   <form:option value='comment'>댓글</form:option>
	                   <form:option value='stsfdg'>만족도조사</form:option>
	               </form:select>
			              ※ 추가 선택사항은 수정 불가 (미설정된 기존 게시판의 경우 처음 설정은 가능함)
				</div>
				</c:if>
			</div>
			<!-- /.box-body -->
		
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
				 <a class="btn btn-primary" href="#LINK" onclick="javascript:fn_egov_regist_brdMstr(); return false;"><spring:message code="button.save" /></a>
                 <a class="btn" href="<c:url value='/admin/board/SelectBBSMasterInfs.do'/>" onclick="javascript:fn_egov_select_brdMstrList(); return false;"><spring:message code="button.list" /></a>
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