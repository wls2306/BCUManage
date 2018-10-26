package com.bcu.dao;

import com.bcu.entity.Equipment;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EquipmentDao {
      DBUtil util=new DBUtil();

      public boolean insertEquipment(String equId, String equName, String equModel, String equType, String equFormat, String equPrice, String equMainCount, String equTotalPrice, String equUnit, String equTickNo, String equFactory, String equFactoryNo, String equOutFactoryDate, String equBoughtDate, String equUseDirection, String equStatus, String equManager, String equLocation, String equBelong)
      {

          String sql="insert into bcu_manage.equipment (equ_id,equ_name,equ_model,equ_type,equ_format,equ_price,equ_main_count,equ_total_price,equ_unit,equ_tick_no,equ_factory,equ_factory_no,equ_out_factory_date,equ_bought_date," +
                      "equ_use_direction,equ_status,equ_manager,equ_location,equ_belong) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
          Connection conn=util.getConnection();
          try {
              PreparedStatement pstmt=conn.prepareStatement(sql);
              pstmt.setString(1,equId);
              pstmt.setString(2,equName);
              pstmt.setString(3,equModel);
              pstmt.setString(4,equType);
              pstmt.setString(5,equFormat);
              pstmt.setString(6,equPrice);
              pstmt.setString(7,equMainCount);
              pstmt.setString(8,equTotalPrice);
              pstmt.setString(9,equUnit);
              pstmt.setString(10,equTickNo);
              pstmt.setString(11,equFactory);
              pstmt.setString(12,equFactoryNo);
              pstmt.setString(13,equOutFactoryDate);
              pstmt.setString(14,equBoughtDate);
              pstmt.setString(15,equUseDirection);
              pstmt.setString(16,equStatus);
              pstmt.setString(17,equManager);
              pstmt.setString(18,equLocation);
              pstmt.setString(19,equBelong);

              if(pstmt.executeUpdate()>0) {
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




    public ArrayList<Equipment> serchEquipmentByName(String name)
    {
        ArrayList<Equipment> list=new ArrayList<>();
        String sql="select * from bcu_manage.equipment where equ_name like ?";
        Connection conn=util.getConnection();
        try{
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,name);
            ResultSet rs=pstmt.executeQuery();
            while (rs.next())
            {
                Equipment equ=new Equipment();
                equ.setEquId(rs.getString(1));
                equ.setEquName(rs.getString(2));
                equ.setEquModel(rs.getString(3));
                equ.setEquType(rs.getString(4));
                equ.setEquFormat(rs.getString(5));
                equ.setEquPrice(rs.getString(6));
                equ.setEquMainCount(rs.getString(7));
                equ.setEquTotalPrice(rs.getString(8));
                equ.setEquUnit(rs.getString(9));
                equ.setEquTickNo(rs.getString(10));
                equ.setEquFactory(rs.getString(11));
                equ.setEquFactoryNo(rs.getString(12));
                equ.setEquOutFactoryDate(rs.getString(13));
                equ.setEquBoughtDate(rs.getString(14));
                equ.setEquUseDirection(rs.getString(15));
                equ.setEquStatus(rs.getString(16));
                equ.setEquManager(rs.getString(17));
                equ.setEquLocation(rs.getString(18));
                equ.setEquBelong(rs.getString(19));
                equ.setEquUser(rs.getString(20 ));
                list.add(equ);
            }
            conn.close();
            return list;
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }


    public ArrayList<Equipment> serchEquipmentById(String id)
    {
        ArrayList<Equipment> list=new ArrayList<>();
        String sql="select * from bcu_manage.equipment where equ_id= ?";
        Connection conn=util.getConnection();
        try{
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,id);
            ResultSet rs=pstmt.executeQuery();
            while (rs.next())
            {
                Equipment equ=new Equipment();
                equ.setEquId(rs.getString(1));
                equ.setEquName(rs.getString(2));
                equ.setEquModel(rs.getString(3));
                equ.setEquType(rs.getString(4));
                equ.setEquFormat(rs.getString(5));
                equ.setEquPrice(rs.getString(6));
                equ.setEquMainCount(rs.getString(7));
                equ.setEquTotalPrice(rs.getString(8));
                equ.setEquUnit(rs.getString(9));
                equ.setEquTickNo(rs.getString(10));
                equ.setEquFactory(rs.getString(11));
                equ.setEquFactoryNo(rs.getString(12));
                equ.setEquOutFactoryDate(rs.getString(13));
                equ.setEquBoughtDate(rs.getString(14));
                equ.setEquUseDirection(rs.getString(15));
                equ.setEquStatus(rs.getString(16));
                equ.setEquManager(rs.getString(17));
                equ.setEquLocation(rs.getString(18));
                equ.setEquBelong(rs.getString(19));
                equ.setEquUser(rs.getString(20));
                list.add(equ);
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
