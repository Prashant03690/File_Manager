package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.model.User;

@Service
public class LoginService {
	
	public User processLoginForm(String uemail, String upassword) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            
            User user = new User();
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE uemail = ? AND upassword = ?");
            ps.setString(1, uemail);
            ps.setString(2, upassword);

            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setUid(rs.getInt("uid"));
                user.setUemail(rs.getString("uemail"));
                user.setUpassword(rs.getString("upassword"));
                user.setUname(rs.getString("uname"));
                return user;
            } else {
                // User not found
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

//	public User back(int uid, String uemail) {
//		// TODO Auto-generated method stub
//		 Connection con = null;
//	        try {
//	            con = ConnectionProvider.getConnection();
//	            
//	            User user = new User();
//	            
//	            PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE uid = ? AND uemail = ?");
//	            ps.setInt(1, uid);
//	            ps.setString(2, uemail);
//
//
//	            ResultSet rs = ps.executeQuery();
//
//	            if (rs.next()) {
//	                user.setUid(rs.getInt("uid"));
//	                user.setUemail(rs.getString("uemail"));
//	                user.setUpassword(rs.getString("upassword"));
//	                user.setUname(rs.getString("uname"));
//	                return user;
//	            } else {
//	                // User not found
//	                return null;
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return null;
//	        }
//	}

}
