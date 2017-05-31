package main.entry.webapp.active;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import common.helper.AjaxJson;
import common.helper.HttpWebIOHelper;
import common.helper.MyBeanUtils;
import common.helper.StringUtil;
import common.utils.UnicodeUtil;
import database.common.PageDataList;
import database.models.active.Msg;
import database.models.active.People;
import service.basicFunctions.active.MsgService;
import service.basicFunctions.active.PeopleService;

/**
 * 
 * @Description: 活动用戶信息
 * @author 高雄辉
 * @date 2017年1月16日 上午1:30:56
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/active/peopleController")
public class PeopleController {

	@Autowired
	private PeopleService peopleService;
	@Autowired
	private MsgService msgService;
//	@Autowired
//	private ActiveService activeService;

	/**
	 * 
	 * @Description: 活动用戶信息页面
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(path = "/list")
	public String list(HttpServletRequest req, HttpServletResponse res) {
		Integer activeId=Integer.parseInt(req.getParameter("activeId"));
		req.setAttribute("activeId",activeId);
		return "active/peopleList";
	}

	/**
	 * 
	 * @Description: 活动用戶信息列表数据
	 *
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/loadData")
	public void loadData(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String currentPage = req.getParameter("currentPage");
		Integer activeId=Integer.parseInt(req.getParameter("activeId"));
		PageDataList<People> pageDataList = peopleService
				.loadDataByPage(StringUtil.isNotBlank(currentPage) ? Integer.parseInt(currentPage) : 1,activeId);
		for(People people:pageDataList.getList()){
			people.setNickName(UnicodeUtil.unicodeToString(people.getNickName()));
		}
		HttpWebIOHelper._printWebJson(pageDataList, res);
	}

	public static Random random = new Random();

	/**
	 * 
	 * @Description: 添加活动用戶
	 *
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/addOrUpdate")
	public void addOrUpdate(HttpServletRequest req, HttpServletResponse res, People people) throws IOException {
		if (null!=people.getId()) {
			People peopleOld=peopleService.find(people.getId());
			try {
				MyBeanUtils.copyBean2Bean(peopleOld,people);
			} catch (Exception e) {
				e.printStackTrace();
			}
			peopleService.update(people);
		} else {
			people.setAddTime(new Date());
			peopleService.save(people);
		}
		HttpWebIOHelper._printWebJson(AjaxJson.successAjaxJson("修改成功!"), res);
	}
	

	/**
	 * 
	 * @Description: 发送短信
	 *
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/sendMsg")
	public void addOrUpdate(HttpServletRequest req, HttpServletResponse res,String phones,String activeId,String sendContent) throws IOException {
		String[] phoneArray=phones.split("_");
//		Active active = activeService.find(Integer.valueOf(activeId));
		for(String phone:phoneArray){
			Msg msg = new Msg();
			msg.setAddTime(new Date());
			msg.setMobilePhone(phone);
			msg.setSendStatus(0);
			msg.setCode("M621028_M5813068=tfE38Lhd9N03b7");
//			msg.setSendContent("【巾帼园】您已经成功报名"+active.getName()+"活动，请保留此短信至活动结束。退订回复T。");
			msg.setSendContent("【巾帼园】"+sendContent+"退订回复T。");
			msgService.save(msg);
		}
		HttpWebIOHelper._printWebJson(AjaxJson.successAjaxJson("发送成功!"), res);
	}

	/**
	 * 
	 * @Description: 删除活动用戶
	 *
	 * @param req
	 * @param res
	 * @param peopleId
	 */
	@RequestMapping(value = "/del")
	public void del(HttpServletRequest req, HttpServletResponse res, int peopleId) throws IOException {
		peopleService.delete(peopleId);
		HttpWebIOHelper._printWebJson(AjaxJson.successAjaxJson("删除成功!"), res);
	}

	/**
	 * 
	 * @Description: 导出当前活动用户
	 *
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/exportPeoples")
	public void addOrUpdate(HttpServletRequest req, HttpServletResponse res, String activeId) throws IOException {
		List<People> peoples = peopleService.findByHql("from People where type=0 and activeId = '" + activeId + "'");
		String fileName = "活动用户报名表";
		String sheetName = "活动用户报名表";
		if (peoples != null && peoples.size() > 0) {
			sheetName = peoples.get(0).getActiveName() + "_" + sheetName;
			fileName = peoples.get(0).getActiveName() + "_" + fileName;
		}
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet(sheetName);
		sheet.setColumnWidth(0, 256*20);
		sheet.setColumnWidth(1, 256*20);
		sheet.setColumnWidth(2, 256*40);
		sheet.setColumnWidth(3, 256*20);
		sheet.setColumnWidth(4, 256*20);
		
		HSSFRow row = sheet.createRow((int) 0);
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// set date format
		HSSFCellStyle dateFormatCellStyle = wb.createCellStyle();
		HSSFDataFormat format = wb.createDataFormat();
		dateFormatCellStyle.setDataFormat(format.getFormat("yyyy年m月d日  HH点mm分ss秒"));
		dateFormatCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("昵称");
		cell.setCellStyle(style);
		cell = row.createCell((short) 1);
		cell.setCellValue("手机号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 2);
		cell.setCellValue("报名时间");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("活动名称");
		cell.setCellStyle(style);
		cell = row.createCell((short) 4);
		cell.setCellValue("姓名");
		cell.setCellStyle(style);

		for (int i = 0; i < peoples.size(); i++) {
			row = sheet.createRow((int) i + 1);
			People people = peoples.get(i);
			cell=row.createCell((short) 0);
			cell.setCellValue(UnicodeUtil.unicodeToString(people.getNickName()));
			cell.setCellStyle(style);
			cell=row.createCell((short) 1);
			cell.setCellValue(people.getMobiePhone());
			cell.setCellStyle(style);
			cell = row.createCell((short) 2);
			cell.setCellValue(people.getAddTime());
			cell.setCellStyle(dateFormatCellStyle);
			cell=row.createCell((short) 3);
			cell.setCellValue(people.getActiveName());
			cell.setCellStyle(style);
			cell=row.createCell((short) 4);
			cell.setCellValue(people.getName());
			cell.setCellStyle(style);
		}
		// 输出数据流
		try {
			res.setContentType("application/x-download");
			res.setCharacterEncoding("utf-8");
			res.setHeader("Content-Disposition",
					"attachment;filename=" + new String(fileName.getBytes("gbk"), "iso8859-1") + ".xls");
			ServletOutputStream out = res.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
