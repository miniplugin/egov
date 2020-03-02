<%--
  Class Name : EgovBannerList.java
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
    document.listForm.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
    document.listForm.submit();
}

function fncSelectBanner(bannerId) {
    document.listForm.bannerId.value = bannerId;
    document.listForm.action = "<c:url value='/uss/ion/bnr/getBanner.do'/>";
    document.listForm.submit();
}

function fncAddBannerInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/uss/ion/bnr/addViewBanner.do'/>";
    document.listForm.submit();
}

function fncBannerListDelete() {
	if(fncManageChecked()) {
        if(confirm("<spring:message code="ussIonBnr.bannerList.deleteImage"/>")) {/* 삭제하시겠습니까? */
            document.listForm.action = "<c:url value='/uss/ion/bnr/removeBannerList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
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
	
	<form name="listForm" action="<c:url value='/uss/ion/bnr/selectBannerList.do'/>" method="post">

	<div class="search_box" title="<spring:message code="common.searchCondition.msg"/>"><!-- 이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다. -->
		<ul>
			<li>
				<label for="searchKeyword"><spring:message code="ussIonBnr.bannerList.bannerNm"/> : </label><!-- 배너명 -->
				<input id="searchKeyword" class="s_input2 vat" name="searchKeyword" type="text" value="<c:out value="${bannerVO.searchKeyword}"/>" size="25" onkeypress="press();" title="<spring:message code="title.search"/>" /><!-- 검색어 -->
				
				<input class="s_btn" type="submit" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" />" onclick="fncSelectBannerList('1'); return false;" />
				<span class="btn_b"><a href="<c:url value='/uss/ion/bnr/addViewBanner.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddBannerInsert(); return false;" title="<spring:message code="button.create" />"><spring:message code="button.create" /></a></span>
			</li>
		</ul>
	</div>
	
	<input type="hidden" name="bannerId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty bannerVO.pageIndex }">1</c:if><c:if test="${!empty bannerVO.pageIndex }"><c:out value='${bannerVO.pageIndex}'/></c:if>">
	<input type="hidden" name="searchCondition" value="1">
	</form>

	<table class="board_list">
		<caption></caption>
		<colgroup>
			<col style="width:20%" />
			<col style="width:30%" />
			<col style="" />
			<col style="width:15%" />
		</colgroup>
		<thead>
			<tr>
			   <th scope="col"><spring:message code="ussIonBnr.bannerList.bannerNm"/></th><!-- 배너명 -->
			   <th scope="col"><spring:message code="ussIonBnr.bannerList.linkUrl"/></th><!-- 링크 URL -->
			   <th scope="col"><spring:message code="ussIonBnr.bannerList.bannerDc"/></th><!-- 배너 설명 -->
			   <th scope="col"><spring:message code="ussIonBnr.bannerList.reflctAtt"/></th><!-- 반영여부 -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
			<tr>
				<td>
					<form name="item" method="post" action="<c:url value='/uss/ion/bnr/getBanner.do'/>">
						<input type="hidden" name="bannerId" value="<c:out value="${banner.bannerId}"/>">
						<input type="hidden" name="pageIndex" value="<c:out value='${bannerVO.pageIndex}'/>">
						<input type="hidden" name="searchCondition" value="<c:out value='${bannerVO.searchCondition}'/>">
						<input type="hidden" name="searchKeyword" value="<c:out value="${bannerVO.searchKeyword}"/>">
						<input class="link" type="submit" value="<c:out value="${banner.bannerNm}"/>" onclick="fncSelectBanner('<c:out value="${banner.bannerId}"/>'); return false;">
					</form>
				</td><!-- 배너 명 -->
				<td class="left"><c:out value="${banner.linkUrl}"/></td><!-- 링크 URL -->
				<td><c:out value="${banner.bannerDc}"/></td><!-- 배너 설명 -->
				<td><c:out value="${banner.reflctAt}"/></td><!-- 반영여부 -->
			</tr>
			</c:forEach>
			
			<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
			<c:if test="${fn:length(bannerList) == 0}">
			<tr>
				<td class="lt_text3" colspan="4">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
		</ul>
	</div>
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<c:import url="/EgovPageLink.do?link=admin/include/footer" />
