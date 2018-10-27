package com.bcu.servlet;

import com.bcu.dao.RequestDao;
import com.bcu.entity.Request;
import com.bcu.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class GetRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session=req.getSession();

        User user= (User) session.getAttribute("user");
        String type=req.getParameter("type");
        /**
         * 规定：type
         * 1.通过用户名查找请求
         * 2.通过权限查找请求
         *
         */
        String username=user.getUserName();
        String level=req.getParameter("level");

        switch (type){
            case "1":
                ArrayList<Request> list1=new RequestDao().getRequestByInitiator(username);
                session.setAttribute("request",list1);
                resp.setHeader("refresh","0,url=myrequest.jsp");
                break;
            case "2":

                break;
        }


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
