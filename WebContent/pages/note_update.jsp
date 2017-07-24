<%@ page language="java" import="java.sql.*,java.util.*,bean.*,dao.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="safe.jsp" %>
    
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
	<link rel="stylesheet" type="text/css" href="/Note/css/note_publish.css">
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<body>
 <div class="sidebar">
  <h3>我的笔记</h3>
  <a href="/Note/pages/note_manage.jsp">管理笔记</a>
 
    <ul>
    <h3>笔记类型</h3>
       <li>
      	<a href="/Note/ColumnGetInfoServlet?type=css">CSS</a>
      </li>
      <li>
      <a href="/Note/ColumnGetInfoServlet?type=javascript">JAVASCRIPT</a>
      </li>
      <li>
      	 <a href="/Note/ColumnGetInfoServlet?type=HTML5">HTML5</a>
      </li>
    </ul>
  </div>
  <div class="article-main">
		<%
			if(flag) {
		%>
		<h1 align="center">修改成功</h1>
		<%
			} else {
		%>
		<main>
      <form action="../UpdateServlet"  method="post" >
      	  <input class="form-group" readonly="readonly"  type="text" name="id" value=<%=note.getId()%>>
          <input class="form-group"  type="text" name="title" value=<%=note.getTitle()%>>
          <label>文章类型</label>
          <select name="type" class="form-group">
			<option value="css" <%=note.getType().equals("css")?"selected" : "" %>>css</option>
			<option value="javascript" <%=note.getType().equals("javascript")?"selected" : "" %>>javascript</option>
			<option value="HTML5" <%=note.getType().equals("HTML5")?"selected" : "" %>>HTML5</option>
		  </select>
          <input class="form-group"  type="text" name="publishTime" value=<%=note.getPublishTime()%>>
        <div>
          <input class="submit" type="submit" name="submit" value="修改">
        </div>
        <div>
          <textarea id="ckeditor" name="content" cols="75" rows="20"><%=note.getContent() %></textarea>
          <script type="text/javascript">
						CKEDITOR.replace('content',{
							width:1000,
							height:700
						});
		  </script>
        </div>
      </form>
    </main>
		<%
			}
		%>
  </div>		
</body>
</html> 