package com.bcu.servlet;

import com.bcu.dao.RequestDao;
import com.bcu.util.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.io.PrintWriter;

public class ChangeRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out=resp.getWriter();
        String type=req.getParameter("type");

        /**
         * 规定 type
         * 1.同意请求
         * 2.否决请求
         * 3.转移上级
         */



        String status=req.getParameter("status");
        String id=req.getParameter("id");
        String auditor=req.getParameter("auditor");
        String back=req.getParameter("back");
        String level=req.getParameter("level");
        String time= util.getTime();

        System.out.println("CR:"+type);
        System.out.println("CR:"+id);
        System.out.println(auditor);




        switch (type)
        {
            case "1":
                boolean rs=new RequestDao().agreeRequest( id, back, auditor, time);
                if(rs)
                    out.println("提交成功");
                else
                    out.println("提交失败");

                break;
            case "2":
                boolean rs2=new RequestDao().rejectRequest(id, back, auditor, time);
                if(rs2)
                    out.println("提交成功");
                else
                    out.println("提交失败");
                break;
            case "3":
                boolean rs3=new RequestDao().upRequestLevel(id, back, auditor, time, level);
                if (rs3)
                    out.println("提交成功");
                else
                    out.println("提交失败");
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
