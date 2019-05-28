<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.coffee.common.board.Pager"%>
<%@page import="com.coffee.model.domain.Franchisee"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%! Pager pager = new Pager(); %>
<%
	List<Franchisee> franchiseeList = (List)request.getAttribute("franchiseeList");
	pager.init(request, franchiseeList.size());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  height : 50%;
  border: 1px solid #ddd;
}

th, td, tr {
  text-align: center;
  padding: 5px;
  border: 1px solid #b68834;
}

tr:nth-child(even) {
  color: #b68834
}
.mb-30{
	color : #b68834;
}
.col-lg-3{
	margin-top : 30px;
}
.col-lg-77{
	margin:auto;
	margin-top : 30px;
	text-align: center;
}
.col-lg-3 {
    flex: 0 0 16%;
    max-width: 25%;
}
.row{
	margin:auto;
}
.mt-10{
	margin-top : 30px;
	border : solid 1px brown;
}
.genric-btn{
	width:45%;
	text-align: center;
}
.d-flex3 {
  display: flex !important;
}
.swtich-p{
	display: inline-block;
	width : 10%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var map;
	var mapProp;
	var pager;
	$(function(){
		searchAll();
		$("#bt-search").click(function(){
			pagerSearch();
			localSearch();
		});
	});
	function searchAll(){
		$.ajax({
			url : "/client/franchisee/searchAll",
			type: "get",
			success:function(result){
				mapMarker(result);
			}
		});
	}
	function localSearch(){
		$.ajax({
			url : "/client/franchisee/search",
			type: "get",
			data:{
				local : $($("form").find("select[name='local']")).val(),
				f_name : $($("form").find("input[name='f_name']")).val()
			},
			success:function(result){
				renderList(result);
				mapMarker(result);
			}
		});
	}
	function pagerSearch(){
		$.ajax({
			url : "/client/franchisee/searchPager",
			type: "get",
			data:{
				local : $($("form").find("select[name='local']")).val(),
				f_name : $($("form").find("input[name='f_name']")).val()
			},
			success:function(result){
				pager = result;
			}
		});
	}
	function renderList(jsonArray){
		$("#franchiseeList").html("");
		var str = "";
		str += "<table>";
		str += "<tr>";
		str += "<th width='10%'>No.</th>";
		str += "<th width='20%'>지역</th>";
		str += "<th width='20%'>점포명</th>";
		str += "<th width='49%'>주소</th>";
		str += "</tr>";
		var num = pager.num;
		var curPos = pager.curPos;
		for(var i = 0 ; i < pager.pageSize; i++){
			if(num < 1){break;}
			var json = jsonArray[i];
			str += "<tr>";
			str += "<td>"+(num--)+"</td>";
			str += "<td>"+json.local+"</td>";
			str += "<td>"+json.f_name+"</td>";
			str += "<td>"+json.addr+"</td>";
			str += "</tr>";		
		}
		str += "<tr>";
		str += "<td colspan=5>";
		for(var i = pager.firstPage; i < pager.lastPage; i++){
			if(i > pager.totalPage)break;
			str += "<a href='/client/franchisee/'>["+i+"]";
		}
		str += "</td>";
		str += "</tr>";
		$("#franchiseeList").append(str);
	}
	function mapMarker(jsonArray){
		myMap();
		for(var i = 0; i < jsonArray.length; i++){
			var json = jsonArray[i];
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(json.lati, json.longi),
			});
			marker.setMap(map);		
			placeMarker(map, marker, json);
		}
	}
	function placeMarker(map, marker, json) {
		var infowindow = new google.maps.InfoWindow({
		    content:"<b>" + json.f_name + "</b><hr> 주소 :" + json.addr 
		});
		google.maps.event.addListener(marker, 'click', function() {
			  map.setCenter(marker.getPosition());
			  infowindow.open(map,marker);
		});	
	}
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<h2 class="mb-30">Franchisee Search</h2>
					<form>
						<div class="mt-10" id="googleMap" style="width:100%;height:500px;"></div>
						<div class="mt-10" style="overflow:hidden" id="franchiseeList">
							<table>
								  <tr>
								    <th width="10%">No.</th>
								    <th width="20%">지역</th>
								    <th width="20%">점포명</th>
								    <th width="49%">주소</th>
								  </tr>
								  <%int num =	pager.getNum();%>
								  <%int curPos = pager.getCurPos(); %>
								  <%for(int i = 0; i < pager.getPageSize(); i++) {%>
								  <%if(num < 1) break; %>
								  <%Franchisee franchisee = franchiseeList.get(curPos++); %>
								  <tr>
								    <td><%=num-- %></td>
								    <td><%=franchisee.getLocal() %></td>
								    <td><%=franchisee.getF_name() %></td>
								    <td><%=franchisee.getAddr() %></td>
								  </tr>
								  <%} %>
								  <tr>
								  	<td colspan=5>
										<%for(int i = pager.getFirstPage(); i < pager.getLastPage(); i++){ %>
										<%if(i>pager.getTotalPage())break; %>
											<a href="/client/franchisee/mapList?currentPage=<%=i%>">[<%=i %>]</a>
										<%} %>
									</td>
								  </tr>
							</table>
						</div>
						<div class="mt-10">
							<div class="default-select" id="default-select" style="width:15%;float:left;">
								<select name = "local">
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
							</div>
							<input type="text" name="f_name" placeholder="가게명..." onfocus="this.placeholder = ''" onblur="this.placeholder = '가게명...'" required class="single-input" style="width:65%;float:left" />
							<a id="bt-search" class="genric-btn2 primary-border" style="width : 20%;" >Search</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>
</body>
<%@ include file="/inc/footer.jsp" %>
<script>
	function myMap(jsonLati, jsonLongi) {
		mapProp= {
	 	 center:new google.maps.LatLng(37.528776, 126.934279),
	 	 zoom:12,
		};
		map= new google.maps.Map(document.getElementById("googleMap"),mapProp);
	}
	</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7h6wQQQLLXC7QjvP7nuwXtWrSgBGWdpQ&callback=myMap"></script>
</html>