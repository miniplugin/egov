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
//KIK
$( document ).ready(function() {
    $(window).resize();
    //모바일 서브메뉴 띄움 Start 
	$('.openAll').click(function(){
		if ( parseInt($('header').css('width')) <= 800 ){ 
			$(this).parents().children('.gnb_depth').css({ display:'inherit' });
			var offset = $(this).offset();
			var offset_top = 60;
			if(offset.top>120){offset_top = 120};
			$(this).parents().children('.gnb_depth').css({ margin: offset_top +"px 0 0 0" });
			}
	});
	//모바일 서브메뉴 띄움 End
 });
 $(window).resize(function(){
	 //메인콘텐츠 가로크기 반응형처리 Start
	 var targets = $('#leftmenu').width()+30;
	 if($(window).width() < 800) targets = 30;
     $('#content').css({
         width: ($(window).width() - targets )+"px"
     });
   //메인콘텐츠 가로크기 반응형처리 End
     //모바일 서브메뉴 띄움 Start
     if ( parseInt($('header').css('width')) <= 800 ){
    	 $('.openAll').click(function(event){event.preventDefault();});
    	 $('.gnb_depth .submenu_list').css({ padding:'inherit',width:'inherit' });
    	 $('.closeSubmenu').css({ display:'block' });
    	 $('.closeSubmenu').click(function(){$(this).parents().children('.gnb_depth').css({ display:'none' });});
     }
     if ( parseInt($('header').css('width')) > 800 ){
    	 $('.openAll').unbind('click').click();
    	 //$('.openAll').unbind()
    	 $('.gnb_depth').css({ margin:'inherit' });
    	 $('.gnb_depth .submenu_list').css({ padding:'0 0 0 480px',width:'1050px' });
    	 $('.closeSubmenu').css({ display:'none' });
     }
    //모바일 서브메뉴 띄움 End
 });
</script>
</body>
</html>