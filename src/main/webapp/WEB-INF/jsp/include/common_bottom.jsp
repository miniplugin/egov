<%--
  Class Name : common_bottom.jsp
  Description : 화면하단 FooterBottom(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2020.01.24   KIK       경량환경 버전 생성
 
    author   : 타임스페이스 KIK
    since    : 2020.01.24 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$( document ).ready(function() {
    $(window).resize();
 });
 $(window).resize(function(){
	 var targets = $('#leftmenu').width()+30;
	 if($(window).width() < 800) targets = 30;
     $('#content').css({
         width: ($(window).width() - targets )+"px"
     });
 });
</script>
</body>
</html>