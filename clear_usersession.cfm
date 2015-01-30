<cfset chat_user = #session.MyUsername#>
<cfset Application.MessageLog	= "<div id='message'><font color='red'><b>User #session.MyUsername# Ended Session by closing Window</b></font></div>" & Application.MessageLog>
<!---<cfoutput>
#session.MyUsername#<br />
#Application.MessageLog#
</cfoutput>--->
<cfquery name="Archive_chat" datasource="#datasource#">
insert into chat_transcriptions_archives (chat_user, chat_text, chat_date) VALUES ('#session.MyUsername#', '#Application.MessageLog#', '#dateformat(now(), "YYYY-MM-DD")#');
</cfquery>

<!---<cfabort>--->
<cfset Application.UserList = ListDeleteAt(Application.UserList, ListFindNoCase(Application.UserList, session.MyUsername, "#chr(9)#"), "#chr(9)#")>
<cfset StructClear(Session)>
<cfset Application.MessageLog = "">