package com.myservice;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.stereotype.Service;

import com.model.File;

@Service
public class ShowFileService {

	//Show files inside the folder
	public List<File> showMyFiles(String id) throws IOException {
		int foid = Integer.parseInt(id);

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();

			List<File> list = new ArrayList<>();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM file WHERE foid = ?");
			ps.setInt(1, foid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				File file = new File();
				file.setFid(rs.getInt("fid"));
				file.setFname(rs.getString("fname"));

				String ftype = rs.getString("ftype");

				if ("png".equalsIgnoreCase(ftype) || "jpg".equalsIgnoreCase(ftype)) {
					Blob blob = rs.getBlob("fcontent");
					if (blob != null) {
						try (InputStream inputStream = blob.getBinaryStream()) {
							byte[] bytes = inputStream.readAllBytes();
							String base64Image = Base64.getEncoder().encodeToString(bytes);
							file.setFcontent(base64Image);
						}
					}
				} else {
					file.setFcontent(rs.getString("fcontent"));
				}

				file.setFtype(ftype);
				file.setFcreationdate(rs.getTimestamp("fcreationdate"));
				file.setFmodifieddate(rs.getTimestamp("fmodifieddate"));
				file.setFoid(rs.getInt("foid"));
				list.add(file);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	//Check if user is trying to access the files only after logging in
	public boolean verifyUser(int uid, String id) {

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			int foid = Integer.parseInt(id);
			@SuppressWarnings("unused")
			List<File> list = new ArrayList<>();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM folder WHERE foid = ? AND uid = ?");
			ps.setInt(1, foid);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}

	}

}
