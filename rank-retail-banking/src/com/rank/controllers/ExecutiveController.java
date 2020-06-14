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

import com.google.gson.Gson;
import com.rank.beans.Customer;
import com.rank.services.CustomerService;
import com.rank.util.DateTime;

/**
 * Servlet implementation class ExecutiveController
 */
@WebServlet("/ExecutiveController")
public class ExecutiveController extends HttpServlet {
	private Gson gson = new Gson();
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if (userName == null)
			response.sendRedirect("index.jsp");
		String action = "";
		action = (String) request.getParameter("action");

		switch (action) {
		case "createCustomer":
			response.sendRedirect("executiveJSPs/createCustomer.jsp");
			break;
		case "updateCustomer":
			response.sendRedirect("executiveJSPs/updateCustomer.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = (String) request.getParameter("action");

		switch (action) {
		case "createCustomer":
			String name = (String) request.getParameter("name");
			int ssn = Integer.parseInt(request.getParameter("ssn"));
			String dob = (String) request.getParameter("dob");
			String address = (String) request.getParameter("address");
			LocalDate date;
			try {
				date = (LocalDate) DateTime.returnDate(dob);
				short age = (short) Period.between(date, LocalDate.now()).getYears();
				Customer customer = new Customer(ssn, name, address, "CUSTOMER CREATED SUCCESSFULLY", dob, "Active",
						age);
				String custId=CustomerService.createCustomer(customer);
				if (custId!=null) {
					response.setContentType("text/plain");
					response.getWriter().write(custId);
				} else {
					response.getWriter().write("failed");
				}
			} catch (Exception e) {
			}
			break;
		case "updateCustomer":
			String type = (String) request.getParameter("actionType");
			if (type.contentEquals("fetch")) {
				Long id = Long.parseLong(request.getParameter("customerId"));
				Customer customer = null;
				try {
					customer = CustomerService.getCustomer(id);

					response.setContentType("application/json");
					if (customer.getId() != 0) {
						String customerJson = this.gson.toJson(customer);
						response.getWriter().print(customerJson);
					} else {
						response.getWriter().print("{}");
					}
				} catch (Exception e) {
				}
			} else {
				String name1 = (String) request.getParameter("name");
				String address1 = (String) request.getParameter("address");
				short age1 = Short.parseShort(request.getParameter("age"));
				long id1 = Long.parseLong(request.getParameter("id"));
				Customer updateCustomer = new Customer();
				updateCustomer.setAddress(address1);
				updateCustomer.setAge(age1);
				updateCustomer.setId(id1);
				updateCustomer.setName(name1);
				try {
					response.setContentType("text/plain");
					if (CustomerService.updateCustomer(updateCustomer)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}

				} catch (Exception e) {
				}

			}

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
