package com.bcu.servlet;

import com.bcu.dao.EquipmentDao;
import com.bcu.entity.Equipment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class SearchEquipmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
        PrintWriter out=resp.getWriter();
        out.println("查询中...");
        /**
         * 规定： type
         *    1. 通过名称查找
         *    2. 通过编号查找
         */
        String type=req.getParameter("type");
        String name=req.getParameter("name");
        String id=req.getParameter("id");



        switch (type) {
            case "1":
                ArrayList<Equipment> list=new EquipmentDao().serchEquipmentByName(name);
                session.setAttribute("result",list);
                resp.setHeader("refresh","1,url=equRs.jsp");

                System.out.println(list.get(0).getEquName());




                break;

            case "2":
                ArrayList<Equipment> list2=new EquipmentDao().serchEquipmentById(id);
                session.setAttribute("result",list2);
                resp.setHeader("refresh","1,url=equRs.jsp");
                break;
        }

    }
}
