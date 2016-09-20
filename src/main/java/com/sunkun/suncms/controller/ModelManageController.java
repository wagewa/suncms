
package com.sunkun.suncms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunkun.suncms.beans.ModelBean;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.service.IModelService;

/**
 * 
 * @ClassName: ModelManageController
 * @Description:
 * @author sunkun
 * @date 2016年9月20日 下午5:48:55
 */
@Controller
@RequestMapping("modelManage")
public class ModelManageController {

	@Resource
	private IModelService modelService;

	@RequestMapping("index")
	public String index() {

		return "admin/model/model";
	}

	@ResponseBody
	@RequestMapping("getModelList")
	public PageResults<ModelBean> getModelList(int page, int rows, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", (page - 1) * rows);
		map.put("pageSize", rows);
		map.put("sort", sort);
		map.put("order", order);
		PageResults pageResults = modelService.getAllModel(map);
		return pageResults;
	}

	@ResponseBody
	@RequestMapping("saveModel")
	public int saveModel(ModelBean bean) throws Exception {
		bean.setCreateTime(new Date());
		int i = 0;
		if (bean.getId() != null && bean.getId() > 0)
			i = modelService.editModel(bean);
		else
			i = modelService.addModel(bean);
		return i;
	}

	@ResponseBody
	@RequestMapping("delModel")
	public int delModel(String ids) throws Exception {
		String[] strs = ids.split(",");
		List<Integer> list = new ArrayList<Integer>();
		for (String s : strs) {
			list.add(Integer.parseInt(s));
		}
		int i = modelService.delModel(list);
		return i;
	}
}
