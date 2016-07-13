package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Letter;
import com.service.userService;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public class secretLetterAction extends baseAction {
    private userService userService;
    private String slettercontent;
    private String sendee;
    private List<Letter>letterList;
    private JSONObject result;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    private int letterId;

    public String sendLetter(){
        Map Session = ActionContext.getContext().getSession();
        String sender = (String)Session.get("username");
        System.out.println("SE"+sendee);
        userService.sendLetter(sender,sendee,slettercontent);

        return SUCCESS;
    }

    public String viewLetter(){
        userService.viewLetter(letterId);
        return SUCCESS;
    }

    public String listLetter()
    {
        dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String user=(String)Session.get("username");
        letterList=userService.showLetterByUser(user);
        System.out.println(letterList.size());
        dataMap.put("letterList", letterList);
        System.out.println("success");
        return "json";
    }

    public String getSlettercontent() {
        return slettercontent;
    }

    public void setSlettercontent(String slettercontent) {
        this.slettercontent = slettercontent;
    }

    public String getSendee(){
        return sendee;
    }
    public void setSendee(String sendee) {
        this.sendee = sendee;
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
}
