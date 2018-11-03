package com.bcu.servlet;

import com.bcu.dao.RequestDao;
import com.bcu.entity.Request;
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

public class GetRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/json;charset=utf-8");
        HttpSession session=req.getSession();
        PrintWriter out=resp.getWriter();
        User user= (User) session.getAttribute("user");
        String type=req.getParameter("type");
        /**
         * 规定：type
         * 1.通过用户名查找请求
         * 2.通过权限查找请求
         *
         */

        //通过session保存的信息获取数据
        String username=user.getUserName();
        String level=user.getUserType()+"";

        switch (type){
            case "1":
                ArrayList<Request> list1=new RequestDao().getRequestByInitiator(username);
                JSONArray ja1=JSONArray.fromObject(list1);
                out.print(ja1);
                  // session.setAttribute("request",list1);
                //  resp.setHeader("refresh","0,url=myrequest.jsp");
                break;
            case "2":
                ArrayList<Request> list2=new RequestDao().getRequestByLevel(level);
                JSONArray ja2=JSONArray.fromObject(list2);
                out.print(ja2);

             //   session.setAttribute("request",list2);
             //   resp.setHeader("refresh","0,url=handleRequest.jsp");
                break;
        }


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
