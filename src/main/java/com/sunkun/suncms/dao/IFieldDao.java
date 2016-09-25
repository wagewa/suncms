
package com.sunkun.suncms.dao;

import java.util.Map;

public interface IFieldDao extends IBaseDao {

	int insertField(Map<String, Object> map) throws Exception;

	int deleteFieldformodel(Map<String, Object> map) throws Exception;

}
