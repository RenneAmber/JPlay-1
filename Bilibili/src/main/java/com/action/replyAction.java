package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Reply;
import com.service.replyService;

import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class replyAction extends baseAction {
    private replyService replyService;
    private int replyId;
    private String reason;
    private List<Reply> replyList;

    public String listReplies() throws Exception {
        replyList = replyService.findAllReplies();
        return SUCCESS;
    }

    public String deleteReply() throws Exception {
        replyService.deleteReply(replyId);
        return SUCCESS;
    }

    public String report(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        replyService.reportReply(replyId, email, reason);
        return SUCCESS;
    }

    public String thumbCount(){
        replyService.replyThumbCount(replyId);
        return SUCCESS;
    }

    public replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(replyService replyService) {
        this.replyService = replyService;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }
}
