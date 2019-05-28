<%@page import="com.coffee.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8">
<title></title>
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
	$(function(){
		$("#bt-change").click(function(){
			changePW();
		});
	})
	function changePW(){
		if($("#pass1").val() != $("#pass2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		$.ajax({
			url:"/ctest/member/changepw",
			type : "post",
			data :{
				id: $($("form").find("input[name='id']")).val(),
				name : $($("form").find("input[name='name']")).val(),
				phone : $($("form").find("input[name='phone']")).val(),
				pass : $($("form").find("input[name='pass']")).val()
			},
			success : function(result){
				var json = JSON.parse(result);
				if(json.result == 1){
					if(confirm("정상적으로 변경되었습니다.")){
						location.href="/client/member/login.jsp";
					}
				}else{
					alert("변경에 실패했습니다. 입력 정보를 확인해주세요");
				}
			}
		});
	}
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
					<h2 class="mb-30">Change Password</h2>
					<form>
						<input type="hidden", name="id" value="<%=member.getId() %>"/>
						<input type="hidden", name="name" value="<%=member.getName() %>"/>
						<input type="hidden", name="phone" value="<%=member.getPhone() %>"/>
						<div class="mt-10">
							<input type="password" id="pass1" name="pass" placeholder="New Password!!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'New Password!!'" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="password" id="pass2" placeholder="Reply New Password!!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Reply New Password!!'" required class="single-input">
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-77 col-md-8">
				<a id="bt-change" class="genric-btn primary-border circle">Change</a>
				<a href="/client/member/login.jsp" class="genric-btn primary-border circle">Go to Login</a>
			</div>
		</div>
</body>
<%@ include file="/inc/footer.jsp" %>
</html>