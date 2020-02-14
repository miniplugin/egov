<%--
  Class Name : LoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.06  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- common_top 시작 -->
<c:import url="/EgovPageLink.do?link=main/template_start/inc/common_top" />
<!-- common_top 끝 -->
<!-- sub CSS 추가 -->
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/sub.css">
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/login.css">
<!-- wrap -->
<div id="wrap">
	<!-- header 시작 -->
	<c:import url="/EgovPageLink.do?link=main/template_start/inc/header" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->
<script type="text/javascript">
<!--
function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        document.loginForm.action="<c:url value='/main/template/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    getid(document.loginForm);
}
$(document).ready(function() { fnInit(); });
//-->
</script>
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/template_start/inc/left" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- content 시작 --> 
            <div id="content">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li><strong>로그인</strong></li>
                        </ul>
                    </div>                  
                </div>
                <!-- 타이틀 이미지 -->            
                <div id="content_img_div"><img  alt="LOGIN 표준프레임워크 경량환경 단순 홈페이지에 오신것을 환영합니다." src="<c:url value='/'/>images/subtitle/img_subtitle_login.gif" width="776" height="230" /></div>       
                    <!-- bodytext_area -->
					<div class="bodytext_area box_inner">
						<!-- appForm -->
						<form:form name="loginForm" method="post" action="#LINK" class="appForm">
							<fieldset>
								<legend>입력 양식</legend>
								<p class="info_pilsoo pilsoo_item">필수입력</p>
								<ul class="app_list">
									<li class="clear">
										<label for="id" class="tit_lbl pilsoo_item">아이디</label>
										<div class="app_content"><input type="text" class="w100p" id="id" name="id" placeholder="아이디를 입력해주세요"/></div>
									</li>
									<li class="clear">
										<label for="password" class="tit_lbl pilsoo_item">비밀번호</label>
										<div class="app_content"><input type="password" class="w100p" id="password" name="password" onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }" placeholder="비밀번호를 입력해주세요"/></div>
									</li>
									<li class="clear">
										<div class="app_content checkbox_area">
											<input type="checkbox"  onclick="javascript:saveid(this.form);" class="css-checkbox" id="checkId" name="checkId"><label for="checkId">ID저장</label>
										</div>
									</li>
								</ul>
								<input type="hidden" name="message" value="${message}" />
				            	<input type="hidden" name="userSe"  value="USR"/>
								<p class="btn_line">
								<a href="javascript:;" onclick="javascript:actionLogin()" class="btn_baseColor">로그인</a>
								</p>
							</fieldset>
						</form:form>
						<!-- //appForm -->
						<div class="content_field">
                            <h3>로그인안내</h3>
							<fieldset><legend>정보영역</legend>
                                <p>비밀번호는 6~12자의 영문 대/소문자, 숫자, 특수문자를 혼합해서 사용하실 수 있습니다.</p>
                                <p>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우, 도용되기 쉬우므로 주기적으로 변경하셔서 사용하는 것이 좋습니다.</p>
                            </fieldset>
                        </div>
					</div>
					<!-- //bodytext_area -->
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