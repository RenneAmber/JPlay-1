-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-13 08:29:37
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bilibili`
--

-- --------------------------------------------------------

--
-- 表的结构 `authority`
--

DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `auth_id` int(10) NOT NULL,
  `auth_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `auth_content` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(10) NOT NULL,
  `content` varchar(200) COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `thumb_count` int(10) NOT NULL,
  `comment_pusher` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 触发器 `comment`
--
DROP TRIGGER IF EXISTS `comment_BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `comment_BEFORE_DELETE` BEFORE DELETE ON `comment` FOR EACH ROW BEGIN
	DELETE FROM `reply` WHERE `reply_id` IN (
		SELECT `reply_id` FROM `comment_reply` WHERE `comment_id` = OLD.`comment_id`
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `comment_reply`
--

DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply` (
  `comment_id` int(10) NOT NULL,
  `reply_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `comment_report`
--

DROP TABLE IF EXISTS `comment_report`;
CREATE TABLE `comment_report` (
  `comment_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `reason` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `favorite_group`
--

DROP TABLE IF EXISTS `favorite_group`;
CREATE TABLE `favorite_group` (
  `group_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `group_name` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `follower_id` int(10) NOT NULL,
  `followee_id` int(10) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `group_post`
--

DROP TABLE IF EXISTS `group_post`;
CREATE TABLE `group_post` (
  `post_id` int(10) NOT NULL,
  `interest_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `interestgroup_user`
--

DROP TABLE IF EXISTS `interestgroup_user`;
CREATE TABLE `interestgroup_user` (
  `user_id` int(10) NOT NULL,
  `interest_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `interest_group`
--

DROP TABLE IF EXISTS `interest_group`;
CREATE TABLE `interest_group` (
  `interest_group_id` int(10) NOT NULL,
  `interst_group_name` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 触发器 `interest_group`
--
DROP TRIGGER IF EXISTS `interest_group_BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `interest_group_BEFORE_DELETE` BEFORE DELETE ON `interest_group` FOR EACH ROW BEGIN
	DELETE FROM `post` where `interest_group_id` in (
		select `post_id` from `group_post` where `interest_group_id` = OLD.`interest_group_id`
    ); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `letter`
--

DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `letter_id` int(10) NOT NULL,
  `sender_id` int(10) NOT NULL,
  `receiver_id` int(10) NOT NULL,
  `letter_content` varchar(500) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(10) NOT NULL,
  `content` varchar(500) COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `thumb_count` int(10) NOT NULL,
  `post_pusher` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 触发器 `post`
--
DROP TRIGGER IF EXISTS `post_BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `post_BEFORE_DELETE` BEFORE DELETE ON `post` FOR EACH ROW BEGIN
	DELETE FROM `reply` WHERE `reply_id` IN (
		SELECT `reply_id` FROM `post_reply` WHERE `post_id` = OLD.`post_id`
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `post_reply`
--

DROP TABLE IF EXISTS `post_reply`;
CREATE TABLE `post_reply` (
  `reply_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `post_report`
--

DROP TABLE IF EXISTS `post_report`;
CREATE TABLE `post_report` (
  `post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `reason` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(10) NOT NULL,
  `content` varchar(200) COLLATE utf8_bin NOT NULL,
  `thumb_count` int(10) NOT NULL,
  `reply_pusher` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `reply_report`
--

DROP TABLE IF EXISTS `reply_report`;
CREATE TABLE `reply_report` (
  `reply_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `reason` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `role_authority`
--

DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `role_id` int(10) NOT NULL,
  `auth_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE `series` (
  `series_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `series_video`
--

DROP TABLE IF EXISTS `series_video`;
CREATE TABLE `series_video` (
  `series_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `video_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE `subcategory` (
  `subcategory_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `category_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `user_id` int(10) NOT NULL,
  `series_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `tag_video`
--

DROP TABLE IF EXISTS `tag_video`;
CREATE TABLE `tag_video` (
  `tag_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `video_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `pwdhash` blob NOT NULL,
  `status` tinyint(1) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `signature` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `email` varbinary(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `realName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `university` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `experience` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 触发器 `user`
--
DROP TRIGGER IF EXISTS `user_BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `user_BEFORE_DELETE` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
	DELETE FROM `comment` WHERE `comment_id` IN (
		SELECT `comment_id` FROM `user_comment` WHERE `user_id` = OLD.`user_id`
    );
    DELETE FROM `reply` WHERE `reply_id` IN (
		SELECT `reply_id` FROM `user_reply` WHERE `user_id` = OLD.`user_id`
    );
    DELETE FROM `post` WHERE `post_id` IN (
		SELECT `post_id` FROM `user_post` WHERE `user_id` = OLD.`user_id`
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `user_id` int(10) NOT NULL,
  `comment_id` int(10) NOT NULL,
  `is_thumb` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `user_post`
--

DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post` (
  `user_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `is_thumb` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `user_reply`
--

DROP TABLE IF EXISTS `user_reply`;
CREATE TABLE `user_reply` (
  `user_id` int(10) NOT NULL,
  `reply_id` int(10) NOT NULL,
  `is_thumb` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `video_id` int(10) NOT NULL,
  `uper` varchar(50) COLLATE utf8_bin NOT NULL,
  `topic` varchar(50) COLLATE utf8_bin NOT NULL,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` varchar(50) COLLATE utf8_bin NOT NULL,
  `link` varchar(300) COLLATE utf8_bin NOT NULL,
  `create_time` time NOT NULL,
  `last_update` time NOT NULL,
  `is_pass` tinyint(1) NOT NULL,
  `click_count` int(10) NOT NULL,
  `thumb_count` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 触发器 `video`
--
DROP TRIGGER IF EXISTS `video_BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `video_BEFORE_DELETE` BEFORE DELETE ON `video` FOR EACH ROW BEGIN
	DELETE FROM `comment` WHERE `comment_id` IN (
		SELECT `comment_id` FROM `video_comment` WHERE `video_id` = OLD.`video_id`
    );
	DELETE FROM `user` WHERE `user_id` IN (
		SELECT `user_id` FROM `video_uper` WHERE `video_id` = OLD.`video_id`
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `video_comment`
--

DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment` (
  `video_id` int(10) NOT NULL,
  `comment_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `video_favorite`
--

DROP TABLE IF EXISTS `video_favorite`;
CREATE TABLE `video_favorite` (
  `video_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `video_report`
--

DROP TABLE IF EXISTS `video_report`;
CREATE TABLE `video_report` (
  `user_id` int(10) NOT NULL,
  `video_id` int(10) NOT NULL,
  `reason` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `video_subcategory`
--

DROP TABLE IF EXISTS `video_subcategory`;
CREATE TABLE `video_subcategory` (
  `video_id` int(10) NOT NULL,
  `subcategory_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `video_uper`
--

DROP TABLE IF EXISTS `video_uper`;
CREATE TABLE `video_uper` (
  `video_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_name`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `comment_reply`
--
ALTER TABLE `comment_reply`
  ADD PRIMARY KEY (`comment_id`,`reply_id`),
  ADD KEY `FK_Reference_23` (`reply_id`);

--
-- Indexes for table `comment_report`
--
ALTER TABLE `comment_report`
  ADD PRIMARY KEY (`comment_id`,`user_id`),
  ADD KEY `FK_Reference_29` (`user_id`);

--
-- Indexes for table `favorite_group`
--
ALTER TABLE `favorite_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `FK_Reference_9` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follower_id`,`followee_id`),
  ADD KEY `FK_Reference_6` (`followee_id`);

--
-- Indexes for table `group_post`
--
ALTER TABLE `group_post`
  ADD PRIMARY KEY (`post_id`,`interest_group_id`),
  ADD KEY `FK_Reference_46` (`interest_group_id`);

--
-- Indexes for table `interestgroup_user`
--
ALTER TABLE `interestgroup_user`
  ADD PRIMARY KEY (`user_id`,`interest_group_id`),
  ADD KEY `FK_Reference_41` (`interest_group_id`);

--
-- Indexes for table `interest_group`
--
ALTER TABLE `interest_group`
  ADD PRIMARY KEY (`interest_group_id`);

--
-- Indexes for table `letter`
--
ALTER TABLE `letter`
  ADD PRIMARY KEY (`letter_id`),
  ADD KEY `FK_Reference_7` (`receiver_id`),
  ADD KEY `FK_Reference_8` (`sender_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_reply`
--
ALTER TABLE `post_reply`
  ADD PRIMARY KEY (`reply_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post_report`
--
ALTER TABLE `post_report`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `FK_Reference_44` (`user_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `reply_report`
--
ALTER TABLE `reply_report`
  ADD PRIMARY KEY (`reply_id`,`user_id`),
  ADD KEY `FK_Reference_32` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_authority`
--
ALTER TABLE `role_authority`
  ADD PRIMARY KEY (`role_id`,`auth_id`),
  ADD KEY `FK_Reference_34` (`auth_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`series_name`);

--
-- Indexes for table `series_video`
--
ALTER TABLE `series_video`
  ADD PRIMARY KEY (`series_name`,`video_id`),
  ADD KEY `FK_Reference_48` (`video_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcategory_name`),
  ADD KEY `FK_Reference_36` (`category_name`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`user_id`,`series_name`),
  ADD KEY `series_name` (`series_name`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_name`);

--
-- Indexes for table `tag_video`
--
ALTER TABLE `tag_video`
  ADD PRIMARY KEY (`tag_name`,`video_id`),
  ADD KEY `FK_Reference_38` (`video_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`user_id`,`comment_id`),
  ADD KEY `FK_Reference_13` (`comment_id`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `FK_Reference_43` (`post_id`);

--
-- Indexes for table `user_reply`
--
ALTER TABLE `user_reply`
  ADD PRIMARY KEY (`user_id`,`reply_id`),
  ADD KEY `FK_Reference_30` (`reply_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `FK_Reference_4` (`user_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `video_comment`
--
ALTER TABLE `video_comment`
  ADD PRIMARY KEY (`video_id`,`comment_id`),
  ADD KEY `FK_Reference_14` (`comment_id`);

--
-- Indexes for table `video_favorite`
--
ALTER TABLE `video_favorite`
  ADD PRIMARY KEY (`video_id`,`group_id`),
  ADD KEY `FK_Reference_10` (`group_id`);

--
-- Indexes for table `video_report`
--
ALTER TABLE `video_report`
  ADD PRIMARY KEY (`user_id`,`video_id`),
  ADD KEY `FK_Reference_27` (`video_id`);

--
-- Indexes for table `video_subcategory`
--
ALTER TABLE `video_subcategory`
  ADD PRIMARY KEY (`video_id`,`subcategory_name`),
  ADD KEY `FK_Reference_17` (`subcategory_name`);

--
-- Indexes for table `video_uper`
--
ALTER TABLE `video_uper`
  ADD PRIMARY KEY (`video_id`,`user_id`),
  ADD KEY `FK_Reference_21` (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `authority`
--
ALTER TABLE `authority`
  MODIFY `auth_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `favorite_group`
--
ALTER TABLE `favorite_group`
  MODIFY `group_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `interest_group`
--
ALTER TABLE `interest_group`
  MODIFY `interest_group_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `letter`
--
ALTER TABLE `letter`
  MODIFY `letter_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `reply`
--
ALTER TABLE `reply`
  MODIFY `reply_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `comment_reply`
--
ALTER TABLE `comment_reply`
  ADD CONSTRAINT `FK_Reference_22` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_23` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `comment_report`
--
ALTER TABLE `comment_report`
  ADD CONSTRAINT `FK_Reference_28` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_29` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `favorite_group`
--
ALTER TABLE `favorite_group`
  ADD CONSTRAINT `FK_Reference_9` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `FK_Reference_5` FOREIGN KEY (`follower_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_6` FOREIGN KEY (`followee_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `group_post`
--
ALTER TABLE `group_post`
  ADD CONSTRAINT `FK_Reference_46` FOREIGN KEY (`interest_group_id`) REFERENCES `interest_group` (`interest_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_47` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `interestgroup_user`
--
ALTER TABLE `interestgroup_user`
  ADD CONSTRAINT `FK_Reference_40` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_41` FOREIGN KEY (`interest_group_id`) REFERENCES `interest_group` (`interest_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `letter`
--
ALTER TABLE `letter`
  ADD CONSTRAINT `FK_Reference_7` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_8` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `post_reply`
--
ALTER TABLE `post_reply`
  ADD CONSTRAINT `post_reply_ibfk_1` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_reply_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `post_report`
--
ALTER TABLE `post_report`
  ADD CONSTRAINT `FK_Reference_44` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_45` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `reply_report`
--
ALTER TABLE `reply_report`
  ADD CONSTRAINT `FK_Reference_32` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_35` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `role_authority`
--
ALTER TABLE `role_authority`
  ADD CONSTRAINT `FK_Reference_33` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_34` FOREIGN KEY (`auth_id`) REFERENCES `authority` (`auth_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `series_video`
--
ALTER TABLE `series_video`
  ADD CONSTRAINT `FK_Reference_48` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_49` FOREIGN KEY (`series_name`) REFERENCES `series` (`series_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `FK_Reference_36` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`);

--
-- 限制表 `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribe_ibfk_2` FOREIGN KEY (`series_name`) REFERENCES `series` (`series_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `tag_video`
--
ALTER TABLE `tag_video`
  ADD CONSTRAINT `FK_Reference_37` FOREIGN KEY (`tag_name`) REFERENCES `tag` (`tag_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_38` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_comment`
--
ALTER TABLE `user_comment`
  ADD CONSTRAINT `FK_Reference_12` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_13` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `FK_Reference_42` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_43` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_reply`
--
ALTER TABLE `user_reply`
  ADD CONSTRAINT `FK_Reference_30` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_31` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_Reference_39` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `video_comment`
--
ALTER TABLE `video_comment`
  ADD CONSTRAINT `FK_Reference_14` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_15` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`);

--
-- 限制表 `video_favorite`
--
ALTER TABLE `video_favorite`
  ADD CONSTRAINT `FK_Reference_10` FOREIGN KEY (`group_id`) REFERENCES `favorite_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_11` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `video_report`
--
ALTER TABLE `video_report`
  ADD CONSTRAINT `FK_Reference_26` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_27` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `video_subcategory`
--
ALTER TABLE `video_subcategory`
  ADD CONSTRAINT `FK_Reference_16` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_17` FOREIGN KEY (`subcategory_name`) REFERENCES `subcategory` (`subcategory_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `video_uper`
--
ALTER TABLE `video_uper`
  ADD CONSTRAINT `FK_Reference_20` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reference_21` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
