package com.bcu.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class util {
    public  static  String getTime()
    {
        SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = tempDate.format(new Date(System.currentTimeMillis()));
        return datetime;
    }
}
