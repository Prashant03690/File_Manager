package com.myController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Folder;
import com.myservice.RenameFolderService;
import com.myservice.ShowFolderService;

@Controller
public class RenameFolderController {
	
	private final ShowFolderService showFolderService;
	private final RenameFolderService renameFolderService;
	
	@Autowired
	public RenameFolderController(ShowFolderService showFolderService, RenameFolderService renameFolderService) {
		this.showFolderService = showFolderService;
		this.renameFolderService = renameFolderService;	
	}
	
	@RequestMapping(path = "/renameFolder", method = RequestMethod.POST)
	public String renameMyFolder(HttpSession session, @RequestParam("foname") String foname, @RequestParam("newfoname") String newfoname, Model m ) {
		try {
		int uid = (int) session.getAttribute("uid");
		String uname = (String) session.getAttribute("uname");
		String result = renameFolderService.renameFolder(foname, newfoname, uid);
		if(result.equals("duplicateEntry")){
			List<Folder> list = showFolderService.showMyFolders(uid);
			//m.addAttribute("uid",uid);
			m.addAttribute("uname",uname);
			//m.addAttribute("upassword",upassword);
			m.addAttribute("duplicate","Folder Name Already Taken!!");
			m.addAttribute("folder",list);
			return "folders";
		}else if(result.equals("done")) {
			List<Folder> list = showFolderService.showMyFolders(uid);
			//m.addAttribute("uid",uid);
			m.addAttribute("uname",uname);
			//m.addAttribute("upassword",upassword);
			m.addAttribute("folder",list);
			return "folders";
		}}catch(Exception e) {
			System.out.println("Caught in rename folder");
			return "error";
		}
		return "error";
		
	}
	
	
	

}
