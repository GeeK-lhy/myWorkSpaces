package com.fh.controller.accident.receiveaccident;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.oracle.service.MyUserService;
import com.oracle.service.ReceiveAccidentMessageService;
import com.oracle.service.SendAccidentService;
import com.oracle.vo.ReceiveAccidentVo;
import com.fh.service.accident.receiveaccident.ReceiveAccidentManager;
import com.fh.service.accident.sentaccident.SentAccidentManager;

/** 
 * 说明：已接收事故报告
 * 创建人：FH Q313596790
 * 创建时间：2019-04-11
 */
@Controller
@RequestMapping(value="/receiveaccident")
public class ReceiveAccidentController extends BaseController {
	
	String menuUrl = "receiveaccident/list.do"; //菜单地址(权限用)
	@Resource(name="receiveaccidentService")
	private ReceiveAccidentManager receiveaccidentService;
	@Autowired
	private ReceiveAccidentMessageService ramService;
	@Resource(name="sentaccidentService")
	private SentAccidentManager sentaccidentService;
	@Autowired
	private SendAccidentService sendService;
	@Autowired
	private MyUserService userService;
	
	@RequestMapping(value="/updateStatusSecond")
	@ResponseBody
	public String updateStatus2(String sendAccidentId,String roleId) {
		int status=Integer.valueOf(roleId);
		sendService.updateStatus(status+2, sendAccidentId);
		return "";
	}
	@RequestMapping(value="/updateStatus")
	@ResponseBody
	public String updateStatus(String sendAccidentId,String roleId) {
		int status=Integer.valueOf(roleId);
		if(status==5) {
			sendService.updateStatus(0, sendAccidentId);
		}else if(status==6) {
			sendService.updateStatus(2, sendAccidentId);
		}
		return "";
	}

	/*
	 * 检查是否收到了新的事故上报
	 */
	@RequestMapping(value="/flushAccident")
	@ResponseBody
	public Object flushAccident(String receiveUser) {
		List<ReceiveAccidentVo> list=ramService.selectByStatus(receiveUser);
		if(list!=null)
		{
			return list;
		}
		return "null";
	}
	
	@RequestMapping(value="/picture")
	public String picture(String path,Map<String,Object>map) {
		String []str=path.split(",");
		List list=new ArrayList();
		for(int i=0;i<str.length;i++) {
			list.add(str[i]);
		}
		map.put("list", list);
		return "accident/receiveaccident/picture";
	}
	
	/**获取地图坐标页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mapXY")
	public ModelAndView mapXY(String zbx,String zby) throws Exception{
		System.out.println(zbx);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("zbx", zbx);
		pd.put("zby", zby);
		mv.setViewName("accident/receiveaccident/mapXY");
		mv.addObject("pd", pd);
		return mv;
	}
	

	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ReceiveAccident");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		receiveaccidentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表SentAccident");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		User user=(User) request.getSession().getAttribute(Const.SESSION_USER);
		pd.put("STATUS",user.getROLE_ID());
		page.setPd(pd);
		List<PageData>	varList = receiveaccidentService.list(page);	//列出列表
/*		for(int i=0;i<varList.size();i++) {
			Set set=varList.get(i).keySet();
			for(Object o:set)
				System.out.println(o);
			
		}*/
		
		mv.setViewName("accident/receiveaccident/receiveaccident_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}
	
	
	
	 /**查看事故
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goCheck(HttpServletRequest request)throws Exception{
		System.out.println(request.getParameter("SENTACCIDENT_ID"));
		ModelAndView mv = this.getModelAndView();
		User user=(User) request.getSession().getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SENTACCIDENT_ID", request.getParameter("SENTACCIDENT_ID"));
		pd = receiveaccidentService.findById(pd);	//根据ID读取
		String ZUOBIAO_Y="";
		String ZUOBIAO_X="";
		if(!pd.getString("ADDRESS").equals(","))
		{ ZUOBIAO_Y=pd.getString("ADDRESS").split(",")[0];
		 ZUOBIAO_X=pd.getString("ADDRESS").split(",")[1];
		}
		pd.put("ZUOBIAO_Y", ZUOBIAO_Y);
		pd.put("ZUOBIAO_X", ZUOBIAO_X);
		
		mv.setViewName("accident/receiveaccident/receiveaccident_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("userRoleId",user.getROLE_ID());
		return mv;
	}	

	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
