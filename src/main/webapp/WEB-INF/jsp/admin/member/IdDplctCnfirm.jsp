<%--
  Class Name : IdDplctCnfirm.jsp
  Description : 아이디중복확인
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.02.07  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/common_top" />

<base target="_self">
<script type="text/javascript"
	src="<c:url value='/js/showModalDialogCallee.js'/>"></script>
<script type="text/javaScript">
<!--
	function fnCheckId() {
		if (document.checkForm.checkId.value == "") {
			alert("중복조회할 아이디를 입력하십시오.");
			document.checkForm.focus();
			return;
		}
		if (fnCheckNotKorean(document.checkForm.checkId.value)) {
			document.checkForm.submit();
		} else {
			alert("한글은 사용할 수 없습니다.");
			return;
		}
	}
	function fnReturnId() {
		var retVal = "";
		if (document.checkForm.usedCnt.value == 0) {
			retVal = document.checkForm.resultId.value;
			setReturnValue(retVal);
			window.returnValue = retVal;
			window.close();
		} else if (document.checkForm.usedCnt.value == 1) {
			alert("이미사용중인 아이디입니다.");
			return;
		} else {
			alert("먼저 중복확인을 실행하십시오");
			return;
		}
	}
	function fnClose() {
		var retVal = "";
		window.returnValue = retVal;
		window.close();
	}
	function fnCheckNotKorean(koreanStr) {
		for (var i = 0; i < koreanStr.length; i++) {
			var koreanChar = koreanStr.charCodeAt(i);
			if (!(0xAC00 <= koreanChar && koreanChar <= 0xD7A3)
					&& !(0x3131 <= koreanChar && koreanChar <= 0x318E)) {
			} else {
				//hangul finding....
				return false;
			}
		}
		return true;
	}
//-->
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	
			<!-- box general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">ID중복확인</h3>
				</div>
				<!-- /.box-header -->

				<form name="checkForm"
					action="<c:url value='/admin/member/IdDplctCnfirm.do'/>">
					<input type="submit" id="invisible" class="invisible" />

					<div class="box-body">
						<div class="form-group col-sm-12">
							<label class="col-sm-6" for="checkId">사용할아이디</label> <input
								class="col-sm-6" type="text" name="checkId" title="선택여부"
								value="<c:out value="${checkId}"/>" maxlength="20" /> <input
								type="hidden" name="resultId"
								value="<c:out value="${checkId}"/>" /> <input type="hidden"
								name="usedCnt" value="<c:out value="${usedCnt}"/>" />
						</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-6" for="oldPassword">결과</label>
						</div>
						<div class="form-group col-sm-12">
							<c:choose>
								<c:when test="${usedCnt eq -1}">
	                    &nbsp; 중복확인을 실행하십시오
	                </c:when>
								<c:when test="${usedCnt eq 0}">
	                    ${checkId} 는 사용가능한 아이디입니다.
	                </c:when>
								<c:otherwise>
	                    ${checkId} 는 사용할수 없는 아이디입니다.
	                </c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<a class="btn btn-warning" href="#LINK"
							onclick="javascript:fnCheckId(); return false;"><spring:message
								code="button.inquire" /></a> <a class="btn btn-default"
							href="#LINK" onclick="javascript:fnReturnId(); return false;"><spring:message
								code="button.use" /></a> <a class="btn btn-default" href="#LINK"
							onclick="javascript:fnClose(); return false;"><spring:message
								code="button.close" /></a>
					</div>
				</form>
			</div>
			<!-- /.box -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
