package com.yg.service.impl;

import com.yg.mapper.UserMapper;
import com.yg.pojo.User;
import com.yg.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    //调用添加用户方法
    public int addUser(User user) {
        return userMapper.addUser(user);
    }
    //调用删除用户方法
    public int deleteUserById(int userId) {
        return userMapper.deleteUserById(userId);
    }
    //调用更新用户方法
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }
    // 根据userId查询用户
    public User queryUserById(String userId) {
        return userMapper.queryUserById(userId);
    }

    //调用查询用户方法
    public User queryUserByName(String username) {
        return userMapper.queryUserByName(username);
    }
    //调用查询所有用户方法
    public List<User> queryAllUser(int pageNo,int pageSize) {
        return userMapper.queryAllUser(pageNo,pageSize);
    }
    // 根据用户Uid查询用户信息
    public User queryUserByUid(String uid) {
        return userMapper.queryUserByUid(uid);
    }
    // 根据电话查询用户信息
    public User queryUserByPhone(String phone) {
        return userMapper.queryUserByPhone(phone);
    }

    // 用户登录功能
    public User loginUser(String username, String password) {
        return userMapper.loginUser(username,password);
    }
    //用户修改密码
    public int changePassword(String username,String password){
        return userMapper.changePassword(username,password);
    }

}
