package com.bcu.dao;

import com.bcu.entity.Menu;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MenuDao {
    DBUtil util=new DBUtil();


    public ArrayList<Menu> GetMenu()
    {
        ArrayList<Menu> list=new ArrayList<Menu>();
        String sql="select * from bcu_manage.menu";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while (rs.next())
            {
                Menu menu=new Menu();
                menu.setMenuId(rs.getString(1));
                menu.setMenuName(rs.getString(2));
                menu.setMenuType(rs.getString(3));
                menu.setMenuStatus(rs.getString(4));
                menu.setMenuUrl(rs.getString(5));
                list.add(menu);
            }
                conn.close();
                return list;
        }catch (Exception e)
        {
            e.printStackTrace();
        }

            return null;

    }

}
