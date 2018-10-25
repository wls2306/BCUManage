package com.bcu.entity;

/**
 *
 *
 */
public class User {
    private String userName;
    private  String userPassword;
    private  int userType;

    /**
     * userType 设定：
     *  1：教师  可对资产借用进行申请
     *  2. 设备管理员 可对所有资产进行统计查询，对专业秘书发来的采购申请进行审批
     *  3. 专业秘书 可提交采购清单给设备管理员 进行初审核
     *  4. 最高管理员 可审核经由设备管理员审核过得采购申请
     */



    private int userStatus;

    /***
     * 账户状态
     *  默认为1
     */


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

   /*
    public User(String userName, String userPassword, int userType, int userStatus) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userType = userType;
        this.userStatus = userStatus;
    }
    */
}
