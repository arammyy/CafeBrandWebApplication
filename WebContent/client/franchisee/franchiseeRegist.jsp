<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
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
select {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#default-switch").change(function(){
			changediv();
		});
		$("#bt-regist").click(function(){
			regist();
		});
	});
	function changediv(){
		if(!$("#default-switch").prop('checked')){
			$("#addr_div").hide();
		}else{
			$("#addr_div").show();
		}
	}
	function regist(){
		$("form[name='franchisee-form']").attr({
			"method" : "post",
			"action" : "/client/franchisee/regist"
		});
		$("form[name='franchisee-form']").submit();
	}
</script>
</head>
<%@ include file="/inc/header.jsp"%>
<body>
	<section class="menu-area section-gap" id="coffee">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-77 col-md-8">
					<h2 class="mb-30">Franchisee Regist</h2>
					<form name="franchisee-form">
						<input type="hidden" name="member_id" value="<%=client.getMember_id() %>">
						<div class="mt-10">
							<input type="text" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input"
							value="<%=client.getName()%>">
						</div>
						<div class="col-lg-3 col-md-4 mt-sm-30">
							<div class="single-element-widget">
								<div class="switch-wrap d-flex justify-content-between">
										<p class="mb-30">점포유무</p>
										<div class="primary-switch">
											<input type="checkbox" id="default-switch">
											<label for="default-switch"></label>
										</div>
								</div>
							</div>
						</div>

						<div class="mt-10" id="addr_div" style="display:none">
							<input type="text" name="addr" placeholder="Address..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address...'" required class="single-input">
						</div>
						<div  class="col-75">
						  <select name="local">
							<option value="경기" >경기</option>
							<option value="서울" >서울</option>
							<option value="강원" >강원</option>
							<option value="충남" >충남</option>
							<option value="충북" >충북</option>
							<option value="전남" >전남</option>
							<option value="전북" >전북</option>
							<option value="경남" >경남</option>
							<option value="경북" >경북</option>
							<option value="제주" >제주</option>
							</select>
						</div>
						<div class="mt-10">
							<input type="text" name="f_name" placeholder="Franchisee Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Franchisee Name'" required class="single-input">
						</div>
						<div class="mt-10">
							<textarea class="single-textarea" name="message" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'" required></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-77 col-md-8">
				<a id="bt-regist" class="genric-btn primary-border circle">Regist</a>
				<a href="/index.jsp" class="genric-btn primary-border circle">Cancel</a>
			</div>
		</div>
		<%@ include file="/inc/footer.jsp" %>
		</section>
</body>
</html>