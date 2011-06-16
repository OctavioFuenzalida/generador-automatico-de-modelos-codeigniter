-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 15, 2011 at 09:02 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ACL`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `ID` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `restore` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `app`
--


-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `permKey` varchar(30) NOT NULL,
  `permName` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `permKey` (`permKey`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`ID`, `permKey`, `permName`) VALUES
(00000000000000000001, 'access_site', 'Access Site'),
(00000000000000000002, 'access_admin', 'Access Admin System'),
(00000000000000000003, 'publish_articles', 'Publish Articles'),
(00000000000000000004, 'publish_events', 'Publish Events'),
(00000000000000000005, 'install_modules', 'Install Modules'),
(00000000000000000006, 'post_comments', 'Post Comments'),
(00000000000000000007, 'access_premium_content', 'Access Premium Content'),
(00000000000000000008, 'limited_admin', 'Limited Admin');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID`, `roleName`) VALUES
(00000000000000000001, 'Administrators'),
(00000000000000000002, 'All Users'),
(00000000000000000003, 'Authors'),
(00000000000000000004, 'Premium Members');

-- --------------------------------------------------------

--
-- Table structure for table `role_perms`
--

CREATE TABLE IF NOT EXISTS `role_perms` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `roleID` bigint(20) NOT NULL,
  `permID` bigint(20) NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `roleID_2` (`roleID`,`permID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `role_perms`
--

INSERT INTO `role_perms` (`ID`, `roleID`, `permID`, `value`, `addDate`) VALUES
(00000000000000000016, 1, 2, 1, '2009-03-02 17:13:21'),
(00000000000000000017, 1, 7, 1, '2009-03-02 17:13:21'),
(00000000000000000018, 1, 1, 1, '2009-03-02 17:13:21'),
(00000000000000000019, 1, 5, 1, '2009-03-02 17:13:21'),
(00000000000000000020, 1, 8, 1, '2009-03-02 17:13:21'),
(00000000000000000021, 1, 6, 1, '2009-03-02 17:13:21'),
(00000000000000000022, 1, 3, 1, '2009-03-02 17:13:21'),
(00000000000000000023, 1, 4, 1, '2009-03-02 17:13:21'),
(00000000000000000024, 2, 1, 1, '2009-03-02 17:13:31'),
(00000000000000000025, 3, 7, 1, '2009-03-02 17:13:38'),
(00000000000000000026, 3, 8, 1, '2009-03-02 17:13:38'),
(00000000000000000027, 3, 6, 1, '2009-03-02 17:13:38'),
(00000000000000000028, 3, 3, 1, '2009-03-02 17:13:38'),
(00000000000000000029, 3, 4, 1, '2009-03-02 17:13:38'),
(00000000000000000030, 4, 7, 1, '2009-03-02 17:13:42'),
(00000000000000000031, 4, 6, 1, '2009-03-02 17:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`) VALUES
(0000000001, 'Admin Steve'),
(0000000002, 'Author Aaron'),
(0000000003, 'Joe User'),
(0000000004, 'Penelope Premium');

-- --------------------------------------------------------

--
-- Table structure for table `user_perms`
--

CREATE TABLE IF NOT EXISTS `user_perms` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `permID` bigint(20) NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userID` (`userID`,`permID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_perms`
--

INSERT INTO `user_perms` (`ID`, `userID`, `permID`, `value`, `addDate`) VALUES
(00000000000000000001, 4, 2, 0, '2011-01-30 17:03:39'),
(00000000000000000002, 4, 8, 1, '2011-01-30 17:03:39'),
(00000000000000000003, 4, 3, 1, '2011-01-30 17:03:40'),
(00000000000000000004, 4, 4, 1, '2011-01-30 17:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `userID` bigint(20) NOT NULL,
  `roleID` bigint(20) NOT NULL,
  `addDate` datetime NOT NULL,
  UNIQUE KEY `userID` (`userID`,`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`userID`, `roleID`, `addDate`) VALUES
(1, 1, '2009-03-02 17:14:45'),
(1, 2, '2009-03-02 17:14:45'),
(2, 2, '2009-03-02 17:27:23'),
(2, 3, '2009-03-02 17:27:23'),
(3, 2, '2009-03-02 17:27:05'),
(4, 2, '2011-01-30 17:03:33'),
(4, 4, '2011-01-30 17:03:33');
