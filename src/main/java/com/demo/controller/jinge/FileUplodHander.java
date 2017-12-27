package com.demo.controller.jinge;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class FileUplodHander {

	@RequestMapping("/fileupload")
	public @ResponseBody String fileupload(@RequestParam(value="file", required=false) MultipartFile file, HttpServletRequest request)
			throws Exception
	{
		String name = file.getOriginalFilename();
		InputStream is = null;
		String path = request.getRealPath("upload")+"\\"+name;
		try{
			is=file.getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "upload\\"+name;
	}

	@RequestMapping(value="/delimg", method=RequestMethod.POST)
	public  @ResponseBody String delimg(String imgpath, HttpServletRequest request)
	{

		return "删除成功";
	}
}
