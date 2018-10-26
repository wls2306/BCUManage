package com.bcu.servlet;

import com.bcu.dao.EquipmentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddEquipmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out=resp.getWriter();

        String equId=req.getParameter("equId");
        String equName=req.getParameter("equName");
        String equModel=req.getParameter("equModel");
        String equType=req.getParameter("equType");
        String equFormat=req.getParameter("equFormat");
        String equPrice=req.getParameter("equPrice");
        String equMainCount=req.getParameter("equMainCount");
        String equTotalPrice=req.getParameter("equTotalPrice");
        String equUnit=req.getParameter("equUnit");
        String equTickNo=req.getParameter("equTickNo");
        String equFactory=req.getParameter("equFactory");
        String equFactoryNo=req.getParameter("equFactoryNo");
        String equOutFactoryDate=req.getParameter("equOutFactoryDate");
        String equBoughtDate=req.getParameter("equBoughtDate");
        String equUseDirection=req.getParameter("equUseDirection");
        String equStatus=req.getParameter("equStatus");
        String equManager=req.getParameter("equManager");
        String equLocation=req.getParameter("equLocation");
        String equBelong=req.getParameter("equBelong");

        boolean rs=new EquipmentDao().insertEquipment(equId, equName, equModel, equType, equFormat, equPrice, equMainCount, equTotalPrice, equUnit, equTickNo, equFactory, equFactoryNo, equOutFactoryDate, equBoughtDate, equUseDirection, equStatus, equManager, equLocation, equBelong);

        if(rs) {
            out.println("信息录入成功，2秒后跳回！");
            resp.setHeader("refresh","2;url=addEqu.jsp");
        }
        else
        {
            out.println("信息录入失败，请检查资产编号是否有重复，2秒后跳回！");
            resp.setHeader("refresh","2;url=addEqu.jsp");
        }

    }
}
