package com.sunkun.suncms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunkun.suncms.dao.IOmnipotentDao;
import com.sunkun.suncms.service.IOmnipotentService;

@Service
public class OmnipotentServiceImpl implements IOmnipotentService {

	@Resource
	private IOmnipotentDao omnipotentDao;

	@Override
	public int save(Map<String, Object> map) throws Exception {
		return omnipotentDao.insertSelective(map);
	}

	@Override
	public int del(List<Integer> list) throws Exception {
		return omnipotentDao.deleteByIds(list);
	}

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> map) throws Exception {
		return omnipotentDao.getAllList(map);
	}

}
