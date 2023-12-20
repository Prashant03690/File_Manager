package com.myController;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.Folder;
import com.model.User;
import com.myservice.LoginService;
import com.myservice.ShowFolderService;

@Controller
public class LoginController {
	
	private final LoginService loginService; 
	private final ShowFolderService showFolderService;
	
	@Autowired
	public LoginController(LoginService loginService, ShowFolderService showFolderService) {
		this.loginService = loginService;
		this.showFolderService = showFolderService;
	}

	//Open login form page
	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String openLoginForm() {
	    return "login";
	}
	
	//Process the form and check if the user is available in database.
	@RequestMapping(path = "/authentication", method = RequestMethod.POST)
	public String processForm(HttpSession session, @RequestParam("uemail") String uemail, @RequestParam("upassword") String upassword, Model m) {
	    User user = loginService.processLoginForm(uemail, upassword);
	    if (user != null) {
	        session.setAttribute("uid", user.getUid());
	        session.setAttribute("uemail", user.getUemail());
	        session.setAttribute("uname", user.getUname());
	        return "redirect:/Showfolders";
	    } else {
	        m.addAttribute("error", "Invalid Email-Id or Password");
	        return "login";
	    }
	}

	
	//Back to home page
	@RequestMapping(path = "/newindex", method = RequestMethod.GET)
	public String openHome() {
	    return "newindex";
	}
	
	//Go back to folders list
	@RequestMapping(path = "/back", method = RequestMethod.GET)
	public String GoBack(HttpSession session, Model m) {
		int uid = (int) session.getAttribute("uid");
		@SuppressWarnings("unused")
		String uemail = (String) session.getAttribute("uemail");
		String uname = (String) session.getAttribute("uname");
		if(uname != null) {
			List<Folder> list = showFolderService.showMyFolders(uid);
			m.addAttribute("uname", uname);
			m.addAttribute("folder", list);
			
			return "redirect:/Showfolders";
		}else {
			m.addAttribute("error","Invalid Email-Id or Password");
			return "folders";
		}
	}
	
	//Logout and delete the session data.
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-store");
	    session.invalidate();
	    return "redirect:/login";
	}	
}
