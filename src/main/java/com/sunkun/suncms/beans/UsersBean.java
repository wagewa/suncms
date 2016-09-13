
package com.sunkun.suncms.beans;

import java.util.Date;

/**
 * 
  * @ClassName: UsersBean
  * @Description: 
  * @author sunkun
  * @date 2016年9月13日 下午4:53:56
 */
public class UsersBean
{
    private Integer id;

    /**
     * 用户登陆名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 性别(0保密,1男,2女)
     */
    private Integer sex;

    /**
     * 出生日期
     */
    private Date birthday;

    /**
     * 会员积分等级
     */
    private Integer rankPoints;

    /**
     * 注册时间
     */
    private Date regTime;

    /**
     * 最后一次登陆时间
     */
    private Date lastTime;

    /**
     * 最后一次登陆ip
     */
    private String lastIp;

    /**
     * 昵称
     */
    private String alias;

    /**
     * 办公电话 
     */
    private String officePhone;

    /**
     * 是否生效
     */
    private Integer isValidated;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Integer getSex()
    {
        return sex;
    }

    public void setSex(Integer sex)
    {
        this.sex = sex;
    }

    public Date getBirthday()
    {
        return birthday;
    }

    public void setBirthday(Date birthday)
    {
        this.birthday = birthday;
    }

    public Integer getRankPoints()
    {
        return rankPoints;
    }

    public void setRankPoints(Integer rankPoints)
    {
        this.rankPoints = rankPoints;
    }

    public Date getRegTime()
    {
        return regTime;
    }

    public void setRegTime(Date regTime)
    {
        this.regTime = regTime;
    }

    public Date getLastTime()
    {
        return lastTime;
    }

    public void setLastTime(Date lastTime)
    {
        this.lastTime = lastTime;
    }

    public String getLastIp()
    {
        return lastIp;
    }

    public void setLastIp(String lastIp)
    {
        this.lastIp = lastIp;
    }

    public String getAlias()
    {
        return alias;
    }

    public void setAlias(String alias)
    {
        this.alias = alias;
    }

    public String getOfficePhone()
    {
        return officePhone;
    }

    public void setOfficePhone(String officePhone)
    {
        this.officePhone = officePhone;
    }

    public Integer getIsValidated()
    {
        return isValidated;
    }

    public void setIsValidated(Integer isValidated)
    {
        this.isValidated = isValidated;
    }

}
