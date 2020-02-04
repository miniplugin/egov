<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->

<!-- wrap -->
<div id="wrap">
	<!-- header 시작 -->
	<c:import url="/EgovPageLink.do?link=main/template_start/inc/header" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->
	<div id="container">
    	<div class="main_rolling_pc">
            <div class="visualRoll">
                <ul class="viewImgList">
                    <li class="imglist0">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="<c:url value='/'/>resources/template_start/img/img_slidecontents01.png" alt="OOOO OOOOO OOOO OOOOO, 스프링... OOOO OOOOO?"></a>
                            <p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
                        </div>
                    </li>
                    <li class="imglist1">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="<c:url value='/'/>resources/template_start/img/img_slidecontents02.png" alt="OOOO OOOOOOOOO OOOOO 스프링정보, 스프링... OOOO OOOOO?"></a>
                            <p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
                        </div>
                    </li>
                    <li class="imglist2">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="<c:url value='/'/>resources/template_start/img/img_slidecontents03.png" alt="OOOO OOOOO 믿을 수 있는 스프링정보, 스프링... OOOO OOOOO?"></a>
                            <p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
                        </div>
                    </li>
                </ul>

                <div class="rollbtnArea">
                    <ul class="rollingbtn">
                        <li class="seq butt0"><a href="#butt"><img src="<c:url value='/'/>resources/template_start/img/btn_rollbutt_on.png" alt="1번" /></a></li>
                        <li class="seq butt1"><a href="#butt"><img src="<c:url value='/'/>resources/template_start/img/btn_rollbutt_off.png" alt="2번" /></a></li>
                        <li class="seq butt2"><a href="#butt"><img src="<c:url value='/'/>resources/template_start/img/btn_rollbutt_off.png" alt="3번" /></a></li>
                        <li class="rollstop"><a href="#" class="stop"><img src="<c:url value='/'/>resources/template_start/img/btn_roll_stop.png" alt="멈춤" /></a></li>
                        <li class="rollplay"><a href="#" class="play"><img src="<c:url value='/'/>resources/template_start/img/btn_roll_play.png" alt="재생" /></a></li>
                    </ul>
                </div><!-- //rollbtnArea -->

            </div><!-- //visualRoll -->
        </div><!-- //main_rolling_pc -->
        
        <div class="main_rolling_mobile">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="<c:url value='/'/>resources/template_start/img/mainslide_mob01.jpg" alt="OOOO OOOOO 믿을 수 있는 스프링정보, 스프링... OOOO OOOOO?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="<c:url value='/'/>resources/template_start/img/mainslide_mob02.jpg" alt="OOOO OOOOO 믿을 수 있는 스프링정보, 스프링... OOOO OOOOO?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="<c:url value='/'/>resources/template_start/img/mainslide_mob03.jpg" alt="OOOO OOOOO 믿을 수 있는 스프링정보, 스프링... OOOO OOOOO?" /></a>
                    </div>
                </div>						
                <div class="swiper-pagination"></div>
                <!-- <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div> -->
                
            </div><!--//swiper-container-->
        </div><!--//main_rolling_mobile -->
	
		<!-- about_area -->
		<div class="about_area">
			<h2><a href="#LINK" onclick="javascript:fn_main_headPageAction('32','main/template_start/Board.do?bbsId=BBSMSTR_BBBBBBBBBBBB'); return false;">겔러리 게시판</a> <b>TOP 3</b></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
				<c:forEach var="result" items="${galList}" varStatus="status">
					<c:if test="${status.index < 3}">
					<li style="padding:4px 0">
                    <form name="subForm" method="post" action="<c:url value='/main/template_start${prefix}/BoardDetail.do'/>">
		            <c:choose>
		                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
		                    <img class="img_topplace" src="<c:url value='/'/>resources/template_start/img/img_topplace01.jpg" alt="OOOO OOOOO" />
		                    <h3><c:out value="${result.nttSj}" /></h3>
		                </c:when>
		                <c:otherwise>
		                <a href="javascript:void(0);" onclick="$(this).closest('form').submit();">
		                        <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
		                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
		                        <input name="pageIndex" type="hidden" value="<c:out value='1'/>"/>
		                        <c:if test="${not empty result.atchFileId}">
								<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
					                        <c:param name="atchFileId" value="${result.atchFileId}" />
					            </c:import>
								</c:if>
								<c:if test="${empty result.atchFileId}">
		                        <img class="img_topplace" src="<c:url value='/'/>resources/template_start/img/img_topplace01.jpg" alt="OOOO OOOOO" />
		                        </c:if>
								<h3><c:out value="${fn:substring(fn:escapeXml(result.nttSj), 0, 50)}" /></h3>
								<span class="view">VIEW</span></a>
						</a>
		                </c:otherwise>
		            </c:choose>
		            </form>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${fn:length(galList) == 0}">
                    <li>
						<img class="img_topplace" src="/resources/template_start/img/img_topplace01.jpg" alt="OOOO OOOOO" />
						<h3>등록된 글이 없습니다.</h3>
						<p class="txt">등록된 이미지가 없습니다.</p>
						<span class="view">VIEW</span></a>
					</li>
                </c:if>
				</ul>
			</div>
		</div>
		<!-- //about_area -->

		<!-- app_area -->
		<div class="appbbs_area" style="padding:30px 0">
			<div class="appbbs_box box_inner clear">
				<h2 class="hdd">상담과 최근게시물</h2>
				<p class="app_line">
					<a href="javascript:;">카카오톡 1:1 상담</a>
					<a href="javascript:;">전화 상담 신청</a>
				</p>
				<div class="bbs_line">
					<h3><a href="#LINK" onclick="javascript:fn_main_headPageAction('31','main/template_start/Board.do?bbsId=BBSMSTR_AAAAAAAAAAAA'); return false;">NOTICE</a></h3>
					<ul class="notice_recent">
					<c:forEach var="result" items="${notiList}" varStatus="status">
					<li style="padding:4px 0">
					<form name="subForm" method="post" action="<c:url value='/main/template_start${prefix}/BoardDetail.do'/>">
		            <c:if test="${result.replyLc!=0}">
		                <c:forEach begin="0" end="${result.replyLc}" step="1">
		                    &nbsp;
		                </c:forEach>
		                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
		            </c:if>
		            <c:choose>
		                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
		                    <c:out value="${result.nttSj}" />
		                </c:when>
		                <c:otherwise>
		                        <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
		                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
		                        <input name="pageIndex" type="hidden" value="<c:out value='1'/>"/>
		                        <span class="link"><input type="submit" style="border:solid 0px black;cursor:pointer;" value="<c:out value="${result.nttSj}"/>" ></span>
		                </c:otherwise>
		            </c:choose>
		            </form>
                    </li>
					</c:forEach>
					<c:if test="${fn:length(notiList) == 0}">
                        <li>등록된 공지사항이 없습니다.</li>
                    </c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- //app_area -->
		
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

