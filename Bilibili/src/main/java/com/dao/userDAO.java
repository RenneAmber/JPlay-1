package com.dao;

/**
 * Created by Admin on 2016/6/27.
 */

import com.pojo.User;

import java.util.List;

/**
 * userDAO接口 提供了对user进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface userDAO {
    /**
     * createUser方法实现了向数据库中增加一个user的功能
     * @param user 传入要增加的user
     */
    public void createUser(User user);

    /**
     * deleteUser方法实现了从数据库中删除一个user的功能
     * @param userId 传入userId以根据userId找到要删除的user
     */
    public void deleteUser(int userId);

    /**
     * updateUser方法实现了向数据库中修改一个user属性的功能
     * @param user 传入要修改的user（包含修改属性）
     */
    public void updateUser(User user);

    /**
     * findUserById方法实现了根据userId找到一个user信息的功能
     * @param userId 传入userId作为查找因子
     * @return 返回需要查找的User类的对象
     */
    public User findUserById(int userId);

    /**
     * findUserByUsername方法实现了根据username找到一个user信息的功能
     * @param username 传入username作为查找因子
     * @return 返回需要查找的User类的对象
     */
    public List<User> findUserByUsername(String username);

    public User findUserByEmail(String email);

<<<<<<< HEAD
    public List<User> findAllUsers();

    public List<User> findUpersByVideoId(int videoId);
=======
    public List<User> getAllUser();
>>>>>>> 359bd080132ad7a750832e6f9421f6f2dd012831
}
