<%@ page language="java" import="java.sql.*,java.util.*,bean.*,dao.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	boolean flag = false;
	try {
		flag = (Boolean)request.getAttribute("flag");
	} catch(Exception e) {		
	}
	int id = Integer.parseInt(request.getParameter("id"));
	NoteDao nd = new NoteDao();
	ResultSet rs = nd.selectNoteById(id);
	Note note = new Note();
	try {
		while(rs.next()) {
			note.setId(rs.getInt("id"));
			note.setTitle(rs.getString("title"));
			note.setType(rs.getString("type"));
			note.setPublishTime(rs.getDate("publishTime"));
			note.setContent(rs.getString("content"));
		}	
	} catch (SQLException e) {
		e.printStackTrace();
	}
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
			<ul>
				<li><h1><%=note.getTitle() %></h1></li>
				<li>
				<span>类型：</span><%=note.getType() %>
				<a href="/Note/pages/note_update.jsp?id=<%=note.getId() %>">修改</a>
				<a href="/Note/DeleteServlet?id=<%=note.getId() %>">删除</a>
				</li>
			</ul>
	<p><%=note.getContent() %></p>		
	</div>
  </div>
</body>
</html>