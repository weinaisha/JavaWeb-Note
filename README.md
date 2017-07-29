# JavaWeb-Note（个人学习作品）

* 基于mvc模式实现笔记管理 所用技术：Servlet+Jsp+JavaBean
* 登录：实现登录、注册 2.实现笔记的增、删、改、查，分类
* 采用JDBC数据库访问技术，链接和MySQl数据库之间的通信
* Jsp实现视图层、Servlet实现控制层，接受用户的输入并调用模型和视图完成用户请求
* 以注册为例说明编程逻辑：（view层）用户提交注册表单，通过action属性转到registerServlet（注册控制器），（control层）通过request.getParameter( )方法获取注册信息并存到JavaBean（user类），（model层）调用insertUser( )方法使用MySQL语句把用户注册信息通过与数据库通信对象connection写入数据库
