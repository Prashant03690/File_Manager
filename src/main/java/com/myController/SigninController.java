package com.myController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.myservice.SigninService;

@Controller
public class SigninController {
	
private final SigninService signinService; 
	
	@Autowired
	public SigninController(SigninService signinService) {
		this.signinService = signinService;
	}
	
	@RequestMapping(path = "/signin", method = RequestMethod.POST)
	public String processForm(@RequestParam("uemail") String uemail, @RequestParam("uname") String uname, @RequestParam("upassword") String upassword, @RequestParam("reenteredPassword") String reenteredpassword, Model m ) {
		String result = signinService.processSigninForm(uemail, uname, upassword, reenteredpassword);
		if(result.equals("unmatchingPassword")) {
			m.addAttribute("unmatchingPassword", "Password Is Not Matching");
			return "signin";
		}else if(result.equals("failed")){
			m.addAttribute("failed", "Email already used!! Please try another email!");
			return "signin";
		}else if(result.equals("done")){
			return "login";
		}
		return "login";
	}
}
