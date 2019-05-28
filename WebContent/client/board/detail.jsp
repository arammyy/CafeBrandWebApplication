<%@page import="com.coffee.model.domain.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Board board = (Board)request.getAttribute("board");

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css">
<style>
.mb-30{
	color : #b68834;
}
.mb-20{
	color : #b68834;
	text-align : left;
}
h4{
	font-size: 14px;
}
.col-lg-3{
	margin-top : 30px;
}
.col-lg-77{
	margin:auto;
	margin-top : 30px;
	text-align: center;
}
.col-lg-3 {
    flex: 0 0 16%;
    max-width: 25%;
}
.row{
	margin:auto;
}
.mt-10{
	border : solid 1px brown;
	margin-bottom : 5px;
	margin-top :5px;
}
.genric-btn{
	width:24%;
	text-align: center;
}
.d-flex3 {
  display: flex !important;
}
</style>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	$("#bt-edit").click(function() {
		edit();
	});
	$("#bt-delete").click(function() {
		del();
	});
	$("#bt-list").click(function() {
		location.href="/client/board/list";
	});
	$("#bt-reply").click(function() {
		reply();
	});

});
function del() {
	if (!confirm("삭제하시겠어요?")) {
		return;
	}
	$("form[name='edit-form']").attr({
		action : "/client/board/delete",
		method : "post"
	});
	$("form[name='edit-form']").submit();
}
function edit() {
	if (!confirm("수정하시겠어요?")) {
		return;
	}
	$("form[name='edit-form']").attr({
		action : "/client/board/edit",
		method : "post"
	});
	$("form[name='edit-form']").submit();
}
function reply(){
	if (!confirm("답변하시겠어요?")) {
		return;
	}
	$("form[name='edit-form']").attr({
		action : "/client/board/goReply",
		method : "post"
	});
	$("form[name='edit-form']").submit();
	
}


</script>

</head>
<body>
<%@ include file="/inc/header.jsp" %> 
<section class="menu-area section-gap" id="coffee" >
	<div class="row" >
		<div class="col-lg-77 col-md-8" >
			<form name="edit-form">
			    <input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">
			    <input type="hidden" name="member_id" value="<%=board.getMember().getMember_id()%>">
			    <input type="hidden" name="reply_id" value="<%=client.getMember_id()%>">
			    <input type="hidden" name="team" value="<%=board.getTeam()%>">
			    <input type="hidden" name="rank" value="<%=board.getRank()%>">
			    <input type="hidden" name="depth" value="<%=board.getDepth()%>">
			    <h4 class="mb-20">Title</h4>
			    <div class="mt-10">
			    	<input type="text" name="title" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input" value = "<%=board.getTitle()%>">
			    </div>
			    <h4 class="mb-20">Writer</h4>
			    <div class="mt-10">
			    	<input type="text"  name="writer" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input" value="<%=board.getMember().getName()%>">
			    </div>
			    <h4 class="mb-20">Date</h4>
			    <div class="mt-10">		
			    	<input type="text"  name="date" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input" value = "<%=board.getDate()%>">    
			    </div>
			    <h4 class="mb-20">Content</h4>
			    <div class="mt-10">
			    	<textarea name="content" class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'" required><%=board.getContent()%></textarea> <!-- /textarea를 엔터쳐서 내리면 안되 무조건 한줄!! -->
				</div>
				<div class="col-lg-77 col-md-8">
					<%if(client.getGrade().getGrade_id()==3&&board.getRank()==1){ %>
					<a id="bt-list" class="genric-btn primary-border circle">목록보기</a>
					<a id="bt-edit" class="genric-btn primary-border circle">수정하기</a>
					<a id="bt-delete" class="genric-btn primary-border circle">삭제하기</a>
					<a id="bt-reply" class="genric-btn primary-border circle">답글달기</a>
				    <%}else if(client.getGrade().getGrade_id()==3&&board.getRank()>1){ %>
				    <a id="bt-list" class="genric-btn primary-border circle">목록보기</a>
					<a id="bt-edit" class="genric-btn primary-border circle">수정하기</a>
					<a id="bt-delete" class="genric-btn primary-border circle">삭제하기</a>
				    <%}else if(client.getGrade().getGrade_id()<3&&board.getRank()==1) {%>
				    <a id="bt-list" class="genric-btn primary-border circle">목록보기</a>
					<a id="bt-edit" class="genric-btn primary-border circle">수정하기</a>
					<a id="bt-delete" class="genric-btn primary-border circle">삭제하기</a>
				    <%}else if(client.getGrade().getGrade_id()<3&&board.getRank()>1) {%>
				    <a id="bt-list" class="genric-btn primary-border circle">목록보기</a>
					<%} %>
				</div>		
		 	</form>
		 </div> 
	</div>
</section>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>