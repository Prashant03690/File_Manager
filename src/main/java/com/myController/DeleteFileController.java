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
import com.myservice.DeleteFileService;
import com.myservice.ShowFileService;

@Controller
public class DeleteFileController {

	private final DeleteFileService deleteFileService;
	private final ShowFileService showFileService;

	@Autowired
	public DeleteFileController(DeleteFileService deleteFileService, ShowFileService showFileService) {
		this.deleteFileService = deleteFileService;
		this.showFileService = showFileService;
	}

	//Method for deleting the file
	@RequestMapping(path = "/deleteFile", method = RequestMethod.POST)
	public String deleteFile(HttpSession session, @RequestParam("fid") String fid, @RequestParam("foid") String foid,
			Model m) throws IOException {
		try {
			@SuppressWarnings("unused")
			int uid = (int) session.getAttribute("uid");
			String result = deleteFileService.deleteThisFile(fid, foid);
			@SuppressWarnings("unused")
			String uname = (String) session.getAttribute("uname");
			if (result.equals("done")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in delete file");
			return "error";
		}
		return "files";
	}

}
