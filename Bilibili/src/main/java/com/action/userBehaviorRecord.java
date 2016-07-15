package com.action;

import com.mongodb.pojo.userBehavior;
import com.pojo.User;
import com.service.userService;
import com.service.videoService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

/**
 * Created by Admin on 2016/7/14.
 */
public class userBehaviorRecord extends baseAction {
    private static final int favoriteIncrement = 15;
    private static final int thumbIncrement = 10;
    private static final int watchedIncrement = 5;
    private userService userService;
    private videoService videoService;
    private String email;
    private int videoId;

    public String favoriteBehavior() {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
        User user = userService.findUserByEmail(email);
        Query query = new Query(Criteria.where("userId").is(user.getUserId()));
        query.addCriteria(Criteria.where("videoId").is(videoId));
        Update update = new Update().inc("likeDegree", favoriteIncrement);
        mongoOperations.findAndModify(query, update, userBehavior.class);

        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public com.service.videoService getVideoService() {
        return videoService;
    }

    public void setVideoService(com.service.videoService videoService) {
        this.videoService = videoService;
    }
}
