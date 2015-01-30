/*
Navicat SQL Server Data Transfer

Source Server         : __LocalHost - MSSQL
Source Server Version : 100000
Source Host           : localhost:1433
Source Database       : cf_dev
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2012-03-12 15:40:48
*/


-- ----------------------------
-- Table structure for [dbo].[chat_sessions]
-- ----------------------------
DROP TABLE [dbo].[chat_sessions]
GO
CREATE TABLE [dbo].[chat_sessions] (
[chat_user] varchar(25) NULL ,
[session_new] int NULL 
)


GO

-- ----------------------------
-- Records of chat_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[chat_transcriptions_archives]
-- ----------------------------
DROP TABLE [dbo].[chat_transcriptions_archives]
GO
CREATE TABLE [dbo].[chat_transcriptions_archives] (
[chat_user] varchar(25) NULL ,
[chat_text] varchar(MAX) NULL ,
[chat_date] varchar(25) NULL 
)


GO

-- ----------------------------
-- Records of chat_transcriptions_archives
-- ----------------------------
INSERT INTO [dbo].[chat_transcriptions_archives] ([chat_user], [chat_text], [chat_date]) VALUES (N'Gorgeous George', N'<div id=''message''><font color=''blue''><b>YourSiteName</b></font> :: Hello, <b>Gorgeous George</b>! While we''re getting a live operator to chat with you, please tell us a little about your accident and your injuries.</div>', N'2009-11-11');
GO
INSERT INTO [dbo].[chat_transcriptions_archives] ([chat_user], [chat_text], [chat_date]) VALUES (N'Gorgeous George', N'<div id=''message''><font color=''blue''><b>YourSiteName</b></font> :: Hello, <b>Gorgeous George</b>! While we''re getting a live operator to chat with you, please tell us a little about your accident and your injuries.</div>', N'2009-11-11');
GO
