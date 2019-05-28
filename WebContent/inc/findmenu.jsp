<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #b68834;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 50%;
}

.tablink:hover {
  background-color: #b68834;
}
</style>
</head>
<body>
<button class="tablink" onclick="location.href='/client/member/findid.jsp'">Find ID</button>
<button class="tablink" onclick="location.href='/client/member/findpw.jsp'">Find Password</button>
<script>
</script>
</body>
</html> 