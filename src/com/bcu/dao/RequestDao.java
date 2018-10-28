package com.bcu.dao;

import com.bcu.entity.Request;
import com.bcu.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RequestDao {
    DBUtil util=new DBUtil();
    public boolean insertRequest(String reqType,String reqGoalId,String reqGoalName,String reqContent,String reqApprovalLevel,String reqInitiator,String reqPostTime)
    {
        String sql="insert into bcu_manage.request (req_type,req_goal_id,req_goal_name,req_content,req_approval_level,req_status,req_initiator,req_post_time) values (?,?,?,?,?,?,?,?)";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,reqType);
            pstmt.setString(2,reqGoalId);
            pstmt.setString(3,reqGoalName);
            pstmt.setString(4,reqContent);
            pstmt.setString(5,reqApprovalLevel);
            pstmt.setString(6,"0");
            pstmt.setString(7,reqInitiator);
            pstmt.setString(8,reqPostTime);
            if (pstmt.executeUpdate()>0)
            {
                conn.close();
                return true;
            }
            conn.close();
        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return  false;
    }


    public ArrayList<Request> getRequestByLevel(String level)
    {
        ArrayList<Request> list=new ArrayList<Request>();
        String sql="select * from bcu_manage.request where req_approval_level=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,level);
            ResultSet rs= pstmt.executeQuery();
            while (rs.next())
            {
                Request req=new Request();
                req.setReqId(rs.getString(1));
                req.setReqType(rs.getString(2));
                req.setReqGoalId(rs.getString(3));
                req.setReqGoalName(rs.getString(4));
                req.setReqContent(rs.getString(5));
                req.setReqApprovalLevel(rs.getString(6));
                req.setReqStatus(rs.getString(7));
                req.setReqBack(rs.getString(8));
                req.setReqInitiator(rs.getString(9));
                req.setReqAuditor(rs.getString(10));
                req.setReqPostTime(rs.getString(11));
                req.setReqHandleTime(rs.getString(12));
                list.add(req);
            }
            conn.close();
            return list;
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }


    public ArrayList<Request> getRequestByInitiator(String username)
    {
        ArrayList<Request> list=new ArrayList<Request>();
        String sql="select * from bcu_manage.request where req_initiator=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,username);
            ResultSet rs= pstmt.executeQuery();
            while (rs.next())
            {
                Request req=new Request();
                req.setReqId(rs.getString(1));
                req.setReqType(rs.getString(2));
                req.setReqGoalId(rs.getString(3));
                req.setReqGoalName(rs.getString(4));
                req.setReqContent(rs.getString(5));
                req.setReqApprovalLevel(rs.getString(6));
                req.setReqStatus(rs.getString(7));
                req.setReqBack(rs.getString(8));
                req.setReqInitiator(rs.getString(9));
                req.setReqAuditor(rs.getString(10));
                req.setReqPostTime(rs.getString(11));
                req.setReqHandleTime(rs.getString(12));
                list.add(req);
            }
            conn.close();
            return list;
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public boolean agreeRequest(String id,String back,String auditor,String time)
    {
        String sql="update bcu_manage.request set req_status='1',req_back=?,req_auditor=?,req_handle_time where req_id=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,back);
            pstmt.setString(2,auditor);
            pstmt.setString(3,time);
            pstmt.setString(4,id);

            if(pstmt.executeUpdate()>0)
            {
                conn.close();
                return true;
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }


    public boolean rejectRequest(String id,String back,String auditor,String time)
    {
        String sql="update bcu_manage.request set req_status='-1',req_back=?,req_auditor=?,req_handle_time where req_id=?";
        Connection conn=util.getConnection();
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,back);
            pstmt.setString(2,auditor);
            pstmt.setString(3,time);
            pstmt.setString(4,id);
            if(pstmt.executeUpdate()>0)
            {
                conn.close();
                return true;
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean upRequestLevel(String id,String back,String auditor,String time,String level) {
        String sql = "update bcu_manage.request set req_stasus='2',req_back=?,req_auditor=?,req_handle_time=?,req_approval_level=? where req_id=?";
        Connection conn = util.getConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, back);
            pstmt.setString(2, auditor);
            pstmt.setString(3, time);
            pstmt.setString(4, level);
            pstmt.setString(5,id);
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
