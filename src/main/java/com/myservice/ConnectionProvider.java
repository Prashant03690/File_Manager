package com.myservice;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	//Database info
	private static Connection con;
	private static String url = "jdbc:mysql://localhost:3306/filemanager";
	private static String user = "root";
	private static String pwd = "Nabla!23";

	//Get connection
	public static Connection getConnection() {

		if (con == null) {

			try {

				Class.forName("com.mysql.cj.jdbc.Driver");

				con = DriverManager.getConnection(url, user, pwd);

				return con;

			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Error iss");
				e.printStackTrace();
			}
		}

		return con;
	}

}
