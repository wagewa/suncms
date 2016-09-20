
package com.sunkun.suncms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunkun.suncms.service.IModelService;

/**
 * 
 * @ClassName: AdminIndexController
 * @Description:
 * @author sunkun
 * @date 2016年9月18日 下午12:15:48
 */
@Controller
@RequestMapping("admin")
public class AdminIndexController {

	@Resource
	private IModelService modelService;

	@RequestMapping("index")
	public String index() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", 0);
		map.put("pageSize", 10);
		modelService.getAllModel(map);
		return "admin/index";
	}
}
