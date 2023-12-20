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
import com.myservice.CreateFileService;
import com.myservice.ShowFileService;

@Controller
public class CreateFileController {

	private final CreateFileService createFileService;
	private final ShowFileService showFileService;

	@Autowired
	public CreateFileController(CreateFileService createFileService, ShowFileService showFileService) {
		this.createFileService = createFileService;
		this.showFileService = showFileService;
	}

	//Method for creating file (If extension is text)
	@RequestMapping(path = "/createFile", method = RequestMethod.POST)
	public String newFile(HttpSession session, @RequestParam("fname") String fname,
			@RequestParam("fcontent") String fcontent, @RequestParam("ftype") String ftype,
			@RequestParam("foid") String foid, Model m) throws IOException {
		try {
			@SuppressWarnings("unused")
			int uid = (int) session.getAttribute("uid");
			String result = createFileService.createFile(fname, fcontent, ftype, foid);
			if (result.equals("done")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else if (result.equals("duplicateEntry")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				m.addAttribute("duplicate", "File Name Already Used!");
				return "files";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in create files");
			return "error";
		}
		return "error";
	}

	//MEthod for creating a file (If extension is PNG or JPG)
	@RequestMapping(path = "/createImage", method = RequestMethod.POST)
	public String newImage(HttpSession session, @RequestParam("fname") String fname,
			@RequestParam("fcontent") MultipartFile fcontent, @RequestParam("ftype") String ftype,
			@RequestParam("foid") String foid, Model m) throws IOException {
		try {
			@SuppressWarnings("unused")
			int uid = (int) session.getAttribute("uid");
			String result = createFileService.createImage(fname, fcontent, ftype, foid);
			if (result.equals("done")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				return "files";
			} else if (result.equals("duplicateEntry")) {
				List<File> list = showFileService.showMyFiles(foid);
				m.addAttribute("files", list);
				m.addAttribute("foid", foid);
				m.addAttribute("duplicate", "File Name Already Used!");
				return "files";
			} else if (result.equals("error")) {
				return "error";
			}
		} catch (Exception e) {
			System.out.println("Caught in create image");
			return "newindex";
		}
		return "error";
	}

}
