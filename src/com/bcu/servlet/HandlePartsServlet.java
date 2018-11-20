package com.bcu.servlet;

import com.bcu.dao.PartsDao;
import com.bcu.entity.Parts;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class HandlePartsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html charset=UTF-8");
        resp.setCharacterEncoding("utf-8");

        PrintWriter out=resp.getWriter();

        String type=req.getParameter("type");
        String id=req.getParameter("id");
        String count=req.getParameter("count");

        String partsId=req.getParameter("partsId");
        String partsName=req.getParameter("partsName");
        String partsUnit=req.getParameter("partsUnit");
        String partsNumber=req.getParameter("partsNumber");
        String partsStatus=req.getParameter("partsStatus");
        String partsManager=req.getParameter("partsManager");
        String partsLocation=req.getParameter("partsLocation");

        switch (type) {

            case "1":

                out.print(new PartsDao().insertParts(partsId, partsName, partsUnit, partsNumber, "-", partsStatus, partsManager, partsLocation));



                break;


            //删除配件
            case "2":
                if(new PartsDao().deleteParts(id))
                    out.print("操作成功");
                else
                    out.print("操作失败");
                break;



                //增添数量
            case "3":
                int balance =new PartsDao().getCount(id);
                balance += Integer.valueOf(count);
                boolean rs3=new PartsDao().changeCount(id,balance+"");
                if (rs3)
                    out.print("操作成功");
                else
                    out.print("操作失败");
                break;


            //减少数量
            case "4":
                int balance2 =new PartsDao().getCount(id);
                balance2 -= Integer.valueOf(count);
                boolean rs4=new PartsDao().changeCount(id,balance2+"");
                if (rs4)
                    out.print("操作成功");
                else
                    out.print("操作失败");
                break;


            //获取所有数据
            case "5":
            ArrayList<Parts> list = new PartsDao().getAllParts();
            JSONArray ja = JSONArray.fromObject(new PartsDao().getAllParts());
            out.print(ja);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
