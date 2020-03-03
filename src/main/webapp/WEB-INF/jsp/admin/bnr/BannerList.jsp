<%--
  Class Name : BannerList.java
  Description : 배너관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.03.02  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javaScript" language="javascript" defer="defer">

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("<spring:message code="ussIonBnr.bannerList.noBanner"/>");/* 선택된  배너가 없습니다. */
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("<spring:message code="ussIonBnr.bannerList.noBanner"/>");/* 선택된  배너가 없습니다. */
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
    	alert("<spring:message code="ussIonBnr.bannerList.failInquire"/>");/* 조회된 결과가 없습니다. */
    }

    document.listForm.bannerIds.value = returnValue;
    return returnBoolean;
}

function fncSelectBannerList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/admin/bnr/selectBannerList.do'/>";
    document.listForm.submit();
}

function fncSelectBanner(bannerId) {
    document.listForm.bannerId.value = bannerId;
    document.listForm.action = "<c:url value='/admin/bnr/getBanner.do'/>";
    document.listForm.submit();
}

function fncAddBannerInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/admin/bnr/addViewBanner.do'/>";
    document.listForm.submit();
}

function fncBannerListDelete() {
	if(fncManageChecked()) {
        if(confirm("<spring:message code="ussIonBnr.bannerList.deleteImage"/>")) {/* 삭제하시겠습니까? */
            document.listForm.action = "<c:url value='/admin/bnr/removeBannerList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/admin/bnr/selectBannerList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectBannerList('1');
    }
}
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- form start -->
    <form name="listForm" action="<c:url value='/admin/bnr/selectBannerList.do'/>" method="post">
    <input type="hidden" name="bannerId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty bannerVO.pageIndex }">1</c:if><c:if test="${!empty bannerVO.pageIndex }"><c:out value='${bannerVO.pageIndex}'/></c:if>">
	<input type="hidden" name="searchCondition" value="1">
    
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title"><spring:message code="ussIonBnr.bannerList.bannerList"/></h3><!-- 배너관리 목록 -->
				</div>
				<div class='box-body'>
					<div class="form-group">
					<div class="col-sm-2">
						<label for="searchKeyword"><spring:message code="ussIonBnr.bannerList.bannerNm"/> : </label><!-- 배너명 -->
					</div>
					<div class="col-sm-6">
						<input class="vat form-control" id="searchKeyword" name="searchKeyword" type="text" value="<c:out value="${bannerVO.searchKeyword}"/>" onkeypress="press();" title="<spring:message code="title.search"/>" /><!-- 검색어 -->
                    </div>
                    <div class="col-sm-4">
                    <input class="btn btn-default" type="submit" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" />" onclick="fncSelectBannerList('1'); return false;" />
					<a class="btn btn-default" href="<c:url value='/admin/bnr/addViewBanner.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddBannerInsert(); return false;" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a>
                    </div>
                    </div>
				</div>
			</div>
			<div class="box">
				<div class="box-body">
				
				<table class="table table-bordered">
					<tr>
	                   <th><spring:message code="ussIonBnr.bannerList.bannerNm"/></th><!-- 배너명 -->
					   <th><spring:message code="ussIonBnr.bannerList.linkUrl"/></th><!-- 링크 URL -->
					   <th><spring:message code="ussIonBnr.bannerList.bannerDc"/></th><!-- 배너 설명 -->
					   <th><spring:message code="ussIonBnr.bannerList.reflctAtt"/></th><!-- 반영여부 --> 
					</tr>
				
				<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
				<c:if test="${fn:length(bannerList) == 0}">
                <tr> 
                      <td colspan="4">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="banner" items="${bannerList}" varStatus="status">
				<tr>
					<td>
						<a href="#LINK" onclick="fncSelectBanner('<c:out value="${banner.bannerId}"/>'); return false;">
						<c:out value="${banner.bannerNm}"/>
						</a>
					</td><!-- 배너 명 -->
					<td class="left"><c:out value="${banner.linkUrl}"/></td><!-- 링크 URL -->
					<td><c:out value="${banner.bannerDc}"/></td><!-- 배너 설명 -->
					<td><c:out value="${banner.reflctAt}"/></td><!-- 반영여부 -->
				</tr>
				</c:forEach>
				</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a class="btn btn-primary" href="<c:url value='/admin/bnr/addViewBanner.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddBannerInsert(); return false;" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a>
				</div>
				
				<div class="text-center">
					<div class="pagination" id="paging_div">
					<ul class="paging_align">
	                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	                </ul>
	                </div> 
				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
	</form>    
    <!-- form end -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<c:import url="/EgovPageLink.do?link=admin/include/footer" />