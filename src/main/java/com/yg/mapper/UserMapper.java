package com.yg.mapper;

import com.yg.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*普通用户*/
public interface UserMapper {
// 添加用户
 int addUser(@Param("user") User user);
//删除用户
 int deleteUserById(@Param("userId") int userId);
// 更新用户
 int updateUser(@Param("user") User user);
// 根据userId查询用户
 User queryUserById(@Param("userId") String userId);
// 根据用户username查询用户
 User queryUserByName(@Param("username") String username);
// 查询所有用户
 List<User> queryAllUser(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);
 // 根据用户Uid查询用户信息
 User queryUserByUid(@Param("uid") String uid);
 // 根据用户电话查询用户信息
 User queryUserByPhone(@Param("phone") String phone);
 // 用户登录功能
 User loginUser(@Param("username") String username, @Param("password") String password);
// 用户修改密码
 int changePassword(@Param("username") String username, @Param("password") String password);
}


