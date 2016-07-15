package com.mongodb.dao;

import com.mongodb.pojo.userBehavior;

import java.util.List;

/**
 * Created by Admin on 2016/7/15.
 */
public interface userBehaviorDAO {
    public List<userBehavior> findAllBehaviors();

    public List<userBehavior> findBehaviorsByUserId(int userId);

    public void createBehavior(userBehavior userBehavior);

    public void deleteBehaviorByUserId(int userId);

    public void deleteBehaviorByVideoId(int videoId);

    public void deleteBehavior
}
