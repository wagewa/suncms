
package com.sunkun.suncms.service;

import java.util.List;
import java.util.Map;

import com.sunkun.suncms.beans.FieldBean;
import com.sunkun.suncms.beans.PageResults;

public interface IFieldService {
	int addField(FieldBean bean) throws Exception;

	int editField(FieldBean bean) throws Exception;

	int delField(List<Integer> list) throws Exception;

	PageResults<FieldBean> getAllFieldList(Map<String, Object> map) throws Exception;

	FieldBean getField(int id) throws Exception;

	int insertField(Map<String, Object> map) throws Exception;

	int deleteFieldformodel(Map<String, Object> map) throws Exception;
}
