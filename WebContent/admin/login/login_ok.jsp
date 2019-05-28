<%@page import="com.coffee.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	Member admin=(Member)session.getAttribute("admin");
	response.sendRedirect("/admin/member/list");
%>