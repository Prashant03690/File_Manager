package com.myController;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Folder;
import com.myservice.ShowFolderService;

@Controller
public class ShowFolderController {
	
	private final ShowFolderService showFolderService;
	
	public ShowFolderController(ShowFolderService showFolderService) {
		this.showFolderService = showFolderService;
		
	}
	
	@RequestMapping(path = "/Showfolders", method = RequestMethod.GET)
    public String showFolders(HttpSession session, HttpServletResponse response, Model m) {
		try {
		response.setHeader("Cache-Control", "no-store");
		int uid = (int) session.getAttribute("uid");
		List<Folder> list = showFolderService.showMyFolders(uid);
		m.addAttribute("folder",list);
        return "folders";
		}catch(NullPointerException e) {
			return "error";
		}
    }

}
