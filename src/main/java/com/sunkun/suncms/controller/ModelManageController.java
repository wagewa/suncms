
package com.sunkun.suncms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
  * @ClassName: ModelManageController
  * @Description: 
  * @author sunkun
  * @date 2016年9月20日 下午5:48:55
 */
@Controller
@RequestMapping("modelManage")
public class ModelManageController
{

    @RequestMapping("index")
    public String index()
    {

        return "admin/model/model";
    }
}
