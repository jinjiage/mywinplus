package com.demo.controller.jinge;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.demo.model.Member;
import com.demo.model.Subject;
import com.demo.model.SysType;
import com.demo.service.jinge.SubjectPurchaseRecordService;
import com.demo.service.jinge.SubjectSysService;
import com.demo.service.jinge.SysTypeService;
import com.demo.service.wenlei.MemberServices;

@Controller
@RequestMapping("/subject/sys")
public class SubjectSysHander {
	@Autowired
	SubjectSysService subjectSysService;
	@Autowired
	SysTypeService SysTypeService;
	@Autowired
	SubjectPurchaseRecordService subjectPurchaseRecordService;
	@Autowired
	MemberServices memberServices;
	@RequestMapping("/gushouList")
	public String sysIndex(Subject subject, @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="2") Integer pageSize, Model model)
	{
		List<SysType> subjecttype = SysTypeService.find("subjecttype");
		List<SysType> subjectstatu = SysTypeService.find("subjectstatus");
		Integer count  = subjectSysService.getSubjectCount(subject);
		Integer pages = count%pageSize==0?count/pageSize:count/pageSize+1;
		List<Object[]> list = subjectSysService.getSubject(page, pageSize, subject);
		model.addAttribute("subjecttype", subjecttype);
		model.addAttribute("subjectstatu", subjectstatu);
		model.addAttribute("pageInfo", list);
		model.addAttribute("subject", subject);
		model.addAttribute("page", page);
		model.addAttribute("pages", pages);
		return "/main/finance/subject";
	}
	@RequestMapping("/addView")
	public String addSubject(Map<String,Object> map) {
		List<SysType> subjecttype = SysTypeService.find("subjecttype");
		List<SysType> subjectstatu = SysTypeService.find("subjectstatus");
		List<SysType> experstatus = SysTypeService.find("experstatus");
		List<SysType> safeguardway = SysTypeService.find("safeguardway");
		map.put("subjecttype", subjecttype);
		map.put("subjectstatu", subjectstatu);
		map.put("experstatus", experstatus);
		map.put("safeguardway", safeguardway);
		return "/main/finance/index";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addSubject(Subject subject)
	{
		Date d = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
		Random ne = new Random();
		int x = ne.nextInt(9000) + 1000;
		subject.setCreate_date(new Date());
		subject.setSerial_number("YJ"+x);
		subjectSysService.addSubject(subject);
		return "redirect:/subject/sys/gushouList";
	}
	@RequestMapping(value="editView/{id}", method=RequestMethod.GET)
	public String editView(@PathVariable Integer id, Map<String,Object> map)
	{
		List<SysType> subjecttype = SysTypeService.find("subjecttype");
		List<SysType> subjectstatu = SysTypeService.find("subjectstatus");
		List<SysType> experstatus = SysTypeService.find("experstatus");
		List<SysType> safeguardway = SysTypeService.find("safeguardway");
		Subject subject = subjectSysService.findSubjectById(id);
		map.put("subjecttype", subjecttype);
		map.put("subject", subject);
		map.put("subjectstatu", subjectstatu);
		map.put("experstatus", experstatus);
		map.put("safeguardway", safeguardway);
		return "main/finance/editview";
	}
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	  public String edit(Subject subject)
	  {
		subject.setUpdate_date(new Date());
	     subjectSysService.updateSubject(subject);
	    return "redirect:/subject/sys/gushouList";
	  }
	 @RequestMapping(value="/attchment", method=RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object> subjectAttchment(@RequestParam CommonsMultipartFile files, HttpServletRequest request) {
	   Map<String,Object> map = new HashMap();
	   
		 String name = files.getOriginalFilename();
	    InputStream is = null;
	    String path = request.getRealPath("upload")+"\\"+name;
		try{
			is=files.getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));
			map.put("code", name);
		}catch(Exception e){}
		return map;
	  }
	 @RequestMapping(value="/subjectPurchase", method=RequestMethod.GET)
	  public String subjectPurchase(Integer subjcetId, @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="20") Integer pageSize, Model model)
	  {
	    Page subjects = subjectPurchaseRecordService.getPurchaseRecord(subjcetId, page, pageSize);
	   
	    List<Member> memberlist= memberServices.selectlist();
	    model.addAttribute("subjects",subjects);
	    model.addAttribute("memberlist",memberlist);   
	    model.addAttribute("subjectId", subjcetId);
	    return "/main/finance/purchase";
	  }
	 @InitBinder    
	    public void initBinder(WebDataBinder binder) {    
	        binder.registerCustomEditor(Date.class, 
	        		new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));    
	    }
}
