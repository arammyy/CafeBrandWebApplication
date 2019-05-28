<%@page import="com.coffee.model.domain.Category"%>
<%@page import="com.coffee.common.board.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.coffee.model.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!Pager pager = new Pager();%>
<%
   List<Product> productList = (List)request.getAttribute("productList");
   List<Category> categoryList = (List)request.getAttribute("categoryList");
   pager.init(request, productList.size());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css" />
<style>
.product_table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  font-size: 20px;
}
.product_th, .product_td {
  text-align: left;
  padding: 20px;
  color:black;
  cursor:pointer;
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

.product_tr {
	border: 1px solid #b68834;
}
.product_tr:nth-child(1){
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
.search{
   padding: 13px 16px;
   font-size: 14px;
   width:300px;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(function(){
      $("#bt-search").click(function(){
         search();
      });
   });
   function regist(){
      location.href="/admin/product/regist.jsp"; 
   }
   function showDetail(product_id){
      location.href="/admin/product/detail?product_id="+product_id;
   }
   function search(){
      $("form").attr({
         action:"/admin/product/search",
         method:"get"
      });
      $("form").submit();
   }
</script>
</head>
<body>
<%@include file="/inc/top_navi.jsp" %>
<hr>
<h2 style="text-align:center">PRODUCT</h2>
<p></p>
<div class="row">
<div class="col-lg-77 col-md-8" style="margin:0 auto">
  <div>
     <div  class="button_td" style="text-align:left; float:left">
        <input class="button genric-btn3 primary-border circle" type="button" value="등록" onClick="location.href='/admin/product/goRegist'">        
     </div>
     <div  class="button_td" style="text-align:right">
        <form>
       <select class="button genric-btn3 primary-border circle" name="category_id">
           <option value="">카테고리 선택</option>
           <%for(int i = 0; i < categoryList.size(); i++) {%>
              <%Category category = categoryList.get(i); %>
              <option value="<%=category.getCategory_id()%>"><%=category.getCategory_name()%></option>
           <%} %>
        </select>
        <input type="text" name="name"  placeholder="상품 이름 검색" style="text-align: center" class="search"> 
        <input class ="button genric-btn3 primary-border circle" type="button" value="검색" id="bt-search">
        </form>
     </div>
  </div>
<table  class="product_table">
  <tr  class="product_tr">
    <th class="product_th">No.</th>
    <th class="product_th">상품 사진</th>
    <th class="product_th">상품 종류</th>
    <th class="product_th">상품 이름</th>
    <th class="product_th">상품 가격</th>
  </tr>
  <%int num = pager.getNum();
     int curPos = pager.getCurPos();%>
   <%for(int i=0;i<pager.getPageSize();i++){ %>
   <%if(num<1) break; %>
   <%Product product = productList.get(curPos++); %>
      <tr class="product_tr" onClick="showDetail(<%=product.getProduct_id() %>)">
         <td class="product_td"><%=num-- %></td>
         <td class="product_td"><img src="/data/<%=product.getFilename() %>" widht="100px" height="100px" ></td>
         <td class="product_td"><%=product.getCategory().getCategory_name() %></td>
         <td class="product_td"><%=product.getName() %></td>
         <td class="product_td"><%=product.getPrice() %></td>
      </tr>
   <%} %>


</table>
<hr>
<div style="text-align:center; font-size:20px; color:#b68834">
<%if(pager.getCurrentPage() -1 > 0) {%>
            <a href="/admin/product/list?currentPage=<%=pager.getCurrentPage()-1%>">◀</a>
         <%}else{ %>
            <a href="javascript:alert('처음 페이지입니다');">◀</a>
      <%} %>
        <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){ %>
        <%if(i>pager.getTotalPage())break; %>
             <a href = "/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>
        <%} %>
        <%if(pager.getCurrentPage() < pager.getTotalPage()) {%>
            <a href="/admin/product/list?currentPage=<%=pager.getCurrentPage()+1%>">▶</a>
      <%}else{ %>
            <a href="javascript:alert('마지막 페이지입니다');">▶</a>
      <%} %>
</div>
</div>
</div>
</body>
</html>