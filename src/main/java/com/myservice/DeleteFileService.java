package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

@Service
public class DeleteFileService {

	//Delete file
	public String deleteThisFile(String fid, String foid) {

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			int id = Integer.parseInt(fid);
			int iid = Integer.parseInt(foid);
			PreparedStatement ps = con.prepareStatement("DELETE FROM file WHERE fid = ? AND foid = ?");
			ps.setInt(1, id);
			ps.setInt(2, iid);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				return "done";
			} else {
				return "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}
