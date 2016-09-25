package com.sunkun.suncms.service;

import java.util.List;
import java.util.Map;

public interface IOmnipotentService {

	int save(Map<String, Object> map) throws Exception;

	int del(List<Integer> list) throws Exception;

	List<Map<String, Object>> getList(Map<String, Object> map) throws Exception;

}
