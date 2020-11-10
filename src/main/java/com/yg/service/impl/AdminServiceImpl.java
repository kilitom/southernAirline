package com.yg.service.impl;

import com.yg.mapper.AdminMapper;
import com.yg.pojo.Admin;
import com.yg.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }
    //调用添加管理员方法
    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }
    //调用删除管理员方法
    public int deleteAdminById(int id) {
        return adminMapper.deleteAdminById(id);
    }
    //调用更新管理员方法
    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }
    //调用查询管理员方法
    public Admin queryAdminById(int id) {
        return adminMapper.queryAdminById(id);
    }
    //调用查询所有管理员方法
    public List<Admin> queryAllAdmin() {
        return null;
    }
    //管理员登录功能

    public Admin loginAdmin(String name, String password) {
        return adminMapper.loginAdmin(name,password);
    }
}
