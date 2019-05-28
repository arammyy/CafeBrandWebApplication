<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("접근 권한이 없습니다");
location.href="/index.jsp";
</script>
</head>
<%-- <body bgcolor="yellow">
<%RuntimeException err=(RuntimeException)request.getAttribute("err"); %>
<%=err.getMessage() %><br>
이용에 불편을 드려 죄송합니다.<br>
잠시 후 다시 이용해주세요
</body> --%>
</html>