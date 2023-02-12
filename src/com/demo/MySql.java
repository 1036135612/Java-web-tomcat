package com.demo;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet("/select")
public class MySql extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	Connection dbconn = null;

	public void init()
	{
		String driver = "com.mysql.cj.jdbc.Driver";
		String dburl = "jdbc:mysql://127.0.0.1:3306/javaweb?useSSL=false&serverTimezone=UTC";
		String username = "root";
		String password = "root";
		try
		{
			Class.forName(driver); // 加载驱动程序
			// 创建连接对象
			dbconn = DriverManager.getConnection(dburl, username, password);
		} catch (ClassNotFoundException e1)
		{
			System.out.println(e1);
			getServletContext().log("驱动程序类找不到！");
		} catch (SQLException e2)
		{
			System.out.println(e2);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 // 设置响应的内容类型
	       response.setContentType("text/html;charset=UTF-8");
	       // 获取一个打印输出流对象
     // PrintWriter out = response.getWriter();
      String name = new String(request.getParameter("username").getBytes("iso-8859-1"), "UTF-8");
      String word = new String(request.getParameter("password").getBytes("iso-8859-1"), "UTF-8");
    
      //ServletContext application = this.getServletContext();
     // HttpSession session = request.getSession(true);
         String r = "";
         Object s ="" ;
		try
		{
			String sql = "select * from dl where user=? and pwd=? ";
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, word);
		    ResultSet result = pstmt.executeQuery();
			if (result.next())
			{
				s="1";
				r = "登录成功！！";
				request.getSession().setAttribute("s", s);
				
			} 
			else
			{
				r = "登录失败！！";
				
			}
			
			request.setAttribute("result", r);
			request.getRequestDispatcher("首页.jsp").forward(request, response);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	      

		
    }
	
	public void destroy() {
		try {
			dbconn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
}