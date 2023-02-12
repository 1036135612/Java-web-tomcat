package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection dbconn = null;
   
    public void init() {
       
    	String driver = "com.mysql.cj.jdbc.Driver";
		String dburl = "jdbc:mysql://127.0.0.1:3306/javaweb?useSSL=false&serverTimezone=UTC";
		String username = "root";
		String password = "root";
		try {
			Class.forName(driver); // ������������
			// �������Ӷ���
			dbconn = DriverManager.getConnection(dburl, username, password);
		} catch (ClassNotFoundException e1) {
			System.out.println(e1);
			getServletContext().log("�����������Ҳ�����");
		} catch (SQLException e2) {
			System.out.println(e2);
		}
		  
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user = new String(request.getParameter("name").getBytes("iso-8859-1"), "UTF-8");
		String pwd = new String(request.getParameter("word").getBytes("iso-8859-1"), "UTF-8");
		
		
		
		     String result = "";
		try { 
			  
		      String sql = "INSERT INTO dl VALUES(?,?)";
			  
			  
			  PreparedStatement pstmt = dbconn.prepareStatement(sql);
			  
			  pstmt.setString(1, user);
			  pstmt.setString(2, pwd);
			  
			  int n = pstmt.executeUpdate();
			  
			  if (n == 1)
				{
					result = "�ɹ�����һ����¼";

				} else
				{
					result = "�����¼ʧ��";
				}
				request.setAttribute("result", result);
				request.getRequestDispatcher("%E6%B3%A8%E5%86%8C.jsp").forward(request, response);

			} catch (SQLException e)
			{
				result = "��������";
				request.setAttribute("result", result);
				request.getRequestDispatcher("%E6%B3%A8%E5%86%8C.jsp").forward(request, response);
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
