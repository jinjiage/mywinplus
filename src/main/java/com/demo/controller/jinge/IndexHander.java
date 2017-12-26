package com.demo.controller.jinge;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberDepositRecord;
import com.demo.model.MemberProfitRecord;
import com.demo.service.jinge.MemberAccountService;
import com.demo.service.jinge.MemberDepositRecordService;
import com.demo.service.jinge.MemberProfitRecordService;
import com.demo.service.jinge.MemberService;
import com.demo.util.SendMsg;

@Controller
@RequestMapping("/web")
public class IndexHander {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberAccountService memberAccountService;
	@Autowired
	MemberProfitRecordService memberProfitRecordService;
	@Autowired
	MemberDepositRecordService memberDepositRecordService;
	@RequestMapping(value="/regis", method=RequestMethod.GET)
	public String regis(HttpServletRequest request)
	{
		Member member = (Member) request.getSession().getAttribute("members");
		if (member != null) {
			return "redirect:/subject";
		}
		return "/index/register";
	}
	@ResponseBody
	@RequestMapping(value="/regis", method=RequestMethod.POST)
	public Map<String,Object> regis( Integer code, Member member, HttpServletRequest request)
	{
		Integer msg = (Integer) request.getSession().getAttribute("regitmsg");
		System.out.println(code.equals(msg));
		Map<String,Object> map = new HashMap();
		if (msg == null) {
			map.put("msg", "验证码已过期");
		}  else if (!code.equals(msg)) {
			map.put("msg", "手机验证码错误");
		} else {
			map.put("code", 0);	
			member.setCreate_date(new Date());
			memberService.saveMember(member);
			Member members = memberService.selectMemberByPhone(member.getMobile_Phone());
			MemberAccount massages = addMemberAccount(members);
			memberAccountService.saveMemberAccount(massages);
			map.put("msg", "注册成功");
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/valiatorPhone", method=RequestMethod.POST)
	public Map<String,Object>  valiatorPhone(String phone)
	{
		Map<String,Object> map = new HashMap();
		Integer phones = memberService.selectOneMember(phone);
		if (phones!=0){
			map.put("msg", "该手机号已被注册"); 
			map.put("code", 1);
			}else {
			map.put("msg", "可以注册！");
			map.put("code", 0);
			}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/valiatorName", method=RequestMethod.POST)
	public Map<String,Object>  valiatorName(String string)
	{
		Map<String,Object> map = new HashMap();
		Integer names = memberService.selectMemberByName(string);
		if (names!=0){
			map.put("msg", "该用户名已被注册"); 
			map.put("namecode", 1);
			}else {
			map.put("msg", "该用户名可以注册！");
			map.put("namecode", 0);
			}
		return map;
	}
	@ResponseBody
	  @RequestMapping(value="/sendTestValSms", method=RequestMethod.POST)
	  public Map<String,Object> sendTestValSms(String phone,HttpServletRequest request)
	  {
		Map<String,Object> map = new HashMap();
	    String regExp = "^1[3-9][0-9]\\d{8}$";
	    Pattern p = Pattern.compile(regExp);
	    Matcher m = p.matcher(phone);
	    if (!m.find()) {
	    	map.put("msg", "手机号码格式错误");  
	    } else {
	    	Integer regitmsg =  (int) (Math.random()*(9999-1000+1))+1000;
//	    	SendMsg.sendmsg(phone, regitmsg);
	    	request.getSession().setAttribute("regitmsg", regitmsg);
	    	map.put("msg", "验证码短信发送成功");  
	    }
	    return map;
	  }
	  @ResponseBody
	  @RequestMapping(value="/login",method=RequestMethod.POST)
	  public Map<String,Object> login(Member smember,HttpServletRequest request)
	  {
		  Map<String,Object> map = new HashMap();
	      Member member = memberService.selectLogin(smember.getMobile_Phone(),smember.getPassword());
	      if (member != null) {
	      MemberAccount memberAccount =memberAccountService.getMemberAcount(member.getId());
	      MemberProfitRecord  memberProfitRecord  =   memberProfitRecordService.getOne(member.getId());
	      request.getSession().setAttribute("memberInfo", member);
	      request.getSession().setAttribute("memberAccount", memberAccount);
	      request.getSession().setAttribute("memberProfitRecord", memberProfitRecord);
	      map.put("code", 0);
	        map.put("msg", "登录成功");
	      } else {
	        map.put("msg", "用户名或密码错误");
	      }
	     return map;
	  }
	  @RequestMapping(value="/login",method=RequestMethod.GET)
	  public String logins()
	  {
		 return "/index/login";
	  }
	  @RequestMapping(value="/logout", method=RequestMethod.GET)
	  public String logout(HttpServletRequest request)
	  {
		 request.getSession().removeAttribute("memberInfo");
		 request.getSession().removeAttribute("memberAccount");
		 request.getSession().removeAttribute("memberProfitRecord");
	    return "redirect:/web/login";
	  }
	  @RequestMapping(value="/isTrue", method=RequestMethod.GET)
	  public String isTrue(HttpServletRequest request)
	  {
		  Map<String,Object> map = new HashMap();
		  String trader_no = request.getParameter("trader_no");
		  MemberDepositRecord memberDepositRecord = memberDepositRecordService.getOne(trader_no);
		  String amount = memberDepositRecord.getAmount()+"";
		  memberDepositRecord.setStatus(1);
		  memberDepositRecordService.updateStustus(memberDepositRecord);
		  Member member = memberService.selectByPrimaryKey(memberDepositRecord.getMember().getId());
		  MemberAccount memberAccount =memberAccountService.getMemberAcount(member.getId());
		  memberAccount.setUseable_balance(memberAccount.getUseable_balance()+Double.parseDouble(amount));
		  memberAccountService.updateBalance(memberAccount);
	      MemberProfitRecord  memberProfitRecord  =   memberProfitRecordService.getOne(member.getId());
	      request.getSession().setAttribute("memberInfo", member);
	      request.getSession().setAttribute("memberAccount", memberAccount);
	      request.getSession().setAttribute("memberProfitRecord", memberProfitRecord);
	    return "/index/member";
	  }
	  public MemberAccount addMemberAccount(Member member){
		  MemberAccount memberAccount = new MemberAccount();
		  memberAccount.setUseable_balance(0.0);
		  memberAccount.setImuseale_balance(0.0);
		  memberAccount.setTotal_profit(0.0);
		  memberAccount.setCreate_date(new Date());
		  memberAccount.setUpdate_date(new Date());
		  memberAccount.setBbin_amount(8888.8);
		  memberAccount.setMember(member);
		  return memberAccount;
	  }
	  @InitBinder    
	    public void initBinder(WebDataBinder binder) {    
	        binder.registerCustomEditor(Date.class, 
	        		new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));    
	    }
}
