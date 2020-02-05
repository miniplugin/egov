<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<!-- 첨부파일 업로드 js -->
<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- ...433p.Mustach를 기반으로 작성된 handlebars.js 이용 댓글 Ajax . -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- 첨부파일 업로드 css -->
<style type="text/css">
.popup {position: absolute;}
.back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
.front { 
   z-index:1110; opacity:1; boarder:1px; margin: auto; 
  }
 .show{
   position:relative;
   max-width: 1200px; 
   max-height: 800px; 
   overflow: auto;       
 } 

</style>
<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;">
	<img id="popup_img">
</div>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" method="post">
	<!-- 
		...220p.나중에 수정, 삭제 작업에 사용되므로 반드시 원래 게시물 번호인 bno를
		...가지고 있도록 hidden속성으로 bno값을 처리함.
	 -->
	<input type='hidden' name='bno' value="${boardVO.bno}">
	<!-- 페이지 넘버링 처리 -->
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<!-- 페이지 검색 처리 -->
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">
</form>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label> <input type="text"
			name='title' class="form-control" value="${boardVO.title}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="writer" class="form-control" value="${boardVO.writer}"
			readonly="readonly">
	</div>
</div>
<!-- /.box-body -->
<ul class="mailbox-attachments clearfix uploadedList"></ul>
<div class="box-footer">
	<button type="submit" class="btn btn-warning" id="modifyBtn">UPDATE</button>
	<button type="submit" class="btn btn-danger" id="deleteBtn">DELETE</button>
	<button type="submit" class="btn btn-primary" id="listBtn">LIST ALL</button>
</div>

<!-- 
	...222p.$("form[role='form']")로 선언된 formObj는 <form>태그를 의미함.
	...$(".btn-warning")이벤트 처리는 수정할 수 있는 페이지로 이동하도록 <form>태그 속성을
	...수정하고 전송하게 함.
 -->
<script>				
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//$(".btn-warning").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#modifyBtn").on("click", function(){
			formObj.attr("action", "/admin/board/update");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
		//$(".btn-danger").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#deleteBtn").on("click", function(){
			var replyCnt =  $("#reply_countSmall").html();		
			//alert("replyCnt : "+ replyCnt);
			if(replyCnt > 0 ){
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}	
			var arr = [];
			$(".uploadedList li").each(function(index){
				 arr.push($(this).attr("data-src"));
			});
			if(arr.length > 0){
				$.post("/deleteAllFiles",{files:arr}, function(){
					
				});
			}
			formObj.attr("action", "/admin/board/delete");
			formObj.submit();
		});
		
		//$(".btn-primary").on("click", function(){//...440p.댓글추가랑 class가 겹쳐서 주석처리함.
		$("#listBtn").on("click", function(){
			//self.location = "/admin/board/listAll";
			formObj.attr("action", "/admin/board/listAll");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
	});
</script>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	
	<!-- ...426p. -->
	<div class="row">
		<div class="col-md-12">
		
		<!-- ...426p. 댓글 등록에 필요한 div -->
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> 
					<input class="form-control" type="text" placeholder="USER ID"
						   id="newReplyWriter"> 
					<label for="exampleInputEmail1">Reply Text</label> 
					<input class="form-control" type="text" placeholder="REPLY TEXT" 
						   id="newReplyText">
				</div>
				
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">
						ADD REPLY
					</button>
				</div>
			</div>

		<!-- ...426p. 댓글 목록과 페이징 처리에 필요한 div -->
		<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv">
					<button class="btn btn-info bg-green">
						Replies List
						<!-- ...510p.댓글목록갯수. -->  
						 [ <small id='reply_countSmall'>${boardVO.reply_count}</small> ] 
					</button>
				</li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->	
		
	<!-- ...442p. 수정과 삭제를 위한 Modal 창 -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"></h4>
	      </div>
	      <div class="modal-body" data-rno>
	        <p><input type="text" id="replytext" class="form-control"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
	        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div> 	
	
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- 첨부파일 Ajax사용 템플릿 -->
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script> 

