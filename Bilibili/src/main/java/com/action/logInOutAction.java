package com.action;


import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import com.service.userService;


/**
 * Created by Admin on 2016/6/27.
 */
public class logInOutAction extends baseAction {
    private static final long serialVersionUID = 1L;
    private userService userService;
    private String username;
    private String password;

    public String logIn(){
        if (username.equals("") || password.equals("")) {
            return ERROR;
        }
        Boolean ret = userService.validateUser(username, password);
        if (ret == false) {
            return ERROR;
        }
        Map Session = ActionContext.getContext().getSession();
        Session.put("username", username);
        if (ret.equals("N")){
            return "user";
        } else {
            return "admin";
        }
    }

    public String logOut(){
        Map Session = ActionContext.getContext().getSession();
        Session.clear();
        return SUCCESS;
    }

    public userService getUserService() {
        return userService;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
