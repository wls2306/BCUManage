package com.bcu.servlet;

import com.bcu.dao.MenuDao;
import com.bcu.dao.UserDao;
import com.bcu.entity.Menu;
import com.bcu.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * 登陆验证
 */

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();

        String username=req.getParameter("username");
        String pwd=req.getParameter("password");

        User user=new UserDao().getUser(username,pwd);

         if(user!=null) {
             session.setAttribute("user", user);

             ArrayList<Menu> list =new MenuDao().GetMenu();

             session.setAttribute("menuList",list);

             resp.sendRedirect("main.jsp");
         }
         else
         {
             out.println("用户名或密码有误，拒绝登入！");
             resp.setHeader("refresh","2;url=login.jsp");
         }

    }
}
