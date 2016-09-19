
package com.sunkun.suncms.dao;

import java.util.List;
import java.util.Map;

/**
 * 
  * @ClassName: IBaseDao
  * @Description: dao公用接口
  * @author sunkun
  * @date 2016年7月11日 下午4:23:34
 */
public interface IBaseDao
{
    /**
     * 
      * @Description: 根据主键查询一条记录
      * @throws
        @author sunkun
     */
    <T> T selectByPrimaryKey(int id) throws Exception;

    /**
     * 
      * @Description: 新增数据
      * @throws
        @author sunkun
     */
    <T> int insertSelective(T t) throws Exception;

    /**
     * 
      * @Description: 获取分页数据
      * @throws
        @author sunkun
     */
    <T> List<T> getAllList(Map<String, Object> map) throws Exception;

    /**
     * 
      * @Description: 获取总记录数
      * @throws
        @author sunkun
     */
    int getAllCount(Map<String, Object> map) throws Exception;

    /**
     * 
      * @Description: 根据主键删除记录
      * @throws
        @author sunkun
     */
    int deleteByPrimaryKey(int id) throws Exception;

    /**
     * 
      * @Description: 根据id删除多条记录
      * @throws
        @author sunkun
     */
    int deleteByIds(List<Integer> list) throws Exception;
    
    int deleteByIds(String ids) throws Exception;

    /**
     * 
      * @Description: 更新记录
      * @throws
        @author sunkun
     */
    <T> int updateByPrimaryKeySelective(T t) throws Exception;
}
