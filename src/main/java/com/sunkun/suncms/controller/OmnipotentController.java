package com.sunkun.suncms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.sunkun.suncms.beans.FieldBean;
import com.sunkun.suncms.beans.ModelBean;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.service.IFieldService;
import com.sunkun.suncms.service.IModelService;
import com.sunkun.suncms.service.IOmnipotentService;
import com.sunkun.suncms.utils.SKutils;

@RequestMapping("omnipotent")
@Controller
public class OmnipotentController {

	@Resource
	private IOmnipotentService omnipotentService;

	@Resource
	private IFieldService fieldService;

	@Resource
	private IModelService modelService;

	@RequestMapping("index")
	public String index(HttpServletRequest request, Integer modelId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", 0);
		map.put("pageSize", 100);
		map.put("sort", "id");
		map.put("order", "asc");
		map.put("modelId", modelId);
		PageResults<FieldBean> pageResults = fieldService.getAllFieldList(map);
		System.out.println(
				JSON.toJSONString(pageResults.getRows()) + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		request.setAttribute("modelId", modelId);
		request.setAttribute("lists", pageResults.getRows());
		return "admin/omnipotent/index";
	}

	@ResponseBody
	@RequestMapping("getList")
	public List<Map<String, Object>> getList(int page, int rows, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", 0);
		map.put("pageSize", 100);
		map.put("sort", sort);
		map.put("order", order);
		//修改modelid 查询表明 查询field字段
		map.put("keys", "id,title");
		map.put("tableName", "sk_news");
		List<Map<String, Object>> list = omnipotentService.getList(map);
		return list;
	}

	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("save")
	public int save(HttpServletRequest request, String keys, Integer modelId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String str = (String) request.getAttribute("keys");
		String[] k = keys.split(",");
		int len = k.length;
		String values = "";
		for (int i = 0; i < len; i++) {
			if (i == len - 1) {
				values = (String) "'" + request.getParameter(k[i]) + "'";
			} else {
				values = (String) "'" + request.getParameter(k[i]) + "',";
			}
		}
		ModelBean modelBean = modelService.getModel(modelId);
		map.put("keys", keys);
		map.put("values", values);
		map.put("tableName", "sk_" + modelBean.getTableName());
		int i = omnipotentService.save(map);
		return i;
	}

	@ResponseBody
	@RequestMapping("del")
	public int del(String ids) throws Exception {
		List<Integer> list = SKutils.StringToList(ids);
		int i = omnipotentService.del(list);
		return i;
	}

}
