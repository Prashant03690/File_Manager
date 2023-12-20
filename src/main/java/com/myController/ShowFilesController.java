package com.myController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.File;
import com.model.Folder;
import com.myservice.ShowFileService;
import com.myservice.ShowFolderService;

@Controller
public class ShowFilesController {

	private final ShowFileService showFileService;;
	private final ShowFolderService showFolderService;

	@Autowired
	public ShowFilesController(ShowFileService showFileService, ShowFolderService showFolderService) {
		this.showFileService = showFileService;
		this.showFolderService = showFolderService;
	}

	// Show files inside folder
	@RequestMapping(path = "/showfiles", method = RequestMethod.GET)
	public String showFiles(HttpSession session, @RequestParam("foid") String foid, Model m) throws IOException {
		try {
			int uid = (int) session.getAttribute("uid");
			boolean access = showFileService.verifyUser(uid, foid);
			if (access) {
				List<File> list = showFileService.showMyFiles(foid);
				List<Folder> flist = showFolderService.showMyFolders(uid);
				m.addAttribute("folder", flist);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}
}
