package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class release
 */
@WebServlet("/release")
public class release extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection dbconn = null;
	//Statement stmt = null; 
	
    public void init() {
       
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
		} catch (SQLException e2) {
			System.out.println(e2);
		}
		  
    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String bt = new String(request.getParameter("bt").getBytes("iso-8859-1"), "UTF-8");
		String nr = new String(request.getParameter("nr").getBytes("iso-8859-1"), "UTF-8");
		
		Date dd = new Date();
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sj = sim.format(dd);
		
		     String result = "";
		try { 
			  
		      String sql = "INSERT INTO fb VALUES(?,?,?)";
			  
			  
			  PreparedStatement pstmt = dbconn.prepareStatement(sql);
			 
			  pstmt.setString(1, bt);
			  pstmt.setString(2, nr);
			  pstmt.setString(3, sj);
			  
			  int n = pstmt.executeUpdate();
			  
			  if (n == 1)
				{
					result = "成功插入一条记录";
					//out.println("成功插入一条记录");

				} else
				{
					result = "插入记录失败";
					out.println("插入记录失败");
				}
				request.setAttribute("result", result);
				request.getRequestDispatcher("%E5%8F%91%E5%B8%83%E9%97%AE%E9%A2%98.jsp").forward(request, response);

			} catch (SQLException e)
			{
				result = "发生错误";
				request.setAttribute("result", result);
				request.getRequestDispatcher("/release").forward(request, response);
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
