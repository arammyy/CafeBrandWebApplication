<%@page import="com.coffee.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member client = (Member)session.getAttribute("client");
%>
<header id="header" id="home">
	<div class="header-top">
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-lg-8 col-sm-4 col-8 header-top-right no-padding">
					<%if(client == null) {%>
					<ul>					
						<li><a href="/client/member/login.jsp">Login</li>
						<li><a href="/ctest/member/goRegist">Regist</a></li>
					</ul>
					<%}else if(client.getGrade().getGrade_id()==3){ %>
						<ul>					
							<li><b><%=client.getName()%></b>님 반갑습니다.</li>
							<li><a href="/admin/member/list">Admin</a></li>
							<li><a href="javascript:logout()">Logout</a></li>
							<li><a href="/client/item/getPage"><img src="/img/cart2.png"/ width="30px"></a></li>
						</ul>
					<%}else{ %>
						<%if(client.getGrade().getGrade_id()==2) {%>
							<ul>
								<li><b><%=client.getName()%></b>점주님 반갑습니다.</li>
								<li>Point : <%=client.getPoint() %>점</li>					
								<li><a href="javascript:logout()">Logout</a></li>
								<li><a href="/client/item/getPage"><img src="/img/cart2.png"/ width="30px"></a></li>
							</ul>
						<%}else{%>
							<ul>
								<li><b><%=client.getName()%></b>님 반갑습니다.</li>
								<li>Point : <%=client.getPoint() %>점</li>			
								<li><a href="javascript:logout()">Logout</a></li>
								<li><a href="/client/item/getPage"><img src="/img/cart2.png"/ width="30px"></a></li>
							</ul>
						<%} %>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" title="" /></a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="/index.jsp">Home</a></li>
					<li><a href="/client/menu/getPage">CoffeeMenu</a></li>
					<li><a href="/client/point/getPage">PointMall</a></li>
					<li class="menu-has-children"><a href="/client/franchisee/mapList">Franchisee</a>
						<ul>
							<%if (client != null) {%>
							<form><input type="hidden" name="member_id" value="<%=client.getMember_id()%>"></form>
							<li><a href="javascript:goRegist()">Regist</a></li>
							<li><a href="/client/franchisee/mapList">Search</a></li>
							<%} else {%>
							<li><a href="/client/franchisee/mapList">Search</a></li>
							<%} %>
						</ul>
					</li>
					<li><a href="/client/board/list">Q&A</a></li>		
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>
<!-- #header -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/ctest/member/logout";
		}
	}
	function goRegist(){
		$("form").attr({
			method : "post",
			action : "/client/franchisee/goRegist"
		});
		$("form").submit();
	}
</script>
<script src="${pageContext.request.contextPath}/js/vendor/jquery-2.2.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
