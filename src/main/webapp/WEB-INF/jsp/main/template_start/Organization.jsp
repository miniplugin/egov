<%--
  Class Name : EgovOrganization.jsp
  Description : 샘플화면 - 조직도(sample)
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
							<li><strong>조직소개</strong></li>
						</ul>
					</div>
				</div>				
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle01.gif" width="776" height="230" alt="" /></div>   
				<!-- content_field 시작 -->
				<div class="content_field">
				<div><h2>조직소개</h2></div>
					<h3>조직</h3>
					<fieldset><legend>조건정보 영역</legend><p>오픈커뮤니티의 초기 정착을 위해 표준프레임워크 개발 참여자와 국내 주요 오픈커뮤니티의 운영자․전문가를 리딩그룹(PMC, 커미터)으로 구성</p>
					<p>오픈커뮤니티의 지속적인 확대․발전을 위해 프로젝트 활동에 적극적으로 참여하는 커뮤니티 회원이 리딩그룹의 역할을 획득할 수 있도록 투명하고 공정한 의사결정 체계를 수립</p>
					</fieldset>							
				</div>
				<!-- //content_field 끝 -->
			</div>
			<!-- //content 끝 -->
		</div>
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