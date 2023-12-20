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
import com.myservice.CreateFolderService;
import com.myservice.ShowFolderService;

@Controller
public class CreateFolderController {

	private final CreateFolderService createFolderService;
	private final ShowFolderService showFolderService;

	@Autowired
	public CreateFolderController(CreateFolderService createFolderService, ShowFolderService showFolderService) {
		this.createFolderService = createFolderService;
		this.showFolderService = showFolderService;
	}

	//Method for creating a new folder
	@RequestMapping(path = "/createFolder", method = RequestMethod.POST)
	public String newFolder(HttpSession session, @RequestParam("foname") String foname, Model m) {
		try {
			int uid = (int) session.getAttribute("uid");
			String result = createFolderService.createFolder(uid, foname);
			if (result.equals("done")) {
				List<Folder> list = showFolderService.showMyFolders(uid);
				m.addAttribute("folder", list);
				return "folders";
			} else if (result.equals("failed")) {
				m.addAttribute("failed", "Something Happened!! Try Again");
				return "folders";
			} else if (result.equals("error")) {
				return "error";
			} else if (result.equals("duplicateEntry")) {
				List<Folder> list = showFolderService.showMyFolders(uid);
				m.addAttribute("folder", list);
				m.addAttribute("duplicateCreate", "Cannot Have Two Folders With The Same Name!!");
				return "folders";
			}
		} catch (Exception e) {
			System.out.println("Caught in create folder");
			return "error";
		}
		return "folders";
	}

}
