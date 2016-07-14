package com.action;

import com.mongodb.pojo.Barrage;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;

/**
 * Created by Admin on 2016/6/27.
 */
public class barrageAction extends baseAction {
//    private Map<String, String> timeLine;
//    private Integer mode;
//    private Integer stime;
//    private String text;
//    private Integer ttl;
//    private Integer dur;
//    private Integer cindex;
//    private ArrayList<Object> motion;
//    private Boolean movable;
//    private Object _alphaMotion;
//    private Integer align;
//    private Integer _alpha;
//    private Integer _size;
//    private Integer _color;
//    private Boolean _border;
//    private Boolean _shadow;
//    private String _font;
    private String barrageJson; // In json format
    private int videoId;

    public void setBarrageJson(String barrageJson) {
        this.barrageJson = barrageJson;
    }

    public String getBarrageJson() {
        return barrageJson;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getVideoId(){
        return videoId;
    }

    public String Show() throws  Exception {
        System.out.println(barrageJson);
        return SUCCESS;
    }

    public String Store() throws Exception {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
        Barrage barrage = new Barrage();
        barrage.setVideoId(videoId);
        barrage.setBarrageJson(barrageJson);
        mongoOperations.insert(barrage);
        return SUCCESS;
    }

    public String FetchByVideoId() throws Exception {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
        Query query = new Query(Criteria.where("videoId").is(videoId));
        barrageJson = mongoOperations.findOne(query, Barrage.class).getBarrageJson();
        return SUCCESS;
    }

    public String UpdateByVideoId() throws Exception {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
        Query query = new Query(Criteria.where("videoId").is(videoId));
        Update update = new Update().set("barrageJson", barrageJson);
        mongoOperations.updateFirst(query, update, Barrage.class);
        return SUCCESS;
    }
}
