<%--
  Class Name : BoardUseInfRegist.jsp
  Description : 게시판  사용정보  등록화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardUseInf" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/showModalDialog.js'/>" ></script>
<script type="text/javascript">
    function fn_egov_select_bbsUseInfs(){
        document.boardUseInf.action = "<c:url value='/admin/common/selectBBSUseInfs.do'/>?searchCondition=1";
        document.boardUseInf.submit();
    }

    //<c:url value='/admin/common/selectBBSUseInfs.do'/>?searchCondition=1"
    
    function fn_egov_regist_bbsUseInf(){
        if (!validateBoardUseInf(document.boardUseInf)){
            return;
        }
        
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.boardUseInf.param_trgetType.value = document.boardUseInf.trgetType.value;
            document.boardUseInf.action = "<c:url value='/admin/common/insertBBSUseInf.do'/>";
            document.boardUseInf.submit();      
        }
    }
    
    function fn_egov_inqire_bbsInf(){
        var retVal;
        var url = "<c:url value='/admin/common/openPopup.do?requestUrl=/admin/board/SelectBBSMasterInfsPop.do&width=890&height=520'/>";      
        var openParam = "dialogWidth: 890px; dialogHeight: 520px; resizable: 0, scroll: 1, center: 1";  
        
        retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam);
        if(retVal != null){
            var tmp = retVal.split("|");
            document.boardUseInf.bbsId.value = tmp[0];
            document.boardUseInf.bbsNm.value = tmp[1];
        }       
    }
    
    function showModalDialogCallback(retVal) {
    	if(retVal != null){
            var tmp = retVal.split("|");
            document.boardUseInf.bbsId.value = tmp[0];
            document.boardUseInf.bbsNm.value = tmp[1];
        }  
    }
    
    function fn_egov_selectTargetType(obj) {
        var retVal;
        var _strType = obj.value;
        if (_strType == 'CMMNTY') {
            retVal = fn_egov_inqire_cmmnty();
        } else if (_strType == 'CLUB') {
            retVal = fn_egov_inqire_club();
        } else if (_strType == '') {
            retVal = "|";
        } else {
            retVal = "SYSTEM_DEFAULT_BOARD"+"|"+"시스템 활용";
        }
        if (retVal != null) {
            var tmp = retVal.split("|");
            document.boardUseInf.trgetId.value = tmp[0];
            document.boardUseInf.trgetNm.value = tmp[1];
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
					<h3 class="box-title">게시판 사용등록</h3>
				</div>
				<!-- /.box-header -->

			<form:form commandName="boardUseInf" name="boardUseInf" method="post">
			<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="param_trgetType" value="" />
        
			<div class="box-body">
				<div class="form-group col-sm-12">
					<div style="width:70%;display:inline-block;">
					<label class="col-sm-6" for="bbsNm">게시판명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
                    <input name="bbsId" type="hidden" /> 
					<input class="form-control" name="bbsNm" type="text" value=""  maxlength="40" title="게시판명" readonly />
					</div>
					<div style="width:20%;display:inline-block;">
					<a class="btn btn-default" style="margin-bottom:5px;" href="#LINK" onclick="fn_egov_inqire_bbsInf();" style="selector-dummy: expression(this.hideFocus=false);">검색</a>
					</div>
					<form:errors path="bbsId" />  
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-12" for="trgetType"><spring:message code="cop.trgetNm" /><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" /></label>
					<div style="width:30%;display:inline-block;">
					<select id="trgetType" name="trgetType" class="form-control" title="" onChange="javascript:fn_egov_selectTargetType(this)"  >
		               <option selected value=''>--선택하세요--</option>
		               <option value="SYSTEM" >시스템</option>            
		            </select>
		            </div>
		            <div style="width:30%;display:inline-block;">
		            <input type="hidden" name="trgetId" value="" />
		            <input type="text" name="trgetNm" value="" class="form-control" title="" readOnly />
		            </div>
		            <form:errors path="trgetId" />
				</div>
				
			</div>
			<!-- /.box-body -->
		
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
				 <a class="btn btn-primary" href="#LINK" onclick="JavaScript:fn_egov_regist_bbsUseInf(); "><spring:message code="button.create" /></a>
				 <a class="btn btn-default" href="<c:url value='/admin/common/selectBBSUseInfs.do'/>?searchCondition=1" onclick="JavaScript:fn_egov_select_bbsUseInfs(); return false;"><spring:message code="button.list" /></a>
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