package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Letter;
import com.service.userService;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public class secretLetterAction extends baseAction {
    private userService userService;
    private String letterContent;
    private String receiverEmail;
    private List<Letter>letterList;
    private JSONObject result;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    private int letterId;

    public String sendLetter() {
        Map Session = ActionContext.getContext().getSession();
        String senderEmail = (String)Session.get("email");
        userService.sendLetter(senderEmail, receiverEmail, letterContent);
        return SUCCESS;
    }

    public String viewLetter() {
        userService.viewLetter(letterId);
        return SUCCESS;
    }

    public String listLetter() {
        dataMap.clear();
        //System.out.println("in list letter");
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        //System.out.println(user);
        letterList=userService.showLetterByUser(email);
        System.out.println(letterList.size());
//        Session.put("letterList",letterList);
        dataMap.put("letterList", letterList);
        System.out.println("success");
        //result = JSONObject.fromObject(letterList);
        return "json";
    }

    public String getLetterContent() {
        return letterContent;
    }

    public void setLetterContent(String letterContent) {
        this.letterContent = letterContent;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public userService getUserService(){
        return userService;
    }

    public List<Letter> getLetterList() {
        return letterList;
    }

    public void setLetterList(List<Letter> letterList) {
        this.letterList = letterList;
    }

    public JSONObject getResult() {
        return result;
    }

    public void setResult(JSONObject result) {
        this.result = result;
    }

    public int getLetterId() {
        return letterId;
    }

    public void setLetterId(int letterId) {
        this.letterId = letterId;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public String getReceiverEmail(){
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

//    public String getSender(){
//        return sender;
//    }
//
//    public void setSender(String sender) {
//        this.sender = sender;
//    }
}
