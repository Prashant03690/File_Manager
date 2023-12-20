package com.myservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

@Service
public class SigninService {
	
	public String processSigninForm(String uemail, String uname, String upassword, String reenteredpassword) {
		if(!upassword.equals(reenteredpassword)) {
			return "unmatchingPassword";
		}
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO user(uemail, uname, upassword) VALUES(?, ?, ?)");
            ps.setString(1, uemail);
            ps.setString(2, uname);
            ps.setString(3, upassword);

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
