<%@page import="com.coffee.model.domain.Category"%>
<%@page import="com.coffee.model.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> ptMenuList = (List<Product>)request.getAttribute("ptMenuList");
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
			url:"/client/point/",
			type:"get",
			success:function(result){
				renderList(result);
			}
		});
	}else{
		$.ajax({
			url:"/client/point/"+category_id,
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
		}
		str+="<div class='col-lg-4'>";
		str+="<div class='single-menu'>";
		str+="<div class='col-lg-11 title-div justify-content-between d-flex'>";
		str+="<h4>"+json.name+"</h4>"
		str+="<p class='price float-right'>"+json.cost+" P	</p>"
		str+="</div>";
		str+="<div class='menu-img col-lg-4'>";
		str+="<img src='/data/"+json.filename+"' width='100p%' height='162px'>";
		str+="</div>";
		str+="<div class='menu-content col-lg-7'>";
		str+="<p class='menu-detail'>";
		str+=json.detail;
		str+="</p>";
		str+="</div>";
		str+="<div class='bottom-line'>";
		str+="<div class='product'>";
		str+="<div class='product_quantity'>";
		str+="<div class='qnt_btn sub_qnt'><span>-</span></div>";
		str+="<span class='product_num' name='ea'>1</span>";
		str+="<div class='qnt_btn sum_qnt'><span>+</span></div>";
		str+="</div>";
		str+="</div>";
		str+="<div class='icon-div'>";
		str+="<a href='javascript:checkUserPt("+i+", "+json.product_id+")'><img src='/img/cart.png' width='25%' align='right'/></a>";
		str+="</div>";
		str+="</div>";
		str+="</div>";
		str+="</div>";
	}
	$("#menuList").append(str);
	initQty();
}
function checkUserPt(i, product_id){
	var ea = $($("span[name='ea']")[i]).text();
	$.ajax({
		url:"/client/product/"+product_id,
		type:"post",
		data:{"ea":ea},
		success:function(result){
			var json = JSON.parse(result);
			console.log(json.resultCode);	
			if(json.resultCode!=404){
				if(json.resultCode){
					addCoupon(ea, product_id);
				}else{
					alert("포인트가 부족합니다.");
				}
			}else{
				loginerror(json);
			}
		}
	});
}
function loginerror(json){
	location.href=json.msg+".jsp";
}
function addCoupon(ea, product_id){
	console.log(product_id);
	$.ajax({
		url:"/client/coupon/add",
		type:"post",
		data:{
			"product_id":product_id,
			"ea":ea
		},
		success:function(result){
			var json = JSON.parse(result);
			alert(json.msg);
		}
	});
}
</script>
</head>
<body>
<form id="headerForm">
<%@ include file="/inc/header.jsp" %>
</form>
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
						<%for(int i = 0 ; i<ptMenuList.size();i++){ %>
						<%Product product = ptMenuList.get(i); %>
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
										<%=product.getCost() %> P
									</p>
								</div>
								<div class="menu-img col-lg-5" align="left">
									<img src="/data/<%=product.getFilename()%>" width="100%" height="162px">
								</div>
								
								<div class="menu-content">
									<p>
										<%=product.getDetail() %>
									</p>
								</div>
								<div class="bottom-line">
									<div class="product">	
										<div class="product_quantity">
											<div class="qnt_btn sub_qnt"><span>-</span></div>
											<span class="product_num" name="ea">1</span>
											<div class="qnt_btn sum_qnt"><span>+</span></div>
										</div>
									</div>
									<div class="icon-div">
										<a href="javascript:checkUserPt(<%=i%>, <%=product.getProduct_id()%>)"><img src="/img/cart.png" width="25%" align="right"/></a>
									</div>
								</div>	
							</div>
						</div>
						<%} %>
																					
					</div>
				</div>	
			</section>
			<!-- End menu Area -->
<script src="${pageContext.request.contextPath}/js/qnt.js"></script>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>