package com.myservice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.File;

@Service
public class CreateFileService {

	//Create new file (text)
	public String createFile(String fname, String fcontent, String ftype, String foid) {

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();

			int folderid = Integer.parseInt(foid);
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM FILE WHERE fname = ? AND foid = ?");
			ps1.setString(1, fname);
			ps1.setInt(2, folderid);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				return "duplicateEntry";
			}
			@SuppressWarnings("unused")
			File file = new File();

			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO file (fname, fcontent, ftype, fcreationdate, fmodifieddate, foid) VALUES (?, ?, ?, NOW(), NOW(), ?);");
			int id = Integer.parseInt(foid);
			ps.setString(1, fname);
			ps.setString(2, fcontent);
			ps.setString(3, ftype);
			ps.setInt(4, id);
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

	//Create new file (Image)
	public String createImage(String fname, MultipartFile fcontent, String ftype, String foid) throws IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();

			int folderid = Integer.parseInt(foid);
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM FILE WHERE fname = ? AND foid = ?");
			ps1.setString(1, fname);
			ps1.setInt(2, folderid);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				return "duplicateEntry";
			}

			@SuppressWarnings("unused")
			File file = new File();

			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO file (fname, fcontent, ftype, fcreationdate, fmodifieddate, foid) VALUES (?, ?, ?, NOW(), NOW(), ?);");
			byte[] fcontentBytes = fcontent.getBytes();
			int id = Integer.parseInt(foid);
			ps.setString(1, fname);
			ps.setBytes(2, fcontentBytes);
			ps.setString(3, ftype);
			ps.setInt(4, id);
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
