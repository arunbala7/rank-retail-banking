package com.rank.beans;

public class Combined {

	Customer customer;
	Account account;
	public Combined(Customer customer, Account account) {
		super();
		this.customer = customer;
		this.account = account;
	}
	public Combined() {}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
	
	
}
