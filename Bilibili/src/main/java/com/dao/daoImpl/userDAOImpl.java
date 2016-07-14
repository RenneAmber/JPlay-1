package com.dao.daoImpl;

import com.dao.userDAO;
import com.pojo.User;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Admin on 2016/6/27.
 */

/**
 * userDAOImpl类对userDAO接口的方法进行了实现。<br>
 * 主要包含对user类的增删改查四个功能。
 */
public class userDAOImpl extends HibernateDaoSupport implements userDAO {
    /**
     * createUser方法实现了向数据库中增加一个user的功能
     * @param user 传入要增加的user
     */
    @Override
    public void createUser(User user) {
        getHibernateTemplate().save(user);
        getHibernateTemplate().flush();
    }

    /**
     * deleteUser方法实现了从数据库中删除一个user的功能
     * @param userId 传入userId以根据userId找到要删除的user
     */
    @Override
    public void deleteUser(int userId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(User.class, userId));
        getHibernateTemplate().flush();
    }

    /**
     * updateUser方法实现了向数据库中修改一个user属性的功能
     * @param user 传入要修改的user（包含修改属性）
     */
    @Override
    public void updateUser(User user) {
        getHibernateTemplate().merge(user);
        getHibernateTemplate().flush();
    }

    /**
     * findUserById方法实现了根据userId找到一个user信息的功能
     * @param userId 传入userId作为查找因子
     * @return 返回需要查找的User类的对象
     */
    @Override
    public User findUserById(int userId) {
        return getHibernateTemplate().load(User.class, userId);
    }

    /**
     * findUserByUsername方法实现了根据username找到一个user信息的功能
     * @param username 传入username作为查找因子
     * @return 返回需要查找的User类的对象列表
     */
    @Override
    public List<User> findUserByUsername(String username) {
        return (List<User>) getHibernateTemplate().find("from User as user where user.username = ?",username);
//        if(getHibernateTemplate().find("from User as user where user.username = ?",username).size()==0)
//            return null;
//        else
//            return .get(0);
    }

    @Override
    public User findUserByEmail(String email) {
        //return (User) getHibernateTemplate().find("from User as user where user.email = ?", email.getBytes());
        List<User>result = (List<User>) getHibernateTemplate().find("from User as user where user.email = ?", email.getBytes());
        if(result.size() == 0)
            return null;
        else
            return result.get(0);
    }


    @Override
    public List<User> findAllUsers() {
        return (List<User>) getHibernateTemplate().find("from User ");
    }

    @Override
    public List<User> findUpersByVideoId(int videoId) {
        List<User>result = null;
        return result;
    }
}