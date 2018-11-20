package com.bcu.servlet;

import com.bcu.dao.BrPartRecordDao;
import com.bcu.dao.BrRecordDao;
import com.bcu.dao.EquipmentDao;
import com.bcu.dao.PartsDao;
import com.bcu.util.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class HandleRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");


        PrintWriter out=resp.getWriter();

        String type=req.getParameter("type");
        String goalId=req.getParameter("goalId");
        String initiator=req.getParameter("initiator");
        String auditor=req.getParameter("auditor");
        String content=req.getParameter("content");
        String date= util.getTime();


        /***
         * 规定 Type
         *  10+ ：资产相关请求
         *      11.资产借用请求
         *      12.资产归还请求
         *      13.资产维修请求
         *      14.资产报废请求
         *
         *  20+：耗材相关请求
         *      21.耗材使用请求
         *
         *  30+仪器设备相关请求
         *      31.仪器借用请求
         *      32.仪器归还请求
         *      33.仪器维修请求
         *      34.仪器报废请求
         *
         *  40+采购单等方面相关请求
         *
         */


        switch (type)
        {
                //资产借用
            case "11":
                boolean rs1=new EquipmentDao().useEquipment(goalId,initiator);
                boolean rs2=new BrRecordDao().insertRecord(goalId,new EquipmentDao().getEquipmentNameById(goalId),"1",initiator,auditor,date);
                if(rs1&&rs2)
                    out.println("操作成功");
                break;

                //资产归还
            case "12":
                boolean rs3=new EquipmentDao().changeEquipmentStatus(goalId,"1","");
                boolean rs4=new BrRecordDao().insertRecord(goalId,new EquipmentDao().getEquipmentNameById(goalId),"2",initiator,auditor,date);
                if(rs3&&rs4)
                    out.println("操作成功");
                break;

                //
            case "21":

                int balance=new PartsDao().getCount(goalId);
                String data[]=content.split("#");
                int count= Integer.valueOf(data[1]);

                balance-=count;

                boolean rs21_1=new PartsDao().changeCount(goalId,balance+"");
               // boolean rs21_2=new BrPartRecordDao().insertParts("",goalId,"","1",initiator,auditor,date,count+"");

                if (rs21_1)
                    out.print("操作成功，配件数量 -"+count);
                else
                    out.print("操作失败");
                break;



        }




    }
}
