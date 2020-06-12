package com.rank.dao;

import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.rank.beans.User;
import com.rank.util.DBConnection;

public class BankingDAO {

	public String isValidUser(User user) throws Exception {
		String workGroup = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT work_group FROM users WHERE user_name ='" + user.getUserName() + "' AND password='"
				+ user.getPassword() + "'";
		Statement st = con.createStatement();
		ResultSet rsResultSet = st.executeQuery(query);
		if (rsResultSet.next())
			workGroup = rsResultSet.getString("work_group");
		DBConnection.closeConnection();
		st.close();
		return workGroup;
	}

}
