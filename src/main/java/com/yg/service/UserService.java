package com.yg.service;

import com.yg.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    // 添加用户
    int addUser(User user);
    //删除用户
    int deleteUserById(int userId);
    // 更新用户
    int updateUser(User user);
    // 根据userId查询用户
    User queryUserById(@Param("userId") String userId);
    // 根据用户username查询返回一个用户
    User queryUserByName(String username);
    // 查询所有用户
    List<User> queryAllUser(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);
    // 根据用户Uid查询用户信息
    User queryUserByUid(@Param("uid") String uid);
    // 根据用户电话查询用户信息
    User queryUserByPhone(@Param("phone") String phone);
    // 用户登录功能
    User loginUser(@Param("username") String username, @Param("password") String password);
    //用户修改密码
    int changePassword(@Param("username") String username, @Param("password") String password);
//    根据用户名身份证号电话查询用户信息
    User queryUserByUsernameUidPhone(@Param("username") String username, @Param("uid") String uid, @Param("phone") String phone);
}
