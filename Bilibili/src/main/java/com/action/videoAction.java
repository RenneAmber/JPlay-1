package com.action;



import com.opensymphony.xwork2.ActionContext;
import com.pojo.Comment;
import com.pojo.Reply;
import com.pojo.User;
import com.pojo.Video;
import com.service.commentService;
import com.service.replyService;
import com.service.userService;
import com.service.videoService;
import com.util.ftsearchUtil;
import com.util.mongoUtil;
import com.util.timeUtil;

import javax.servlet.ServletException;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 * Created by Admin on 2016/6/27.
 */
public class videoAction extends baseAction {
    private userService userService;
    private videoService videoService;
    private commentService commentService;
    private replyService replyService;

    //用于上传视频
    private String title;
    private String content;
    private String message;

    //用于举报
    private int videoId;
    private String reason;

    //用于显示视频upe主信息，评论信息和回复信息，包括了搜索功能
    private Video videoBean;
    private User userBean;
    private List<Comment>commentList;
    private List<User> commentPusherList;
    private List<List<Reply>>replyList;
    private List<List<User>> replyPusherList;

    private List<Video> videoList;
    private String keyword;

    /** For Administrator **/
    public String deleteVideo() {
        videoService.deleteVideo(videoId);
        return SUCCESS;
    }

    public String listVideos() {
        videoList = videoService.findAllVideos();
        return SUCCESS;
    }

    /** For User **/
    public String upload() throws Exception  {
        System.out.println("Start uploading...");
        try {
            java.util.Map<String,Object> Session = ActionContext.getContext().getSession();
            if(!Session.containsKey("videoName")||!Session.containsKey("username")) {
                message = "100";
                return ERROR;
            }
            String email = (String)Session.get("email");
            //转码成功与否的标记
            boolean flag = false;

            //获得保存文件的路径
//            ServletContext sctx = getServletContext();
            //获得文件名
            String basePath = getServletContext().getRealPath("videos");
            //待转码的文件
            String serialName = String.valueOf(System.currentTimeMillis());
            //设置转换为flv格式后文件的保存路径
            String codcFilePath = basePath + "\\" + serialName + ".mp4";
            //设置上传视频截图的保存路径
            String mediaPicPath = basePath + "\\images" + File.separator + serialName + ".jpg";


            // 获取配置的转换工具（ffmpeg.exe）的存放路径
            String ffmpegPath = getServletContext().getRealPath("/tools/ffmpeg.exe");

            //设置video初始属性
            Video video = new Video();
//            video.setVideoId(videoService.findMaxVideoId()+1);
            video.setTitle(title);
            video.setContent(content);
            video.setLink("videos/" + serialName + ".mp4");
            video.setIsPass(new Byte("0"));
            video.setTopic("unknown");
            video.setCreateTime(timeUtil.GetCurrentTime());
            video.setLastUpdate(timeUtil.GetCurrentTime());
            video.setClickCount(0);
            video.setThumbCount(0);
            video.setUper(email);

            //video.setPicture("videos/images/" + serialName + ".jpg");

            //转码
            flag = videoService.executeCodecs(ffmpegPath,(String)Session.get("videoName"), codcFilePath, mediaPicPath);

            if (flag) {
                //转码成功,向数据表中添加该视频信息
                videoService.createVideo(video);
                videoService.addVideoUper(email, video.getVideoId());
                //利用mongoDB工具存储截图
                mongoUtil.StoreImage(mediaPicPath,video.getVideoId());
                Session.remove("videoName");
                message = "上传成功!";
                return SUCCESS;
            }
            message = "上传失败";
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    public String delete() throws Exception {
        try{
            videoService.deleteVideo(videoId);
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String update() throws Exception {
        try{
            Video video = videoService.findVideoById(videoId);

            if(content != null && content.length() !=0) {
                video.setContent(content);
            }

            video.setLastUpdate(timeUtil.GetCurrentTime());

            if(title != null && title.length() !=0){
                video.setTitle(title);
            }

            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String thumbCount() {
        videoService.videoThumbCount(videoId);
        return SUCCESS;
    }

    public String report() {
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        videoService.videoReport(email, videoId);
        return SUCCESS;
    }

    public String autoPlay() {
        replyList = new ArrayList<List<Reply>>();
        replyPusherList = new ArrayList<List<User>>();
        videoBean = videoService.findVideoById(videoId);
        userBean = videoService.findUperByVideoId(videoId);
        commentList = commentService.findCommentsByVideoId(videoId);
        commentPusherList = commentService.findCommentPushersByCommentList(commentList);
        System.out.println("Pusher name:"+commentPusherList.get(0).getUsername());

        List<Reply>temp;
        for(int i = 0; i < commentList.size(); i++){
            temp = replyService.findRepliesByCommentId(commentList.get(i).getCommentId());
            replyService.findReplyPushersByReplyList(temp);
            replyList.add(temp);
        }
        return SUCCESS;
    }

    public String search() throws Exception {
        ftsearchUtil ftsearchUtil = new ftsearchUtil();
        ftsearchUtil.createIndex();
        videoList = ftsearchUtil.getResult(keyword);
        System.out.println(videoList.size());
        System.out.println(keyword);
//        System.out.println("熊果");
        return SUCCESS;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setVideoService(com.service.videoService videoService) {
        this.videoService = videoService;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public Video getVideoBean() {
        return videoBean;
    }

    public void setVideoBean(Video videoBean) {
        this.videoBean = videoBean;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public commentService getCommentService() {
        return commentService;
    }

    public void setCommentService(commentService commentService) {
        this.commentService = commentService;
    }

    public List<List<Reply>> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<List<Reply>> replyList) {
        this.replyList = replyList;
    }

    public replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(replyService replyService) {
        this.replyService = replyService;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public User getUserBean() {
        return userBean;
    }

    public void setUserBean(User userBean) {
        this.userBean = userBean;
    }

    public List<User> getCommentPusherList() {
        return commentPusherList;
    }

    public void setCommentPusherList(List<User> commentPusherList) {
        this.commentPusherList = commentPusherList;
    }

    public List<List<User>> getReplyPusherList() {
        return replyPusherList;
    }

    public void setReplyPusherList(List<List<User>> replyPusherList) {
        this.replyPusherList = replyPusherList;
    }
}
