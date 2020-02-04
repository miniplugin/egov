<%--
  Class Name : common_top.jsp
  Description : 화면상단 HeaderTop(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.01.24   KIK       경량환경 버전 생성
 
    author   : 타임스페이스 KIK
    since    : 2020.01.24 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:if test="${empty brdMstrVO.bbsNm}">
<title>반응형-표준프레임워크 경량환경 홈페이지 템플릿</title>
</c:if>
<title><c:out value="${brdMstrVO.bbsNm}"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/swiper.min.css">
<link rel="stylesheet" href="<c:url value='/'/>resources/template_start/css/common.css">
<script src="<c:url value='/'/>resources/template_start/js/jquery-1.11.3.min.js"></script>
<script src="<c:url value='/'/>resources/template_start/js/rollmain.js"></script>
<script src="<c:url value='/'/>resources/template_start/js/jquery.easing.js"></script>	
<script src="<c:url value='/'/>resources/template_start/js/common.js"></script>  
<script src="<c:url value='/'/>resources/template_start/js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="<c:url value='/'/>resources/template_start/js/html5shiv.js"></script>
	<script src="<c:url value='/'/>resources/template_start/js/placeholders.min.js"></script>
<![endif]-->
</head>
<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>