package com.rank.beans;

public class Customer {

	long id;
	int ssn;
	String name, address,message,createdDateTime,updatedDateTime,dob,status;
	short age;	

	public Customer() {

	}
	
	

	@Override
	public String toString() {
		return "Customer [id=" + id + ", ssn=" + ssn + ", name=" + name + ", address=" + address + ", message="
				+ message + ", createdDateTime=" + createdDateTime + ", updatedDateTime=" + updatedDateTime + ", dob="
				+ dob + ", status=" + status + ", age=" + age + "]";
	}



	public Customer(int ssn, String name, String address, String message, String dob, String status, short age) {
		super();
		this.ssn = ssn;
		this.name = name;
		this.address = address;
		this.message = message;
		this.dob = dob;
		this.status = status;
		this.age = age;
	}



	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getSsn() {
		return ssn;
	}

	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(String createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public String getUpdatedDateTime() {
		return updatedDateTime;
	}

	public void setUpdatedDateTime(String updatedDateTime) {
		this.updatedDateTime = updatedDateTime;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public short getAge() {
		return age;
	}

	public void setAge(short age) {
		this.age = age;
	}

}
