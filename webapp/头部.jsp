<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <body>
  <div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="http://127.0.0.1:8080/Javaweb/%E9%A6%96%E9%A1%B5.jsp">
      <img src="./站内问题库列表 - 问答小屋_files/logo.jpg" alt="问答小屋" style="width:130px;height:30px;">
    </a>
    <ul class="layui-nav fly-nav layui-hide-xs">
      
    </ul>
    
     <ul class="layui-nav fly-nav-user">
      <li class="layui-nav-item">
        <a href="http://127.0.0.1:8080/Javaweb/%E6%B3%A8%E5%86%8C%E7%99%BB%E5%BD%95.jsp">登入</a>
      </li>
      <% 
         Object user = session.getAttribute("s");
        if ( user=="1" ){ %>
      <li class="layui-nav-item">
        <a href="http://127.0.0.1:8080/Javaweb/%E5%8F%91%E5%B8%83%E9%97%AE%E9%A2%98.jsp">发布问题</a>
      </li>
      <% }%>
      </ul>         
  </div>
</div>
</body>