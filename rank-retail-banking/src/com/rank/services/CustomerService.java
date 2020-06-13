package com.rank.services;

import com.rank.beans.Customer;
import com.rank.dao.BankingDAO;

public class CustomerService {

	public static boolean createCustomer(Customer customer) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.createCustomer(customer);		
	}
}
