package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.model.File;

@Service
public class RenameFolderService {

	// Rename folder
	public String renameFolder(String foname, String newfoname, int uid) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM FOLDER WHERE foname = ? AND uid = ?");
			ps1.setString(1, newfoname);
			ps1.setInt(2, uid);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				return "duplicateEntry";
			}

			@SuppressWarnings("unused")
			File file = new File();

			PreparedStatement ps = con.prepareStatement("UPDATE FOLDER SET foname = ? WHERE foname = ? AND uid = ?;");
			ps.setString(1, newfoname);
			ps.setString(2, foname);
			ps.setInt(3, uid);
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
