<%--
  Class Name : BannerUpdt.jsp
  Description : 배너 수정 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.03.03  KIK          최초 생성
 
    author   : 공통서비스 개발팀 KIK
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:import url="/EgovPageLink.do?link=admin/include/header" />

<script type="text/javascript" src="<c:url value='/js/EgovMultiFiles.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="banner" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectBannerList() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/admin/bnr/selectBannerList.do'/>";
    varFrom.submit();       
}

function fncBannerUpdate() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/admin/bnr/updtBanner.do'/>";

    if(confirm("<spring:message code="ussIonBnr.bannerUpdt.saveImage"/>")){/* 저장 하시겠습니까? */
        if(!validateBanner(varFrom)){           
            return;
        }else{
            varFrom.submit();
        } 
    }
}

function fncBannerDelete() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/admin/bnr/removeBanner.do'/>";
    if(confirm("<spring:message code="ussIonBnr.bannerUpdt.deleteImage"/>")){/* 삭제 하시겠습니까? */
        varFrom.submit();
    }
}

function fncOnChangeImage() {
	var varFrom = document.getElementById("banner");
	varFrom.bannerImage.value = varFrom.file_1.value;
}

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><spring:message code="ussIonBnr.bannerUpdt.bannerUpdt"/></h3><!-- 배너관리 등록 -->
				</div>
				<!-- /.box-header -->

			<form:form commandName="banner" method="post" action="${pageContext.request.contextPath}/admin/bnr/updtBanner.do' />" enctype="multipart/form-data">
			<input type="hidden" name="posblAtchFileNumber" value="1"  >
        
			<div class="box-body">
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bannerId"><spring:message code="ussIonBnr.bannerRegist.bannerId"/> <span class="pilsu">*</span></label><!-- 배너ID -->
					
                    <input class="form-control" id="bannerId" type="text" name="bannerId" value="<c:out value='${banner.bannerId}'/>" title="<spring:message code="ussIonBnr.bannerRegist.bannerId"/>" readonly="readonly" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bannerNm"><spring:message code="ussIonBnr.bannerRegist.bannerNm"/> <span class="pilsu">*</span></label><!-- 배너명 -->
					
                    <input class="form-control" id="bannerNm" type="text" name="bannerNm" value="<c:out value='${banner.bannerNm}'/>" title="<spring:message code="ussIonBnr.bannerRegist.bannerNm"/>" maxLength="10" />
					<form:errors path="bannerNm" cssClass="error" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="linkUrl"><spring:message code="ussIonBnr.bannerRegist.linkUrl"/> <span class="pilsu">*</span></label><!-- 링크URL -->
					<input class="form-control" id="linkUrl" type="text" name="linkUrl" value="<c:out value='${banner.linkUrl}'/>" title="<spring:message code="ussIonBnr.bannerRegist.linkUrl"/>" maxLength="255" />
					<form:errors path="linkUrl" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6"><spring:message code="ussIonBnr.bannerRegist.bannerImage"/> <span class="pilsu">*</span></label><!-- 배너이미지 --> 
					<div class="egov_file_box" style="display:inline-block">
					<label for="egovfile_0" id="file_label"><spring:message code="title.attachedFileSelect"/></label> <!-- 파일선택 -->
					<input class="form-control" type="file" name="file_1" id="egovfile_0" title="<spring:message code="ussIonBnr.bannerRegist.bannerImage"/>" onchange="fncOnChangeImage();" />
					<c:if test="${not empty banner.bannerImageFile}">
					<a href="#LINK" data-toggle="modal" data-target="#myModal">
					<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
		                        <c:param name="atchFileId" value="${banner.bannerImageFile}" />
		            </c:import>
		            </a>
		            <!-- 큰 modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">이미지 크게보기</h4>
					      </div>
					      <div class="modal-body">
					        <c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
		                        <c:param name="atchFileId" value="${banner.bannerImageFile}" />
		            		</c:import>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
					</c:if>
					</div><input class="form-control" name="bannerImage" id="bannerImage" type="text" title="<spring:message code="ussIonBnr.bannerRegist.bannerImage"/>" value="<c:out value="${banner.bannerImage}"/>" maxLength="30" readonly="readonly" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="bannerDc"><spring:message code="ussIonBnr.bannerRegist.bannerDc"/></label><!-- 배너설명 -->
					<input class="form-control" id="bannerDc" type="text" name="bannerDc" value="<c:out value='${banner.bannerDc}'/>" title="<spring:message code="ussIonBnr.bannerRegist.bannerDc"/>" maxLength="100" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="sortOrdr"><spring:message code="ussIonBnr.bannerRegist.sortOrdr"/> <span class="pilsu">*</span></label><!-- 정렬순서 -->
					<input class="form-control" id="sortOrdr" type="text" name="sortOrdr" title="<spring:message code="ussIonBnr.bannerRegist.sortOrdr"/>" value="<c:out value='${banner.sortOrdr}'/>" maxLength="5" />
					<form:errors path="sortOrdr" />
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="tmplatNm"><spring:message code="ussIonBnr.bannerRegist.reflctAtt"/> <span class="pilsu">*</span></label><!-- 반영여부 -->
					<select class="form-control" id="reflctAt" name="reflctAt" title="<spring:message code="ussIonBnr.bannerRegist.reflctAtt"/>">
						<option value="Y" <c:if test="${banner.reflctAt == 'Y'}">selected</c:if> >Y</option>
						<option value="N" <c:if test="${banner.reflctAt == 'N'}">selected</c:if> >N</option>
					</select>
				</div>
				<div class="form-group col-sm-6">
					<label class="col-sm-6" for="regDate"><spring:message code="ussIonBnr.bannerRegist.regDate"/> <span class="pilsu">*</span></label><!-- 등록일시 -->
					<input class="form-control" id="regDate" type="text" name="regDate" value="<c:out value="${banner.regDate}"/>" title="<spring:message code="ussIonBnr.bannerRegist.regDate"/>" maxLength="20" readonly="readonly" />
				</div>
			</div>
			<!-- /.box-body -->
		
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
				 <input class="btn btn-primary" type="submit" value="<spring:message code="button.save" />" onclick="fncBannerUpdate(); return false;" />
				 <a class="btn btn-default" href="<c:url value='/admin/bnr/selectBannerList.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectBannerList(); return false;"><spring:message code="button.list" /></a>
				 <a class="btn btn-default" href="<c:url value='/admin/bnr/removeBanner.do'/>?bannerId=<c:out value='${bannerVO.bannerId}'/>" onclick="fncBannerDelete(); return false;"><spring:message code="button.delete" /></a>
			</div>
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${bannerVO.searchCondition}'/>" >
			<input type="hidden" name="searchKeyword" value="<c:out value='${bannerVO.searchKeyword}'/>" >
			<input type="hidden" name="pageIndex" value="<c:out value='${bannerVO.pageIndex}'/>" >
			<!-- 검색조건 유지 -->
            </form:form>
            
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<c:import url="/EgovPageLink.do?link=admin/include/footer" />