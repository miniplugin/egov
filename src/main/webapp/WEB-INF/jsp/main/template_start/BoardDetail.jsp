<%--
  Class Name : BoardDetail.jsp
  Description : 샘플화면 - 자료실 상세조회(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/sub.css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function onloading() {
        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/main/template_start${prefix}/Board.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_delete_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/main/template_start${prefix}/deleteBoard.do'/>";
            document.frm.submit();
        }   
    }
    
    function fn_egov_moveUpdt_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }

        document.frm.action = "<c:url value='/main/template_start${prefix}/forUpdateBoard.do'/>";
        document.frm.submit();          
    }
    
    function fn_egov_addReply() {
        document.frm.action = "<c:url value='/main/template_start${prefix}/addReplyBoard.do'/>";
        document.frm.submit();          
    }   
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/bbs/selectCommentList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/bbs/selectSatisfactionList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
    function fn_egov_addScrap() {
        document.frm.action = "<c:url value='/cop/bbs/addScrap.do'/>";
        document.frm.submit();          
    }
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->
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
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" alt="자료실 전자정부표준프레임워크 경량환경 페이지의 다양한 종류의 자룔르 다운 받으실 수 있습니다."/></div>
				<form name="frm" method="post" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
					<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
					<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
					<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
					<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
					<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
				<!-- bodytext_area -->
				<div class="bodytext_area box_inner">			
					<ul class="bbsview_list">
						<li class="bbs_title"><c:out value="${result.nttSj}" /></li>
						<!-- 작성자 : <span><c:out value="${result.frstRegisterNm}" /></span></li> -->
						<li class="bbs_date">작성일 : <span><c:out value="${result.frstRegisterPnttm}" /></span></li>
						<li class="bbs_hit">조회수 : <span><c:out value="${result.inqireCo}" /></span></li>
						<c:if test="${not empty result.atchFileId}">
							<li class="bbs_title">첨부파일정보 : 
								<span>
									<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
				                    	<c:param name="param_atchFileId" value="${result.atchFileId}" />
				                	</c:import>
				                </span>
						    </li>
					        <c:if test="${result.bbsAttrbCode == 'BBSA02'}">
					          	<li class="bbs_content">첨부이미지 : 
									<span>
										<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
					                        <c:param name="atchFileId" value="${result.atchFileId}" />
					                    </c:import>
					                </span>
							    </li>
					        </c:if>
					     </c:if>
						<li class="bbs_content">
							<div class="editer_content">
							    <c:out value="${result.nttCn}" escapeXml="false" />
		                    </div>
						</li>
					</ul>
					<p class="btn_line txt_right">
					<% if(null != session.getAttribute("LoginVO")){ %>
			             <c:if test="${result.frstRegisterId == sessionUniqId}">     
							<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;" class="btn_bbs">수정</a>
							<a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;" class="btn_bbs">삭제</a>  
						</c:if>    
			        	<c:if test="${result.replyPosblAt == 'Y'}">  
			        		<a href="#LINK" onclick="javascript:fn_egov_addReply(); return false;" class="btn_bbs">답글작성</a> 
			        	</c:if>
			        <% } %>
			        <a href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;" class="btn_bbs">목록</a>
			        </p>
			        <!-- 
					<ul class="near_list mt20">
						<li><h4 class="prev">다음글</h4><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>		
						<li><h4 class="next">이전글</h4><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (스프링경비 50만원 지원)</a></li>
					</ul>
					 -->
				</div>
				<!-- //bodytext_area -->
 				</form>
			</div>
			<!-- //content 끝 -->
	</div>
	<!-- //container -->
	
	<!-- footer 시작 -->
	<c:import url="/EgovPageLink.do?link=main/template_start/inc/footer" />
	<!-- //footer 끝 -->
</div>
<!-- //wrap 끝 -->

<!-- common_bottom 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_bottom" />
<!-- common_bottom 끝 -->