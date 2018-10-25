package com.bcu.dao;

import com.bcu.entity.User;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/***
 *
 */
public class UserDao {
    DBUtil util=new DBUtil();
    User user=new User();


    public boolean checkUser(String username,String pwd)
    {
        String sql="select * from bcu_manage.user where user_name=? and user_pwd=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,pwd);
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()) {
                conn.close();
                return true;
            }
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;

    }

    public User getUser(String username,String pwd)
    {
        String sql="select * from bcu_manage.user where user_name=? and user_pwd=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,pwd);
            ResultSet rs=pstmt.executeQuery();
           while (rs.next())
           {
              user.setUserName(rs.getString(1));
              user.setUserPassword(rs.getString(2));
              user.setUserStatus(rs.getInt(3));
              user.setUserType(rs.getInt(4));

           }
           conn.close();
           return user;

        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }


}
