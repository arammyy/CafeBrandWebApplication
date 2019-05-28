<%@page import="com.coffee.model.domain.Grade"%>
<%@page import="java.util.List"%>
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
.input-border{
	border : 1px solid rgb(182, 136, 52);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var json;
	var json2;
	$(function(){
		$("#bt-regist").click(function(){
			regist();
		});
		$("#bt-check").click(function(){
			checkinfo();
		});
		$("#bt-checkphone").click(function(){
			checkphone();
		});
	})
	function regist(){
		if($($("form").find("input[name='id']")).val() == ""){
			alert("아이디를 입력해주세요!!");
			return;
		}else if(json.result == 0){
			alert("아이디 중복 체크 해주세요!!");
			return;
		}else if($($("form").find("input[name='pass']")).val() == ""){
			alert("비밀번호를 입력해주세요!!");
			return;
		}else if($($("form").find("input[name='passck']")).val() == ""){
			alert("비밀번호확인을 입력해주세요!!");
			return;
		}else if($($("form").find("input[name='phone']")).val() == ""){
			alert("전화번호를 입력해주세요!!");
			return;
		}else if(json2.result == 0){
			alert("전화번호 중복 체크 해주세요!!");
			return;
		}else if($($("form").find("input[name='name']")).val() == ""){
			alert("이름을 입력해주세요!!");
			return;
		}else if($($("form").find("input[name='age']")).val() == ""){
			alert("나이를 입력해주세요!!");
			return;
		}else if($($("form").find("select[name='grade_id']")).val() == ""){
			alert("등급을 선택해주세요!!");
			return;
		}else if($($("form").find("input[name='pass']")).val().length<4||$($("form").find("input[name='pass']")).val().length>10){
			alert("비밀번호 길이를 확인해 주세요!!");
			return;
		}else if($($("form").find("input[name='pass']")).val()!=$($("form").find("input[name='passck']")).val()){
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		$("form").attr({
			"action" : "/ctest/member/regist",
			"method" : "post"
		});
		$("form").submit();
	}

	function pwcheck(){
		if($($("form").find("input[name='pass']")).val()==$($("form").find("input[name='passck']")).val() ){

			document.getElementById('lb_pass').style.color="blue";
			document.getElementById('lb_pass').innerHTML = '비밀번호가 일치합니다';
		}else{

			document.getElementById('lb_pass').style.color="red";
			document.getElementById('lb_pass').innerHTML = '비밀번호가 일치하지 않습니다';
		}
	}

	function checkinfo(){
		$.ajax({
			url:"/ctest/member/checkinfo",
			type:"get",
			data:{
				id : $($("form").find("input[name='id']")).val()
			},
			success:function(result){
				json = JSON.parse(result);
				if(json.result == 1){
					alert("사용 가능한 아이디 입니다.");
				}else{
					alert("중복된 아이디 입니다.");
				}
			}
		});
	}
	function checkphone(){
		$.ajax({
			url:"/client/member/checkphone",
			type:"get",
			data:{
				phone : $($("form").find("input[name='phone']")).val()
			},
			success:function(result){
				json2 = JSON.parse(result);
				if(json2.result == 1){
					alert("사용 가능한 전화번호 입니다.");
				}else{
					alert("중복된 전화번호 입니다.");
				}
			}
		});
	}
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
<%
		List<Grade> gradeList = (List)request.getAttribute("gradeList");
%>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<h2 class="mb-30">Regist Page</h2>
					<form>
						<div class="mt-10">
							<input type="text" name="id" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'" required class="single-input" style="width:70%;float:left" />
							<a id="bt-check" class="genric-btn2 primary-border" style="width : 30%" >Check</a>
						</div>
						<div class="mt-10">
							<label  id="lb_passinfo">*비밀번호는 4~10자 사이로 입력해 주세요*</label>
						</div>
						<div class="mt-10">
							<input type="password" name="pass" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input" onkeyup="pwcheck()">
						</div>
						<div class="mt-10">
							<input type="password" name="passck" placeholder="Password Check" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password Check'" required class="single-input" onkeyup="pwcheck()">
						</div>
						<div class="mt-10">
							<label id="lb_pass" ></label>
						</div>
						<div class="mt-10">
							<input type="text" name="phone" placeholder="PhoneNumber" onfocus="this.placeholder = ''" onblur="this.placeholder = 'PhoneNumber'" required class="single-input" style="width:70%;float:left">
							<a id="bt-checkphone" class="genric-btn2 primary-border" style="width : 30%" >Check</a>
						</div>
						<div class="mt-10">
							<input type="text" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="email" name="age" placeholder="Age" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Age'" required class="single-input">
						</div>
						<div class="input-group-icon mt-10">
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<div class="form-select" id="default-select"">
								<select name="grade_id">
									<option value="">Grade</option>
									<%for(int i = 0; i < gradeList.size(); i++) {%>
									<%Grade grade = gradeList.get(i); %>
										<option value="<%=grade.getGrade_id()%>"><%=grade.getGrade_name() %></option>
									<%} %>
								</select>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-77 col-md-8">
				<a id="bt-regist" class="genric-btn primary-border circle">Regist</a>
				<a href="/index.jsp" class="genric-btn primary-border circle">Cancel</a>
			</div>
		</div>
</body>
<%@ include file="/inc/footer.jsp" %>
</html>