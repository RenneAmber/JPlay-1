package com.action;

import com.service.commentService;
import com.opensymphony.xwork2.ActionContext;
import com.pojo.Comment;
import com.util.timeUtil;

import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class videoCommentAction extends commentAction {
    private commentService commentService;
    private int videoId;
    protected String commentContent;

    private int commentId;
    private String reason;

    public String commentVideo(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        Comment comment = new Comment();
        comment.setCommentId(commentService.findMaxCommentId()+1);
        comment.setContent(commentContent);
        comment.setThumbCount(0);
        comment.setCreateTime(timeUtil.GetCurrentDatetime());
        comment.setCommentPusher(username);
        commentService.makeCommentOnVideo(videoId,username,comment);
        return SUCCESS;
    }

    public String deleteComment(){
        commentService.deleteComment(commentId);
        return SUCCESS;
    }

    public String report(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        System.out.println(commentId+":"+username+":"+reason);
        commentService.reportComment(commentId,username,reason);
        System.out.println("suc");
        return SUCCESS;
    }

    public String thumbCount(){
        commentService.commentThumbCount(commentId);
        return SUCCESS;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public com.service.commentService getCommentService() {
        return commentService;
    }

    public void setCommentService(com.service.commentService commentService) {
        this.commentService = commentService;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
