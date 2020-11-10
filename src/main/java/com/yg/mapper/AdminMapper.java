package com.yg.mapper;

import com.yg.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*管理员*/
public interface AdminMapper {
    //添加管理员
    int addAdmin(@Param("admin") Admin admin);
    //删除管理员
    int deleteAdminById(@Param("id") int id);
    //更新管理员
    int updateAdmin(@Param("admin") Admin admin);
    //查询管理员
    Admin queryAdminById(@Param("id") int id);
    //查询所有管理员
    List<Admin> queryAllAdmin();
    //管理员登录
    Admin loginAdmin(@Param("name") String name, @Param("password") String password);
}
