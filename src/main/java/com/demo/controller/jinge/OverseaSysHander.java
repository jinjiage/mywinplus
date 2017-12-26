package com.demo.controller.jinge;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.demo.model.OverseaConfig;
import com.demo.model.SysType;
import com.demo.service.jinge.OverseaConfigService;
import com.demo.service.jinge.OverseaConfigSubscribeService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/overseaSys")
public class OverseaSysHander {
	@Autowired
	OverseaConfigService overseaConfigService;
	@Autowired
	OverseaConfigSubscribeService overseaConfigSubscribeService;
	@Autowired
	SysTypeService sysTypeService;
	@RequestMapping(value="/overseaConfig", method=RequestMethod.GET)
	public String overseaConfig( @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize, Model model)
	{
		Page overseaConfiglist = overseaConfigService.getOverseaConfigList( page, pageSize);
		List<SysType> financestaus =sysTypeService.find("overseastatus");
		model.addAttribute("financestaus", financestaus);
		model.addAttribute("overseaConfiglist", overseaConfiglist);
		return "/main/finance/overseasys";
	}
	@RequestMapping(value="/overseaConfigSubscribe/{id}", method=RequestMethod.GET)
	public String overseaConfigSubscribe(@PathVariable("id") Integer id, @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize, Model model)
	{
		Page pageSubscribe = overseaConfigSubscribeService.getPageSubscribe(page, pageSize, id);

		model.addAttribute("pageSubscribe", pageSubscribe);
		model.addAttribute("id", id);
		return "/main/finance/overseasubscribe";
	}
	@RequestMapping(value="/overseaConfigView", method=RequestMethod.GET)
	public String overseaConfigView(Integer id, Model model)
	{
		List<SysType> financestaus =sysTypeService.find("overseastatus");
		model.addAttribute("financestaus", financestaus);
		if(id!=null){
			OverseaConfig overseaConfig = overseaConfigService.getOne(id);
			model.addAttribute("overseaConfig", overseaConfig);
		return "/main/finance/overseaupdate";
		}
		return "/main/finance/overseaadd";
	}
	@RequestMapping(value="/overseaConfig", method=RequestMethod.POST)
	public String overseaConfigAdd(@RequestParam CommonsMultipartFile avatar_link,OverseaConfig overseaConfig,HttpServletRequest request)
	{
		String name = avatar_link.getOriginalFilename();
		InputStream is = null;
		String path = request.getRealPath("upload")+"\\"+name;
		try{
			is=avatar_link.getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));

		}catch(Exception e){}
		if(name!=null)
		overseaConfig.setOversea_icon("upload/"+name);
		if(overseaConfig.getId()!=null){
			overseaConfig.setUpdtime(new Date());
		}else{
		overseaConfig.setAddtime(new Date());}
		overseaConfigService.saveOver(overseaConfig);
		return "redirect:/overseaSys/overseaConfig";
	}

	@InitBinder    
	public void initBinder(WebDataBinder binder) {    
		binder.registerCustomEditor(Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));    
	}
}
