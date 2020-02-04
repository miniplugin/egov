<%--
  Class Name : EgovAboutSite.jsp
  Description : 샘플화면 - 자료실목록조회(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/sub.css">
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
    function press(event) {
    }

    function fn_egov_addNotice() {
    }
    
    function fn_egov_select_noticeList(pageNo) {
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {      
    }
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_noticeList('1');
        }
    }

    function fn_egov_addNotice() {
        document.frm.action = "<c:url value='/main/template_start${prefix}/addBoard.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/main/template_start${prefix}/Board.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/main/template_start${prefix}/BoardDetail.do'/>";
        document.subForm.submit();          
    }
//-->
</script>
</c:otherwise>
</c:choose>
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
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" alt="자료실 전자정부표준프레임워크 경량환경 페이지의 다양한 종류의 쟈료를 다운 받으실 수 있습니다."/></div>

                <!-- bodytext_area -->
				<div class="bodytext_area box_inner">
					<form class="minisrch_form" name="frm" action ="<c:url value='/main/template_start${prefix}/Board.do'/>" method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                        <fieldset>
					    <select id="search_select" name="searchCnd" class="select" title="검색조건 선택">
					           <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
					           <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>             
					           <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>            
                        </select>
                        <legend>검색</legend>
                        <input class="tbox" name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
                        <a class="btn_srch" href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;">검색</a>
                        </fieldset>
                    </form>
					<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
						<caption class="hdd">공지사항  목록</caption>
						<thead>
							<tr>
								<th scope="col">번호</th>
		                        <th scope="col">제목</th>
		                        <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
			                        <th scope="col">게시시작일</th>
			                        <th scope="col">게시종료일</th>
			                    </c:if>
			                    <c:if test="${anonymous != 'true'}">
			                        <th scope="col">작성자</th>
			                    </c:if>
		                        <th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
		                    <!-- loop 시작 -->
		                      <tr>
		                        <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>            
						        <td class="tit_notice">
						            <form name="subForm" method="post" action="<c:url value='/main/template_start${prefix}/BoardDetail.do'/>">
						            <c:if test="${result.replyLc!=0}">
						                <c:forEach begin="0" end="${result.replyLc}" step="1">
						                    &nbsp;
						                </c:forEach>
						                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
						            </c:if>
						            <c:choose>
						                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
						                    <c:out value="${result.nttSj}" />
						                </c:when>
						                <c:otherwise>
						                        <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						                        <span class="link"><input type="submit" style="background-color:inherit;width:100%;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>" ></span>
						                </c:otherwise>
						            </c:choose>
						            </form>
						        </td>
						        <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
						            <td ><c:out value="${result.ntceBgnde}"/></td>
						            <td ><c:out value="${result.ntceEndde}"/></td>
						        </c:if>
						        <c:if test="${anonymous != 'true'}">
						            <td ><c:out value="${result.frstRegisterNm}"/></td>
						        </c:if>
						        <td ><c:out value="${result.inqireCo}"/></td>
						        <td ><c:out value="${result.frstRegisterPnttm}"/></td>
						      </tr>
				        	</c:forEach>     
						     <c:if test="${fn:length(resultList) == 0}">
						      <tr>
						        <c:choose>
						            <c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
						                <td colspan="7" ><spring:message code="common.nodata.msg" /></td>
						            </c:when>
						            <c:otherwise>
						                <c:choose>
						                    <c:when test="${anonymous == 'true'}">
						                        <td colspan="4" ><spring:message code="common.nodata.msg" /></td>
						                    </c:when>
						                    <c:otherwise>
						                        <td colspan="5" ><spring:message code="common.nodata.msg" /></td>
						                    </c:otherwise>
						                </c:choose>     
						            </c:otherwise>
						        </c:choose>       
						          </tr>      
						     </c:if>  
						</tbody>
					</table>
					<!-- 페이지 네비게이션 시작 -->
	                <div class="pagination" id="paging_div">
	                    <ul class="paging_align">
	                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />    
	                    </ul>
	                </div>
	                <!-- //페이지 네비게이션 끝 -->  
					<!-- pagination ImagePaginationRenderer.java 에 디자인적용
					<div class="pagination">
						<a href="javascript:;" class="firstpage  pbtn"><img src="<c:url value='/'/>resources/template_start/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
						<a href="javascript:;" class="prevpage  pbtn"><img src="<c:url value='/'/>resources/template_start/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
						<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
						<a href="javascript:;"><span class="pagenum">2</span></a>
						<a href="javascript:;"><span class="pagenum">3</span></a>
						<a href="javascript:;"><span class="pagenum">4</span></a>
						<a href="javascript:;"><span class="pagenum">5</span></a>
						<a href="javascript:;" class="nextpage  pbtn"><img src="<c:url value='/'/>resources/template_start/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
						<a href="javascript:;" class="lastpage  pbtn"><img src="<c:url value='/'/>resources/template_start/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
					</div>
					//pagination -->
					<% if(null != session.getAttribute("LoginVO")){ %>
					<p class="btn_line txt_right">
                       <c:if test="${brdMstrVO.authFlag == 'Y'}">
                           <a class="btn_bbs" href="<c:url value='/main/template_start${prefix}/addBoard.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>">등록</a>
                       </c:if>
                    </p>
                    <%} %>					
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

<!-- common_bottom 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_bottom" />
<!-- common_bottom 끝 -->