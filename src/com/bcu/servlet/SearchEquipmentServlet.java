package com.bcu.servlet;

import com.bcu.dao.EquipmentDao;
import com.bcu.entity.Equipment;
import com.bcu.entity.User;
import net.sf.json.JSONArray;

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
        resp.setContentType("text/json;charset=utf-8");
        HttpSession session=req.getSession();
        User user=(User)session.getAttribute("user");
        PrintWriter out=resp.getWriter();
      //  out.println("查询中...");
        /**
         * 规定： type
         *    1. 通过名称查找
         *    2. 通过编号查找
         *    3. 返回全部可用资产
         *    4. 返回全部资产
         *    5 .通过用户名查找资产
         */
        String type=req.getParameter("type");
        String name=req.getParameter("name");
        String id=req.getParameter("id");
        String username=user.getUserName();




        switch (type) {
            case "1":
                ArrayList<Equipment> list=new EquipmentDao().serchEquipmentByName(name);
                session.setAttribute("result",list);
                JSONArray ja1=JSONArray.fromObject(list);
                out.print(ja1);
                break;

            case "2":
                ArrayList<Equipment> list2=new EquipmentDao().serchEquipmentById(id);
                JSONArray ja2=JSONArray.fromObject(list2);
                out.print(ja2);

                break;


            case "3":
                ArrayList<Equipment> list3=new  EquipmentDao().getAllAvailableEquipment();
                JSONArray ja3=JSONArray.fromObject(list3);
                out.print(ja3);


             //   session.setAttribute("result",list3);
             //   resp.setHeader("refresh","0,url=brorrowEqu.jsp");
                break;


            case"4":
                ArrayList<Equipment> list4=new EquipmentDao().getAllEquipment();
                JSONArray ja4=JSONArray.fromObject(list4);
                out.print(ja4);

                break;



            case "5":
                ArrayList<Equipment> list5=new EquipmentDao().serchEquipmentByUser(username);
                JSONArray ja5=JSONArray.fromObject(list5);
                out.print(ja5);
                break;
        }

    }
}
