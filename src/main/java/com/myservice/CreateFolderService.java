package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.model.User;

@Service
public class CreateFolderService {

	//Create new folder
	public String createFolder(int uid, String foname) {

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();

			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM FOLDER WHERE foname = ? AND uid = ?");
			ps1.setString(1, foname);
			ps1.setInt(2, uid);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				return "duplicateEntry";
			}

			@SuppressWarnings("unused")
			User user = new User();

			PreparedStatement ps = con.prepareStatement("INSERT INTO folder(foname, uid) VALUES(?,?);");
			ps.setString(1, foname);
			ps.setInt(2, uid);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				return "done";
			} else {
				return "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
	}

}
