package com.yg.controller;

import com.yg.pojo.Admin;
import com.yg.pojo.User;
import com.yg.service.AdminService;
import com.yg.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    //管理员登录
    @RequestMapping(value = "loginAdmin",method = RequestMethod.POST)
    public String loginAdmin(@RequestParam("name") String name,
                             @RequestParam("password") String password,
                             Map<String,Object>map,HttpServletRequest request){
        Admin result = adminService.loginAdmin(name,password);

        if (result == null){
            map.put("msg","用户名或密码错误");
            return "login";
        }
        request.getSession().setAttribute("adminName",result.getName());
        map.put("code",200);
        map.put("msg","登陆成功");
        return "indexadmin";
    }
    //    退出登录
    @RequestMapping("/removeAdmin")
    public String remove(HttpSession session, User user) {
        session.setAttribute("adminName", null);
        return "loginadmin";
    }
}
