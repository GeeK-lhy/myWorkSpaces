package com.oracle.action;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.AccountService;
import com.oracle.service.ChargeService;
import com.oracle.service.MobileService;
import com.oracle.service.UserService;
import com.oracle.vo.Charge;
import com.oracle.vo.ChargeRule;
import com.oracle.vo.Customer;
import com.oracle.vo.Mobile;
import com.oracle.vo.User;

@Controller
public class Actions {
	@Autowired
	UserService us;
	@Autowired
	AccountService as;
	@Autowired
	MobileService ms;
	@Autowired
	ChargeService cs;
	@RequestMapping("/{path}")
	public String getPath(@PathVariable("path") String path) {
		return path;
	}
//	@ModelAttribute
//	public Customer	CustomerModel() {
//		Customer c=new Customer();
//		return c;
//	}
	@RequestMapping(value="/newCustomer")
	public String newCustomer(Map<String,Object>map) {
		if(ms.checkAvailable()==0) {
			map.put("nubmerNum", "没有可用号码");
			
		}return  "newCustomer";
	}
	@RequestMapping(value="/addNewCustomer1")
	public String newCustomer1(String id_Type,String id_Number,Map<String,Object>map) {

		if(!id_Type.equals("") && !id_Number.equals("") ) {
		map.put("id_Type", id_Type);
		map.put("id_Number",id_Number );
		return "newCustomer1";
		}else {
			return "redirect:newCustomer.jsp";
		}
	}

	@RequestMapping(value="/addCustomer2")
	public String addNewCustomer(String id_Type,String id_Number,Customer c,Map<String,Object>map) {
	if(c.getCustomer_Address()!="" && c.getCustomer_Birthday()!="" && c.getCustomer_Name()!="") {
		as.addCustomer(c);
		System.out.println(c.getCustomer_Id());
		map.put("customer_Id", c.getCustomer_Id());
		return "newUser";
		}else {
			map.put("id_Type", id_Type);
			map.put("id_Number",id_Number );
		return "newCustomer1";
		}
	}
	@RequestMapping(value="/mobiles")
	public String addMobileNumber(String mobile_Type,String start,String end) {
		System.out.println(mobile_Type);
		BigInteger b1=new BigInteger(start);
		BigInteger b2=new BigInteger(end);
		BigInteger one=new BigInteger("1");
		for(BigInteger i=b1;i.compareTo(b2)<=0;i=i.add(one)) {
			Map<String,Object>m=new HashMap<>();
			m.put("mobile_Type", mobile_Type);
			StringBuffer sb=new StringBuffer();
			for(int j=0;j<8;j++) {
				sb.append(new Random().nextInt(10));
			}
			System.out.println(i);
			m.put("mobile_Number", i);
			m.put("card_Number", sb.toString());
			ms.addMobiles(m);
		}

		return "redirect:success";
	}
	@RequestMapping("/getCharge")
	public String getCharge(Map<String,Object>map) {
		List<Charge> list=cs.getCharge();
		map.put("charges",list);
		
		return "charge";
	}
	@RequestMapping(value="/updateCharge")
	@ResponseBody
	public String getCharge(String charge,String charge_Code) {
		cs.updateCharge(Integer.valueOf(charge), charge_Code);
		return "收费明细提交成功";
	}
	@RequestMapping(value="/getChargeByCode")
	@ResponseBody
	public String getChargeByCode(String charge_Code) {
		Integer num=cs.getChargeByCode(charge_Code);
		System.out.println(charge_Code);
		System.out.println(num);
		return num.toString();
	}
	@RequestMapping(value="/calculate",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String calculate( String[]checkId,String func_Id,String func_Name) {
		System.out.println(checkId.length);
		Integer num=0;
		for(int i=0;i<checkId.length;i++) {
			num+=cs.getChargeByCode(checkId[i]);
			cs.save(new ChargeRule(func_Id,checkId[i],func_Name));
		}
		return "费用为："+num;
	}
	@RequestMapping(value="/checkNumber",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String checkNumber(String Mobile_Number) {
		if(!Mobile_Number.equals("")) {
		BigInteger l=new BigInteger(Mobile_Number);
		Mobile m=ms.getNumber(l);
		if(m!=null) {
			return "号码可用";
		}else
		return "号码不可用";
	}else {
		return "请输入号码";
	}
  }
	@RequestMapping("/saveUser")
	public String saveUser(User user) {

		us.saveUser(user);
		ms.updateAvailable(user.getMobile_Number());
		return "saveInfo";
	
	}
	
}
