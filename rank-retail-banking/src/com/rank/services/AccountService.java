package com.rank.services;

import java.util.List;

import com.rank.beans.Account;
import com.rank.beans.Transaction;
import com.rank.dao.BankingDAO;

public class AccountService {

	public static boolean singleTransaction(Long id, Long amount,String description) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.Transaction(id,amount,description);
	}
	
	public static boolean doubleTransaction(Long sender, Long receiver,Long amount) throws Exception {
		BankingDAO dao=new BankingDAO();
		if(dao.Transaction(receiver, amount,"CREDIT")) {
			if(dao.Transaction(sender,amount,"DEBIT")) return true;
		};
		return false;
	}

	public static boolean isValidId(String basedOn, Long id) throws Exception {
		BankingDAO dao=new BankingDAO();		
		return dao.isVaildId(basedOn,id);	
	}

	public static List<Account> getAccounts(String basedOn, Long id) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.getAccounts(basedOn,id);
	}
	public static List<Account> getAllAccounts(int currentPage, int recordsPerPage) throws Exception {
		int start=currentPage*recordsPerPage-recordsPerPage;
		BankingDAO dao=new BankingDAO();
		return dao.getAllAccounts(start,recordsPerPage);
	}

	public static List<Transaction> getTransactions(Long accountId,String basedOn, String count, String start, String end) throws Exception {
		BankingDAO dao=new BankingDAO();
		return dao.getTransactions(accountId,basedOn,count,start,end);
	}



}
