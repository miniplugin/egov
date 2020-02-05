<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<script type="text/javascript">
				<!--
					function actionLogin() {

						if (document.loginForm.id.value == "") {
							alert("아이디를 입력하세요");
							return false;
						} else if (document.loginForm.password.value == "") {
							alert("비밀번호를 입력하세요");
							return false;
						} else {
							document.loginForm.action = "<c:url value='/admin/actionLogin.do'/>";
							//document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
							//document.loginForm.action="<c:url value='/j_spring_security_check'/>";
							document.loginForm.submit();
						}
					}

					function setCookie(name, value, expires) {
						document.cookie = name + "=" + escape(value)
								+ "; path=/; expires=" + expires.toGMTString();
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
								return unescape(document.cookie.substring(
										offset, end))
							}
						}
						return "";
					}

					function saveid(form) {
						var expdate = new Date();
						// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
						if (form.checkId.checked)
							expdate.setTime(expdate.getTime() + 1000 * 3600
									* 24 * 30); // 30일
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
					$(document).ready(function() {
						fnInit();
					});
				//-->
				</script>
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">관리자 로그인 페이지</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form:form name="loginForm" method="post" action="#LINK"
						class="form-horizontal">
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>

								<div class="col-sm-10">
									<input type="text" class="form-control" id="id" name="id"
												placeholder="아이디를 입력해주세요" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>

								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
												name="password"
												onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }"
												placeholder="비밀번호를 입력해주세요" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox"
												onclick="javascript:saveid(this.form);" class="css-checkbox"
												id="checkId" name="checkId"> ID저장
										</label>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="message" value="${message}" /> <input
									type="hidden" name="userSe" value="USR" />
						<!-- /.box-body -->
						<div class="box-footer">
							<a class="btn btn-info pull-right" href="javascript:;"
								onclick="javascript:actionLogin()" class="btn_baseColor">로그인</a>
						</div>
						<!-- /.box-footer -->
					</form:form>
					<!-- form start -->
				</div>
			</div>
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<%@include file="include/footer.jsp"%>