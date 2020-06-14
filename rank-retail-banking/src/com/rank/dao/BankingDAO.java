package com.rank.dao;

import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.rank.beans.Customer;
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

	public boolean createCustomer(Customer customer) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "INSERT INTO customer (`customer_ssn`, `customer_name`, `customer_address`, `customer_dob`, `customer_age`,`customer_status`,`customer_messages`,`customer_create_datetime`,`customer_update_datetime`)"
				+ "VALUES (?,?,?,?,?,?,?,now(),now());";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setInt(1, customer.getSsn());
		ps.setString(2, customer.getName());
		ps.setString(3, customer.getAddress());
		ps.setString(4, customer.getDob());
		ps.setShort(5, customer.getAge());
		ps.setString(6, customer.getStatus());
		ps.setString(7, customer.getMessage());
		int row= ps.executeUpdate();
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}
	

	public Customer getCustomer(Long id) throws Exception {
		Customer customer=new Customer();
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT customer_name, customer_ssn, customer_address, customer_age FROM customer WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, id);		
		ResultSet rsResultSet = ps.executeQuery();
		if (rsResultSet.next())
			{
			customer.setName(rsResultSet.getString("customer_name"));
			customer.setId(id);
			customer.setSsn(rsResultSet.getInt("customer_ssn"));
			customer.setAddress(rsResultSet.getString("customer_address"));
			customer.setAge(rsResultSet.getShort("customer_age"));   
			}
		DBConnection.closeConnection();
		ps.close();	
		return customer;
	}

	public boolean updateCustomer(Customer customer) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "UPDATE customer SET customer_name = ?, customer_address= ?, customer_age = ?, customer_messages = 'CUSTOMER DETAILS UPDATED', customer_update_datetime=now()  WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, customer.getName());
		ps.setString(2, customer.getAddress());
		ps.setShort(3, customer.getAge());
		ps.setLong(4, customer.getId());
		int row= ps.executeUpdate();		
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}

}
