package com.service;

import com.pojo.Reply;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface replyService {
    /**
     * createReply方法实现了向数据库中增加一个reply的功能
     * @param reply 传入要增加的reply
     */
    public void createReply(Reply reply);

    /**
     * deleteReply方法实现了从数据库中删除一个reply的功能
     * @param replyId 传入replyId以根据replyId找到要删除的reply
     */
    public void deleteReply(int replyId);

    /**
     * updateReply方法实现了向数据库中修改一个reply属性的功能
     * @param reply 传入要修改的reply（包含修改属性）
     */
    public void updateReply(Reply reply);

    /**
     * findReplyById方法实现了根据replyId找到一个reply信息的功能
     * @param replyId 传入replyId作为查找因子
     * @return 返回需要查找的Reply类的对象
     */
    public Reply findReplyById(int replyId);

//    public int findMaxReplyId();

    public void makeReplyOnComment(int commentId,String username,Reply reply);

    public void makeReplyOnPost(int postId,String username,Reply reply);

    public void reportReply(int replyId,String username,String reason);

    public void replyThumbCount(int replyId);

    public List<Reply> showRepliesByCommentId(int commentId);

    public List<Reply> showRepliesByPostId(int postId);
}
