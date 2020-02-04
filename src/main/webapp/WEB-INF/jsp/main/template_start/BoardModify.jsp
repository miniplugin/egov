<%--
  Class Name : BoardModify.jsp
  Description : 샘플화면 - 자료실 수정(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.02   KIK       경량환경 버전 생성
 
    author   : 실행환경개발팀 KIK
    since    : 2020.02.02 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/sub.css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function fn_egov_validateForm(obj){
        return true;
    }

    function fn_egov_regist_notice(){
        //document.board.onsubmit();

        if (!validateBoard(document.board)){
            return;
        }
        
        if (confirm('<spring:message code="common.update.msg" />')) {
            document.board.action = "<c:url value='/main/template_start${prefix}/updateBoard.do'/>";
            document.board.submit();                    
        }
    }   
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/main/template_start${prefix}/Board.do'/>";
        document.board.submit();    
    }
    
    function fn_egov_check_file(flag) {
        if (flag=="Y") {
            document.getElementById('file_upload_posbl').style.display = "block";
            document.getElementById('file_upload_imposbl').style.display = "none";          
        } else {
            document.getElementById('file_upload_posbl').style.display = "none";
            document.getElementById('file_upload_imposbl').style.display = "block";
        }
    }   
</script>
<!-- wrap -->
<div id="wrap">
	<!-- header 시작 -->
	<c:import url="/EgovPageLink.do?link=main/template_start/inc/header" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->
	<div id="container">
		<!-- 좌측메뉴 시작 -->
		<div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/template_start/inc/left" /></div>
		<!-- //좌측메뉴 끝 -->			
			<!-- content 시작 -->			
			<div id="content">
				<!-- 현재위치 네비게이션 시작 -->
				<div id="cur_loc">
					<div id="cur_loc_align">
						<ul>
							<li>HOME</li>
                            <li>&gt;</li>
                            <li>고객지원</li>
                            <li>&gt;</li>
                            <li><strong>${brdMstrVO.bbsNm}</strong></li>
						</ul>
					</div>
				</div>	
				<!-- //현재위치 네비게이션 끝 -->
				<!-- 타이틀 이미지 -->			
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" /></div>
				<!-- bodytext_area -->
				<div class="bodytext_area box_inner">
					<!-- appForm -->
					<form:form class="appForm" commandName="board" name="board" method="post" enctype="multipart/form-data" >
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
					<input type="hidden" name="returnUrl" value="<c:url value='/main/template_start/forUpdateBoard.do'/>"/>
					
					<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
					<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
					
					<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
					<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
					<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
					<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
					<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
					<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
					<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
					
					<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
					
					<c:if test="${anonymous != 'true'}">
						<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
						<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
					</c:if>
					
					<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
					   <input name="ntceBgnde" type="hidden" value="10000101">
					   <input name="ntceEndde" type="hidden" value="99991231">
					</c:if>
						<fieldset>
							<legend>입력 양식</legend>
							<p class="info_pilsoo pilsoo_item">필수입력</p>
							<ul class="app_list">
								<li class="clear">
									<label for="nttSj" class="tit_lbl pilsoo_item">제목</label>
									<div class="app_content">
									<input class="w100p" name="nttSj" title="<spring:message code="cop.nttSj" />" type="text" value='<c:out value="${result.nttSj}" />'>
					           		<br/><form:errors path="nttSj" />
									</div>
								</li>
								<li class="clear">
									<label for="nttCn" class="tit_lbl">내용</label>
									<div class="app_content">
									<textarea class="w100p" id="nttCn" name="nttCn"  cols="75" rows="20"  style="width:99%;" title="<spring:message code="cop.nttCn" />"><c:out value="${result.nttCn}" escapeXml="false" /></textarea> 
					          		<form:errors path="nttCn" />
									</div>
								</li>
								<c:if test="${not empty result.atchFileId}">
									<li class="clear">
							            <label class="tit_lbl"><spring:message code="cop.atchFileList" /></label>
							            <div class="app_content">
							                <c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
							                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
							                </c:import>
							            </div>
							        </li>
							     </c:if>   
							     <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
							          <li class="clear">
							            <label for="egovComFileUploader" class="tit_lbl"><spring:message code="cop.atchFile" /></label>
							            <div class="app_content" id="file_upload_posbl"  style="display:none;" >  
							                        <input name="file_1" id="egovComFileUploader" type="file" />
							                            <div id="egovComFileList"></div>
							            </div>
							            <div class="app_content" id="file_upload_imposbl"  style="display:none;" >
							            </div>
							            <c:if test="${empty result.atchFileId}">
			                                <input class="w100p" type="hidden" name="fileListCnt" value="0" />
			                            </c:if>
							          </li>
							     </c:if>
							</ul>
							<p class="btn_line txt_right">
							<c:if test="${bdMstr.authFlag == 'Y'}">
					        	<c:if test="${result.frstRegisterId == searchVO.frstRegisterId}"> 
					              <a class="btn_bbs" href="#LINK" onclick="javascript:fn_egov_regist_notice(); return false;"><spring:message code="button.save" /></a> 
						        </c:if>
					        </c:if>
					        <a class="btn_bbs" href="<c:url value='/main/template_start${prefix}/Board.do'/>" onclick="javascript:fn_egov_select_noticeList(); return false;"><spring:message code="button.list" />
							</a>
							</p>	
						</fieldset>
					</form:form>
					<!-- //appForm -->
				</div>
				<!-- //bodytext_area -->
			</div>			
			<!-- //content 끝 -->
	</div>
	<!-- //container -->
	
	<!-- footer 시작 -->
	<c:import url="/EgovPageLink.do?link=main/template_start/inc/footer" />
	<!-- //footer 끝 -->
</div>
<!-- //wrap 끝 -->
<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
<script type="text/javascript">
var existFileNum = document.board.fileListCnt.value;        
var maxFileNum = document.board.posblAtchFileNumber.value;

if (existFileNum=="undefined" || existFileNum ==null) {
    existFileNum = 0;
}
if (maxFileNum=="undefined" || maxFileNum ==null) {
    maxFileNum = 0;
}       
var uploadableFileNum = maxFileNum - existFileNum;
if (uploadableFileNum<0) {
    uploadableFileNum = 0;
}               
if (uploadableFileNum != 0) {
    fn_egov_check_file('Y');
    var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
    multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
} else {
    fn_egov_check_file('N');
}           
</script>
</c:if>
<!-- common_bottom 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_bottom" />
<!-- common_bottom 끝 -->