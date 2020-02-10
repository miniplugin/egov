<%--
  Class Name : MberSelectUpdt.jsp
  Description : 일반회원상세조회, 수정 JSP
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

<script type="text/javascript" src="<c:url value="/js/EgovBBSMng.js" />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/showModalDialog.js'/>" ></script>
<script type="text/javascript">
    function fn_egov_validateForm(obj){
        return true;
    }
    
    function fn_egov_update_brdMstr(){
        /* validateBoardMaster 함수 없음.
    	if (!validateBoardMaster(document.boardMaster)){
        	return;
        }
        */
        if(confirm('<spring:message code="common.update.msg" />')){
            document.boardMaster.action = "<c:url value='/admin/board/UpdateBBSMasterInf.do'/>";
            document.boardMaster.submit();                  
        }
    }   
    
    function fn_egov_select_brdMstrList(){
        document.boardMaster.action = "<c:url value='/admin/board/SelectBBSMasterInfs.do'/>";
        document.boardMaster.submit();  
    }   
    
    function fn_egov_delete_brdMstr(){
        if(confirm('<spring:message code="common.delete.msg" />')){
            document.boardMaster.action = "<c:url value='/admin/board/DeleteBBSMasterInf.do'/>";
            document.boardMaster.submit();  
        }       
    }
    
	function showModalDialogCallback(retVal) {
    	if (retVal) {
    		var tmp = retVal.split("|");
            document.boardMaster.tmplatId.value = tmp[0];
            document.boardMaster.tmplatNm.value = tmp[1];
    	}
    }
    
    function fn_egov_inqire_tmplatInqire(){
        var retVal;
        var url = "<c:url value='/admin/common/openPopup.do?requestUrl=/admin/common/selectTemplateInfsPop.do&typeFlag=BBS&width=850&height=430'/>";      
        //var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
 		var openParam = "dialogWidth: 870px; dialogHeight: 450px; resizable: 0, scroll: 1, center: 1";
        retVal = window.showModalDialog(url,"p_tmplatInqire", openParam);
        if(retVal != null){
            var tmp = retVal.split("|");
            document.boardMaster.tmplatId.value = tmp[0];
            document.boardMaster.tmplatNm.value = tmp[1];
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
					<h3 class="box-title">게시판 정보수정</h3>
				</div>
				<!-- /.box-header -->

        <form:form commandName="boardMaster" name="boardMaster" action="<c:url value='/admin/board/SelectBBSMasterInfs.do'/>" method="post" >
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<input name="bbsId" type="hidden" value="<c:out value='${result.bbsId}'/>" />
			<input name="bbsTyCode" type="hidden" value="<c:out value='${result.bbsTyCode}'/>" />
			<input name="bbsAttrbCode" type="hidden" value="<c:out value='${result.bbsAttrbCode}'/>" />
			<input name="replyPosblAt" type="hidden" value="<c:out value='${result.replyPosblAt}'/>" />
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsNm">게시판명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<input class="form-control" title="게시판명입력" id="bbsNm" name="bbsNm" type="text" size="60" value='<c:out value="${result.bbsNm}"/>' maxlength="60" style="width:100%" >
                    <form:errors path="bbsNm" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsIntrcn">게시판 소개<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					
					<textarea class="form-control" name="bbsIntrcn" id="bbsIntrcn" cssClass="col-sm-6" rows="4"  style="width:100%"><c:out value="${result.bbsIntrcn}" escapeXml="true" /></textarea>
                    <form:errors path="bbsIntrcn" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">게시판 유형</label> 
					<div class="col-sm-6"><c:out value="${result.bbsTyCodeNm}"/></div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6">게시판 속성</label> 
					<div class="col-sm-6"><c:out value="${result.bbsAttrbCodeNm}"/></div>
				</div>
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
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bbsIntrcn">파일첨부가능여부<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div class="col-sm-6">
					<spring:message code="button.possible" /> : <input type="radio" name="fileAtchPosblAt" class="radio2" 
		                onclick="document.boardMaster.posblAtchFileNumber.disabled='';"
		                value="Y" <c:if test="${result.fileAtchPosblAt == 'Y'}"> checked="checked"</c:if>>&nbsp;
		            <spring:message code="button.impossible" /> : <input type="radio" name="fileAtchPosblAt" class="radio2" 
		                onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';"
		                value="N" <c:if test="${result.fileAtchPosblAt == 'N'}"> checked="checked"</c:if>>
		            <form:errors path="fileAtchPosblAt" />
		            </div>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="posblAtchFileNumber">첨부가능파일 숫자</label>
					<select class="form-control" title="첨부가능파일 숫자선택" id="posblAtchFileNumber" name="posblAtchFileNumber" class="select" <c:if test="${result.fileAtchPosblAt == 'N'}"> disabled="disabled"</c:if>>
		               <option selected value="0">--선택하세요--</option>
		               <option value='1' <c:if test="${result.posblAtchFileNumber == '1'}">selected="selected"</c:if>>1개</option>
		               <option value='2' <c:if test="${result.posblAtchFileNumber == '2'}">selected="selected"</c:if>>2개</option>
		               <option value='3' <c:if test="${result.posblAtchFileNumber == '3'}">selected="selected"</c:if>>3개</option>
		           </select>
                   <form:errors path="posblAtchFileNumber" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<div style="width:70%;display:inline-block;">
						<label class="col-sm-6" for="tmplatNm">템플릿 정보<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
						<input class="form-control" title="템플릿정보입력" id="tmplatNm" name="tmplatNm" type="text" size="20" value="<c:out value="${result.tmplatNm}"/>"  maxlength="20" readonly >
				         <input name="tmplatId" type="hidden" value='<c:out value="${result.tmplatId}"/>'>
	                    <form:errors path="tmplatNm" cssClass="error" />
					</div>
					<div style="width:20%;display:inline-block;">
						<a class="btn btn-default" style="margin-bottom:5px;" href="#LINK" onclick="fn_egov_inqire_tmplatInqire(); return false;">검색</a>
					</div>
				</div>
				<c:if test="${addedOptions == 'true'}">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="option">추가 선택사항</label>
					<select class="form-control" title="추가선택사항선택" name="option" id="option" class="select" <c:if test="${result.option != 'na'}">disabled="disabled"</c:if>>
	                    <option value='na' <c:if test="${result.option == 'na'}">selected="selected"</c:if>>---선택하세요--</option>
	                    <option value='' <c:if test="${result.option == ''}">selected="selected"</c:if>>미선택</option>
	                    <option value='comment' <c:if test="${result.option == 'comment'}">selected="selected"</c:if>>댓글</option>
	                    <option value='stsfdg' <c:if test="${result.option == 'stsfdg'}">selected="selected"</c:if>>만족도조사</option>
	               </select>
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
				 <a class="btn btn-primary" href="#LINK" onclick="javascript:fn_egov_update_brdMstr(); return false;"><spring:message code="button.save" /></a>
                 <a class="btn" href="#LINK" onclick="fn_egov_delete_brdMstr(); return false;"><spring:message code="button.delete" /></a>
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