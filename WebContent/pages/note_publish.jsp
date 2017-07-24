<%@ page language="java" import="java.sql.*,java.util.*,bean.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="safe.jsp" %>
    
<%
	
	boolean flag = false;
	try {
		flag = (Boolean)request.getAttribute("flag");
	} catch(Exception e) {
		
	}
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/Note/css/note_publish.css">
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<title>新建笔记</title>
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
		<h1>发布成功</h1>
		<%
			} else {
		%>
		<main>
      <form action="../PublishServlet"  method="post" >
          <input class="form-group"  type="text" name="title" placeholder="文章标题*">
          <label>文章类型</label>
          <select name="type" class="form-group">
			<option value="css">css</option>
			<option value="javascript">javascript</option>
			<option value="HTML5">HTML5</option>
		  </select>
          <input class="form-group"  type="text" name="publishTime" placeholder="发布时间*">
        <div>
          <input class="submit" type="submit" name="submit" value="发布">
        </div>
        <div>
          <textarea id="ckeditor" name="content" cols="75" rows="20"></textarea>
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