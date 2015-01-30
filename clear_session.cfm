<cfset chat_user = #form.chat_user#>

<cfquery name="clear_session" datasource="#datasource#">
update chat_sessions set session_new ='0' where chat_user='#chat_user#'
</cfquery>