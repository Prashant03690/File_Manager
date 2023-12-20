package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Folder;

@Service
public class ShowFolderService {

	//Show folders
	public List<Folder> showMyFolders(int uid) {

		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();

			List<Folder> list = new ArrayList<>();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM folder WHERE uid = ?");
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Folder folder = new Folder();
				folder.setFoname(rs.getString("foname"));
				folder.setFoid(rs.getInt("foid"));
				list.add(folder);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
