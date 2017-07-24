<%@ page language="java" import="java.sql.*,java.util.*,bean.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	boolean flag = false;
	try {
		flag = (Boolean)request.getAttribute("flag");
	} catch(Exception e) {
		
	}
	if(!flag) {
		request.getRequestDispatcher("../ColumnGetInfoServlet").forward(request, response);
	}
	
	ResultSet result = (ResultSet)request.getAttribute("result");
	
%>
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/Note/css/note_manage.css">
	<style>
	 .main li{
	 display:block;
	 }
	 .main h1{
	 color:#fff;
	 }
	</style>
</head>
<body>
<div class="ct">
  <h2>刻录.笔记管理</h2>
	<ul class="nav">
		<li><a href="/Note/pages/note_publish.jsp">新建笔记</a></li>
	</ul>
	<div class="main">
	<%
					while(result.next()) {
				%>
			<ul>
				<li><h1><%=result.getString("title") %></h1></li>
				<li>
				<span>类型：</span><%=result.getString("title")%>
				<a href="/Note/pages/note_update.jsp?id=<%=result.getInt("id") %>">修改</a>
				<a href="/Note/DeleteServlet?id=<%=result.getInt("id") %>">删除</a>
				</li>
			</ul>
			<%
					}
				%>	
	</div>
  </div>
</body>
</html>