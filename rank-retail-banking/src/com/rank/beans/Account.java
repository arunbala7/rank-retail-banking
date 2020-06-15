package com.rank.beans;

public class Account {
	long number, customerId, balance;
	String type, createdDateTime,status;

	public Account() {
	}

	@Override
	public String toString() {
		return "Account [number=" + number + ", customerId=" + customerId + ", balance=" + balance + ", type=" + type
				+ ", createdDateTime=" + createdDateTime + ", status=" + status + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Account(long number, long customerId, long balance, String type, String createdDateTime, String status) {
		super();
		this.number = number;
		this.customerId = customerId;
		this.balance = balance;
		this.type = type;
		this.createdDateTime = createdDateTime;
		this.status = status;
	}

	public Account(long customerId, long balance, String type) {
		super();
		this.customerId = customerId;
		this.balance = balance;
		this.type = type;
	}

	public long getNumber() {
		return number;
	}

	public void setNumber(long number) {
		this.number = number;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(String createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

}
