package com.myController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Folder;
import com.myservice.DeleteFolderService;
import com.myservice.ShowFolderService;

@Controller
public class DeleteFolderController {

	private final DeleteFolderService deleteFolderService;
	private final ShowFolderService showFolderService;

	public DeleteFolderController(DeleteFolderService deleteFolderService, ShowFolderService showFolderService) {
		this.deleteFolderService = deleteFolderService;
		this.showFolderService = showFolderService;
	}

	//Method for deleting the folder
	@RequestMapping(path = "/deleteFolder", method = RequestMethod.POST)
	public String deleteFolder(HttpSession session, @RequestParam("foname") String foname, Model m) throws IOException {
		try {
			int uid = (int) session.getAttribute("uid");
			String uname = (String) session.getAttribute("uname");
			String result = deleteFolderService.deleteFolder(foname, uid, uname);
			if (result.equals("done")) {
				List<Folder> list = showFolderService.showMyFolders(uid);
				m.addAttribute("uname", uname);
				m.addAttribute("folder", list);
				return "folders";
			} else if (result.equals("failed")) {
				List<Folder> list = showFolderService.showMyFolders(uid);
				m.addAttribute("uname", uname);
				m.addAttribute("folder", list);
				m.addAttribute("notfound", "No Such Folder!!");
				return "folders";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in delete folder");
			return "error";
		}
		return "error";
	}

}
