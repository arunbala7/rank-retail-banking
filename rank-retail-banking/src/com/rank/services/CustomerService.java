package com.rank.services;

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
	
	
}
