<%@page import="com.coffee.model.domain.Member"%>
<%@page import="com.coffee.common.board.Pager"%>
<%@page import="com.coffee.model.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!Pager pager=new Pager();%>
<%
	List<Board> boardList = (List)request.getAttribute("boardList");
	pager.init(request, boardList.size());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  height : 50%;
  border: 5px solid #b68834;
}

th, td, tr {
  text-align: center;
  padding: 10px;
  border: 1px solid #b68834;
}

tr:nth-child(even) {
  color: #b68834
}
.col-lg-77{
	margin:auto;
	margin-top : 30px;
	text-align: center;
}
.row{
	margin:auto;
} 
.mb-30{
	color : #b68834;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(function() {
      
   });
   function getDetail(boardId,board,clientGrade,clientId,askId){// 여기에 board 넣어야함
	   if(clientGrade==3||clientId==board||clientId==askId){	  
	   		location.href="/client/board/detail?board_id="+boardId;
		}else{
			alert("글을 열람할 수 있는 권한이 없습니다.");
		}
   }
   function regist(member_id){
     
   }
   </script>
</head>
<body>
 <%@ include file="/inc/header.jsp" %>  


<p></p>
<section class="menu-area section-gap" id="coffee" >
<!-- <div class="section-top-border" > -->
	<div class="row" >
		<div class="col-lg-77 col-md-8" >
			<h2 class="mb-30">Q&A 게시판</h2>
			<table class="board_table">
			  <tr class="board_tr" style="text-align: center">		  	 
			    <th style="width:10%; text-align: center"> No.</th>
			    <th style="width:60%; text-align: left">제목</th>
			    <th style="width:10%; text-align: center ">작성자</th>
			    <th style="width:20%; text-align: center">날짜</th>
			  </tr>
			    <%int num=pager.getNum(); %>
			  	<%int curPos=pager.getCurPos(); %>
			  	<%for(int i=0;i<pager.getPageSize();i++){ %>
				<%if(num<1)break; %>
				<%Board board = boardList.get(curPos++);%>
			  <tr class="board_tr" onClick="getDetail(<%=board.getBoard_id()%>,<%=board.getMember().getMember_id()%>,<%=client.getGrade().getGrade_id()%>,<%=client.getMember_id()%>,<%=board.getDepth()%>)">
			    <td class="board_td" style="text-align: center"><%=num--%></td>
			    <td class="board_td" style="text-align: left"><%=board.getTitle() %></td>
			    <td class="board_td" style="text-align: center"><%=board.getMember().getName() %></td>
			    <td class="board_td" style="text-align: center"><%=(board.getDate()).substring(0, 10)%></td>
			  </tr>
			  <%} %>  
			</table>
			</div>
	</div>
		<div class="col-lg-77 col-md-8" style="text-align:center">
		<%if(pager.getCurrentPage() -1 > 0) {%>
				<a href="/client/board/list?currentPage=<%=pager.getCurrentPage()-1%>">◀</a>
			<%}else{ %>
				<a href="javascript:alert('처음 페이지입니다');">◀</a>
		<%} %>
		<%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){ %>
		  	<%if(i>pager.getTotalPage())break; %>
		  	<a href = "/client/board/list?currentPage=<%=i%>">[<%=i %>]</a> <!-- 내가 누른 페이지 번호를 넘기자 -->
		<%} %>
		<%if(pager.getCurrentPage() < pager.getTotalPage()) {%>
				<a href="/client/board/list?currentPage=<%=pager.getCurrentPage()+1%>">▶</a>
		<%}else{ %>
				<a href="javascript:alert('마지막 페이지입니다');">▶</a>
		<%} %>
		</div>
	<div class="col-lg-77 col-md-8" style="text-align:right">
	<!-- <a id="bt-search" class="genric-btn2 primary-border" style="width : 20%;" >등록</a> -->
	<a href="/client/board/goRegist" class="genric-btn2 primary-border" style="width : 15%; border : 1px solid #b68834; font-size :20px; font-weight : bold;" >등록</a> 
</div>
</section>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>