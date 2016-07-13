package com.action;



import com.opensymphony.xwork2.ActionContext;
import com.pojo.Comment;
import com.pojo.Reply;
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
    private String title;
    private String content;
    private String message;

    private int videoId;
    private String reason;

    private Video videoBean;
    private List<Comment>commentListBean;
    private List<List<Reply>>replyListBean;
    private List<Video> videoBeanList;
    private String keyword;

    /** For Administrator **/
    public String deleteVideo() {
        videoService.deleteVideo(videoId);
        return SUCCESS;
    }

    public String listVideos() {
        videoBeanList = videoService.findAllVideos();
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
            String username = (String)Session.get("username");
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
            video.setLink("videos/"+serialName + ".mp4");
            video.setIsPass(new Byte("0"));
            video.setTopic("unknown");
            video.setCreateTime(timeUtil.GetCurrentTime());
            video.setLastUpdate(timeUtil.GetCurrentTime());
            video.setClickCount(0);
            video.setThumbCount(0);
            video.setUper(username);

            //video.setPicture("videos/images/" + serialName + ".jpg");

            //转码
            flag = videoService.executeCodecs(ffmpegPath,(String)Session.get("videoName") , codcFilePath, mediaPicPath);

            if (flag) {
                //转码成功,向数据表中添加该视频信息
                videoService.createVideo(video);
                videoService.addVideoUper(username,video.getVideoId());
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

    public String delete() throws Exception{
        try{
            videoService.deleteVideo(videoId);
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String update() throws Exception{
        try{
            Video video = videoService.findVideoById(videoId);

            if(content != null &&content.length() !=0) {
                video.setContent(content);
            }

            video.setLastUpdate(timeUtil.GetCurrentTime());

            if(title != null &&title.length() !=0){
                video.setTitle(title);
            }

            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }
    public String thumbCount(){
        videoService.videoThumbCount(videoId);
        return SUCCESS;
    }

    public String report(){
        Map Session = ActionContext.getContext().getSession();
        String username = (String)Session.get("username");
        videoService.videoReport(username,videoId);
        return SUCCESS;
    }

    public String autoPlay(){
        replyListBean = new ArrayList<List<Reply>>();
        videoBean = videoService.findVideoById(videoId);
        commentListBean = commentService.showCommentsByVideoId(videoId);
        for(int i = 0; i < commentListBean.size(); i++){
            replyListBean.add(replyService.showRepliesByCommentId(commentListBean.get(i).getCommentId()));
        }
        return SUCCESS;
    }

    public String search() throws Exception {
        ftsearchUtil ftsearchUtil = new ftsearchUtil();
        ftsearchUtil.createIndex();
        videoBeanList = ftsearchUtil.getResult(keyword);
        System.out.println(videoBeanList.size());
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

    public List<Comment> getCommentListBean() {
        return commentListBean;
    }

    public void setCommentListBean(List<Comment> commentListBean) {
        this.commentListBean = commentListBean;
    }

    public com.service.commentService getCommentService() {
        return commentService;
    }

    public void setCommentService(com.service.commentService commentService) {
        this.commentService = commentService;
    }

    public List<List<Reply>> getReplyListBean() {
        return replyListBean;
    }

    public void setReplyListBean(List<List<Reply>> replyListBean) {
        this.replyListBean = replyListBean;
    }

    public com.service.replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(com.service.replyService replyService) {
        this.replyService = replyService;
    }

    public List<Video> getVideoBeanList() {
        return videoBeanList;
    }

    public void setVideoBeanList(List<Video> videoBeanList) {
        this.videoBeanList = videoBeanList;
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
}
