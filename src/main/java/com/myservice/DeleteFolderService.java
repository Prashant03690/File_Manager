package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Service;

@Service
public class DeleteFolderService {

	// Delete folder
	public String deleteFolder(String foname, int uid, String uname) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM folder WHERE foname = ? AND uid = ?;");
			ps.setString(1, foname);
			ps.setInt(2, uid);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				return "done";
			} else {
				return "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

}
