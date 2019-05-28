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
	max-width : 540px;
	margin : auto;
	padding : 10px 0px;
}
.genric-btn{
	width:45%;
	text-align: center;
	max-width:240px;
	margin-left :30px;
}
.genric-btn3{
	width:30%;
	text-align: center;
	max-width:150px;
	margin-left :30px;
}
.input-border{
	border : 1px solid rgb(182, 136, 52);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#bt-login").click(function(){
			login();
		});
	})
	function login(){
		$("form").attr({
			"action" : "/ctest/member/login",
			"method" : "post"
		});
		$("form").submit();
	}
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<h2 class="mb-30">Login</h2>
					<form>
						<div class="mt-10">
							<input type="text" name="id" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'" required class="single-input input-border">
						</div>
						<div class="mt-10">
							<input type="password" name="pass" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input input-border">
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-77 col-md-8">
				<div id="bt-login" class="genric-btn primary-border circle">Login</div>
				<a href="/index.jsp" class="genric-btn primary-border circle">Cancel</a>
			</div>
			<div class="col-lg-77 col-md-8">
				<a href="/ctest/member/goRegist" class="genric-btn3 primary-border circle">Regist</a>
				<a href="/client/member/findid.jsp" class="genric-btn3 primary-border circle">FindID</a>
				<a href="/client/member/findpw.jsp" class="genric-btn3 primary-border circle">FindPW</a>
			</div>
		</div>
</body>
<%@ include file="/inc/footer.jsp" %>
</html>