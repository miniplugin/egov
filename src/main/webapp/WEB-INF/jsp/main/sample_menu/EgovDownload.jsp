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
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle03-01.gif" width="776" height="230" alt="자료실 전자정부표준프레임워크 경량환경 페이지의 다양한 종류의 쟈료를 다운 받으실 수 있습니다."/></div>

                <!-- bodytext_area -->
				<div class="bodytext_area box_inner">
					<form action="form_action.jsp" method="post" class="minisrch_form">
						<fieldset>
							<select name="search_select" id="search_select">
							    <option value="0" selected="selected">전체</option>
							    <option value="1">제목</option>
							    <option value="2">제목/내용</option>
							    <option value="3">작성자</option>
							</select>
							<legend>검색</legend>
							<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
							<a href="javascript:;" onclick="submit();" class="btn_srch">검색</a>
						</fieldset>
					</form>
					<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
						<caption class="hdd">공지사항  목록</caption>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">이번 여름 휴가 제주 갈까? 미션 투어 (스프링경비 50만원 지원)</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">박물관 미션 투어 응모 당첨자 발표</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>3</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>4</td>
								<td class="tit_notice"><a href="javascript:;">하롱베이 서비스 OPEN! (스프링정보, 가이드북, 가이드맵)</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">스프링 서비스 점검 안내 - 스프링에서 매월 실시하는 정기점검 안내</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>6</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">이번 여름 휴가 제주 갈까? 미션 투어 (스프링경비 50만원 지원)</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>7</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">박물관 미션 투어 응모 당첨자 발표</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>8</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>9</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">하롱베이 서비스 OPEN! (스프링정보, 가이드북, 가이드맵)</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
							<tr>
								<td>10</td>
								<td class="tit_notice"><a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadDetail'/>">스프링 서비스 점검 안내</a> </td>
								<td>123</td>
								<td>2018-08-01</td>
							</tr>
						</tbody>
					</table>
					<!-- pagination -->
					<div class="pagination">
						<a href="javascript:;" class="firstpage  pbtn"><img src="<c:url value='/'/>resources/home/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
						<a href="javascript:;" class="prevpage  pbtn"><img src="<c:url value='/'/>resources/home/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
						<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
						<a href="javascript:;"><span class="pagenum">2</span></a>
						<a href="javascript:;"><span class="pagenum">3</span></a>
						<a href="javascript:;"><span class="pagenum">4</span></a>
						<a href="javascript:;"><span class="pagenum">5</span></a>
						<a href="javascript:;" class="nextpage  pbtn"><img src="<c:url value='/'/>resources/home/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
						<a href="javascript:;" class="lastpage  pbtn"><img src="<c:url value='/'/>resources/home/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
					</div>
					<!-- //pagination -->
					<p class="btn_line txt_right">
						<a class="btn_bbs" href="<c:url value='/EgovPageLink.do?link=main/sample_menu/EgovDownloadModify'/>">등록</a>
					</p>
					
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