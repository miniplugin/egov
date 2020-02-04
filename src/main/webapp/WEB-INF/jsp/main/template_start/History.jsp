<%--
  Class Name : EgovHistory.jsp
  Description : 샘플화면 - 사이트 연혁(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/sub.css">

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
							<li>사용자관리</li>
							<li>&gt;</li>
							<li><strong>연혁</strong></li> 
						</ul>
					</div>
				</div>				
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle01.gif" width="776" height="230" alt="그림테스트" /></div>   
				<!-- main content 시작 -->
				<div class="content_field">
						<div><h2>표준프레임워크 연혁</h2></div>
							<h3>History</h3>
							<fieldset><legend>조건정보 영역</legend>
									<p>표준프레임워크 활성화 전담조직으로 한국정보화진흥원(NIA)에 2010년 11월 4일 「표준프레임워크센터」가 설립되었으며 정책지원, 글로벌 확산 등을 담당할 NIA 인력과 R&amp;D, 기술지원 등을 담당할 외부 민간 전문가로 구성되었습니다. </p>
							</fieldset>			
						
				</div>
				<!-- //main content 끝 -->
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