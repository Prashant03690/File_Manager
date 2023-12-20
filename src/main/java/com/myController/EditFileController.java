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
import org.springframework.web.multipart.MultipartFile;

import com.model.File;
import com.myservice.EditFileService;
import com.myservice.ShowFileService;

@Controller
public class EditFileController {

	private final EditFileService editFileService;
	private final ShowFileService showFileService;

	@Autowired
	public EditFileController(EditFileService editFileService, ShowFileService showFileService) {
		this.editFileService = editFileService;
		this.showFileService = showFileService;
	}

	//Method for editing file (text)
	@RequestMapping(path = "/editFile", method = RequestMethod.POST)
	public String editFile(HttpSession session, @RequestParam("fid") String fid, @RequestParam("fname") String fname,
			@RequestParam("fcontent") String fcontent, @RequestParam("ftype") String ftype,
			@RequestParam("foid") String foid, Model m) throws IOException {
		try {
			@SuppressWarnings("unused")
			int uid = (int) session.getAttribute("uid");
			String result = editFileService.editFile(fid, fname, fcontent, ftype, foid);
			if (result.equals("done")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else if (result.equals("duplicateEntry")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				m.addAttribute("duplicateForEdit", "OOPS!! File name already taken");
				return "files";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in edit file");
			return "newindex";
		}
		return "files";
	}

	//Method for editing file (Image)
	@RequestMapping(path = "/editImage", method = RequestMethod.POST)
	public String editImage(HttpSession session, @RequestParam("fid") String fid, @RequestParam("fname") String fname,
			@RequestParam("fcontent") MultipartFile fcontent, @RequestParam("ftype") String ftype,
			@RequestParam("foid") String foid, Model m) throws IOException {
		try {
			@SuppressWarnings("unused")
			int uid = (int) session.getAttribute("uid");
			String result = editFileService.editImage(fid, fname, fcontent, ftype, foid);
			if (result.equals("done")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else if (result.equals("duplicateEntry")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				m.addAttribute("duplicateForEdit", "OOPS!! File name already taken");
				return "files";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in edit image");
			return "error";
		}
		return "files";
	}

}
