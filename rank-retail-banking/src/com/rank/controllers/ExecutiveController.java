package com.rank.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.rank.beans.Account;
import com.rank.beans.Combined;
import com.rank.beans.Customer;
import com.rank.services.AccountService;
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
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}

		String action = "";
		action = (String) request.getParameter("action");

		switch (action) {
		case "createCustomer":
			rd = request.getRequestDispatcher("executiveJSPs/createCustomer.jsp");
			rd.forward(request, response);
			break;

		case "updateCustomer":
			rd = request.getRequestDispatcher("executiveJSPs/updateCustomer.jsp");
			rd.forward(request, response);
			break;

		case "deleteCustomer":
			rd = request.getRequestDispatcher("executiveJSPs/deleteCustomer.jsp");
			rd.forward(request, response);
			break;

		case "createAccount":
			rd = request.getRequestDispatcher("executiveJSPs/createAccount.jsp");
			rd.forward(request, response);
			break;

		case "deleteAccount":
			rd = request.getRequestDispatcher("executiveJSPs/deleteAccount.jsp");
			rd.forward(request, response);
			break;

		case "viewCustomer":
			rd = request.getRequestDispatcher("executiveJSPs/viewCustomer.jsp");
			rd.forward(request, response);
			break;

		case "customerStatus":
			try {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int recordsPerPage = 5;
				List<Customer> customers = null;
				customers = (List<Customer>) CustomerService.getCustomers(currentPage, recordsPerPage);
				response.setContentType("text/html;charset=UTF-8");
				request.setAttribute("customers", customers);
				int rows = 0;
				rows = CustomerService.getNoOfRows("customer");
				int pages = rows / recordsPerPage;
				if (rows % recordsPerPage > 0)
					pages++;
				request.setAttribute("pages", pages);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordsPerPage", recordsPerPage);
				rd = request.getRequestDispatcher("executiveJSPs/viewCustomerStatus.jsp");
				rd.forward(request, response);

			} catch (Exception e) {

			}
			break;

		case "accountStatus":
			try {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int recordsPerPage = 5;
				List<Account> accounts = null;
				accounts = (List<Account>) AccountService.getAllAccounts(currentPage, recordsPerPage);
				response.setContentType("text/html;charset=UTF-8");
				request.setAttribute("accounts", accounts);
				int rows = 0;
				rows = CustomerService.getNoOfRows("account");
				int pages = rows / recordsPerPage;
				if (rows % recordsPerPage > 0)
					pages++;
				request.setAttribute("pages", pages);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordsPerPage", recordsPerPage);
				rd = request.getRequestDispatcher("executiveJSPs/viewAccountStatus.jsp");
				rd.forward(request, response);

			} catch (Exception e) {

			}
			break;

		case "about":
			rd = request.getRequestDispatcher("about.jsp");
			rd.forward(request, response);
			break;

		default:
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		RequestDispatcher rd;
		switch (action) {
		case "createCustomer":
			try {
				String name = (String) request.getParameter("name");
				int ssn = Integer.parseInt(request.getParameter("ssn"));
				String dob = (String) request.getParameter("dob");
				String address = (String) request.getParameter("address");
				LocalDate date;
				date = (LocalDate) DateTime.returnDate(dob);
				short age = (short) Period.between(date, LocalDate.now()).getYears();
				Customer customer = new Customer(ssn, name, address, "CUSTOMER CREATED SUCCESSFULLY", dob, "Active",
						age);
				String custId = CustomerService.createCustomer(customer);
				if (custId != null) {
					response.setContentType("text/plain");
					response.getWriter().write(custId);
				} else {
					response.getWriter().write("failed");
				}
			} catch (Exception e) {
			}
			break;

		case "updateCustomer":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {

					Long id = Long.parseLong(request.getParameter("customerId"));
					Customer customer = null;

					customer = CustomerService.getCustomer(id);
					response.setContentType("application/json");
					if (customer.getId() != 0) {
						String customerJson = this.gson.toJson(customer);
						response.getWriter().print(customerJson);
					} else {
						response.getWriter().print("{}");
					}

				} else {

					String name = (String) request.getParameter("name");
					String address = (String) request.getParameter("address");
					String dob = (String) request.getParameter("dob");
					LocalDate date = (LocalDate) DateTime.returnDate(dob);
					short age = (short) Period.between(date, LocalDate.now()).getYears();
					long id = Long.parseLong(request.getParameter("id"));
					Customer updateCustomer = new Customer();
					updateCustomer.setAddress(address);
					updateCustomer.setDob(dob);
					updateCustomer.setAge(age);
					updateCustomer.setId(id);
					updateCustomer.setName(name);
					response.setContentType("text/plain");
					if (CustomerService.updateCustomer(updateCustomer)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}

				}
			} catch (Exception e) {
			}
			break;

		case "deleteCustomer":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {

					Long id = Long.parseLong(request.getParameter("customerId"));
					Customer customer = null;

					customer = CustomerService.getCustomer(id);
					response.setContentType("application/json");
					if (customer.getId() != 0) {
						String customerJson = this.gson.toJson(customer);
						response.getWriter().print(customerJson);
					} else {
						response.getWriter().print("{}");
					}

				} else {

					Long id = Long.parseLong(request.getParameter("id"));
					response.setContentType("text/plain");
					if (CustomerService.deleteCustomer(id)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}

				}
			} catch (Exception e) {
			}
			break;

		case "createAccount":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("check")) {
					Long id = Long.parseLong(request.getParameter("customerId"));
					response.setContentType("text/plain");
					if (CustomerService.isCustomer(id)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				} else {
					Long id = Long.parseLong(request.getParameter("id"));
					String accountType = (String) request.getParameter("accountType").toUpperCase();
					Long amount = Long.parseLong(request.getParameter("amount"));
					Account account = new Account(id, amount, accountType);
					String accountNumber = CustomerService.createAccount(account);
					if (accountNumber != null) {
						response.setContentType("text/plain");
						response.getWriter().write(accountNumber);
					} else {
						response.getWriter().write("failed");
					}
				}
			} catch (Exception e) {
			}
			break;

		case "deleteAccount":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {
					Long accountId = Long.parseLong(request.getParameter("accountId"));
					Combined account = CustomerService.getAccount(accountId);
					response.setContentType("application/json");
					if (account != null) {
						String customerJson = this.gson.toJson(account);
						response.getWriter().print(customerJson);
					} else {
						response.getWriter().print("{}");
					}
				} else {
					Long id = Long.parseLong(request.getParameter("id"));
					response.setContentType("text/plain");
					if (CustomerService.deleteAccount(id)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				}
			} catch (Exception e) {
			}
			break;

		case "viewCustomer":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {
					String basedOn = (String) request.getParameter("basedOn");
					Long id = Long.parseLong(request.getParameter("id"));
					Customer customer = null;
					customer = CustomerService.getCustomerBasedOn(basedOn, id);
					response.setContentType("application/json");
					if (customer.getId() != 0) {
						String customerJson = this.gson.toJson(customer);
						response.getWriter().print(customerJson);
					} else {
						response.getWriter().print("{}");
					}
				}

			} catch (Exception e) {
			}
			break;

		default:
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}

	}

}
