package com.rank.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rank.beans.User;
import com.rank.services.Login;

/**
 * User Login and Logout controller
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=(String)request.getParameter("userName");
		String password=(String)request.getParameter("password");
		User newUser=new User(userName,password);
		Login userLogin=new Login();
		String workGroup;
		try {
			workGroup = userLogin.isValidUser(newUser);
			if(workGroup!=null)
			{	HttpSession session=request.getSession();
				session.setAttribute("workGroup", workGroup);
				response.sendRedirect("Dashboard.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
