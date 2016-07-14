package com.service;

import com.pojo.InterestGroup;
import com.pojo.Letter;
import com.pojo.User;

import java.util.List;

/**
 * Created by Admin on 2016/6/27.
 */
public interface userService {
    public void createUser(User user);
    public void deleteUser(int userId);
    public void updateUser(User user);
    public User findUserById(int userId);
    public User findUserByUsername(String username);
    public User findUserByEmail(String email);
    public boolean validateUser(String email, String password);
    public boolean validateRegister(String username,String password,String email);
    public void sendLetter(String sender,String sendee, String letterContent);
    public void viewLetter(int letterId);
    public void addInterestGroup(String username,int interestgroupId);
    public void subscribeSeries(String username, String seriesName);
    public void addFavouriteGroup(String username,String groupName);
    public void addVideoToFavouriteGroup(int videoId,int groupId);
    public void giveUserRole(String username, int roleId);
    public List<Letter> showLetterByUser(String username);
    public List<InterestGroup> showGroupsByUsername(String username);
    public List<InterestGroup> showGroupsAll();
    public List<User> getAllUser();
}
