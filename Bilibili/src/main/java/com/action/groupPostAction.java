package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Post;
import com.pojo.Reply;
import com.service.postService;
import com.service.replyService;
import com.util.timeUtil;

import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class groupPostAction extends baseAction {
    private com.service.postService postService;
    private com.service.replyService replyService;
    private int interestsGroupId;
    private String postContent;

    private int postId;
    private String reason;

    private int groupId;
    private Post postBean;
    private List<Reply> replyListBean;

    public String publish(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        Post post = new Post();
//        post.setPostId(postService.findMaxPostId() + 1);
        post.setThumbCount(0);
        post.setContent(postContent);
        post.setCreateTime(timeUtil.GetCurrentDatetime());
        post.setPostPusher(username);
        postService.postPublish(username,interestsGroupId,post);
        return SUCCESS;
    }

    public String report(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        postService.reportPost(postId,username,reason);
        return SUCCESS;
    }

    public String thumbCount(){
        postService.postThumbCount(postId);
        return SUCCESS;
    }

    public String enterPost(){
        postBean = postService.findPostById(postId);
        replyListBean = replyService.showRepliesByPostId(postId);
        return SUCCESS;
    }

    public com.service.postService getPostService() {
        return postService;
    }

    public void setPostService(com.service.postService postService) {
        this.postService = postService;
    }

    public int getInterestsGroupId() {
        return interestsGroupId;
    }

    public void setInterestsGroupId(int interestsGroupId) {
        this.interestsGroupId = interestsGroupId;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Post getPostBean() {
        return postBean;
    }

    public void setPostBean(Post postBean) {
        this.postBean = postBean;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public com.service.replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(com.service.replyService replyService) {
        this.replyService = replyService;
    }

    public List<Reply> getReplyListBean() {
        return replyListBean;
    }

    public void setReplyListBean(List<Reply> replyListBean) {
        this.replyListBean = replyListBean;
    }
}
