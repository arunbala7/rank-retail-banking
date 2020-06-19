package com.rank.services;

import java.util.List;

import com.rank.beans.Account;
import com.rank.beans.Combined;
import com.rank.beans.Customer;
import com.rank.dao.BankingDAO;

public class CustomerService {

	public static String createCustomer(Customer customer) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.createCustomer(customer);		
	}
	
	public static Customer getCustomer(Long id) throws Exception {		
		BankingDAO dao=new BankingDAO();
		return dao.getCustomer(id);		
	}
	
	public static boolean updateCustomer(Customer customer) throws Exception{
		BankingDAO dao=new BankingDAO();
		return dao.updateCustomer(customer);
	}

	public static boolean deleteCustomer(Long id) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.deleteCustomer(id);
	}

	public static boolean isCustomer(Long id) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.isCustomer(id);
	}

	public static String createAccount(Account account) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.createAccount(account);
	}

	public static Combined getAccount(Long accountId) throws Exception {
		BankingDAO dao=new BankingDAO();		
		return dao.getAccount(accountId);
	}

	public static boolean deleteAccount(Long id) throws Exception {
		BankingDAO dao=new BankingDAO();	
		return dao.deleteAccount(id);
	}

	public static List<Customer> getCustomers(int currentPage, int recordsPerPage) throws Exception {
		BankingDAO dao=new BankingDAO();
		int start=currentPage*recordsPerPage-recordsPerPage;
		return dao.getCustomers(start,recordsPerPage);
	}

	public static int getNoOfRows(String tableName) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.getNoOfRows(tableName);
	}

	public static Customer getCustomerBasedOn(String basedOn,Long id) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.getCustomerBasedOn(basedOn,id);
	}

	public static Customer getCustomerBasedOnId(Long id) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.getCustomerBasedOnId(id);
	}

}
