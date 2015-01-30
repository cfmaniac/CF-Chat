ColdFusion Live Support Chat Script
Written By James Harvey

available at : 
http://alteredpixels.net/download.cfm?id=EEE6C3E1-3048-94E3-E96EB73165A94C76
http://cf_support.riaforge.org/

==================

I wrote this Chat Script for a Project I was Working on and had decided to include it here.

This Script is very Light-weight and is very easy on your webserver as everything is run through the Application and Session Scopes, there are However Two Database Tables that must be used in order to use it correctly, included in the package. (Please Note this Schema is for MYSQL).

This Chat uses the use of a Modal Window, Some JQuery for the Administration End and has a nice Source PNG File included for modifying the layout of the Actual Chat Screen. 

This Script also supports the use of Chat Transcripts, and if a user closes the Modal window the system  archives the chat and closes thier Session.

==================
Setting Up the Chat Script::

You will need a Coldfusion Webserver, and MYSQL Support.

Through Your MySQL administation interface run the included */sql Script in the SQL Folder.

Open Application.cfm ::

You change the Following 3 Lines:

<cfset Application.Title	=	"ColdFusion Live Support Chat System">
<cfset datasource = "your Datasource">
<cfset YourSiteSite = "Your Site Name"> 

===================

To Test it use::
http://yourdomain.com/support/index.html

To Test The Admin ::
http://yourdomain.com/support/admin.cfm

===================

That's It.