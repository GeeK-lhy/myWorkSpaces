package com.fh.controller.accident.sentaccident;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.oracle.vo.SendAccident;
import com.fh.service.accident.sentaccident.SentAccidentManager;

/** 
 * 说明：已发送事故报告
 * 创建人：FH Q313596790
 * 创建时间：2019-04-10
 */
@Controller
@RequestMapping(value="/sentaccident")
public class SentAccidentController extends BaseController {
	
	String menuUrl = "sentaccident/list.do"; //菜单地址(权限用)
	@Resource(name="sentaccidentService")
	private SentAccidentManager sentaccidentService;
	@Autowired
	private SendAccidentService  sendaccidentService;
	@Autowired
	private ReceiveAccidentMessageService raService;
	@Autowired
	private MyUserService userService;
	
	
	
	@RequestMapping(value="/picture")
	public String picture(String path,Map<String,Object>map) {
		String []str=path.split(",");
		List list=new ArrayList();
		for(int i=0;i<str.length;i++) {
			list.add(str[i]);
		}
		map.put("list", list);
		return "accident/sentaccident/picture";
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
		mv.setViewName("accident/sentaccident/mapXY");
		mv.addObject("pd", pd);
		return mv;
	}
	

	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除SentAccident");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		sentaccidentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public String edit(SendAccident sa,String time) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d=sdf.parse(time);
		sa.setTime(d);
		System.out.println(sa.getReceiveUser());
		int status=Integer.valueOf(userService.selectRoleId(sa.getReceiveUser()));
		sa.setStatus(status);
		System.out.println(sa.getTitle());
		sendaccidentService.editSendAccident(sa);;

		return "";
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
		pd.put("SENDUSER",user.getUSER_ID());
		page.setPd(pd);
		List<PageData>	varList = sentaccidentService.list(page);	//列出SentAccident列表
		mv.setViewName("accident/sentaccident/sentaccident_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goCheck(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = sentaccidentService.findById(pd);	//根据ID读取
		String ZUOBIAO_Y="";
		String ZUOBIAO_X="";
		if(!pd.getString("ADDRESS").equals(","))
		{ ZUOBIAO_Y=pd.getString("ADDRESS").split(",")[0];
		 ZUOBIAO_X=pd.getString("ADDRESS").split(",")[1];
		}
		pd.put("ZUOBIAO_Y", ZUOBIAO_Y);
		pd.put("ZUOBIAO_X", ZUOBIAO_X);
		mv.setViewName("accident/sentaccident/sentaccident_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
	
		return mv;
	}	
	

	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除SentAccident");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			sentaccidentService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
