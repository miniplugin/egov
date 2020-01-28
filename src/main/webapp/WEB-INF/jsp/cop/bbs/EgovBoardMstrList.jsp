<%--
  Class Name : EgovFileList.jsp
  Description : 파일목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.12   이삼섭          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.12
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>게시판 목록</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}
	
	function fn_egov_insert_addBrdMstr(){	
		document.frm.action = "<c:url value='/cop/bbs/addBBSMaster.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_inqire_brdMstr(bbsId){
		document.frm.bbsId.value = bbsId;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>";
		document.frm.submit();			
	}
</script>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
	
	A:link    { color: #000000; text-decoration:none; }
	A:visited { color: #000000; text-decoration:none; }
	A:active  { color: #000000; text-decoration:none; }
	A:hover   { color: #fa2e2e; text-decoration:none; }	
</style>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 -->
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>사이트관리</li>
                            <li>&gt;</li>
                            <li><strong>게시판생성관리</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field"> 
                    <div id="search_field_loc"><h2><strong>게시판 정보</strong></h2></div>
					<form name="frm" action="<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>" method="post">
						<input type="hidden" name="bbsId">
						<input type="hidden" name="trgetId">
                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                        <fieldset><legend>조건정보 영역</legend>    
                        <div class="sf_start">
                            <ul id="search_first_ul">
                                <li>
                                    <label for="searchCnd" >검색유형선력</label>
					                <select id="searchCnd" name="searchCnd" title="검색유형선력">
					                   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
					                   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>   
					                </select>
                                </li>
                                <li>
                                <label for="searchWrd" >검색어</label>
                                <input title="검색값입력" id="searchWrd" name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}" />' maxlength="35" onkeypress="press(event);"> 
                                </li>       
                            </ul>
                            <ul id="search_second_ul">
                                <li>
                                    <div class="buttons" style="position:absolute;left:870px;top:182px;">
                                       <a href="<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>" onclick="fn_egov_select_brdMstr('1'); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
                                       <a href="<c:url value='/cop/bbs/addBBSMaster.do'/>" onclick="fn_egov_insert_addBrdMstr(); return false;"><spring:message code="button.create"/></a>
                                       <input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_select_brdMstr('1'); return false;" id="invisible" class="invisible" />
                                    </div>                              
                                </li>
                            </ul>           
                        </div>          
                        </fieldset>
                    </form>
                </div>
                <!-- //검색 필드 박스 끝 -->

                <!-- div id="page_info"><div id="page_info_align">총 <strong>321</strong>건 (<strong>1</strong> / 12 page)</div></div-->                    
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호,게시판명,게시판유형,게시판속성,생성일,사용여부  목록입니다" cellpadding="0" cellspacing="0">
                    <caption>사용자목록관리</caption>
                    <colgroup>
                    <col width="10%">
                    <col width="44%">  
                    <col width="10%">
                    <col width="10%">
                    <col width="15%">
                    <col width="8%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">번호</th>
                        <th scope="col" nowrap="nowrap">게시판명</th>
                        <th scope="col" nowrap="nowrap">게시판유형</th>
                        <th scope="col" nowrap="nowrap">게시판속성</th>
                        <th scope="col" nowrap="nowrap">생성일</th>
                        <th scope="col" nowrap="nowrap">사용여부</th>
                    </tr>
                    </thead>
                    <tbody>                 

                    <c:forEach var="result" items="${resultList}" varStatus="status">
                    <!-- loop 시작 -->                                
					  <tr>
					    <!--td class="lt_text3" nowrap="nowrap"><strong><input type="checkbox" name="check1" class="check2"></strong></td-->
					    <td nowrap="nowrap"><strong><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></strong></td>		    
					    <td nowrap="nowrap">
					    	
						    <!-- 2010.11.1 
						    <form name="item" method="post" action="<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>">
				        		<input type=hidden name="bbsId" value="<c:out value="${result.bbsId      }"/>">
				            	<span class="link"><input type="submit" value="<c:out value="${result.bbsNm}"/>" onclick="fn_egov_inqire_brdMstr('<c:out value="${result.bbsId}"/>'); return false;"></span>
				        	</form>
				            -->
			
							<a href="<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>">
								<c:out value="${result.bbsNm}"/>
							</a>
				            
				            
					    </td>
					    <td nowrap="nowrap"><c:out value="${result.bbsTyCodeNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.bbsAttrbCodeNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.frstRegisterPnttm}"/></td>
					    <td nowrap="nowrap">
					    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
					    	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
					    </td>  
					  </tr>
	                </c:forEach>	  
					<c:if test="${fn:length(resultList) == 0}">
					  <tr>
					    <td nowrap colspan="6"><spring:message code="common.nodata.msg" /></td>  
					  </tr>		 
					</c:if>
			        </tbody>
	                </table>
                </div>
		        <!-- 페이지 네비게이션 시작 -->
		        <div id="paging_div">
                    <ul class="paging_align">
                       <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr"  />
                    </ul>
		        </div>                          
                </div>
                <!-- //페이지 네비게이션 끝 -->  
            <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->
	    <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	    <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>