
package com.sunkun.suncms.beans;

import java.util.List;

/**
 * 
  * @ClassName: PageResults
  * @Description: 
  * @author Administrator
  * @date 2016年7月26日 上午11:12:12
  * @param <T>
 */
public class PageResults<T>
{
    /**
     * 总记录数
     */
    private Integer total;

    /**
     * 数据列表
     */
    private List<T> list;

    /**
     * 消息
     */
    private String message;

    public Integer getTotal()
    {
        return total;
    }

    public void setTotal(Integer total)
    {
        this.total = total;
    }

    public List<T> getList()
    {
        return list;
    }

    public void setList(List<T> list)
    {
        this.list = list;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

}
