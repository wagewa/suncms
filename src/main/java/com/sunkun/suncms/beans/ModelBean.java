
package com.sunkun.suncms.beans;

import java.util.Date;

/**
 * 
  * @ClassName: ModelBean
  * @Description: 
  * @author sunkun
  * @date 2016年9月20日 下午6:25:19
 */
public class ModelBean
{
    /**
     * 主键
     */
    private Integer id;

    /**
     * 模型名称
     */
    private String name;

    /**
     * 模型表名
     */
    private String tableName;

    /**
     * 模型列表调用字段
     */
    private String listFields;

    /**
     * 模型介绍
     */
    private String introduce;

    /**
     * 创建时间
     */
    private Date createTime;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getTableName()
    {
        return tableName;
    }

    public void setTableName(String tableName)
    {
        this.tableName = tableName;
    }

    public String getListFields()
    {
        return listFields;
    }

    public void setListFields(String listFields)
    {
        this.listFields = listFields;
    }

    public String getIntroduce()
    {
        return introduce;
    }

    public void setIntroduce(String introduce)
    {
        this.introduce = introduce;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

}
