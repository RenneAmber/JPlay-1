package com.service;

import com.pojo.InterestGroup;
import com.pojo.Letter;
import com.pojo.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Admin on 2016/6/27.
 */
public interface userService {
    public void createUser(User user);
    public void deleteUser(int userId);
    public void updateUser(User user);
    public List<User> findAllUser();
    public User findUserById(int userId);
    public User findUserByUsername(String username);
    public User findUserByEmail(String email);
    public boolean validateUser(String email, String password);
    public boolean validateRegister(String username, String password, String email);
    public void sendLetter(String senderEmail,String receiverEmail, String letterContent);
    public void viewLetter(int letterId);
    public void addInterestGroup(String email,int interestGroupId);
    public void subscribeSeries(String email, String seriesName);
    public void addFavouriteGroup(String email,String groupName);
    public void addVideoToFavouriteGroup(int videoId,int groupId);
    public void giveUserRole(String email, int roleId);
    public List<Letter> showLetterByUser(String email);
    public List<InterestGroup> showGroupsByEmail(String email);
    public List<InterestGroup> showGroupsAll();
    public List<User> getAllUser();
}
