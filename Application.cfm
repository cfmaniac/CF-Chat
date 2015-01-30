<cfsetting enablecfoutputonly="Yes">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      Define a new application
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfapplication name="ColdFusion Live Support ChatRoom"
			   clientmanagement="Yes"
               sessionmanagement="Yes"
               sessiontimeout="#CreateTimeSpan(0,0,10,0)#"
               applicationtimeout="#CreateTimeSpan(0,0,10,0)#">
			   
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	  Define default variables
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfparam name="Application.UserList" default="">
<cfparam name="Application.AdminUserList" default="">
<cfparam name="Application.MessageLog" default="">
<cfset Application.Title	=	"ColdFusion Live Support Chat System">
<cfset datasource = "your Datasource">
<cfset YourSiteSite = "Your Site Name">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      First define default session
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfparam name="session.MyUsername" default="">
<cfparam name="session.Adminname" default="">
<cfparam name="session.goodUser" default="No">

<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      Now see if the user has logged themselves in 
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfif IsDefined("FORM.MyUsername") and FORM.MyUsername neq "">
	<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	      First see if the username is available 
    	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
	<cfset UserOkToUse	=	ListFind(Application.UserList, FORM.MyUsername, "#chr(9)#")>

	<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	      Username ok to use
		  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
	<cfif UserOkToUse eq 0>
		<cfset session.MyUsername = FORM.MyUsername>
		<cfset session.goodUser	  = "Yes">
		<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			  Now add user to list of users
			  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
		<cfset Application.UserList = ListAppend(Application.UserList, FORM.MyUsername, "#chr(9)#")>
        <cfset Application.AdminUserList = ListAppend(Application.AdminUserList, FORM.MyUsername, "#chr(9)#")>
		<!---
		You Can UnComment this Line if you want a "User Has Logged in" Notice
		<cfset Application.MessageLog = "<font color=Green><b>#session.MyUserName# Logged In at #DateFormat(now())# #TimeFormat(now())#</b></font><br>" & Application.MessageLog>--->
	<cfelse>
		<cfset UserMessage = "Username taken, try another!">
	</cfif>
</cfif>
<cfsetting enablecfoutputonly="No">