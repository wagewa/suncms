
package com.sunkun.suncms.beans;

import java.util.Date;

/**
 * 
  * @ClassName: FieldBean
  * @Description: 
  * @author sunkun
  * @date 2016年9月21日 下午3:03:00
 */
public class FieldBean
{
    private Integer id;

    private Integer modelId;

    /**
     * 字段类型
     */
    private String type;

    /**
     * 字段名
     */
    private String name;

    /**
     * 字段别名
     */
    private String alias;

    /**
     * 是否必填
     */
    private Integer isRequired;

    /**
     * 验证失败提示
     */
    private String errorInfo;

    private Date createTime;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getModelId()
    {
        return modelId;
    }

    public void setModelId(Integer modelId)
    {
        this.modelId = modelId;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getAlias()
    {
        return alias;
    }

    public void setAlias(String alias)
    {
        this.alias = alias;
    }

    public Integer getIsRequired()
    {
        return isRequired;
    }

    public void setIsRequired(Integer isRequired)
    {
        this.isRequired = isRequired;
    }

    public String getErrorInfo()
    {
        return errorInfo;
    }

    public void setErrorInfo(String errorInfo)
    {
        this.errorInfo = errorInfo;
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
