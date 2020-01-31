<%--
  Class Name : header.jsp
  Description : 화면상단 Header(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.01.24   KIK       경량환경 버전 생성
 
    author   : 타임스페이스 KIK
    since    : 2020.01.24 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<header id="header">
	<div class="header_area box_inner clear">	
		<h1><a href="<c:url value='/cmm/main/mainPage.do' />">스프링 in EDU</a></h1>
		<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
		<!-- header_cont -->
		<div class="header_cont">
			<script type="text/javascript">
			    function fn_main_headPageMove(menuNo, url){
				    document.selectOne.menuNo.value=menuNo;
				    document.selectOne.link.value=url;
				    document.selectOne.action = "<c:url value='/EgovPageLink.do'/>";
				    //alert(document.selectOne.action);
				    document.selectOne.submit();
			    }
			    function fn_main_headPageAction(menuNo, url){
			        document.selectOne.menuNo.value=menuNo;
			        document.selectOne.link.value="";
			        document.selectOne.action = "<c:url value='/' />"+url;
			        document.selectOne.method = "post";
			        //alert(document.selectOne.action);
			        document.selectOne.submit();
			    }
			</script>
			<ul class="util clear">
			    <%
			       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
			       if(loginVO == null){ 
			    %>
			    	<li><a href="<c:url value='/uat/uia/egovLoginUsr.do'/>">로그인</a></li>
			    <% }else { %>
			    	<c:set var="loginName" value="<%= loginVO.getName()%>"/>
			    	<li><span style="color:#fff"><c:out value="${loginName}"/>님 환영합니다</span></li>
			    <% } %>
			    <%
			       if(loginVO != null){ 
			    %>
			    <li><a href="#LINK" onclick="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')" >사이트관리(관리자)</a></li>
			    <li><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
			    <%
			       }
			    %>
			</ul>
			<!-- topmenu start -->
			<form name="selectOne" action="#LINK">
			<input name="menuNo" type="hidden" />
			<input name="link" type="hidden" />
			</form>
			<nav>
			<ul class="gnb clear">
				<li><a class="openAll1 openAll" href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">사이트소개</a>
					<div class="gnb_depth gnb_depth2_1">
                        <ul class="submenu_list">
                            <li><a href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">소개</a></li>	
							<li><a href="javascript:fn_main_headPageMove('12','main/sample_menu/EgovHistory')">연혁</a></li>
							<li><a href="javascript:fn_main_headPageMove('13','main/sample_menu/EgovOrganization')">조직소개</a></li>
							<li><a href="javascript:fn_main_headPageMove('14','main/sample_menu/EgovLocation')">찾아오시는 길</a></li>
                        </ul>
                        <p class="closeSubmenu" style="float:right"><a href="javascript:;" style="padding:0 10px 0 50px;background:none;">닫기</a></p>
                    </div>
				</li>
				<li><a class="openAll2 openAll" href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">정보마당</a>
					<div class="gnb_depth gnb_depth2_2">
                        <ul class="submenu_list">
                            <li><a href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">주요사업 소개</a></li>	
                            <li><a href="javascript:fn_main_headPageMove('22','main/sample_menu/EgovServiceInfo')">대표서비스 소개</a></li>
                        </ul>
                        <p class="closeSubmenu" style="float:right"><a href="javascript:;" style="padding:0 10px 0 50px;background:none;">닫기</a></p>
                    </div>
				</li>
				<li><a class="openAll3 openAll" href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">고객지원</a>
					<div class="gnb_depth gnb_depth2_3">
                        <ul class="submenu_list">
                            <li><a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">자료실</a></li>	
                        </ul>
                        <p class="closeSubmenu" style="float:right"><a href="javascript:;" style="padding:0 10px 0 50px;background:none;">닫기</a></p>
                    </div>
				</li>
				<li><a class="openAll4 openAll" href="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')">알림마당</a>
					<div class="gnb_depth gnb_depth2_4">
                        <ul class="submenu_list">
                            <li><a href="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')">오늘의 행사</a></li>	
                        </ul>
                        <p class="closeSubmenu" style="float:right"><a href="javascript:;" style="padding:0 10px 0 50px;background:none;">닫기</a></p>
                    </div>
				</li>
			</ul>
               </nav>
               <!-- //topmenu end -->
			<p class="closePop"><a href="javascript:;">닫기</a></p>
		</div>
		<!-- //header_cont -->
	</div>
</header>
	