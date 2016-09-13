
package com.sunkun.suncms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.beans.UsersBean;
import com.sunkun.suncms.dao.IUsersDao;
import com.sunkun.suncms.service.IUsersService;

/**
 * 
  * @ClassName: UsersServiceImpl
  * @Description: 
  * @author sunkun
  * @date 2016年9月13日 下午5:13:37
 */
@Service
public class UsersServiceImpl implements IUsersService
{
    @Resource
    private IUsersDao userDao;

    /**
     * 创建会员
     */
    public int addUser(UsersBean bean) throws Exception
    {
        return userDao.insertSelective(bean);
    }

    @Override
    public PageResults<UsersBean> getList(Map<String, Object> map) throws Exception
    {
        PageResults<UsersBean> results = new PageResults<UsersBean>();
        results.setTotal(userDao.getAllCount(map));
        List<UsersBean> list = userDao.getAllList(map);
        results.setList(list);
        return results;
    }

}
