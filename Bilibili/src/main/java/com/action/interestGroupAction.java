package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.InterestGroup;
import com.pojo.Post;
import com.service.postService;
import com.service.userService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class interestGroupAction extends baseAction {
    private int interestGroupId;
    private userService userService;
    private postService postService;
    private List<InterestGroup> myGroupList;
    private List<InterestGroup> groupList;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    private int groupId;
    private List<Post>postListBean;

    public String addInterestGroup(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        userService.addInterestGroup(username,interestGroupId);
        return SUCCESS;
    }

    public String listInterestGroup()
    {
        groupList=userService.showGroupsAll();
        dataMap.put("groupList",groupList);
        return SUCCESS;
    }

    public String listInterestGroupByUser()
    {
        dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String user=(String)Session.get("username");
        myGroupList=userService.showGroupsByUsername(user);
        dataMap.put("myGroupList",myGroupList);
        listInterestGroup();
        return SUCCESS;
    }

    public String enterGroup(){
        postListBean = postService.showPostsByGroupId(groupId);
        return SUCCESS;
    }

    public void setInterestGroupId(int interestGroupId) {
        this.interestGroupId = interestGroupId;
    }

    public int getInterestGroupId(){
        return interestGroupId;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public userService getUserService(){return userService;}

    public List<InterestGroup> getMyGroupList() {
        return myGroupList;
    }

    public void setMyGroupList(List<InterestGroup> myGroupList) {
        this.myGroupList = myGroupList;
    }

    public com.service.postService getPostService() {
        return postService;
    }

    public void setPostService(com.service.postService postService) {
        this.postService = postService;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public List<Post> getPostListBean() {
        return postListBean;
    }

    public void setPostListBean(List<Post> postListBean) {
        this.postListBean = postListBean;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public List<InterestGroup> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<InterestGroup> groupList) {
        this.groupList = groupList;
    }
}
