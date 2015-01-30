-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 13, 2009 at 01:39 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `#datasource#now`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE IF NOT EXISTS `chat_sessions` (
  `chat_user` varchar(25) default NULL,
  `session_new` int(11) default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_sessions`
--



-- --------------------------------------------------------

--
-- Table structure for table `chat_transcriptions_archives`
--

CREATE TABLE IF NOT EXISTS `chat_transcriptions_archives` (
  `chat_user` varchar(25) default NULL,
  `chat_text` text,
  `chat_date` varchar(25) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_transcriptions_archives`
--

INSERT INTO `chat_transcriptions_archives` (`chat_user`, `chat_text`, `chat_date`) VALUES
('Gorgeous George', '<div id=''message''><font color=''blue''><b>YourSiteName</b></font> :: Hello, <b>Gorgeous George</b>! While we''re getting a live operator to chat with you, please tell us a little about your accident and your injuries.</div>', '2009-11-11');
