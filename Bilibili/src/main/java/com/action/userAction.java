package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.User;
import com.pojo.Video;
import com.service.userService;
import com.service.videoService;
import com.util.timeUtil;

import javax.jws.soap.SOAPBinding;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class userAction extends baseAction {
    private userService userService;
    private videoService videoService;
    private List<Video> videoBeanList;
    private User userBean;
    private List<User> userList;
    private int userId;
    private String username;
    private String gender;
    private String signature;
    private String email;
    private Date birthday;
    private String lastUpdate;
    private String realName;
    private String university;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    /** For Administrator **/
    public String deleteUser() throws Exception {
        userService.deleteUser(userId);
        return SUCCESS;
    }

    public String listUsers() throws Exception {
        userList = userService.findAllUser();
        return SUCCESS;
    }

    public String updateUser() throws Exception {
        userBean.setLastUpdate(timeUtil.GetCurrentDatetime());
        System.out.println("Admin update id" + userBean.getUserId());
        userService.updateUser(userBean);
        return SUCCESS;
    }

    /** For User **/
    public String listMyVideo() throws Exception {
        dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        videoBeanList = videoService.showVideoByUper(email);
        dataMap.put("videoBeanList", videoBeanList);
        return SUCCESS;
    }

    public String updatePersonalInfo() throws Exception {
        userBean.setLastUpdate(timeUtil.GetCurrentDatetime());
        System.out.println("User update " + userBean.getUserId());
        userService.updateUser(userBean);
        return SUCCESS;
    }

    public com.service.videoService getVideoService() {
        return videoService;
    }

    public void setVideoService(com.service.videoService videoService) {
        this.videoService = videoService;
    }

    public List<Video> getVideoBeanList() {
        return videoBeanList;
    }

    public void setVideoBeanList(List<Video> videoBeanList) {
        this.videoBeanList = videoBeanList;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public User getUserBean() {
        return userBean;
    }

    public void setUserBean(User userBean) {
        this.userBean = userBean;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
