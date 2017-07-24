<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	
	if(session.getAttribute("user") == null) {
		request.getRequestDispatcher("../index.jsp").forward(request, response);
	}

%>