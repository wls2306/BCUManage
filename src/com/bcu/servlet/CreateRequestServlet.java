package com.bcu.servlet;

import com.bcu.dao.RequestDao;
import com.bcu.util.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class CreateRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out=resp.getWriter();
        //String reqType,String reqGoalId,String reqGoalName,String reqContent,String reqApprovalLevel,String reqInitiator,String reqPostTime
        String reqType=req.getParameter("type");
        String reqGoalId=req.getParameter("goalid");
        String reqGoalName=req.getParameter("goalname");
        String reqContent=req.getParameter("content");
        String reqApprovalLevel=req.getParameter("level");
        String reqInitiator=req.getParameter("initiator");
        String reqPostTime= util.getTime();

        boolean rs=new RequestDao().insertRequest(reqType, reqGoalId, reqGoalName, reqContent, reqApprovalLevel, reqInitiator, reqPostTime);

        if(rs)
            out.println("您的申请已提交成功，请等待审核！");
        else
            out.println("出现错误！");


    }
}
