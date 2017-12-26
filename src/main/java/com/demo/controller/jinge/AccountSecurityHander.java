package com.demo.controller.jinge;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Member;
import com.demo.model.MemberBankcards;
import com.demo.service.jinge.MemberBankCardService;
import com.demo.service.jinge.MemberService;
import com.demo.service.wenlei.MemberBankcardsServices;

@Controller
@RequestMapping("/account/security")
public class AccountSecurityHander {
	@Autowired
	MemberBankCardService memberBankCardService;
	@Autowired
	MemberService memberService;
	@ResponseBody
	@RequestMapping(value="/addBankCard", method=RequestMethod.POST)
	public Map<String,Object> addBankCard(String userName, String identity, String bankCard, String type, String 
			cardaddress ,HttpServletRequest request)
	{
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");
		Map<String,Object> map = new HashMap();
		String reg = "^[1-9][0-9]{5}(19[0-9]{2}|200[0-9]|2010)(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])[0-9]{3}[0-9xX]$";
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(identity);
		if (!matcher.find()) {
			map.put("msg", "身份证格式不正确!");
		} else {
			int[] weights = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
			String[] parityBits = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" };
			int power = 0;
			for (int i = 0; i < 17; i++) {
				power += Integer.parseInt(String.valueOf(identity.charAt(i)), 10) * weights[i];
			}
			if (!parityBits[(power % 11)].equals(identity.substring(17))) {
				map.put("msg", "请输入正确的身份证号码!");
			} else {

				if(crtMember.getIdentity().equals(identity)){
					map.put("msg", "该身份证号码已被使用!");
				}else{
					String reg1 = "^(\\d{16}|\\d{19})$";
					Pattern pattern1 = Pattern.compile(reg1);
					Matcher matcher1 = pattern1.matcher(bankCard);
					if (!matcher1.find()) {
						map.put("msg", "请输入正确的银行卡号!");
					} else {
						MemberBankcards bankcards = memberBankCardService.selectCard(bankCard);
						if(bankcards==null){
							MemberBankcards cardInfo = new MemberBankcards();
							cardInfo.setMember(crtMember);
							cardInfo.setCard_no(bankCard);
							cardInfo.setCreate_date(new Date());
							cardInfo.setUpdate_date(new Date());
							cardInfo.setType(type);
							cardInfo.setCardaddress(cardaddress);
							memberBankCardService.addBankCard(cardInfo);
							map.put("msg", "绑定银行卡成功");
						}else{
							map.put("msg", "银行卡已被使用绑定，绑定失败");
						}
					}
				}

			}
		}
		return map;
	}
	@RequestMapping(value="", method=RequestMethod.GET)
	public String showSecurityInfo(HttpServletRequest request,Map<String,Object> map)
	{
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");
		MemberBankcards memberBankcards = memberBankCardService.getCard(crtMember.getId(), 0);
		map.put("memberBankcards",memberBankcards);
		if (crtMember.getPassword()==null) {
			map.put("password", 0);
		} else {
			map.put("password", 1);
		}
		if (crtMember.getIdentity()==null) {
			map.put("identity", 0);
		} else {
			map.put("identity", 1);
		}
		if (crtMember.getWithdraw_password()==null) {
			map.put("cardpassword", 0);
		} else {
			map.put("cardpassword", 1);
		}
		return "/index/member/safe";
	}
	@RequestMapping(value="/memberBankcardView", method=RequestMethod.GET)
	  public String memberBankcardView(Model model)
	  {
		return "/index/member/BankcardView";
	  }
	@ResponseBody
	@RequestMapping(value="/authentication/changeLoginPwd", method=RequestMethod.POST)
	  public Map<String,Object> changeLoginPwd(@RequestParam("oriPwd") String oriPwd,@RequestParam("newPwd") String newPwd,HttpServletRequest request)
	  {
		Map<String,Object> map = new HashMap();
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");
		if(!crtMember.getPassword().equals(oriPwd)){
			map.put("msg", "密码修改失败");
		}else{
			crtMember.setPassword(newPwd);
			memberService.saveMember(crtMember);
			map.put("msg", "密码修改成功");
		}
		return map;
	  }
}
