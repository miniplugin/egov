<%--
  Class Name : BoardReply.jsp
  Description : 샘플화면 - 답글 등록(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.03   KIK       경량환경 버전 생성
 
    author   : 타임스페이스 KIK
    since    : 2020.02.03 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>

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

    function fn_egov_validateForm(obj) {
        return true;
    }

    function fn_egov_regist_notice() {
        //document.board.onsubmit();
        if (!validateBoard(document.board)){
            return;
        }
        //ck에디터 내용 입력 제약 조건 추가
        var editor_data = CKEDITOR.instances.nttCn.getData();
		if (editor_data  == '') {
			alert('내용을 입력해 주세요.');
		    CKEDITOR.instances.nttCn.focus();
		    return false;
		}
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.board.action = "<c:url value='/main/template_start${prefix}/replyBoard.do'/>";
            document.board.submit();                    
        }
    }
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/main/template_start${prefix}/Board.do'/>";
        document.board.submit();    
    }
</script>
<!-- ck 에디터추가 -->
<script type="text/javascript" src="<c:url value='/'/>resources/plugins/ckeditor/ckeditor.js"></script>
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
						<double-submit:preventer tokenKey="someKey"/>
						<input type="hidden" name="replyAt" value="Y" />
						<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>" />
						<input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>" />
						<input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>" />
						<input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>" />
						
						<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
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
									<input class="w100p" name="nttSj" title="<spring:message code="cop.nttSj" />" type="text" value="RE: <c:out value='${result.nttSj}'/>">
					           		<br/><form:errors path="nttSj" />
									</div>
								</li>
								<li class="clear">
									<label for="nttCn" class="tit_lbl">내용</label>
									<div class="app_content">
									<textarea class="ckeditor w100p" id="nttCn" name="nttCn"  cols="75" rows="20"  style="width:99%;" title="<spring:message code="cop.nttCn" />"></textarea> 
					          		<form:errors path="nttCn" />
									</div>
								</li>
							     <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
							          <li class="clear">
							            <label for="egovComFileUploader" class="tit_lbl"><spring:message code="cop.atchFile" /></label>
							            <div class="app_content" id="file_upload_posbl">  
							                        <input name="file_1" id="egovComFileUploader" type="file" />
							                            <div id="egovComFileList"></div>
							            </div>
							          </li>
							     </c:if>
							</ul>
							<p class="btn_line txt_right">
							<c:if test="${bdMstr.authFlag == 'Y'}">
				              <a class="btn_bbs" href="#LINK" onclick="javascript:fn_egov_regist_notice(); return false;"><spring:message code="button.save" /></a> 
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
var maxFileNum = document.board.posblAtchFileNumber.value;
if(maxFileNum==null || maxFileNum==""){
    maxFileNum = 3;
} 
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );         
</script>    
</c:if>
<!-- common_bottom 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_bottom" />
<!-- common_bottom 끝 -->