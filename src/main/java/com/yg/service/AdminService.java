package com.yg.service;

import com.yg.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/*
管理员
 */
public interface AdminService {
    //添加管理员
    int addAdmin(Admin admin);
    //删除管理员
    int deleteAdminById(int id);
    //更新管理员
    int updateAdmin(Admin admin);
    //查询管理员
    Admin queryAdminById(int id);
    //查询所有管理员
    List<Admin> queryAllAdmin();
    //管理员登录
    Admin loginAdmin(@Param("name") String name, @Param("password") String password);
}
