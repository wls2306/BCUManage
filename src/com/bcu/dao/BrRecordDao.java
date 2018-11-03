package com.bcu.dao;

import com.bcu.entity.BrRecord;
import com.bcu.entity.Equipment;
import com.bcu.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

public class BrRecordDao {
    DBUtil util=new DBUtil();
    public boolean insertRecord(String goalId,String goalName,String type,String initiator,String auditor,String time)
    {
        String sql="insert into bcu_manage.br_record (br_goal_id,br_goal_name,br_type,br_initiator,br_auditor,br_time)" +
                "values (?,?,?,?,?,?)";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,goalId);
            pstmt.setString(2,goalName);
            pstmt.setString(3,type);
            pstmt.setString(4,initiator);
            pstmt.setString(5,auditor);
            pstmt.setString(6,time);
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


    public ArrayList<BrRecord> getAllBrRecordById(String id)
    {
        String sql="select * from bcu_manage.br_record where br_goal_id=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,id);
            ResultSet rs=pstmt.executeQuery();
            BrRecord br=new BrRecord();
            ArrayList<BrRecord> list= new ArrayList<BrRecord>();
            while (rs.next())
            {
                br.setBrId(rs.getString("br_id"));
                br.setBrGoalId(rs.getString("br_goal_id"));
                br.setBrGoalName(rs.getString("br_goal_name"));
                br.setBrType(rs.getString("br_type"));
                br.setBrInitiator(rs.getString("br_initiator"));
                br.setBrAuditor(rs.getString("br_auditor"));
                br.setBrTime(rs.getString("br_time"));
                list.add(br);
            }
            return list;
        }catch (Exception e)
        {
            e.printStackTrace();
        }
          return null;
    }
}
