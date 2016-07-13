package com.service.serviceImpl;

import com.dao.*;
import com.pojo.*;
import com.service.replyService;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class replyServiceImpl implements replyService {
    private replyDAO replyDAO;
    private commentReplyDAO commentReplyDAO;
    private postReplyDAO postReplyDAO;
    private userReplyDAO userReplyDAO;
    private replyReportDAO replyReportDAO;
    private userDAO userDAO;

    @Override
    public void createReply(Reply reply) {
        replyDAO.createReply(reply);
    }

    @Override
    public void deleteReply(int replyId) {
        replyDAO.deleteReply(replyId);
    }

    @Override
    public void updateReply(Reply reply) {
        replyDAO.updateReply(reply);
    }

    @Override
    public Reply findReplyById(int replyId) {
        return replyDAO.findReplyById(replyId);
    }

//    @Override
//    public int findMaxReplyId() {
//        return replyDAO.findMaxReplyId();
//    }

    @Override
    public void makeReplyOnComment(int commentId, String email, Reply reply) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        createReply(reply);
        CommentReply commentReply = new CommentReply();
        commentReply.setCommentId(commentId);
        commentReply.setReplyId(reply.getReplyId());
        commentReplyDAO.createCommentReply(commentReply);
        UserReply userReply = new UserReply();
        userReply.setUserId(userId);
        userReply.setReplyId(reply.getReplyId());
        userReply.setIsThumb(new Byte("0"));
        userReplyDAO.createUserReply(userReply);
    }

    @Override
    public void makeReplyOnPost(int postId, String email, Reply reply) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        createReply(reply);
        PostReply postReply = new PostReply();
        postReply.setPostId(postId);
        postReply.setReplyId(reply.getReplyId());
        postReplyDAO.createPostReply(postReply);
        UserReply userReply = new UserReply();
        userReply.setUserId(userId);
        userReply.setReplyId(reply.getReplyId());
        userReply.setIsThumb(new Byte("0"));
        userReplyDAO.createUserReply(userReply);
    }

    @Override
    public List<Reply> showRepliesByCommentId(int commentId) {
        return replyDAO.findRepliesByCommentId(commentId);
    }

    @Override
    public List<Reply> showRepliesByPostId(int postId) {
        return replyDAO.findRepliesByPostId(postId);
    }

    @Override
    public void reportReply(int replyId, String email, String reason) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        ReplyReport replyReport = new ReplyReport();
        replyReport.setReplyId(replyId);
        replyReport.setUserId(userId);
        replyReport.setReason(reason);
        replyReportDAO.createReplyReport(replyReport);
    }

    @Override
    public void replyThumbCount(int replyId) {
        Reply reply = replyDAO.findReplyById(replyId);
        reply.setThumbCount(reply.getThumbCount()+1);
        replyDAO.updateReply(reply);
    }

    public com.dao.replyDAO getReplyDAO() {
        return replyDAO;
    }

    public void setReplyDAO(com.dao.replyDAO replyDAO) {
        this.replyDAO = replyDAO;
    }

    public commentReplyDAO getCommentReplyDAO() {
        return commentReplyDAO;
    }

    public void setCommentReplyDAO(commentReplyDAO commentReplyDAO) {
        this.commentReplyDAO = commentReplyDAO;
    }

    public userReplyDAO getUserReplyDAO() {
        return userReplyDAO;
    }

    public void setUserReplyDAO(userReplyDAO userReplyDAO) {
        this.userReplyDAO = userReplyDAO;
    }

    public void setUserDAO(com.dao.userDAO userDAO) {
        this.userDAO = userDAO;
    }

    public com.dao.replyReportDAO getReplyReportDAO() {
        return replyReportDAO;
    }

    public void setReplyReportDAO(com.dao.replyReportDAO replyReportDAO) {
        this.replyReportDAO = replyReportDAO;
    }

    public void setPostReplyDAO(com.dao.postReplyDAO postReplyDAO) {
        this.postReplyDAO = postReplyDAO;
    }
}
