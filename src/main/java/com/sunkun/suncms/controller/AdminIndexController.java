
package com.sunkun.suncms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
  * @ClassName: AdminIndexController
  * @Description: 
  * @author sunkun
  * @date 2016年9月18日 下午12:15:48
 */
@Controller
@RequestMapping("admin")
public class AdminIndexController
{
    @RequestMapping("index")
    public String index(){
        
        return "admin/index";
    }
}
