package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connect.DBconnection;

/**
 * Servlet implementation class deleteBook
 */
@WebServlet("/deleteBook")
public class deleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String pk = request.getParameter("pk");
		
		if(pk != null)
		{
			try {
				
			Connection conn =	DBconnection.getDBConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM `book` WHERE `BookId`=?");
			ps.setString(1, pk);
			ps.executeUpdate();
			
			response.sendRedirect("/Ecommerce/AdminBook/displayBook.jsp");
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

}
