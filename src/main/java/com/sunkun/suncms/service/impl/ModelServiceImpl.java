
package com.sunkun.suncms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunkun.suncms.beans.ModelBean;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.dao.IModelDao;
import com.sunkun.suncms.service.IModelService;

@Service
public class ModelServiceImpl implements IModelService
{
    @Resource
    private IModelDao modelDao;

    @Override
    public int addModel(ModelBean bean) throws Exception
    {
        return modelDao.insertSelective(bean);
    }

    @Override
    public int editModel(ModelBean bean) throws Exception
    {
        return modelDao.updateByPrimaryKeySelective(bean);
    }

    @Override
    public int delModel(List<Integer> list) throws Exception
    {
        return modelDao.deleteByIds(list);
    }

    @Override
    public PageResults<ModelBean> getAllModel(Map<String, Object> map) throws Exception
    {
        int count = modelDao.getAllCount(map);
        List<ModelBean> list = modelDao.getAllList(map);
        PageResults<ModelBean> pageResults = new PageResults<ModelBean>();
        pageResults.setTotal(count);
        pageResults.setRows(list);
        return pageResults;
    }

}
