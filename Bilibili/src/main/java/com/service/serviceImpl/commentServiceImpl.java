package com.service.serviceImpl;

import com.dao.*;
import com.pojo.Comment;
import com.pojo.CommentReport;
import com.pojo.UserComment;
import com.pojo.VideoComment;
import com.service.commentService;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class commentServiceImpl implements commentService {
    private commentDAO commentDAO;
    private userCommentDAO userCommentDAO;
    private videoCommentDAO videoCommentDAO;
    private commentReportDAO commentReportDAO;
    private userDAO userDAO;

    @Override
    public void createComment(Comment comment) {
        commentDAO.createComment(comment);
    }

    @Override
    public void deleteComment(int commentId) {
        commentDAO.deleteComment(commentId);
    }

    @Override
    public void updateComment(Comment comment) {
        commentDAO.updateComment(comment);
    }

    @Override
    public Comment findCommentById(int commentId) {
        return commentDAO.findCommentById(commentId);
    }

    @Override
    public int getAllCommentCount() {
        return commentDAO.getAllCommentCount();
    }

    @Override
    public int findMaxCommentId() {
        return commentDAO.findMaxCommentId();
    }

    @Override
    public void makeCommentOnVideo(int videoId, String username, Comment comment) {
        int userId = userDAO.findUserByUsername(username).getUserId();
        createComment(comment);
        UserComment userComment = new UserComment();
        userComment.setCommentId(comment.getCommentId());
        userComment.setUserId(userId);
        userComment.setIsThumb(new Byte("0"));
        userCommentDAO.createUserComment(userComment);
        VideoComment videoComment = new VideoComment();
        videoComment.setCommentId(comment.getCommentId());
        videoComment.setVideoId(videoId);
        videoCommentDAO.createVideoComment(videoComment);
    }

    @Override
    public void reportComment(int commentId, String username, String reason) {
        int userId = userDAO.findUserByUsername(username).getUserId();
        CommentReport commentReport = new CommentReport();
        commentReport.setCommentId(commentId);
        commentReport.setUserId(userId);
        commentReport.setReason(reason);
        System.out.println(commentReport.getCommentId()+":"+commentReport.getUserId()+":"+commentReport.getReason());
        commentReportDAO.createCommentReport(commentReport);
    }

    @Override
    public void commentThumbCount(int commentId) {
        Comment comment = commentDAO.findCommentById(commentId);
        comment.setThumbCount(comment.getThumbCount()+1);
        commentDAO.updateComment(comment);
    }

    @Override
    public List<Comment> showCommentsByVideoId(int videoId) {
        return commentDAO.findCommentsByVideoId(videoId);
    }

    public com.dao.commentDAO getCommentDAO() {
        return commentDAO;
    }

    public void setCommentDAO(commentDAO commentDAO) {
        this.commentDAO = commentDAO;
    }

    public userCommentDAO getUsercommentDAO() {
        return userCommentDAO;
    }

    public void setUserCommentDAO(userCommentDAO userCommentDAO) {
        this.userCommentDAO = userCommentDAO;
    }

    public videoCommentDAO getVideoCommentDAO() {
        return videoCommentDAO;
    }

    public void setVideoCommentDAO(videoCommentDAO videocommentDAO) {
        this.videoCommentDAO = videocommentDAO;
    }

    public void setUserDAO(com.dao.userDAO userDAO) {
        this.userDAO = userDAO;
    }

    public com.dao.commentReportDAO getCommentReportDAO() {
        return commentReportDAO;
    }

    public void setCommentReportDAO(com.dao.commentReportDAO commentReportDAO) {
        this.commentReportDAO = commentReportDAO;
    }
}
