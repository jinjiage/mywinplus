package com.demo.controller.jinge;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.demo.model.FinanceProductFunds;
import com.demo.model.FinanceProductSubscribe;
import com.demo.model.Member;
import com.demo.model.SysType;
import com.demo.service.jinge.FinanceProductFundsService;
import com.demo.service.jinge.FinanceProductSubscribeService;
import com.demo.service.jinge.MemberService;
import com.demo.service.jinge.SysTypeService;


@Controller
@RequestMapping("/financeProductFunds")
public class FinanceProductFundsHander {
	@Autowired
	FinanceProductFundsService financeProductFundsService;
	@Autowired
	SysTypeService sysTypeService;
	@Autowired
	FinanceProductSubscribeService financeProductSubscribeService;
	@Autowired
	MemberService  memberService;
	@RequestMapping("/financelist")
	public String indexlist(Map<String,Object> map){
		List<FinanceProductFunds> financeProductFundsList = financeProductFundsService.findFinanceProductFundsList();
		map.put("financeProductFundsList", financeProductFundsList);
		return "index/finance";
	}
	@RequestMapping("/list")
	public String list(FinanceProductFunds financeProductFunds, @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="3") Integer pageSize, Model model) { 
		Page finance =	financeProductFundsService.getfinanceProductFunds(financeProductFunds,page,pageSize) ;
		List<Object[]> counts = financeProductSubscribeService.getCount();
		List<SysType> financestaus = sysTypeService.find("financestaus");
		List<SysType> financetype = sysTypeService.find("financeproducttype");
		model.addAttribute("finance",finance);
		model.addAttribute("counts",counts);
		model.addAttribute("financestaus",financestaus);
		model.addAttribute("financetype",financetype);
		model.addAttribute("financeProductFunds",financeProductFunds);
		return "/main/finance/financeProductFunds";
	}
	@RequestMapping(value="/addFinanceProductFundsPage", method=RequestMethod.GET)
	public String toadd(Model model)
	{
		List<SysType> financestaus = sysTypeService.find("financestaus");
		List<SysType> financetype = sysTypeService.find("financeproducttype");
		model.addAttribute("financestaus",financestaus);
		model.addAttribute("financetype",financetype);
		return "/main/finance/addFinanceProductFunds";
	}
	@RequestMapping(value="/addFinanceProductFunds", method=RequestMethod.POST)
	public String addFinanceProductFunds(@RequestParam CommonsMultipartFile avatar_link,FinanceProductFunds financeProductFunds, HttpServletRequest request)
	{	 
		String name = avatar_link.getOriginalFilename();
		InputStream is = null;
		String path = request.getRealPath("upload")+"\\"+name;
		try{
			is=avatar_link.getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));

		}catch(Exception e){}
		financeProductFunds.setProduct_manager_pic("upload"+name);
		financeProductFunds.setCreate_date(new Date());
		financeProductFundsService.addFinanceProductFunds(financeProductFunds);
		return "redirect:/financeProductFunds/list";
	}
	@RequestMapping(value="/updateFinanceProductFunds", method=RequestMethod.POST)
	public String updateFinanceProductFunds(@RequestParam CommonsMultipartFile avatar_link,FinanceProductFunds financeProductFunds, HttpServletRequest request)
	{	 
		String name = avatar_link.getOriginalFilename();
		InputStream is = null;
		String path = request.getRealPath("upload")+"\\"+name;
		try{
			is=avatar_link.getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));

		}catch(Exception e){}
		if(name!=null)
			financeProductFunds.setProduct_manager_pic("upload"+name);
		financeProductFunds.setUpdate_date(new Date());
		financeProductFundsService.updateFinanceProductFunds(financeProductFunds);
		return "redirect:/financeProductFunds/list";
	}
	@RequestMapping(value="/editFinanceProductFundsPage/{financeProductFundsId}", method=RequestMethod.GET)
	public String editPage(@PathVariable int financeProductFundsId, Model model, HttpServletRequest request)
	{
		FinanceProductFunds financeProductFunds = financeProductFundsService.selectByProductId(financeProductFundsId);
		List<SysType> financestaus = sysTypeService.find("financestaus");
		List<SysType> financetype = sysTypeService.find("financeproducttype");
		model.addAttribute("financestaus",financestaus);
		model.addAttribute("financetype",financetype);
		model.addAttribute("financeProductFunds", financeProductFunds);
		return "/main/finance/editfinanceProductFunds";
	}
	@RequestMapping("/financeProductSubscribe")
	public String financeProductSubscribe(Integer financeProductFundsId, @RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize, Model model)
	{
		Page financeProductFundsPage = financeProductSubscribeService.getPageFinanceProductSubscribe(page, pageSize, financeProductFundsId);

		List<SysType> financesubscribestatus = sysTypeService.find("financeproductsubscribestatus");
		model.addAttribute("financesubscribestatus", financesubscribestatus);
		model.addAttribute("financeProductFundsPage", financeProductFundsPage);
		model.addAttribute("financeProductFundsId", financeProductFundsId);
		return "/main/finance/financeProductSubscribe";
	}
	@RequestMapping(value="/addContractView/{id}", method=RequestMethod.GET)
	public String addContractView(@PathVariable("id") Integer id, Model model)
	{
		FinanceProductSubscribe financeProductSubscribe = financeProductSubscribeService.selectByPrimaryKey(id);
		Member member = memberService.selectByPrimaryKey(financeProductSubscribe.getMember_id());

		model.addAttribute("financeProductSubscribe", financeProductSubscribe);
		model.addAttribute("member", member);
		return "/main/finance/addcontractview";
	}
	@ModelAttribute
	public void getUser(@RequestParam(value="id",required=false) Integer id, 
			Map<String, Object> map){
		if(id != null){
			FinanceProductSubscribe financeProductSubscribe = financeProductSubscribeService.selectByPrimaryKey(id);
			map.put("financeProductSubscribe", financeProductSubscribe);
		}
	}
	@RequestMapping(value="/addContract", method=RequestMethod.POST)
	public String addContract(@RequestParam(value="files") MultipartFile files[] ,@ModelAttribute FinanceProductSubscribe financeProductSubscribe, HttpServletRequest request)
	{
		Member member = (Member)this.memberService.selectByPrimaryKey(financeProductSubscribe.getMember_id());
		String commentt = files[0].getOriginalFilename(); 
		String risk_reveal = files[1].getOriginalFilename();
		financeProductSubscribe.setCommentt("upload"+commentt);
		financeProductSubscribe.setRisk_reveal("upload"+risk_reveal);
		String path = request.getRealPath("upload")+"\\"+commentt;
		String path1 = request.getRealPath("upload")+"\\"+risk_reveal;
		InputStream is = null;
		try{
			is=files[0].getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path));
			is=files[1].getInputStream();
			FileUtils.copyInputStreamToFile(is, new File(path1));
		}catch(Exception e){}
		financeProductSubscribe.setUpdate_date(new Date());
		financeProductSubscribe.setStatus(1);
		Integer id = financeProductSubscribe.getProduct_id();
		financeProductSubscribeService.saveFinance(financeProductSubscribe);
		return "redirect:/financeProductFunds/financeProductSubscribe?financeProductFundsId="+id;
	}
	 @RequestMapping("/signedError/{id}")
	  public String signedError(@PathVariable("id") Integer id)
	  {
	    FinanceProductSubscribe subscribe = financeProductSubscribeService.selectByPrimaryKey(id);
	    Integer ids = subscribe.getProduct_id();
	    subscribe.setStatus(3);
		financeProductSubscribeService.saveFinance(subscribe);
		return "redirect:/financeProductFunds/financeProductSubscribe?financeProductFundsId="+ids;

	  }
	@InitBinder    
	public void initBinder(WebDataBinder binder) {    
		binder.registerCustomEditor(Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));    
	}
}
