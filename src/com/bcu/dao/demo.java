package com.bcu.dao;

import com.bcu.entity.Menu;

import java.util.ArrayList;
import java.util.Iterator;

public class demo {
    public static void main(String[] args) {
       MenuDao m=new MenuDao();
        ArrayList<Menu> list=m.GetMenu();
        Menu menu=list.get(2);
        System.out.println(menu.getMenuName());
        System.out.println(menu.getMenuType());
    }
}
