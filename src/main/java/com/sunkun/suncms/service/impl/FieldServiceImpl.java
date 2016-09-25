
package com.sunkun.suncms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunkun.suncms.beans.FieldBean;
import com.sunkun.suncms.beans.PageResults;
import com.sunkun.suncms.dao.IFieldDao;
import com.sunkun.suncms.service.IFieldService;

@Service
public class FieldServiceImpl implements IFieldService {

	@Resource
	private IFieldDao fieldDao;

	@Override
	public int addField(FieldBean bean) throws Exception {
		return fieldDao.insertSelective(bean);
	}

	@Override
	public int editField(FieldBean bean) throws Exception {
		return fieldDao.updateByPrimaryKeySelective(bean);
	}

	@Override
	public int delField(List<Integer> list) throws Exception {
		return fieldDao.deleteByIds(list);
	}

	@Override
	public PageResults<FieldBean> getAllFieldList(Map<String, Object> map) throws Exception {
		int total = fieldDao.getAllCount(map);
		List<FieldBean> list = fieldDao.getAllList(map);
		PageResults<FieldBean> pageResults = new PageResults<FieldBean>();
		pageResults.setTotal(total);
		pageResults.setRows(list);
		return pageResults;
	}

	@Override
	public FieldBean getField(int id) throws Exception {
		return fieldDao.selectByPrimaryKey(id);
	}

	@Override
	public int insertField(Map<String, Object> map) throws Exception {
		return fieldDao.insertField(map);
	}

	@Override
	public int deleteFieldformodel(Map<String, Object> map) throws Exception {
		return fieldDao.deleteFieldformodel(map);
	}

}