<!-- 
	...435p. template코드는 화면상에서 하나의 댓글을 구성하는 부분임.
	...prettifyDate regdate 
-->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
		<i class="fa fa-comments bg-blue"></i>
		 <div class="timeline-item" >
		  	<span class="time">
		    	<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
		  	</span>
		  	<h3 class="timeline-header">
				<strong>{{rno}}</strong> -{{replyer}}
		  	</h3>
			  <div class="timeline-body">{{replytext}}</div>
		      <div class="timeline-footer">
		     	<a class="btn btn-primary btn-xs" 
			       data-toggle="modal" data-target="#modifyModal">
					Modify
				</a>
		      </div>
		  </div>			
		</li>
	{{/each}}
</script>

<!-- 
	...435p.prettifyDate에 대한 자바스크립트 처리. 
	...handlebars는 helper라는 기능을 이용해서 데이터의 상세한 처리에 필요한 기능들을 처리함.
	...만일 원하는 기능이 없는 경우에는 registerHelper()를 이용해서 사용자가 새로운 기능을 추가할
	...수 있음.
 -->
<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	var printData = function(replyArr, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
	
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	
	}
	

	//...436p. 해당 게시물에 대한 번호.
	var bno = ${boardVO.bno};
	
	//...436p. 수정이나 삭제작업 이후 사용자가 보던 댓글의 페이지 번호를 가지고 다시 목록을
	//...출력하기 위해 유지되는 데이터임.
	var replyPage = 1;

	//...436p. getPage() : 특정한 게시물에 대한 페이징 처리를 위해 호출되는 함수.
	//...페이지번호를 전달받고, 댓글의 목록 데이터를 처리함.
	//...댓글의 목록 데이터는 'pageMaker'와 'list'로 구성되므로 이를 printPaging()과
	//...printData()에서 처리함.
	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#reply_countSmall").html("" + data.pageMaker.totalCount +""); //...added since 510p.
			console.log("댓글 총갯수: " + data.pageMaker.totalCount)
			$("#modifyModal").modal('hide');
			

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};	
	
	
	//...437p.화면상에서 'Replies List'라는 버튼을 클릭했을때 댓글 목록을 가져와서 보임.
	//...★ /replies/로 요청경로를 한 이유를 알아야 함.
	//...ajax를 사용해서 JSON으로 값을 받아와서 jQuery로 화면에 표시하므로 JSON으로 값을
	//...처리해주는 별도의 @RestController ReplyController를 사용하고 있다.
	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");

	});
		
	
	//...438p.페이징 처리의 코드는 ul class = 'pagination' 에서 이뤄짐.
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
		
	});

	//...440p. 댓글추가 이벤트 처리.
	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, 
									  replyer:replyer, 
									  replytext:replytext}),
				success:function(result){
					console.log("replyAddBtn clicked result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});

	
	//...443p. 각 댓글의 버튼 이벤트 처리.
	//...실제 댓글목록에 관한 소스에는 다음과 같은 부분이 대상이 된다.
	/*
		div class = "timeline-footer"
		a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal"
		Modify
		a
		처럼 'data-'로 시작하는 커스텀 속성을 활용해서 'modifyModal'아이디에 속하는 
		div를 화면에 보이게 함.
	*/
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	
	//...댓글 수정 버튼 이벤트.
	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("댓글 수정 result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});

	//...댓글 삭제 버튼 이벤트.
	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("댓글 삭제 result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});	
	
	//첨부파일 Ajax처리
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/board/getAttach/"+bno,function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			 $(".uploadedList").append(html);
		});
	});
	
	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		var fileLink = $(this).attr("href");
		if(checkImageType(fileLink)){
			event.preventDefault();
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			console.log(imgTag.attr("src"));
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		$(".popup").hide('slow');
	});	
		
</script>

<%@include file="../include/footer.jsp"%>
