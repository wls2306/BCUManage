package com.bcu.dao;


import com.bcu.entity.Parts;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PartsDao {
    DBUtil util=new DBUtil();
    public ArrayList<Parts> getAllParts()
    {
        ArrayList list3=new ArrayList();
        String sql = "select * from bcu_manage.parts_demo ";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Parts part = new Parts();
                part.setPartsId(rs.getString(1));
                part.setPartsName(rs.getString(2));
                part.setPartsUnit(rs.getString(3));
                part.setPartsNumber(rs.getString(4));
                part.setPartsStock(rs.getString(5));
                part.setPartsStatus(rs.getString(6));
                part.setPartsManager(rs.getString(7));
                part.setPartsLocation(rs.getString(8));
                list3.add(part);

            }
            conn.close();
            return list3 ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean changeCount(String id,String count)
    {
        String sql="update bcu_manage.parts_demo set parts_number=? where parts_id=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,count);
            pstmt.setString(2,id);
            if(pstmt.executeUpdate()>0)
            {
                conn.close();
                return true;
            }
            conn.close();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public int getCount(String partsid)
    {
        int result=-1;
        String sql="select * from bcu_manage.parts_demo where parts_id=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,partsid+"");
            ResultSet rs=pstmt.executeQuery();
            while (rs.next())
            {
                result=rs.getInt(4);
            }
            conn.close();
            return result;
        }catch (Exception e )
        {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean deleteParts(String id) {
        String sql = "delete from bcu_manage.parts_demo where parts_id=?";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            if (pstmt.executeUpdate() > 0) {
                conn.close();
                return true;
            }
            conn.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertParts(String partsId, String partsName, String partsUnit, String partsNumber, String partsStock, String partsStatus, String partsManager, String partsLocation) {
        String sql = "insert into bcu_manage.parts_demo(parts_id,parts_name,parts_unit,parts_number,parts_stock,parts_status,parts_manager,parts_location) values (?,?,?,?,?,?,?,?)";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, partsId);
            pstmt.setString(2, partsName);
            pstmt.setString(3, partsUnit);
            pstmt.setString(4, partsNumber);
            pstmt.setString(5, partsStock);
            pstmt.setString(6, partsStatus);
            pstmt.setString(7, partsManager);
            pstmt.setString(8, partsLocation);

            if (pstmt.executeUpdate() > 0) {
                conn.close();
                return true;
            }
            conn.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
