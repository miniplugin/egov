<%--
  Class Name : EgovDownloadModify.jsp
  Description : 샘플화면 - 자료실 등록(sample)
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
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" /></div>
	
				<!-- bodytext_area -->
				<div class="bodytext_area box_inner">
					<!-- appForm -->
					<form action="#" class="appForm">
						<fieldset>
							<legend>입력 양식</legend>
							<p class="info_pilsoo pilsoo_item">필수입력</p>
							<ul class="app_list">
								<li class="clear">
									<label for="name_lbl" class="tit_lbl pilsoo_item">제목</label>
									<div class="app_content"><input type="text" class="w100p" name="name_lbl" id="name_lbl" placeholder="제목을 입력해주세요"/></div>
								</li>
								<li class="clear">
									<label for="content_lbl" class="tit_lbl">내용</label>
									<div class="app_content"><textarea name="content_lbl" id="content_lbl" class="w100p" placeholder="내용입력"></textarea></div>
								</li>
								<li class="clear">
									<label for="datafile" class="tit_lbl">파일첨부</label>
									<div class="app_content"><input type="file" class="w100p" name="datafile" /></div>
								</li>
							</ul>
							<p class="btn_line txt_right">
							<a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')" class="btn_bbs">목록</a>
							<a href="javascript:;" class="btn_bbs">저장</a>
							<!-- <a href="javascript:;" class="btn_baseColor">등록</a> -->
							</p>	
						</fieldset>
					</form>
					<!-- //appForm -->
					
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