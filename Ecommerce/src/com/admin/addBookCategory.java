package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connect.DBconnection;

/**
 * Servlet implementation class addBookCategory
 */
@WebServlet("/addBookCategory")
public class addBookCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBookCategory() {
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
		
String category = request.getParameter("category");
		
		try {
				Connection conn = 	DBconnection.getDBConnection();
				PreparedStatement ps = conn.prepareStatement("INSERT INTO `category`(`category`) VALUES (?)");
				ps.setString(1, category);
				ps.executeUpdate();
				
				//Redirect
				HttpSession session = request.getSession();
				session.setAttribute("store", "sucess");
				
				response.sendRedirect("/Ecommerce/AdminBook/addCategory.jsp");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
