<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Note/css/index.css">
</head>
<body>

<div class="ct">
<h2>刻录.属于你的美好</h2>
  <form method="post" action="/Note/LoginServlet" >
    <input class="form-grup" type="text" name="username" placeholder="姓名*">
    <input class="form-grup" type="password" name="password" placeholder="密码*">
    <button class="submit">登录</button>
    <a class="submit" href="pages/Register.jsp">注册</a>
  </form>
</div>

</body>
</html>