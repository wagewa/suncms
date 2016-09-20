
package com.sunkun.suncms.service;

import java.util.List;
import java.util.Map;

import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.beans.UsersBean;

/**
 * 
  * @ClassName: UsersService
  * @Description: 
  * @author sunkun
  * @date 2016年9月13日 下午5:12:31
 */
public interface IUsersService
{
    /**
     * 
      * @Description: 创建会员
      * @throws 
      * @author sunkun
     */
    int addUser(UsersBean bean) throws Exception;

    /**
     * 
      * @Description: 获取会员列表
      * @throws
      * @author sunkun
     */
    PageResults<UsersBean> getList(Map<String, Object> map) throws Exception;

    int delUsers(List<Integer> list) throws Exception;
    
    int editUsers(UsersBean bean) throws Exception;
}
