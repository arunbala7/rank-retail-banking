package com.rank.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rank.beans.Customer;
import com.rank.services.CustomerService;
import com.rank.util.DateTime;

/**
 * Servlet implementation class ExecutiveController
 */
@WebServlet("/ExecutiveController")
public class ExecutiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName=(String)session.getAttribute("userName");
		if(userName==null) response.sendRedirect("index.jsp");
		String action="";
		action=(String)request.getParameter("action");
		
		switch (action) {
		case "createCustomer":
			response.sendRedirect("executiveJSPs/createCustomer.jsp");
			break;
		case "updateCustomer":
			
			break;
		case "deleteCustomer":
			
			break;
		case "customerStatus":
			
			break;
		case "createAccount":
			
			break;
		case "deleteAccount":
			
			break;
		case "viewAccounts":
			
			break;
		case "viewCustomers":
			
			break;
		default:
			response.sendRedirect("Dashboard.jsp");
		}
		
	}
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action=(String)request.getParameter("action");
			
			switch (action) {
			case "createCustomer":
				String name=(String)request.getParameter("name");
				int ssn=Integer.parseInt(request.getParameter("ssn"));
				String dob=(String)request.getParameter("dob");
				String address=(String)request.getParameter("address");
				LocalDate date;
				try {
					date = (LocalDate)DateTime.returnDate(dob);
					short age= (short) Period.between(date, LocalDate.now()).getYears();
					Customer customer=new Customer(ssn,name,address,"Customer Created Successfully",dob,"Active",age);
					System.out.println(customer.toString());
					if(CustomerService.createCustomer(customer)) {
					response.setContentType("text/plain");
					response.getWriter().write("success");
					}
					}
				 catch (Exception e) {}					
				break;
			case "updateCustomer":
				
				break;
			case "deleteCustomer":
				
				break;
			case "customerStatus":
				
				break;
			case "createAccount":
				
				break;
			case "deleteAccount":
				
				break;
			case "viewAccounts":
				
				break;
			case "viewCustomers":
				
				break;
			default:
				response.sendRedirect("Dashboard.jsp");
			}
			
		}

}
