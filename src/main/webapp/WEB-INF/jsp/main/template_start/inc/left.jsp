<%--
  Class Name : EgovIncLeftmenu.jsp
  Description :  좌메뉴 화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<%
String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div id="nav">	
	<div class="top"></div>             
	<div class="nav_style">
	<ul>
	    <% if (menuNo.indexOf("1")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('11','main/template_start/AboutSite')">사이트소개</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('11','main/template_start/AboutSite')">소개</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('12','main/template_start/History')">연혁</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('13','main/template_start/Organization')">조직소개</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('14','main/template_start/Location')">찾아오시는 길</a></li>
			</ul> 
		</li>
		<% } %>
		<% if (menuNo.indexOf("2")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('21','main/template_start/ProductInfo')">정보마당</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('21','main/template_start/ProductInfo')">주요사업 소개</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('22','main/template_start/ServiceInfo')">대표서비스 소개</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("3")== 0) {%>
		<li class="leftmenu_dept01">
			<!-- <a href="javascript:fn_main_headPageMove('31','main/template_start/Board')">고객지원</a>  -->
			<a href="javascript:fn_main_headPageAction('31','main/template_start/Board.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">고객지원</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('31','main/template_start/Board.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">공지사항</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('32','main/template_start/Board.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">갤러리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('33','main/template_start/Service')">서비스신청</a></li>
			</ul>
		</li>
		<% } %>
        <% if (menuNo.indexOf("4")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">알림마당</a>
			<ul>
			    <li class="dept02"><a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">오늘의 행사</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')">금주의 행사</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">공지사항</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('44','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">사이트갤러리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("5")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')">사이트관리</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')">일정관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('52','cop/com/selectTemplateInfs.do')">게시판템플릿관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('53','cop/bbs/SelectBBSMasterInfs.do')">게시판생성관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('54','cop/com/selectBBSUseInfs.do')">게시판사용관리</a></li> 
				<li class="dept02"><a href="javascript:fn_main_headPageAction('55','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">공지사항관리</a></li>
                <li class="dept02"><a href="javascript:fn_main_headPageAction('56','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">사이트갤러리관리</a></li>
                <li class="dept02"><a href="javascript:fn_main_headPageAction('57','uss/umt/mber/EgovMberManage.do')">관리자관리</a></li>
			</ul> 
		</li>
		<% } %>
	</ul>
	</div>
	<div class="bottom"></div>		
</div>
<!-- //메뉴 끝 -->	
