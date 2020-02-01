<%--
  Class Name : EgovDownloadDetail.jsp
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

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=include/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/home/css/sub.css">
<!-- wrap -->
<div id="wrap">
	<!-- header 시작 -->
	<c:import url="/EgovPageLink.do?link=include/header" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->
	<div id="container">
		<!-- 좌측메뉴 시작 -->
		<div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
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
                            <li><strong>자료실</strong></li>
                        </ul>
					</div>
				</div>	
				<!-- //현재위치 네비게이션 끝 -->
				<!-- 타이틀 이미지 -->			
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" alt="자료실 전자정부표준프레임워크 경량환경 페이지의 다양한 종류의 자룔르 다운 받으실 수 있습니다."/></div>
	
				<!-- bodytext_area -->
				<div class="bodytext_area box_inner">			
					<ul class="bbsview_list">
						<li class="bbs_title">박물관 미션 투어 응모 당첨자 발표</li>
						<li class="bbs_hit">작성일 : <span>2018.08.09</span></li>
						<li class="bbs_date">조회수 : <span>235</span></li>
						<li class="bbs_hit">파일정보 : <span>egovframework-common-all.zip [15,083,713 byte]</span></li>
						<li class="bbs_date"><span><a href="#"><img src="<c:url value='/'/>images/btn/btn_download.gif"  alt="download" /></a></span></li>
						<li class="bbs_content">
							<div class="editer_content">
							    안녕하세요. 믿을 수 있는 스프링정보, 스프링입니다.<br>
		                        박물관 미션투어에 관심과 참여 감사드립니다. <br>
		                        선정되신 분들도 진심으로 축하드립니다. <br>
		                        앞으로도 큰 관심 부탁드리며, 메일로도 안내 예정이니 참고하시기 바랍니다. <br>
		                        감사합니다. <br><br>
		                        [당첨자]<br>
		                        김용* kimyong***@naver.com <br>
		                        인봉* in2018a***@naver.com<br>
		                        예경* yyhong***@naver.com<br>
		                        한진* haha***@naver.com<br>
		                        박수* pky**@naver.com<br>
		                        명진* mma5**@nate.com<br>
		                        김영* rtfg6*@naver.com<br>
		                        서영* seo20**@gmail.com<br>
		                        윤소* yoon2***@naver.com<br>
		                        지은* ji***@daum.net
		                    </div>
						</li>
					</ul>
					<p class="btn_line txt_right">
						<a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')" class="btn_bbs">목록</a>
						<a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadModify'/>" class="btn_bbs">수정</a>
					</p>
					<ul class="near_list mt20">
						<li><h4 class="prev">다음글</h4><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>		
						<li><h4 class="next">이전글</h4><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (스프링경비 50만원 지원)</a></li>
					</ul>
				</div>
				<!-- //bodytext_area -->
 	
			</div>
			<!-- //content 끝 -->
	</div>
	<!-- //container -->
	
	<!-- footer 시작 -->
	<c:import url="/EgovPageLink.do?link=include/footer" />
	<!-- //footer 끝 -->
</div>
<!-- //wrap 끝 -->

<!-- common_bottom 시작 -->
<c:import url="/EgovPageLink.do?link=include/common_bottom" />
<!-- common_bottom 끝 -->