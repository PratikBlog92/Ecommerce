package com.admin;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connect.DBconnection;


/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//4. update data from db
		String bname =  request.getParameter("bname");
		String author =  request.getParameter("author");
		String price =  request.getParameter("price");
		String quant =  request.getParameter("quant");
		//
		String BookId =  request.getParameter("BookId");
		
		Connection co =  DBconnection.getDBConnection();
		try {
			PreparedStatement  ps = co.prepareStatement("UPDATE `book` SET `BookId`=?,`book_name`=?,`author`=?,`price`=?,`quantity`=? WHERE `BookId`=?");
			ps.setString(1, BookId);
			ps.setString(2, bname);
			ps.setString(3, author);
			ps.setString(4, price);
			ps.setString(5, quant);
			ps.setString(6, BookId);
			ps.executeUpdate();
			
			//return to display.jsp
			response.sendRedirect("/Ecommerce/AdminBook/displayBook.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
