<%@ page contentType="text/html; charset=UTF-8"%>
<%

//	Board board = (Board)request.getAttribute("board");
	String board_id = "1";


	
	//이 게시물과 관련된 댓글 목록도 가져와야한다..

	
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.reply{
	border:1px solid #eee;	
}
#cwriter,#cmsg{
	display:inline-block;
	background:yellow;
}
#cwriter{
	width:20%;
}
#cmsg{
	width:75%;
}
</style>
<script>
$(function(){
	$("#bt-reply").click(function(){
		sendSync(); //동기로 요청
	});
	
	$("#bt-reply2").click(function(){
		sendAsync();//비동기로 요청
	});
});

//댓글 등록 요청!!
function sendSync(){
	$("form[name='reply-form']").attr({
		"method":"post",
		"action":"/comments/regist.jsp"
	});	
	$("form[name='reply-form']").submit(); //데이터 전송!
}

//비동기로 요청을 시도한다, 비동기 통신을 위해서는 Ajax 객체가 필요한데 객체명은 HttpXMLRequest
function sendAsync(){
	var xhttp = new XMLHttpRequest();
	
	xhttp.open("POST", "/comments/regist2.jsp", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	//alert($("[name='cwriter']").val());
	
	//요청과 응답상태를 알 수 있는 이벤트 구현
	xhttp.onreadystatechange=function(){
		  if (this.readyState == 4 && this.status == 200) {
			  var json = JSON.parse(xhttp.responseText);
			  //alert(json.commentsList[0].cregdate);
			  $("#reply-container").html(""); //기존꺼 지우기
			  for(var i=0;i<json.commentsList.length;i++){
				var obj = json.commentsList[i];
				var ct = new Comments(obj.comments_id,obj.cwriter,obj.msg);
				$("#reply-container").append(ct.getStr());
			  }
		  }
			  
			  //alert("서버의 응답 결과 메시지는"+ xhttp.responseText);
		
	};
	
	xhttp.send("cwriter="+$("[name='cwriter']").val()+"&msg="+$("[name='msg']").val()+"&board_id="+$("[name='board_id']").val());
}
function del(){
	if(!confirm("삭제하시겠습니까?")){
		return; 
	}
	$("[name='board-form']").attr({
		"method":"post",
		"action":"/board/delete.jsp"
	});
	$("[name='board-form']").submit(); //404에러뜰거야 만약 존재하지 않는걸로 보내면
}
</script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<h3>상세내용</h3>

<div class="container">
  <form name = "board-form">
    <input type="hidden" name="board_id" value="1">
    <input type="text"  name="writer" value="작가">
    <input type="text"  name="title" value = "제목">
    <textarea name="content" style="height:200px">내용</textarea> <!-- /textarea를 엔터쳐서 내리면 안되 무조건 한줄!! -->
    <input type="button" id = "bt-board" value="등록하기">
    <input type="button" id = "bt-list" value="목록보기" onClick="location.href='list.jsp'">
    <input type="button" id = "bt-edit" value="수정하기">
    <input type="button" id = "bt-delete" value="삭제하기" onClick="del()">
  </form>
  
  <!-- 댓글 등록 영역 -->
  <form name ="reply-form">
  	<input type="hidden" name="board_id" style="width:20%" value="1">
  	<input type="text"  name="cwriter" style="width:20%" placeholder="작성자 입력">
    <input type="text"  name="msg" style="width:40%" placeholder="제목 입력">	
    <input type="button" id = "bt-reply" style="width:5% text-align:center" value ="등록하기(sync)">
    <input type="button" id = "bt-reply2" style="width:5% text-align:center" value ="등록하기(async)">
  </form>
</div>

	<!-- 댓글 목록 -->
	
	<div id="reply-container">
		<div class = "reply">
			<div id = "cwriter"></div>
			<div id = "cmsg"></div>
		</div>
	</div>
</body>
</html>