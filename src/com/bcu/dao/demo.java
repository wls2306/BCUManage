package com.bcu.dao;

public class demo {
    public static void main(String[] args) {
        UserDao u=new UserDao();
        boolean p=u.checkUser("admin","123456");
        System.out.println(p);
    }
}
