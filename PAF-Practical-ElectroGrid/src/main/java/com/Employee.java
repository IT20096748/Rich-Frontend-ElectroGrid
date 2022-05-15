/*Employee class*/
package com;

import java.sql.*;

public class Employee {

	// A common method to connect to the DB
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electro_grid", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	// Method to read data
	public String readEmployee() {
		String output = "";

		try {
			Connection con = connect(); // creating a connection

			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the html table to be displayed
			output = "<div class='w-100'><table class='table table-striped table-dark w-100'><tr>" + "<th>Employee ID&nbsp;</th>"
					+ "<th>Full Name&nbsp;</th>" + "<th>Gender&nbsp;</th>" + "<th>NIC&nbsp;</th>"
					+ "<th>Phone Number&nbsp;</th>" + "<th>Email&nbsp;</th>" + "<th>Password&nbsp;</th>"
					+ "<th>address&nbsp;</th>" + "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from employee";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {
				String empNo = Integer.toString(rs.getInt("empNo"));
				String empID = Integer.toString(rs.getInt("empID"));
				String fname = rs.getString("fname");
				String gender = rs.getString("gender");
				String nic = rs.getString("nic");
				String number = rs.getString("number");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String address = rs.getString("address");

				// Add into the html table

				output += "<td>" + empID + "</td>";
				output += "<td>" + fname + "</td>";
				output += "<td>" + gender + "</td>";
				output += "<td>" + nic + "</td>";
				output += "<td>" + number + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + password + "</td>";
				output += "<td>" + address + "</td>";

				// buttons

				output += "<td><input name='btnUpdate' type='button' value='Update' "
						+ "class='btnUpdate btn btn-info' data-itemid='" + empNo + "'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' "
						+ "class='btnRemove btn btn-danger' data-itemid='" + empNo + "'></td></tr>";
			}

			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) // Exception handling
		{
			output = "Error while reading the Employee.";
			System.err.println(e.getMessage());
		}

		return output;

	}

	// Method to insert data
	public String insertemployee(String empID, String fname, String gender, String nic, String number, String email,
			String passoword, String address) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into employee (`empNo`,`empID`,`fname`,`gender`,`nic`,`number`,`email`,`password`,`address`)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setInt(2, Integer.parseInt(empID));
			preparedStmt.setString(3, fname);
			preparedStmt.setString(4, gender);
			preparedStmt.setString(5, nic);
			preparedStmt.setString(6, number);
			preparedStmt.setString(7, email);
			preparedStmt.setString(8, passoword);
			preparedStmt.setString(9, address);

			// execute the statement
			preparedStmt.execute();
			con.close();
			String newEmployee = readEmployee();
			output = "{\"status\":\"success\", \"data\": \"" + newEmployee + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the employee.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// Method to update data
	public String updateemployee(String empNo, String empID, String fname, String gender, String nic, String number,
			String email, String password, String address) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE employee SET empID=?,fname=?,gender=?,nic=?,number=?,email=?,password=?,address=? WHERE empNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(empID));
			preparedStmt.setString(2, fname);
			preparedStmt.setString(3, gender);
			preparedStmt.setString(4, nic);
			preparedStmt.setString(5, number);
			preparedStmt.setString(6, email);
			preparedStmt.setString(7, password);
			preparedStmt.setString(8, address);
			preparedStmt.setInt(9, Integer.parseInt(empNo));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newEmployee = readEmployee();
			output = "{\"status\":\"success\", \"data\": \"" + newEmployee + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the employee.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// Method to delete data
	public String deleteemployee(String consumerNo) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from employee where empNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(consumerNo));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newConsumer = readEmployee();
			output = "{\"status\":\"success\", \"data\": \"" + newConsumer + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the employee.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
}