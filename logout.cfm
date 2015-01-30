<cfif isdefined('form.email') and form.email NEQ "">
<!---\\Sends Transcription and then forwards to Logout.cfm//--->
<cfmail to ="#form.email#" type="html" subject="Chat Transcription from #YourSiteName#" from="#YourSiteName# <no-reply@#datasource#now.com>">
<cfoutput>
Thank you <b>#form.username#</b> for chatting with #YourSiteName# on #dateformat(now(), "MM/DD/YYYY")#. Below is the Transcript from your chat session.<br><br>
#form.chat_text#
<br><br>
This Email was sent from #datasource#now.com on #dateformat(now(), "MM/DD/YYYY")#.
</cfoutput>
</cfmail>
<cfquery name="Archive_chat" datasource="#datasource#">
insert into chat_transcriptions_archives (chat_user, chat_text, chat_date) VALUES ('#form.username#', '#form.chat_text#', '#dateformat(now(), "YYYY-MM-DD")#');
</cfquery>
<cfquery name="clear_session" datasource="#datasource#">
update chat_sessions set session_new ='0' where chat_user='#form.username#'
</cfquery>
<cfset Application.UserList = ListDeleteAt(Application.UserList, ListFindNoCase(Application.UserList, session.MyUsername, "#chr(9)#"), "#chr(9)#")>
<cfset StructClear(Session)>
<cfset Application.MessageLog = "">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      LOG THE USER OUT
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfset session.MyUsername = "">
<cfset session.goodUser	  = "No">

<script>
top.f_dialogClose();
</script>


<cfelseif isdefined('form.chat_text') and form.chat_text NEQ "">
<cfquery name="Archive_chat" datasource="#datasource#">
insert into chat_transcriptions_archives (chat_user, chat_text, chat_date) VALUES ('#form.username#', '#form.chat_text#', '#dateformat(now(), "YYYY-MM-DD")#');
</cfquery>
<cfquery name="clear_session" datasource="#datasource#">
update chat_sessions set session_new ='0' where chat_user='#form.username#'
</cfquery>
<cfset Application.UserList = ListDeleteAt(Application.UserList, ListFindNoCase(Application.UserList, session.MyUsername, "#chr(9)#"), "#chr(9)#")>
<cfset StructClear(Session)>
<cfset Application.MessageLog = "">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      LOG THE USER OUT
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfset session.MyUsername = "">
<cfset session.goodUser	  = "No">

<script>
top.f_dialogClose();
</script>
</cfif>



