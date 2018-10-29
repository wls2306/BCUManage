package com.bcu.dao;

import com.bcu.entity.Menu;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class demo {
    public static void main(String[] args) {
        SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = tempDate.format(new Date(System.currentTimeMillis()));

    }
}
