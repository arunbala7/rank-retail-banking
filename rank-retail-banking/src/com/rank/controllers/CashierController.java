package com.rank.controllers;

import java.io.IOException;

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
import com.rank.services.AccountService;
import com.rank.services.CustomerService;

@WebServlet("/CashierController")
public class CashierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if (userName == null)
			response.sendRedirect("index.jsp");
		String action = "";
		action = (String) request.getParameter("action");

		switch (action) {
		case "depositMoney":
			response.sendRedirect("cashierJSPs/depositMoney.jsp");
			break;
			
		case "withdrawMoney":
			response.sendRedirect("cashierJSPs/withdrawMoney.jsp");
			break;
			
		case "transferMoney":
			response.sendRedirect("cashierJSPs/transferMoney.jsp");
			break;
			
		case "printStatement":
			response.sendRedirect("cashierJSPs/printStatement.jsp");
			break;
			
		case "Accounts":
			response.sendRedirect("cashierJSPs/Accounts.jsp");
			break;
			
		default:
			response.sendRedirect("Dashboard.jsp");
		}
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String action = (String) request.getParameter("action");

		switch (action) {
		
		case "depositMoney":
			try {
				String type=(String)request.getParameter("actionType");
				if(type.contentEquals("fetch")) {
				Long accountId=Long.parseLong(request.getParameter("accountId"));
				Combined account = CustomerService.getAccount(accountId);
				response.setContentType("application/json");
				if (account != null) {
					String customerJson = this.gson.toJson(account);
					response.getWriter().print(customerJson);
				} else {
					response.getWriter().print("{}");
				}
				}				
				else {
					Long id=Long.parseLong(request.getParameter("id"));
					Long amount=Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.singleTransaction(id,amount,"DEPOSIT")) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}										
				}
			} catch (Exception e) {}
			break;
			
			
		case "withdrawMoney":
			try {
				String type=(String)request.getParameter("actionType");
				if(type.contentEquals("fetch")) {
				Long accountId=Long.parseLong(request.getParameter("accountId"));
				Combined account = CustomerService.getAccount(accountId);
				response.setContentType("application/json");
				if (account != null) {
					String customerJson = this.gson.toJson(account);
					response.getWriter().print(customerJson);
				} else {
					response.getWriter().print("{}");
				}
				}				
				else {
					Long id=Long.parseLong(request.getParameter("id"));
					Long amount=Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.singleTransaction(id,amount,"WITHDRAW")) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}										
				}
			} catch (Exception e) {}
			break;
			
			
		case "transferMoney":
			try {
				String type=(String)request.getParameter("actionType");
				if(type.contentEquals("fetch")) {
				Long accountId=Long.parseLong(request.getParameter("accountId"));
				Combined account = CustomerService.getAccount(accountId);
				response.setContentType("application/json");
				if (account != null) {
					String customerJson = this.gson.toJson(account);
					response.getWriter().print(customerJson);
				} else {
					response.getWriter().print("{}");
				}
				}				
				else {
					Long sender=Long.parseLong(request.getParameter("id"));
					Long receiver=Long.parseLong(request.getParameter("receive"));
					Long amount=Long.parseLong(request.getParameter("amount"));
					response.setContentType("text/plain");
					if (AccountService.doubleTransaction(sender,receiver,amount)) {
						response.getWriter().write("success");
					} else {
						response.getWriter().write("failed");
					}										
				}
			} catch (Exception e) {}			
			break;
			
			
		case "Accounts":
			try {
				String type=(String)request.getParameter("actionType");			
				if(type.contentEquals("fetch")) {
					Long id=Long.parseLong(request.getParameter("id"));
					String basedOn=(String)request.getParameter("basedOn");	
				response.setContentType("text/plain");
				if (AccountService.isValidId(basedOn,id)) {	
					response.getWriter().write("success");
				} else {
					response.getWriter().write("failed");
				}
				}				
				else {
					response.setContentType("text/html;charset=UTF-8");
					Long id=Long.parseLong(request.getParameter("id"));
					String basedOn=(String)request.getParameter("basedOn");	
					Account[] accounts=null;
					accounts=AccountService.getAccounts(basedOn,id);					
					request.setAttribute("accounts",accounts);
					RequestDispatcher rd=request.getRequestDispatcher("cashierJSPs/viewAccounts.jsp");
					rd.forward(request, response);
										
				}
			} catch (Exception e) {}
			break;
			
			
		case "printStatement":			
			break;
			
			
		default:
			response.sendRedirect("Dashboard.jsp");
		
		}
	}

}
