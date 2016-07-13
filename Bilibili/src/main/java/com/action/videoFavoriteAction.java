package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.service.userService;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class videoFavoriteAction extends baseAction {
    private userService userService;
    private String groupName;
    private int groupId;
    private int videoId;

    public videoFavoriteAction() {
    }

    public String createFile()throws Exception{
        Map Session = ActionContext.getContext().getSession();
        String email = (String) Session.get("email");
        userService.addFavouriteGroup(email, groupName);
        return SUCCESS;
    }

    public String addVideo()throws Exception{
        userService.addVideoToFavouriteGroup(videoId, groupId);
        return SUCCESS;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public int getGroupId(){
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getVideoId(){
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
