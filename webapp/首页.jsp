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
<link rel="stylesheet" href="./站内问题库列表 - 问答小屋_files/layui.css">
<link rel="stylesheet" href="./站内问题库列表 - 问答小屋_files/global.css">
<link rel="stylesheet" href="./站内问题库列表 - 问答小屋_files/main.css">
</head>
<body>
<div id="header" style="display:inline-block;"><%@ include file="/头部.jsp"%></div>
<div style="background: #fff;padding:10px;margin-bottom:15px;">
<font color=red>${result}</font>
</div>
<script>
layui.use(['jquery', 'layer'], function(){

  var $ = layui.$ //重点处
  ,layer = layui.layer;
   $("#searchbox").click(function(){
   var _word=$.trim($("#thesearchword").val());
   if(_word==''){
   layer.msg("搜索关键词不能为空");
return false;
   }
window.location.href=""+"?word="+_word;
   return false;
  })
});
</script> <!-- 首页导航 --> 
<div class="layui-kong"></div><div class="layui-container">
  <div class="nav_breadcrumb">
     <span class="layui-breadcrumb layuilig" style="visibility: visible;">
  <a href="">首页</a><span >/</span>

    
</span>
    </div>
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">

      <div class="fly-panel" style="margin-bottom: 0;">
        
        <div class="fly-panel-title fly-filter">
          <a href="">全部</a>
          <span class="fly-mid"></span>
          <a href="">未结</a>
          <span class="fly-mid"></span>
          <a href="">已结</a>
        
      
          
        </div>
 <!-- 最新问答列表 --> 
 
      
  <ul class="fly-list"> 
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
		     try { 
				  
			      String sql = "SELECT * FROM fb iat GROUP BY sj desc";
				  
			        PreparedStatement pstmt = dbconn.prepareStatement(sql);
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
          <li>
            <a href="" rel="nofollow" class="fly-avatar">
              <img src="./站内问题库列表 - 问答小屋_files/avatar.gif" >
            </a>
            <h2>
              <a href="留言.jsp?productid=${product.bt}">${product.bt}</a>
            </h2>
            <div class="fly-list-info">
              <a href="" rel="nofollow">
                ${product.nr}
              </a>
              <span>${product.sj}</span>
             
                                         
            </div>
          </li>
         </c:forEach>     
        </ul>
    
  </div>
</div>
</div> 
 <!-- 公共底部 --> 

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

<script src="" type="text/javascript"></script> 

<ul class="layui-fixbar"><li class="layui-icon layui-fixbar-top"  style="background-color: rgb(0, 150, 136); display: none;"></li></ul>
</div>
<%@ include file="/尾部.jsp"%>
</body>

</html>
