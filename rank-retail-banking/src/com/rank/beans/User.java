package com.rank.beans;

public class User {
	private String userName, password, workGroup;
	private int userId;

	public User(String userName, String password, String work_group, int userId) {
		super();
		this.userName = userName;
		this.password = password;
		this.workGroup = work_group;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password + ", workGroup=" + workGroup + ", userId="
				+ userId + "]";
	}

	public String getWorkGroup() {
		return workGroup;
	}

	public void setWork_group(String workGroup) {
		this.workGroup = workGroup;
	}

	public String getUserName() {
		return userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
