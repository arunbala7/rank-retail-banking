package com.rank.services;

import com.rank.beans.User;
import com.rank.dao.BankingDAO;

public class Login {

	public User isValidUser(User user) throws Exception {
		BankingDAO loginDao=new BankingDAO();
		User currentUser = null;	
		currentUser=loginDao.isValidUser(user);
		return currentUser;		
	}

	public void updateLogoutInfo(int userId) throws Exception {
		BankingDAO logOutDao = new BankingDAO();
		logOutDao.logOutInfoUpdate(userId);
		
	}
}
