package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;


@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	UsersDAO usersDAO = new UsersDAO();
  
    public CheckEmailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 try {
			if (UsersDAO.checkEmail(request.getParameter("username"))) {
			      response.getWriter().write("<img src=\"img/not-available.png\" />");
			 } else {
			      response.getWriter().write("<img src=\"img/available.png\" />");
			 }
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
