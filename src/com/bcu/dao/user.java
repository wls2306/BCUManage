package com.bcu.dao;

/**
 *
 *
 */
public class user {
    private String userName;
    private  String userPassword;
    private  String userDep;
    private String userStatus;

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

    public String getUserDep() {
        return userDep;
    }

    public void setUserDep(String userDep) {
        this.userDep = userDep;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public user(String userName, String userPassword, String userDep, String userStatus) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userDep = userDep;
        this.userStatus = userStatus;
    }
}
