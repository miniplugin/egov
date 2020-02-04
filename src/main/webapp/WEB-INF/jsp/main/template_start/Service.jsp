<%--
  Class Name : EgovService.jsp
  Description : 샘플화면 - 대표서비스 조회화면(sample)
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
                            <li>고객지원</li>
                            <li>&gt;</li>
                            <li><strong>서비스신청</strong></li>
						</ul>
					</div>
				</div>	
				<!-- //현재위치 네비게이션 끝 -->
				<!-- 타이틀 이미지 -->			
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-03.gif" width="776" height="230" alt="서비스 신청 표준프레임워크 경량환경의 원하시는 서비스를 신청을 하실 수 있습니다."/></div>
				<div class="content_field">
				<div><h2>서비스 신청</h2></div>
					<h3>주요서비스안내</h3>
					<fieldset><legend>조건정보 영역</legend>
							<p>서비스필요시 다음과 같은 절차로 신청하시면 됩니다.</p>
							<p>1. 필요한 서비스 확인</p>
							<p>2. 자료실에서 필요한 서비스 존재여부 확인</p>
							<p>3. 서비스요청을 통해 필요한 서비스 신청</p>
							<a href="<c:url value='EgovPageLink.do?link=main/template_start/EgovServiceInfo'/>">대표 서비스 자세히 보기</a>
					</fieldset>			
				
				</div>
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