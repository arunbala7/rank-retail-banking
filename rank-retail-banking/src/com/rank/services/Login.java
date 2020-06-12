package com.rank.services;

import com.rank.beans.User;
import com.rank.dao.BankingDAO;

public class Login {

	public String isValidUser(User user) throws Exception {
		BankingDAO loginDao=new BankingDAO();
		String workGroup=null;	
		workGroup=loginDao.isValidUser(user);
		return workGroup;		
	}
}
