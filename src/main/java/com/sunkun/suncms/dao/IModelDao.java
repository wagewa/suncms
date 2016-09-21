
package com.sunkun.suncms.dao;

import java.util.Map;

public interface IModelDao extends IBaseDao
{
    void createModelTables(Map<String, Object> map) throws Exception;

    void delModelTables(Map<String, Object> map) throws Exception;
}
