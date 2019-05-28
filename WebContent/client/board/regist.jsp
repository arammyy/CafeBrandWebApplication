<%@page import="com.coffee.model.domain.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

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
	$("#bt-regist").click(function() {
		regist();
	});
	$("#bt-list").click(function() {
		location.href="/client/board/list";
	});
});
function regist() {
    $("form[name='regist-form']").attr({
       method : "post",
       action : "/client/board/doRegist"
    });
    $("form[name='regist-form']").submit();
 }

</script>

</head>
<body>
 <%@ include file="/inc/header.jsp" %> 



<section class="menu-area section-gap" id="coffee" >
	<div class="row" >
		<div class="col-lg-77 col-md-8" >
		  <form name="regist-form">
		    <input type="hidden" name="member_id" value="<%=client.getMember_id()%>">
		    <input type="hidden" name="rank" value="1">
		    <input type="hidden" name="depth" value="0"> 
		    <h4 class="mb-20">Title</h4>
			<div class="mt-10">
			   	<input type="text" name="title" placeholder="Title" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Title...'" required class="single-input">
			</div>
		    <h4 class="mb-20">Content</h4>
			<div class="mt-10">
			   	<textarea name="content" class="single-textarea" placeholder="Content" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Content'" required></textarea> <!-- /textarea를 엔터쳐서 내리면 안되 무조건 한줄!! -->
			</div>
			<div class="col-lg-77 col-md-8">
			<a id="bt-regist" class="genric-btn primary-border circle">작성하기</a>
		    <a id="bt-list" class="genric-btn primary-border circle">목록보기</a>
			</div>
		 </form>
  	</div>
  </div>
</section>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>