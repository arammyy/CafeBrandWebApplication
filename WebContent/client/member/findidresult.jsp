<%@ page contentType="text/html; charset=UTF-8"%>\
<%
	String id = (String)request.getAttribute("id");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
.mb-30{
	color : #b68834;
}
.col-lg-77{
	margin:auto;
	margin-top : 30px;
	text-align: center;
}
.row{
	margin:auto;
}
.mt-10{
	margin-top : 30px;
}
.genric-btn{
	width:45%;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
		<div class="row" style="flex: 0 0 66.66667%;max-width: 66.66667%;">
				<%@ include file="/inc/findmenu.jsp" %>
		</div>
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<form>
						<h2 class="mb-30" name = "id">찾으시는 아이디는 : <%= id%>입니다.</h2>
					</form>
				</div>
			</div>
			<div class="col-lg-77 col-md-8">
				<a href="/client/member/findpw.jsp?id=<%=id %>" class="genric-btn primary-border circle">Go to FindPW</a>
				<a href="/client/member/login.jsp" class="genric-btn primary-border circle">Go to Login</a>
			</div>
		</div>
</body>
<%@ include file="/inc/footer.jsp" %>
</html>