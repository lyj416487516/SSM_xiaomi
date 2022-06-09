package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.User;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface UserMapper {

    /**
     * 通过id查询用户
     *
     * @param id
     * @return User
     */
//    @Select("SELECT * FROM sys_user WHERE id = #{id}")
    User selectById(Long id);

    /**
     * 查询全部用户
     *
     * @return
     */
    List<User> selectAll();

    /**
     * 通过用户名和密码查询用户
     *
     */
    User findBySysUser(@Param("username") String user_name, @Param("password") String user_password);

    /**
     * 通过用户名查询用户
     *
     */
    User findByUserName(@Param("username") String user_name);

    /**
     * 添加用户
     */
    int insertUser(User sysUser);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    int updateUserInfo(User user);

    /**
     * 通过用户id减少余额
     * @param id
     * @param money
     * @return
     */
    int decUserMoney(@Param("id") Long id, @Param("money") BigDecimal money);

}
