package com.rank.beans;

public class User {
	String userName, password, work_group;
	int user_id;

	public User(String userName, String password, String work_group, int user_id) {
		super();
		this.userName = userName;
		this.password = password;
		this.work_group = work_group;
		this.user_id = user_id;
	}

	public String getWork_group() {
		return work_group;
	}

	public void setWork_group(String work_group) {
		this.work_group = work_group;
	}

	public String getUserName() {
		return userName;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
