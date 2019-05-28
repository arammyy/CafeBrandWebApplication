<%@page import="com.coffee.model.domain.Category"%>
<%@page import="com.coffee.model.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> menuList = (List<Product>)request.getAttribute("menuList");
	List<Category> categoryList = (List<Category>)request.getAttribute("categoryList");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function getCategory(category_id){
	if(category_id==0){
		$.ajax({
			url:"/client/menu/",
			type:"get",
			success:function(result){
				renderList(result);
			}
		});
	}else{
		$.ajax({
			url:"/client/menu/"+category_id,
			type:"get",
			success : function(result){
				renderList(result);
			}
		});
	}
}
function renderList(jsonArray){
	$("#menuList").html("");
	var str = "";
	var currcategory=0;
	for(var i = 0 ; i < jsonArray.length;i++){
		var json = jsonArray[i];
		if(json.category.category_id!=currcategory){
			str+="<h3 class='col-lg-12 category-index'>"+json.category.category_name+"</h3>";
			str+="<hr class='col-lg-12'>";
			currcategory=json.category.category_id;
			console.log(currcategory);
			console.log(json.category.category_id);
		}
		str+="<div class='col-lg-4'>";
		str+="<div class='single-menu'>";
		str+="<div class='col-lg-11 title-div justify-content-between d-flex'>";
		str+="<h4>"+json.name+"</h4>"
		str+="<p class='price float-right'>"+json.price+"원	</p>"
		str+="</div>";
		str+="<div class='menu-img col-lg-4'>";
		str+="<img src='/data/"+json.filename+"' width='100p%' height='162px'>";
		str+="</div>";
		str+="<div class='menu-content col-lg-7'>";
		str+="<p class='menu-detail'>";
		str+=json.detail;
		str+="</p>";
		str+="</div>";
		str+="</div>";
		str+="</div>";
	}
	$("#menuList").append(str);
}
</script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<!-- Start menu Area -->
			<section class="menu-area section-gap" id="coffee">
				<div class="container">
					
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-12">
							<div class="side-category title text-center">
								<a href="javascript:getCategory(0)" class="side-menu-btn primary-border circle">ALL</a>
							<%for(int i = 0; i<categoryList.size();i++){ %>
								<a href="javascript:getCategory(<%=i+1 %>)" class="side-menu-btn primary-border circle"><%= categoryList.get(i).getCategory_name()%></a>
							<%} %>
							</div>
						</div>
					</div>						
					<div class="row" id="menuList">
					
						<%int currcategory=0; %>
						<%for(int i = 0 ; i<menuList.size();i++){ %>
						<%Product product = menuList.get(i); %>
						<%if(product.getCategory().getCategory_id()!=currcategory){ %>
							<h3 class="col-lg-12 category-index"><%=product.getCategory().getCategory_name() %></h3>
							<hr class="col-lg-12">
							<%currcategory=product.getCategory().getCategory_id(); %>
						<%} %>
						<div class="col-lg-4">
							<div class="single-menu">
								<div class="col-lg-11 title-div justify-content-between d-flex">
									<h4><%=product.getName() %></h4>
									<p class="price float-right">
										<%=product.getPrice() %>원
									</p>
								</div>
								<div class="menu-img col-lg-4">
									<img src="/data/<%=product.getFilename()%>" width="100%" height="162px">
								</div>
								
								<div class="menu-content col-lg-7">
									<p class="menu-detail">
										<%=product.getDetail() %>
									</p>	
								</div>	
													
							</div>
						</div>
						<%} %>
																					
					</div>
				</div>	
			</section>
			<!-- End menu Area -->
</body>
<%@ include file="/inc/footer.jsp" %>
</html>