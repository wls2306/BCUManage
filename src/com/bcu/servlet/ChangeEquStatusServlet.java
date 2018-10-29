package com.bcu.servlet;

import com.bcu.dao.EquipmentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ChangeEquStatusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out=resp.getWriter();

        /***
         * 规定：type
         * 1. 直接更改状态
         * 2. 占用资产，并录入使用者
         * 3. 删除资产信息
         */

        String type=req.getParameter("type");
        String id=req.getParameter("id");
        String user=req.getParameter("user");
        String status=req.getParameter("status");

        System.out.println(user);
       switch (type){
           case "1":
               boolean rs=new EquipmentDao().changeEquipmentStatus(id,status);
               if(rs)
                   out.println("修改成功");
               else
                   out.println("修改失败");
               break;
           case "2":
               boolean rs2=new EquipmentDao().useEquipment(id,user);
               if(rs2)
                   out.println("修改成功");
               else
                   out.println("修改失败");
               break;

           case "3":
               boolean rs3=new EquipmentDao().deleteEquipment(id);
               if (rs3)
                   out.println("删除成功");
              else
                   out.println("删除失败");
               break;
       }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doGet(req,resp);
    }
}
