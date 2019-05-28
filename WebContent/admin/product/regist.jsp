<%@page import="com.coffee.model.domain.Product"%>
<%@page import="com.coffee.model.domain.Category"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
   Product product=(Product)request.getAttribute("product");
   List<Category> categoryList = (List)request.getAttribute("categoryList");
   Category cate = new Category();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/top_navi.css" />
<style>
* {
   box-sizing: border-box;
     text-align: center;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 16px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
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

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.bt{
   padding-top: 12px;
    float:right;
   width: 100%;
    margin-top: 0;
}
.bt:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1000px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

</style>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

   var sel_file;

   

   $(document).ready(function(){
      $("#input_img").on("change", handleImgFileSelect);
   });

   $(function() {
      
      $($("input[type='button']")[0]).click(function() {
         regist();
      });
      $($("input[type='button']")[1]).click(function() {
         getList();
      });
   });

   function handleImgFileSelect(e){
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);

      filesArr.forEach(function(f){
         if(!f.type.match("image.*")){
            alert("이미지만 가능합니다");
            return;
         }

         sel_file = f;

         var reader = new FileReader();
         reader.onload = function(e){
            $("#img").attr("src", e.target.result);
         }
         
         reader.readAsDataURL(f);
      });
   }

   function regist() {
      if (!confirm("등록하시겠어요?")) {
         return;
      }
       form1.action="/admin/product/regist";
         form1.method="post";
         form1.submit();
      /* $("form").attr({
         method : "post",
         action : "/admin/product/regist"
      });
      $("form").submit(); */

   }

   //비동기 목록 요청
   function getList() {
      $.ajax({
         url : "/admin/product/list",
         type : "get",
         success : function(result) {
            // renderList(JSON.parse(result));

         },
         error : function(result) {

         }
      });

      location.href = "/admin/product/list.jsp";

   }

</script>
</head>
<body>
<%@include file="/inc/top_navi.jsp" %>

<h2>Product Regist</h2>


<div class="container">
  <form name="form1" enctype="multipart/form-data" class="form1">
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="name" name="name" placeholder="상품 이름" >
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="fname">Product Price</label>
      </div>
      <div class="col-75">
        <input type="text" id="price" name="price" placeholder="상품 가격" >
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Cost</label>
      </div>
      <div class="col-75">
        <input type="text" id="cost" name="cost" placeholder="상품 포인트" >
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Detail</label>
      </div>
      <div class="col-75">
        <input type="text" id="detail" name="detail" placeholder="상품 설명" >
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="ca">Product Category</label>
      </div>
      <div class="col-75">
        <select id="category_id" name="category_id">
      <%for(int i = 0; i < categoryList.size(); i++) {%>
      <%Category category = categoryList.get(i); %>
         <option value=<%=category.getCategory_id()%>><%=category.getCategory_name() %></option>
      <%} %>
        </select>
      </div>
    </div>
    <div class="row">
    <form name ="file_form" action="UploadService">
      <div class="col-25">
        <label for="image">Product Image</label>
        <input type="file" id="input_img" name="myFile" value="사진 찾기">
      </div>
      
      <div class="col-75">
         <img class="sticky" width="150px" height="200px" id="img">
      </div>
      </form>
    </div>
         <div class="bt">
            <input type="button" class="button genric-btn3 primary-border circle" value="등록"> 
            <input type="button" class="button genric-btn3 primary-border circle" value="목록">
         </div>
      </form>
</div>

</body>
</html>