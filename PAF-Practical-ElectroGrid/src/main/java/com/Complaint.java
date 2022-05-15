/*Complaint class*/
package com;

import java.sql.*;

/**
 * @author Nimesha
 *
 */
//A common method to connect to the DB
public class Complaint {

	private Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electro_grid", "root", "");
		} catch (Exception e) // Exception handling
		{
			e.printStackTrace();
		}

		return con;
	}
//Function to insert data

	public String insertComplaint(String cID, String type, String cdesc) {
		String output = "";

		try {
			Connection con = connect(); // creating a connection

			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}

			// create a prepared statement
			String query = " insert into complaint(`cID`,`type`,`cdesc`)" + " values (?, ?, ?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values

			preparedStmt.setString(1, cID);
			preparedStmt.setString(2, type);
			preparedStmt.setString(3, cdesc);

			// execute the statement
			preparedStmt.execute();
			con.close();
			String newComplaint = readComplaints();
			output = "{\"status\":\"success\", \"data\": \"" + newComplaint + "\"}";
		} catch (Exception e) // Exception handling
		{
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the complain details.\"}";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Function to read data
	public String readComplaints() {
		String output = "";

		try {
			Connection con = connect(); // creating a connection

			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the html table to be displayed
			output = "<div class='w-100'><table class='table table-striped table-dark w-100 text-white'><tr><th>Account Number</th>"
					+ "<th>Complaint type</th><th>Complaint</th>" + "<th>Update</th><th>Remove</th></tr></div>";
			// SQL query
			String query = "select * from complaint";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {
				String cID = rs.getString("cID");
				String type = rs.getString("type");
				String cdesc = rs.getString("cdesc");

				// Add into the html table
				output += "<tr><td>" + cID + "</td>";
				output += "<td>" + type + "</td>";
				output += "<td>" + cdesc + "</td>";

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' "
						+ "class='btnUpdate btn btn-info' data-itemid='" + cID + "'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' "
						+ "class='btnRemove btn btn-danger' data-itemid='" + cID + "'></td></tr>";
			}

			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) // exception handling
		{
			output = "Error while reading the complaint details.";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Function for updating data
	public String updateComplaint(String cID, String type, String cdesc) {
		String output = "";

		try {
			Connection con = connect(); // creating a connection

			if (con == null) {
				return "Error while connecting to the database for updating.";
			}

			// create a prepared statement
			String query = "UPDATE complaint SET type=?, cdesc=? WHERE cID=?"; // SQL query

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values

			preparedStmt.setString(1, type);
			preparedStmt.setString(2, cdesc);
			preparedStmt.setString(3, cID);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newComplaint = readComplaints();
			output = "{\"status\":\"success\", \"data\": \"" + newComplaint + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the complaint details.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}// Function to delete data

	public String deleteComplaint(String cID) {
		String output = "";

		try {
			Connection con = connect(); // creating a connection

			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "delete from complaint where cID=?"; // SQL query

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, cID);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newComplain = readComplaints();
			output = "{\"status\":\"success\", \"data\": \"" + newComplain + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the complain details\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

}
