package com.rank.services;

import com.rank.dao.BankingDAO;

public class AccountService {

	public static boolean singleTransaction(Long id, Long amount,String description) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.Transaction(id,amount,description);
	}
	
	public static boolean doubleTransaction(Long sender, Long receiver,Long amount) throws Exception {
		BankingDAO dao=new BankingDAO();
		if(dao.Transaction(sender,amount,"DEBIT")) {
			if(dao.Transaction(receiver, amount,"CREDIT")) return true;
		};
		return false;
	}
}
