<%@page import="com.coffee.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Member member=(Member)request.getAttribute("member");

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  text-align: center;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  text-align: center;
}

	
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: white;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
  text-align: center;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

.row{
	text-align: center;
	
}

input[type=button] {
 background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 12px 12px;
  font-size: 14px;
  width: 33%;
  
}

input[type=button]:hover{
background-color: #777;
}
</style>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	$($("input[type='button']")[0]).click(function() {
		edit();
	});
	$($("input[type='button']")[1]).click(function() {
		del();
	});
	$($("input[type='button']")[2]).click(function() {
		location.href="/admin/member/list";
	});
});
function del() {
	if (!confirm("삭제하시겠어요?")) {
		return;
	}
	$("form").attr({
		action : "/admin/member/delete",
		method : "post"
	});
	$("form").submit();
}
function edit() {
	if (!confirm("수정하시겠어요?")) {
		return;
	}
	$("form").attr({
		action : "/admin/member/edit",
		method : "post"
	});
	$("form").submit();
}

</script>

</head>
<body>
<%@include file="/inc/top_navi.jsp" %>
<h2 style="text-align:center">Member Detail</h2>


<div class="container">
<!--   <form enctype="multipart/form-data"> -->
  <form >

        <input type="hidden" name="member_id" value="<%=member.getMember_id() %>">
    <div class="row">
      <div class="col-25">
        <label for="fname">아이디</label>
      </div>
      <div class="col-75">
			<input type="text" name="id" value="<%=member.getId()%>"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">비밀번호</label>
      </div>
      <div class="col-75">
			<input type="text" name="pass" value="<%=member.getPass()%>"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">전화번호</label>
      </div>
      <div class="col-75">
			<input type="text" name="phone" value="<%=member.getPhone()%>"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">이름</label>
      </div>
      <div class="col-75">
			<input type="text" name="name" value="<%=member.getName()%>"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">나이</label>
      </div>
      <div class="col-75">
			<input type="text" name="age" value="<%=member.getAge()%>"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">포인트</label>
      </div>
      <div class="col-75">
			<input type="text" name="point" value="<%=member.getPoint()%>"> 
      </div>
    </div>
    <%-- <div class="row">
      <div class="col-25">
        <label for="fname">회원등급</label>
      </div>
      <div class="col-75">
			<input type="text" name="grade_id" value="<%=member.getGrade().getGrade_id()%>"> 
			
      </div>
    </div> --%>
    <div class="row">
      <div class="col-25">
        <label for="fname">회원등급</label>
      </div>
      <div class="col-75">
      		<% String[] grade={"회원","가맹점주","관리자"};%>
      		<select id="grade_id" name="grade_id">
      <%for(int i = 0; i < grade.length; i++) {%>
     
         <option value=<%=(i+1)%>  <%if(member.getGrade().getGrade_id()==(i+1)){%> selected="selected" <%}%>><%=grade[i] %></option>
      <%} %>
        </select>
			
      </div>
    </div>
   
    <div class="row"><hr></div>
    
    <div class="row">
      <input class ="button genric-btn3 primary-border circle" type="button" value="수정">
      <input class ="button genric-btn3 primary-border circle" type="button" value="삭제">
      <input class ="button genric-btn3 primary-border circle" type="button" value="목록">
    
    </div>
  </form>
</div>

</body>
</html>