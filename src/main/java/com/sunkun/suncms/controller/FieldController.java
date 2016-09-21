
package com.sunkun.suncms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunkun.suncms.beans.FieldBean;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.service.IFieldService;
import com.sunkun.suncms.utils.SKutils;

/**
 * 
  * @ClassName: FieldController
  * @Description: 
  * @author sunkun
  * @date 2016年9月21日 下午3:53:32
 */
@Controller
@RequestMapping("field")
public class FieldController
{
    @Resource
    private IFieldService fieldService;

    public String index(int modelId)
    {
        return "admin/model/field";
    }

    @ResponseBody
    @RequestMapping("getFeildList")
    public PageResults<FieldBean> getFeildList(int page , int rows , String sort , String order , Integer modelId)
            throws Exception
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", (page - 1) * rows);
        map.put("pageSize", rows);
        map.put("sort", sort);
        map.put("order", order);
        if (modelId != null && modelId > 0)
        {
            map.put("modelId", modelId);
        }
        PageResults<FieldBean> pageResults = fieldService.getAllFieldList(map);
        return pageResults;
    }

    @ResponseBody
    @RequestMapping("saveField")
    public int saveField(FieldBean bean) throws Exception
    {
        int i = 0;
        if (bean.getId() != null && bean.getId() > 0)
        {
            i = fieldService.editField(bean);
        }
        else
        {
            i = fieldService.addField(bean);
        }
        return i;
    }

    @RequestMapping("delField")
    public int delField(String ids) throws Exception
    {
        List<Integer> list = SKutils.StringToList(ids);
        int i = fieldService.delField(list);
        return i;
    }

}
