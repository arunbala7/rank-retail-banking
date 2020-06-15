package com.rank.dao;

import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.rank.beans.Account;
import com.rank.beans.Combined;
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
		ResultSet rs = st.executeQuery(query);
		if (rs.next())
			workGroup = rs.getString("work_group");
		DBConnection.closeConnection();
		st.close();
		return workGroup;
	}

	public String createCustomer(Customer customer) throws Exception {
		String custId=null;
		Connection con = (Connection) DBConnection.getConnection();
		String query="SELECT * FROM customer WHERE `customer_ssn`= ?;";
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, customer.getSsn());
		ResultSet rs = ps.executeQuery();
		if(rs.next()) return null;
		query = "INSERT INTO customer (`customer_ssn`, `customer_name`, `customer_address`, `customer_dob`, `customer_age`,`customer_status`,`customer_messages`,`customer_create_datetime`,`customer_update_datetime`)"
				+ "VALUES (?,?,?,?,?,?,?,now(),now());";
		ps = (PreparedStatement) con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		ps.setInt(1, customer.getSsn());
		ps.setString(2, customer.getName());
		ps.setString(3, customer.getAddress());
		ps.setString(4, customer.getDob());
		ps.setShort(5, customer.getAge());
		ps.setString(6, customer.getStatus());
		ps.setString(7, customer.getMessage());
		ps.executeUpdate();
		rs = ps.getGeneratedKeys();
		if(rs.next())
		custId=rs.getLong(1)+"";
		DBConnection.closeConnection();
		ps.close();
		return custId;
	}
	

	public Customer getCustomer(Long id) throws Exception {
		Customer customer=new Customer();
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT customer_name, customer_ssn, customer_address, customer_dob FROM customer WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, id);		
		ResultSet rsResultSet = ps.executeQuery();
		if (rsResultSet.next())
			{
			customer.setName(rsResultSet.getString("customer_name"));
			customer.setId(id);
			customer.setSsn(rsResultSet.getInt("customer_ssn"));
			customer.setAddress(rsResultSet.getString("customer_address"));
			customer.setDob(rsResultSet.getString("customer_dob"));   
			}
		DBConnection.closeConnection();
		ps.close();	
		return customer;
	}

	public boolean updateCustomer(Customer customer) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "UPDATE customer SET customer_name = ?, customer_address= ?, customer_dob = ?, customer_messages = 'CUSTOMER DETAILS UPDATED', customer_update_datetime=now(), customer_age=?  WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, customer.getName());
		ps.setString(2, customer.getAddress());
		ps.setString(3, customer.getDob());		
		ps.setShort(4, customer.getAge());
		ps.setLong(5, customer.getId());
		int row= ps.executeUpdate();		
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}
	
	public boolean deleteCustomer(Long id) throws Exception {
		
		Connection con = (Connection) DBConnection.getConnection();
		String query = "DELETE FROM customer WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, id);
		int row= ps.executeUpdate();		
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}

	public boolean isCustomer(Long id) throws Exception {
		int row=0;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM customer WHERE customer_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) row=1;
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}

	public String createAccount(Account account) throws Exception {
		String accountNumber=null;
		Connection con = (Connection) DBConnection.getConnection();
		String query="SELECT * FROM account WHERE `account_type`= ? AND `customer_id`=?;";
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		ps.setString(1, account.getType());
		ps.setLong(2, account.getCustomerId());
		ResultSet rs = ps.executeQuery();
		if(rs.next()) return null;
		query = "INSERT INTO account ( `customer_id`, `account_type`,`account_status`,`account_message`,`account_balance`,`account_create_datetime`,`account_update_datetime`)" + "VALUES (?, ?,'ACTIVE','ACCOUNT CREATED SUCCESSFULLY',?,now(),now());";
		ps = (PreparedStatement) con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		ps.setLong(1, account.getCustomerId());
		ps.setString(2, account.getType());
		ps.setLong(3, account.getBalance());
		ps.executeUpdate();
		rs = ps.getGeneratedKeys();
		if(rs.next())
			accountNumber=rs.getLong(1)+"";
		System.out.print(accountNumber);
		query="INSERT INTO transactions (`account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`)VALUES (?,'DEPOSIT', now(),?);";
		ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, Long.parseLong(accountNumber));
		ps.setLong(2, account.getBalance());
		ps.executeUpdate();
		DBConnection.closeConnection();
		ps.close();
				
		return accountNumber;
	}

	public Combined getAccount(Long accountId) throws Exception {
		Combined combined=null;
		Account account=new Account();
		Customer customer=new Customer();
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT account.*, customer_name , customer_dob FROM account JOIN customer USING(customer_id) WHERE account_number = ? ;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, accountId);		
		ResultSet rs = ps.executeQuery();
		if (rs.next())
			{			  
			account.setNumber(rs.getLong(1));
			account.setCustomerId(rs.getLong(2));
			account.setType(rs.getString(3));
			account.setStatus(rs.getString(4));
			account.setBalance(rs.getLong(6));
			customer.setName(rs.getString(9));
			customer.setDob(rs.getString(10));	
			combined=new Combined(customer,account);
			}		
		DBConnection.closeConnection();
		rs.close();	
		return combined;
		
	}

	public boolean deleteAccount(Long id) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "DELETE FROM account WHERE account_number = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, id);
		int row= ps.executeUpdate();		
		DBConnection.closeConnection();
		ps.close();
		if(row==1) return true;
		return false;
	}

}
