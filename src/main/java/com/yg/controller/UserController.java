package com.yg.controller;

import com.yg.pojo.User;
import com.yg.service.UserService;
import com.yg.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //    用户登录
    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("vcode") String vcode,
                            HttpServletRequest request,
                            Map<String, Object> map) {

        HttpSession session = request.getSession();

        if (vcode == null || !vcode.equals(session.getAttribute("randomcode_key"))) {

            map.put("msg", "验证码错误");
            map.put("code", "500");
            return "login";
        }
        User result = userService.loginUser(username, password);

        session.setAttribute("user", result);

        if (result == null) {
            map.put("msg", "用户名或密码错误");
            return "login";
        }
        map.put("code", 200);
        map.put("msg", "登录成功");
        return "index";
    }

    //    退出登录
    @RequestMapping("/remove")
    public String remove(HttpSession session, User user) {
        session.setAttribute("user", null);
        return "index";
    }

    //    用户注册
    @RequestMapping(value = "/registUser", method = RequestMethod.POST)
    public String registUser(User user,
                             @RequestParam("password2") String password2,
                             Map<String, Object> map) {
        if (user.getPassword().equals(password2)) {
            User byName = userService.queryUserByName(user.getUsername());
            User byUid = userService.queryUserByUid(user.getUid());
            User byPhone = userService.queryUserByPhone(user.getPhone());
            if (byName!=null){
                map.put("msg","用户名已存在");
                return "registerUser";
            }
            if (byUid != null) {
                map.put("msg", "身份证号已存在");
                return "registerUser";
            }
            if (byPhone != null) {
                map.put("msg", "电话号码已存在");
                return "registerUser";
            } else {
                int result = userService.addUser(user);
                if (result != 1) {
                    map.put("code", 500);
                    map.put("msg", "注册失败");
                    return "registerUser";
                }
                map.put("code", 200);
                map.put("msg", "注册成功");
                return "login";
            }

        } else {
            map.put("msg", "两次密码不一致");
            return "registerUser";
        }
    }

    //    新增用户
    @RequestMapping(value = "/insertUser", method = RequestMethod.POST)
    public String insertUser(User user, Map<String, Object> map) {
        User byName = userService.queryUserByName(user.getUsername());
        User byUid = userService.queryUserByUid(user.getUid());
        User byPhone = userService.queryUserByPhone(user.getPhone());
        if (byName!=null){
            map.put("msg","用户名已存在");
            return "registerUser";
        }
        if (byUid != null) {
            map.put("msg", "身份证号已存在");
            return "adminuserinsert";
        }
        if (byPhone != null) {
            map.put("msg", "电话号码已存在");
            return "adminuserinsert";
        } else {
            int result = userService.addUser(user);
            if (result != 1) {
                map.put("code", 500);
                map.put("msg", "注册失败");
                return "adminuserinsert";
            }
            map.put("code", 200);
            map.put("msg", "注册成功");
            return "adminuserDesign";
        }

    }

    //管理员删除用户
    @RequestMapping(value = "deleteUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteUserById(@RequestParam("userId") String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = userService.deleteUserById(Integer.parseInt(userId));
        if (result != 1) {
            map.put("msg", "删除失败");
            map.put("code", 500);
            return map;
        }
        map.put("code", 200);
        map.put("msg", "删除成功");
        map.put("data", result);

        return map;
    }

    //    管理员根据userId查询用户
    @RequestMapping(value = "queryUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryUserById(@RequestParam("userId") String userId,
                                             HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = userService.queryUserById(userId);
        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("data", user);
        String msg = "query success";
        String code = "200";
        if (userId == null || userId.equals("")) {
            msg = "参数错误";
            code = "500";
            resultMap.put("msg", msg);
            resultMap.put("code", code);
            return resultMap;
        }
        resultMap.put("msg", msg);
        resultMap.put("code", code);
        resultMap.put("user",user);

        req.getSession().setAttribute("user", user);

        return resultMap;
    }

    //    管理员修改用户信息
    @RequestMapping(value = "modifyUser", method = RequestMethod.POST)
    public String modifyUser(User user, Map<String, Object> map) {
        int result = userService.updateUser(user);
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "修改失败");
            return "adminuserupdate";
        }
        map.put("code", 200);
        map.put("msg", "修改成功");
        return "adminuserDesign";
    }

    //    管理员查询所有用户
    @RequestMapping(value = "queryAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryAllUser(@RequestParam("pageNo") String pageNo,
                                            @RequestParam("pageSize") String pageSize) throws IOException {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String msg = "queryUsers success";
        String code = "200";
        //参数校验
        if (pageNo == null || pageNo.equals("")) {
            pageNo = "1";
        }
        if (pageSize == null || pageSize.equals("")) {
            pageSize = "2";
        }
        //校验取值范围
        if (Integer.parseInt(pageNo) <= 0 || Integer.parseInt(pageSize) <= 0) {
            msg = "参数错误，取值要注意哦";
            code = "500";
            resultMap.put("msg", msg);
            resultMap.put("code", code);
            return resultMap;
        }

        List<User> users = userService.queryAllUser(Integer.parseInt(pageNo) - 1, Integer.parseInt(pageSize));


        if (users == null || users.size() == 0) {
            resultMap.put("msg", "query fail");
            resultMap.put("code", 500);
        } else {
            resultMap.put("msg", "query success");
            resultMap.put("code", 200);
        }
        resultMap.put("data", users);


        return resultMap;
    }

    /**
     * 获取生成验证码显示到 UI 界面
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value = "/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    根据用户名 uid phone查询用户信息
    @RequestMapping(value = "/queryUserByUsernameUidPhone", method = RequestMethod.POST)
    public String queryUserByUsernameUidPhone(@RequestParam("name") String username,
                                              @RequestParam("uid") String uid,
                                              @RequestParam("phone") String phone,
                                              Model model,
                                              Map<String, Object> map){

        User user = userService.queryUserByUsernameUidPhone(username,uid,phone);
        if (user==null){
            map.put("msg","用户不存在");
            map.put("code",500);
            return "password";
        }
       model.addAttribute("user",user);

        return "rePass";
    }

    //用户修改密码
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(@RequestParam("name") String username,
                                 @RequestParam("password") String password,
                                 Map<String, Object> map) {
        int result = userService.changePassword(username, password);
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "修改失败");
            return "password";

        } else {
            map.put("code", 200);
            map.put("msg", "修改成功");
            return "login";
        }

    }

    //    用户修改个人信息
    @RequestMapping(value = "/changeUser", method = RequestMethod.POST)
    public String changeUser(@RequestParam("userId") String userId, User user,
                             Map<String, Object> map,HttpServletRequest request) {

        int result = userService.updateUser(user);

        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "修改失败");
            return "changeUser";
        }
        map.put("code", 200);
        map.put("msg", "修改成功");
        User userinfo = userService.queryUserById(userId);
        request.getSession().setAttribute("user",userinfo);
        return "changeUser";
    }

}