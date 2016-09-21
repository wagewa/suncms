
package com.sunkun.suncms.service;

import java.util.List;
import java.util.Map;

import com.sunkun.suncms.beans.ModelBean;
import com.sunkun.suncms.beans.PageResults;

public interface IModelService
{
    int addModel(ModelBean bean) throws Exception;

    int editModel(ModelBean bean) throws Exception;

    int delModel(List<Integer> list) throws Exception;

    PageResults<ModelBean> getAllModel(Map<String, Object> map) throws Exception;

    int createTables(Map<String, Object> map);

    int delTables(Map<String, Object> map);

    ModelBean getModel(int id) throws Exception;
}
