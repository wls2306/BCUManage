package com.bcu.dao;

import com.bcu.entity.BrParts;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BrPartRecordDao {

    DBUtil util=new DBUtil();

    public boolean insertParts(String brId, String brgoalId, String brgoalName, String brType, String brInitiator, String brAuditor, String brTime,String brCount) {
        String sql = "insert into bcu_manage.br_parts(br_id,br_goal_id,br_goal_name,br_type,br_initiator,br_auditor,br_time,br_count) values (?,?,?,?,?,?,?,?)";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, brId);
            pstmt.setString(2, brgoalId);
            pstmt.setString(3, brgoalName);
            pstmt.setString(4, brType);
            pstmt.setString(5, brInitiator);
            pstmt.setString(6, brAuditor);
            pstmt.setString(7, brTime);
            pstmt.setString(8, brCount);

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

    public ArrayList<BrParts> serchPartsByName(String name) {
        ArrayList<BrParts> list = new ArrayList<BrParts>();
        String sql = "select * from bcu_manage.br_parts where br_goal_name like ?";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BrParts part = new BrParts();
                part.setBrID(rs.getString(1));
                part.setBrGoalID(rs.getString(2));
                part.setBrGoalName(rs.getString(3));
                part.setBrType(rs.getString(4));
                part.setBrCount(rs.getString(5));
                part.setBrInitiator(rs.getString(6));
                part.setBrAuditor(rs.getString(7));
                part.setBrTime(rs.getString(8));
                list.add(part);
            }
            conn.close();
            return list;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<BrParts> serchPartsByid(String id) {
        ArrayList<BrParts> list = new ArrayList<BrParts>();
        String sql = "select * from bcu_manage.bcu_manage where parts_id like ?";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BrParts part = new BrParts();
                part.setBrID(rs.getString(1));
                part.setBrGoalID(rs.getString(2));
                part.setBrGoalName(rs.getString(3));
                part.setBrType(rs.getString(4));
                part.setBrCount(rs.getString(5));
                part.setBrInitiator(rs.getString(6));
                part.setBrAuditor(rs.getString(7));
                part.setBrTime(rs.getString(8));
                list.add(part);
            }
            conn.close();
            return list;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<BrParts> getAllParts() {
        ArrayList<BrParts> list = new ArrayList<BrParts>();
        String sql = "select * from bcu_manage.bcu_manage";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BrParts part = new BrParts();
                part.setBrID(rs.getString(1));
                part.setBrGoalID(rs.getString(2));
                part.setBrGoalName(rs.getString(3));
                part.setBrType(rs.getString(4));
                part.setBrCount(rs.getString(5));
                part.setBrInitiator(rs.getString(6));
                part.setBrAuditor(rs.getString(7));
                part.setBrTime(rs.getString(8));
                list.add(part);

            }

            conn.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteParts(String id) {
        String sql = "delete from bcu_manage.br_parts where br_id=?";
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


    public boolean changetParts(String brId, String brgoalId, String brgoalName, String brType, String brInitiator, String brAuditor, String brTime,String brCount) {
        String sql = "update bcu_manage.br_parts set br_id=?,br_goal_id=?,br_goal_name=?,br_type=?,br_initiator=?,br_auditor=?,br_time=?,br_count=? where parts_id=?";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, brId);
            pstmt.setString(2, brgoalId);
            pstmt.setString(3, brgoalName);
            pstmt.setString(4, brType);
            pstmt.setString(5, brInitiator);
            pstmt.setString(6, brAuditor);
            pstmt.setString(7, brTime);
            pstmt.setString(8, brCount);
            pstmt.setString(9, brId);
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

    public ArrayList<BrParts> getAllparts() {
        ArrayList<BrParts> list3 = new ArrayList<BrParts>();
        String sql = "select * from bcu_manage.bcu_manage ";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BrParts part = new BrParts();
                part.setBrID(rs.getString(1));
                part.setBrGoalID(rs.getString(2));
                part.setBrGoalName(rs.getString(3));
                part.setBrType(rs.getString(4));
                part.setBrCount(rs.getString(5));
                part.setBrInitiator(rs.getString(6));
                part.setBrAuditor(rs.getString(7));
                part.setBrTime(rs.getString(8));
                list3.add(part);

            }
            conn.close();
            return list3 ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
