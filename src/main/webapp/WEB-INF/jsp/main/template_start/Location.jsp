<%--
  Class Name : EgovLocation.jsp
  Description : 샘플화면 - 찾아오시는길(sample)
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
							<li><strong>찾아오시는길</strong></li>
						</ul>
					</div>
				</div>				
				<div id="content_img_div"><img src="<c:url value='/'/>images/subtitle/img_subtitle01.gif" width="776" height="230" alt="홈페이지 소개 표준프레임워크 경량환경의 개요와 연력, 조직소개, 표준프레임워크센터의 약도 등의 정보를 제공하고 있습니다."/></div>  
				<!-- main content 시작 -->
				<div class="content_field">
						<div><h2>찾아오시는길</h2></div>
							<h3>무교청사 찾아 오시는 길</h3>
							<div>
								<p>
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.013814772011!2d127.14930725102933!3d36.81818887428783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b285cb903dcbf%3A0xbfa1cdcd9b991212!2z7LKc6rSR67mM65Sp!5e0!3m2!1sko!2skr!4v1571849036809!5m2!1sko!2skr" width="100%" height="300" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
								</p>
							</div>
							<h3>상세안내 </h3>
							<fieldset><legend>조건정보 영역</legend>
								<ul>
									<li>-<strong>지하철</strong>
										<ul>
											<li>[1호선]1호선 시청역 5번출구 ▶ 시청삼거리에서 좌회전 ▶서울파이낸스빌딩 옆</li>
											<li>[2호선]2호선 을지로입구역 1번출구 ▶ 시청삼거리에서 우회전 ▶ 맥도날드 건너편</li>
											<li>[5호선]5호선 광화문역 5번출구▶ 동아일보사 건너편</li>
										</ul>
									</li>
								</ul>
								<ul>
									<li>-<strong>버스</strong>
										<ul>
											<li>파이낸셜빌딩 앞 서울신문사 정류장 하차. 청계천 방면 우회전, 동아일보사 건너편</li>
											<li>중앙인사위원회 건물 우측 한국정보화진흥원 빌딩 파랑색 간선노선버스와 초록색 지선노선버스인</li>
											<li>150, 162, 402, 0014, 0015, 1011, 1711, 7017, 7020, 7021 이용</li>
										</ul>
									</li>
								</ul>
								<ul>
									<li>-<strong>승용차</strong>
										<ul>
											<li> 건물뒷편 주차장 입구에서 차량용 리프트를 이용하여 지하 주차장에 주차한 후 엘리베이터를     이용하여</li>
											<li> 1F 안내데스크에서 안내를 받아 주십시오.</li>
										</ul>
									</li>
								</ul>
								<ul>
									<li>-<strong>공항에서 오시는 길(KAL LIMOUSINE BUS)</strong>
										<ul>
											<li>승차위치 : 인천공항(동4B, 11A), 코리아나호텔 정문 앞</li>
											<li>인천공항 → 코리아나호텔(첫차 : 05:55 / 간격 : 15~30분 / 막차 : 22:25분 / 소요시간 : 80분)</li>
											<li>코리아나호텔 → 인천공항(첫차 : 05:55 / 간격 : 15~30분 / 막차 : 18:45분 / 소요시간 : 80분)</li>
											<li>김포공항 → 인천공항(첫차 : 05:00 / 간격 : 15~30분 / 막차 : 21:30분 / 소요시간 : 40분)</li>
											<li>요금 : 코리아나호텔 ↔ 인천공항 13,000원 / 김포공항 → 인천공항 6,000원</li>
										</ul>
									</li>
								</ul>
								<ul>
									<li>-<strong>(605번)</strong>
										<ul>
											<li>승차위치 : 광화문 빌딩 앞 좌석버스 정류장</li>
											<li>인천공항 → 코리아나호텔(첫차 : 06:20 / 간격 : 15분 / 막차 : 21:00분 / 소요시간 : 80~90분)</li>
											<li>코리아나호텔 → 인천공항(첫차 : 06:20 / 간격 : 15분 / 막차 : 23:00분 / 소요시간 : 80~90분)</li>
											<li>요금 : 코리아나호텔 → 인천공항 5,500원 </li>
										</ul>
									</li>
								</ul>								
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