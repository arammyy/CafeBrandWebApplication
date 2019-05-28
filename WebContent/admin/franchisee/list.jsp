<%@page import="com.coffee.common.board.Pager"%>
<%@page import="com.coffee.model.domain.Franchisee"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!Pager pager=new Pager();%>
<%
	List<Franchisee> franchiseeList = (List)request.getAttribute("franchiseeList");
	pager.init(request, franchiseeList.size());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css">
<style>
.member_table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;

  font-size: 20px;
}
.member_tr{
	border: 1px solid #b68834;
}

.member_th, .member_td {
  text-align: left;
  padding: 16px;
  color:black;
  cursor:pointer;
}
.member_tr:nth-child(1){
	background-color: #b68834;
	color:white;
}
select {
  background-color: #555;
  color: white;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 14px;
  width: 150px;
}
.button_td{
	padding: 20px;
}
.button {
  background-color: #555;
  color: white;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 14px;
  width: 150px;
}
.button:hover {
  background-color: #777;
}
.search{
	padding: 13px 16px;
	font-size: 14px;
	width:300px;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(function() {
      $("#bt-search").click(function(){
		search();
      });
   });
   function getDetail(franchisee_id){// 여기에 member 넣어야함
	   location.href="/admin/franchisee/detail?franchisee_id="+franchisee_id;
   }
   function search(){
		$("form").attr({
			action:"/admin/franchisee/search",
			method:"get"
		});
		$("form").submit();
   }
</script>

</head>
<body>
<%@include file="/inc/top_navi.jsp" %>
<hr>
<h2 style="text-align:center">FRANCHISEE</h2>
<p></p>
<div class="row">
<div class="col-lg-77 col-md-8" style="margin:0 auto">
<div>	
  	<div class="button_td" style="text-align:center">
  		<form>
  		<select class ="button genric-btn3 primary-border circle" name="local">
  			<option value="">지역 분류</option>
			<option value="경기">경기</option>
			<option value="서울">서울</option>
			<option value="강원">강원</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
			<option value="전남">전남</option>
			<option value="전북">전북</option>
			<option value="경남">경남</option>
			<option value="경북">경북</option>	
			<option value="제주">제주</option>
  		</select>
        <input type="text" name="f_name"  placeholder="지점명 검색" style="text-align: center" class="search"> 
        <input class ="button genric-btn3 primary-border circle" type="button" value="검색" id="bt-search">
        </form>
     </div>
  </div>
<table class="member_table">
  <tr class="member_tr">
    <th class="member_th">No.</th>
    <th class="member_th">지역</th>
    <th class="member_th">지점명</th>
    <th class="member_th">지점장</th>
    <th class="member_th">승인여부</th>
  </tr>
  <%int num=pager.getNum(); %>
  <%int curPos=pager.getCurPos(); %>
  <%for(int i=0;i<pager.getPageSize();i++){ %>
  <%if(num < 1) break; %>
  <%Franchisee franchisee = franchiseeList.get(curPos++); %>
  <tr class="member_tr" onClick="getDetail(<%=franchisee.getFranchisee_id()%>)"> <!-- i대신 member 넣어야함 -->
    <td class="member_td"><%=num--%></td>
    <td class="member_td"><%=franchisee.getLocal() %></td>
    <td class="member_td"><%=franchisee.getF_name()%></td>
    <td class="member_td"><%=franchisee.getMember().getName()%></td>
    <%if(franchisee.getChecked() == 0){%>
    	<td class="member_td">거부</td>
    <%} else{ %>
    	<td class="member_td">승인</td>
    <%} %>	
  </tr>
  <%} %>
<%--   <tr>
  		<td colspan="5" style="text-align:center">
  		<%if(pager.getCurrentPage() -1 > 0) {%>
				<a href="/admin/franchisee/list?currentPage=<%=pager.getCurrentPage()-1%>">◀</a>
			<%}else{ %>
				<a href="javascript:alert('처음 페이지입니다');">◀</a>
		<%} %>
  		<%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){ %>
  		<%if(i>pager.getTotalPage())break; %>
  			<a href = "/admin/franchisee/list?currentPage=<%=i%>">[<%=i%>]</a>
  		<%} %>
  		<%if(pager.getCurrentPage() < pager.getTotalPage()) {%>
				<a href="/admin/franchisee/list?currentPage=<%=pager.getCurrentPage()+1%>">▶</a>
		<%}else{ %>
				<a href="javascript:alert('마지막 페이지입니다');">▶</a>
		<%} %>
  		</td>
  </tr> --%>
  
</table>
<hr>
<div style="text-align:center; font-size:20px; color:#b68834">
<%if(pager.getCurrentPage() -1 > 0) {%>
				<a href="/admin/franchisee/list?currentPage=<%=pager.getCurrentPage()-1%>">◀</a>
			<%}else{ %>
				<a href="javascript:alert('처음 페이지입니다');">◀</a>
		<%} %>
  		<%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){ %>
  		<%if(i>pager.getTotalPage())break; %>
  			<a href = "/admin/franchisee/list?currentPage=<%=i%>">[<%=i%>]</a>
  		<%} %>
  		<%if(pager.getCurrentPage() < pager.getTotalPage()) {%>
				<a href="/admin/franchisee/list?currentPage=<%=pager.getCurrentPage()+1%>">▶</a>
		<%}else{ %>
				<a href="javascript:alert('마지막 페이지입니다');">▶</a>
		<%} %>
</div>
</div>
</div>
</body>
</html>