<%@page import="java.util.Date"%>
<%@page import="com.coffee.model.domain.Coupon"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Coupon> couponList = (List<Coupon>)request.getAttribute("couponList");
	/*if(request.getSession().getAttribute("client")==null){
		response.getWriter().print("<script>location.href='/client/login/error.jsp'</script>");
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8">
<title>Inventory Page</title>
<style>
.mb-30{
	color : #b68834;
}
.col-lg-77{
	margin:auto;
	margin-top : 30px;
	text-align: center;
}
.row{
	margin:auto;
}
.mt-10{
	margin-top : 30px;
}
.genric-btn3{
	width:30%;
	text-align: center;
}
.coupon-detail div{
	display:inline-block;
	align:left;
}
#coupon_id{
	padding : 0px 20px;
	width : 5%;
}
#coupon_img{
	padding : 10px 20px;
	width : 20%;
}
#coupon_detail{
	width : 40%;
}
#coupon_ea{
	padding : 0px 20px;
	width : 10%;
}
#coupon_regdate{
	width:20%;
}
.coupon-detail{
	width : 73%;
	display:inline-block;
	align:left;
}
.coupon-control{
	width:25%;
	display:inline-block;
}
.refund-ea{
	width : 30%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function refund(i, ea){
	if($($("input[name=refund_ea]")[i]).val()<=ea && $($("input[name='refund_ea']")[i]).val()>0){
		$($("form[name='coupon_form']")[i]).attr({
			method:"post",
			action:"/client/item/refund"
		});
		$($("form[name='coupon_form']")[i]).submit();
	}else{
		alert("올바르지 않은 요청입니다.");
	}
}
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<h2 class="mb-30">보유 쿠폰</h2>
					
						<div class="mt-10">
							<%for(int i = 0 ; i<couponList.size();i++){ %>
							<%Coupon coupon = couponList.get(i); %>
							<%String date = coupon.getRegdate();
								date = date.substring(0,10);
							%>
							<form name="coupon_form">
								<div class="col-lg-12 coupon-border flex-left text-left">
									<div class="coupon-detail">
										<div id="coupon_id"><%=coupon.getCoupon_id() %></div>
										<div id="coupon_img"><img src="/data/<%=coupon.getProduct().getFilename() %>" width="70px"/></div>
										<div id="coupon_detail"><%=coupon.getProduct().getDetail() %></div>
										<div id="coupon_regdate"><%=date %></div>
										<div id="coupon_ea"><%=coupon.getEa() %>개</div>
										<input type="hidden" name="coupon_id" value="<%=coupon.getCoupon_id() %>"/>
									</div>
									<div class="coupon-control">
										<input type="number" class="refund-ea" name="refund_ea" id="refund_ea" min="1" max="<%=coupon.getEa()%>"/>
										<a href="javascript:refund(<%=i %>, <%=coupon.getEa() %>)" class="genric-btn primary-border circle">환불하기</a>
									</div>
								</div>
							</form>
							<%} %>
						</div>
				</div>
			</div>
		</div>
</body>
<%@ include file="/inc/footer.jsp" %>
</html>