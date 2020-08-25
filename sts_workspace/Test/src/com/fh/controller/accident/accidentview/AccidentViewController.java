package com.fh.controller.accident.accidentview;

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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.accident.accidentview.AccidentViewManager;

/** 
 * 说明：事故总览
 * 创建人：FH Q313596790
 * 创建时间：2019-04-29
 */
@Controller
@RequestMapping(value="/accidentview")
public class AccidentViewController extends BaseController {
	
	String menuUrl = "accidentview/list.do"; //菜单地址(权限用)
	@Resource(name="accidentviewService")
	private AccidentViewManager accidentviewService;
	
	
	@RequestMapping(value="/mapXY")
	public ModelAndView mapXY(String zbx,String zby) throws Exception{
		System.out.println(zbx);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("zbx", zbx);
		pd.put("zby", zby);
		mv.setViewName("accident/accidentview/mapXY");
		mv.addObject("pd", pd);
		return mv;
	}
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增AccidentView");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ACCIDENTVIEW_ID", this.get32UUID());	//主键
		accidentviewService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除AccidentView");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		accidentviewService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改AccidentView");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		accidentviewService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表AccidentView");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = accidentviewService.list(page);	//列出AccidentView列表
		mv.setViewName("accident/accidentview/accidentview_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("accident/accidentview/accidentview_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = accidentviewService.findById(pd);	//根据ID读取
		String ZUOBIAO_Y="";
		String ZUOBIAO_X="";
		if(!pd.getString("ADDRESS").equals(","))
		{ ZUOBIAO_Y=pd.getString("ADDRESS").split(",")[0];
		 ZUOBIAO_X=pd.getString("ADDRESS").split(",")[1];
		}
		pd.put("ZUOBIAO_Y", ZUOBIAO_Y);
		pd.put("ZUOBIAO_X", ZUOBIAO_X);
		mv.setViewName("accident/accidentview/accidentview_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除AccidentView");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			accidentviewService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出AccidentView到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("消息标题");	//1
		titles.add("事发");	//2
		titles.add("事发单位");	//3
		titles.add("事故类型");	//4
		titles.add("事故等级");	//5
		titles.add("事发地址");	//6
		titles.add("应急响应等级");	//7
		titles.add("报送时间");	//8
		titles.add("伤亡情况");	//9
		titles.add("经济损失");	//10
		titles.add("事故原因");	//11
		titles.add("图片");	//12
		titles.add("所属单位");	//13
		dataMap.put("titles", titles);
		List<PageData> varOList = accidentviewService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("TIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("SOURCE"));	    //3
			vpd.put("var4", varOList.get(i).getString("ACCIDENTTYPE"));	    //4
			vpd.put("var5", varOList.get(i).getString("GRADE"));	    //5
			vpd.put("var6", varOList.get(i).getString("ADDRESS"));	    //6
			vpd.put("var7", varOList.get(i).getString("RESPONSEGRADE"));	    //7
			vpd.put("var8", varOList.get(i).getString("SENDTIME"));	    //8
			vpd.put("var9", varOList.get(i).getString("CASUALTY"));	    //9
			vpd.put("var10", varOList.get(i).getString("ECONOMICLOSS"));	    //10
			vpd.put("var11", varOList.get(i).getString("REASON"));	    //11
			vpd.put("var12", varOList.get(i).getString("PICADDRESS"));	    //12
			vpd.put("var13", varOList.get(i).getString("UNITS"));	    //13
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
