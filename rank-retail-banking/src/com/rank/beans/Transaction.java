package com.rank.beans;

public class Transaction {

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", accountNumber=" + accountNumber + ", amount=" + amount + ", description="
				+ description + ", dateTime=" + dateTime + "]";
	}
	long id,accountNumber,amount;
	String description,dateTime;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
}
