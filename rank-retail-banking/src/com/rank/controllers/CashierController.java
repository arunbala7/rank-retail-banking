package com.rank.controllers;

import java.io.IOException;
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
import com.rank.beans.Transaction;
import com.rank.services.AccountService;
import com.rank.services.CustomerService;

@WebServlet("/CashierController")
public class CashierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if (userName == null)
			response.sendRedirect("index.jsp");
		String action = "";
		action = (String) request.getParameter("action");
		RequestDispatcher rd;
		switch (action) {
		case "depositMoney":
			rd = request.getRequestDispatcher("cashierJSPs/depositMoney.jsp");
			rd.forward(request, response);
			break;

		case "withdrawMoney":
			rd = request.getRequestDispatcher("cashierJSPs/withdrawMoney.jsp");
			rd.forward(request, response);
			break;

		case "transferMoney":
			rd = request.getRequestDispatcher("cashierJSPs/transferMoney.jsp");
			rd.forward(request, response);
			break;

		case "printStatement":
			rd = request.getRequestDispatcher("cashierJSPs/printStatement.jsp");
			rd.forward(request, response);
			break;

		case "Accounts":
			rd = request.getRequestDispatcher("cashierJSPs/Accounts.jsp");
			rd.forward(request, response);
			break;
			
		case "about":
			rd = request.getRequestDispatcher("about.jsp");
			rd.forward(request, response);			
			break;

		default:
			response.sendRedirect("Dashboard.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = (String) request.getParameter("action");

		switch (action) {

		case "depositMoney":
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
					Long amount = Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.singleTransaction(id, amount, "DEPOSIT")) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				}
			} catch (Exception e) {
			}
			break;

		case "withdrawMoney":
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
					Long amount = Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.singleTransaction(id, amount, "WITHDRAW")) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				}
			} catch (Exception e) {
			}
			break;

		case "transferMoney":
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
					Long sender = Long.parseLong(request.getParameter("id"));
					Long receiver = Long.parseLong(request.getParameter("receive"));
					Long amount = Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.doubleTransaction(sender, receiver, amount)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				}
			} catch (Exception e) {
			}
			break;

		case "Accounts":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {
					Long id = Long.parseLong(request.getParameter("id"));
					String basedOn = (String) request.getParameter("basedOn");
					response.setContentType("text/plain");
					if (AccountService.isValidId(basedOn, id)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				} else {
					response.setContentType("text/html;charset=UTF-8");
					Long id = Long.parseLong(request.getParameter("id"));
					String basedOn = (String) request.getParameter("basedOn");
					List<Account> accounts = null;
					accounts = AccountService.getAccounts(basedOn, id);
					request.setAttribute("accounts", accounts);
					RequestDispatcher rd = request.getRequestDispatcher("cashierJSPs/viewAccounts.jsp");
					rd.forward(request, response);

				}
			} catch (Exception e) {
			}
			break;

		case "printStatement":
			try {
				String type = (String) request.getParameter("actionType");
				if (type.contentEquals("fetch")) {
					Long accountId = Long.parseLong(request.getParameter("accountId"));
					Combined account = CustomerService.getAccount(accountId);
					response.setContentType("text/plain");
					if (account != null) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}
				} else {	

					String basedOn=(String)request.getParameter("basedOn");
					String start=(String)request.getParameter("start");
					Long accountId=Long.parseLong(request.getParameter("accountId"));
					String end=(String)request.getParameter("end");					
					String count=(String)request.getParameter("number");
					List<Transaction> transactions=null;
					transactions=AccountService.getTransactions(accountId,basedOn,count,start,end);
					response.setContentType("text/html;charset=UTF-8");
					String accountNumber=transactions.get(0).getAccountNumber()+"";
					request.setAttribute("transactions", transactions);
					request.setAttribute("accountNumber", accountNumber);
					RequestDispatcher rd=request.getRequestDispatcher("cashierJSPs/viewTransactions.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
			}
			break;

		default:
			response.sendRedirect("Dashboard.jsp");

		}
	}

}
