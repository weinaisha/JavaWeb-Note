<%@ page language="java" import="java.sql.*,java.util.*,bean.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ include file="safe.jsp" %>
    
<%
	boolean flag = false;
	try {
		flag = (Boolean)request.getAttribute("flag");
	} catch(Exception e) {
		
	}
	if(!flag) {
		request.getRequestDispatcher("../NoteManageServlet").forward(request, response);
	}
	
	ResultSet result = (ResultSet)request.getAttribute("result");
	
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/Note/css/note_manage.css">
	<title>新闻发布</title>
</head>
<body>
  <div class="ct">
  <h2>刻录.笔记管理</h2>
	<ul class="nav">
		<li><a href="/Note/pages/note_publish.jsp">新建笔记</a></li>
		
	</ul>
	<div class="main">
	  <div class="logo"></div>
				<%
					while(result.next()) {
				%>
			<ul>
			    <li><span>Id：</span><%=result.getInt("id") %>>></li>
				<li><span>标题：</span><%=result.getString("title") %>>></li>
				<li><span>类型：</span><%=result.getString("type") %>>></li>
				<li><a href="/Note/pages/show_note.jsp?id=<%=result.getInt("id") %>">查看</a></li>
				<li><a href="/Note/pages/note_update.jsp?id=<%=result.getInt("id") %>">修改</a></li>
				<li><a href="/Note/DeleteServlet?id=<%=result.getInt("id") %>">删除</a></li>
			</ul>
				<%
					}
				%>
	</div>
  </div>
</body>
</html>