package com.fh.controller.accident.accidenthandle;

import java.io.PrintWriter;
import java.text.DateFormat;
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
import com.oracle.service.AccidentService;
import com.oracle.service.MyUserService;
import com.oracle.service.ReceiveAccidentMessageService;
import com.oracle.service.SendAccidentService;
import com.oracle.vo.Accident;
import com.oracle.vo.ReceiveAccidentVo;
import com.oracle.vo.SendAccident;
import com.fh.service.accident.accidenthandle.AccidentHandleManager;
import com.fh.service.accident.sentaccident.impl.SentAccidentService;

/** 
 * 说明：事故处理
 * 创建人：FH Q313596790
 * 创建时间：2019-04-09
 */

@Controller
@RequestMapping(value="/accidenthandle")
public class AccidentHandleController extends BaseController {
	
	String menuUrl = "accidenthandle/list.do"; //菜单地址(权限用)
	@Resource(name="accidenthandleService")
	private AccidentHandleManager accidenthandleService;
	@Autowired
	private SendAccidentService  sendaccidentService;
	@Autowired
	private ReceiveAccidentMessageService raService;
	@Autowired
	private MyUserService muservice;
	@Autowired
	private AccidentService accidentService;
	@Autowired
	private ReceiveAccidentMessageService ramService;
	/**获取地图坐标页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mapXY")
	public ModelAndView mapXY() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("accident/accidenthandle/mapXY");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	
	@RequestMapping(value="/sendMessage")
	public String sendAccident(SendAccident sa,String time) throws Exception {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d=sdf.parse(time);
		
		sa.setTime(d);
	//	logBefore(logger, Jurisdiction.getUsername()+"新增SentAccident");
		System.out.println(sa.getTime());
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		//sa.setTime(new SimpleDateFormat(time));
		int status=Integer.valueOf(muservice.selectRoleId(sa.getReceiveUser()));
		
		sa.setStatus(status);
		sendaccidentService.insertSendAccident(sa);

		return "accident/accidenthandle/accidenthandle_list";
		
	}
	@RequestMapping(value="getLeader")
	@ResponseBody
	public List<Map<String,Object>> getLeader(String unit,String roleid){
		List<Map<String,Object>>list=muservice.selectLeder(unit, roleid);
		System.out.println("------------------------------------"+list.size());
		return list;
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(Accident accident) throws Exception{
		System.out.println(accident.getTime());
		accidentService.saveAccident(accident);
		return "";
	}
	


	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表AccidentHandle");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		User user=(User) request.getSession().getAttribute(Const.SESSION_USER);
		page.setPd(pd);
		List<PageData>	varList = accidenthandleService.list(page);	//列出AccidentHandle列表
		mv.setViewName("accident/accidenthandle/accidenthandle_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("userid",user.getUSER_ID());
		return mv;
	}
	
	
	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
