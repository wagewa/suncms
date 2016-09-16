
package com.sunkun.suncms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.beans.UsersBean;
import com.sunkun.suncms.service.IUsersService;

/**
 * 
  * @ClassName: UsersController
  * @Description: 
  * @author sunkun
  * @date 2016年9月13日 下午5:04:00
 */
@RequestMapping("users")
@Controller
public class UsersController
{

    @Resource
    private IUsersService usersService;
    
    /**
     * 
      * @Description: TODO
      * @throws
      * @author sunkun
     */
    @RequestMapping("userList")
    public String userList()
    {
        System.out.println("用户列表++++++++++++++++++++++++++++++++++++++");
        return "users/list";
    }
    
    @RequestMapping("adminUserList")
    public String adminUserList(){
    	
    	return "admin/users/list";
    }

    /**
     * 
      * @Description: 创建会员 
      * @throws
      * @author sunkun
     */
    @ResponseBody
    @RequestMapping("addUser")
    public String addUser(UsersBean bean) throws Exception
    {
        int i = usersService.addUser(bean);
        System.out.println(i + "=========================================================");
        return "" + i;
    }

    
    
    /**
     * 
      * @throws Exception 
      * @Description:获取会员列表 
      * @throws
      * @author sunkun
     */
    @ResponseBody
    @RequestMapping("getList")
    public PageResults getList(int page , int pageSize) throws Exception
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", (page * pageSize) - pageSize);
        map.put("pageSize", pageSize);
        PageResults<UsersBean> results = usersService.getList(map);
        System.out.println(JSONObject.toJSONString(results) + "======================================");
        return results;
    }
}
