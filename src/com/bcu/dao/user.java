package com.bcu.dao;

/**
 *
 *
 */
public class user {
    private String userName;
    private  String userPassword;
    private  int userType;
    private int userStatus;

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

    public user(String userName, String userPassword, int userType, int userStatus) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userType = userType;
        this.userStatus = userStatus;
    }
}
