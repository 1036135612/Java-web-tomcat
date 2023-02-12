<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.demo.Product" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="cn"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<link rel="stylesheet" href="./留言_files/layui.css">
<link rel="stylesheet" href="./留言_files/global.css">
<link rel="stylesheet" href="./留言_files/main.css">
<script src="./留言_files/hm.js.下载"></script><script src="./留言_files/layui.js.下载" type="text/javascript"></script><script type="text/javascript">
</script><link id="layuicss-laydate" rel="stylesheet" href="./留言_files/laydate.css" media="all"><link id="layuicss-layer" rel="stylesheet" href="./留言_files/layer.css" media="all"></head>
<body> <!-- 首页导航 --> 
<div class="layui-kong"></div> 
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8 content detail">
   
      <div class="fly-panel detail-box">
 <div id="header" style="display:inline-block;"><%@ include file="/头部.jsp"%></div>
 <%    
       Connection dbconn = null;
        
        String driver = "com.mysql.cj.jdbc.Driver";
		String dburl = "jdbc:mysql://127.0.0.1:3306/javaweb?useSSL=false&serverTimezone=UTC";
		String username = "root";
		String password = "root";
		try {
			Class.forName(driver); // 加载驱动程序
			// 创建连接对象
			dbconn = DriverManager.getConnection(dburl, username, password);
		} catch (ClassNotFoundException e1) {
			System.out.println(e1);
			getServletContext().log("驱动程序类找不到！");
		} 
   %>  
   <% 
        
response.setContentType("text/html;charset=UTF-8");
		ArrayList<Product> productList = null;
		productList = new ArrayList<Product>();
		String productid = request.getParameter("productid");
		     try { 
				  
			      String sql = "SELECT * FROM fb Where bt=? ";
				  
			        PreparedStatement pstmt = dbconn.prepareStatement(sql);
			        pstmt.setString(1, productid);
					ResultSet rs = pstmt.executeQuery();
				 while (rs.next())
				{
					Product product = new Product();
					product.setbt(rs.getString("bt"));
					product.setnr(rs.getString("nr"));
				    product.setsj(rs.getString("sj"));
				    productList.add(product);
				  
				}
				 if (!productList.isEmpty())
					{
						request.getSession().setAttribute("productList", productList);
						//response.sendRedirect("http://127.0.0.1:8080/Javaweb/%E7%BD%91%E9%A1%B5.jsp");
					} else
					{
						response.sendRedirect("http://127.0.0.1:8080/Javaweb/%E9%A6%96%E9%A1%B5.jsp");
					}

				} catch (SQLException e)
				{
					
					e.printStackTrace();
				}
         
			try {
				dbconn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
        
%>
                          
 
     <c:forEach var="product" items="${productList}">    
      <h1>${product.bt}</h1>
      </c:forEach>  
        <div class="detail-about">
          <a class="fly-avatars" ref="nofllow" >
            <img src="./留言_files/avatar.gif" alt="设计流">
          </a>
          <div class="fly-detail-user">
          
            <a  class="fly-link" ref="nofllow">
             
   
           </a>
          </div>
         <div class="fly-detail-user"> <a  class="fly-link" ref="nofllow"></a></div>           
        </div> 
     <div class="detail-body photos">
       <c:forEach var="product" items="${productList}">      
       <p>${product.nr}</p>    
       </c:forEach>  
     </div>
       <c:forEach var="product" items="${productList}">    
       <p>${product.sj}</p>   
       </c:forEach>     
      </div>
    
      
     
    </div>


    
  </div>
</div>
<div id="bdtts_div_id">

</div>

 <!-- 公共底部 --> 
﻿<%@ include file="/尾部.jsp"%>

 <script>
layui.use(['jquery', 'layer'], function(){ 
  var $ = layui.$ //重点处
  ,layer = layui.layer;
  var tips;
  $(".link-tips").hover(function () { 
      tips = layer.tips($(this).attr("title"), $(this),{
         tips: [1, '#555555']
         // 上右下左四个方向，通过1-4进行方向设定
     });
     
 },function(){
 	layer.close(tips);
 }); $(".lazy").each(function(){
 $(this).attr("src",$(this).attr("data-original"))
 })
});
</script>



</body></html>