<html>
<head>
	<title>Logged In Users</title>
    <script language="javascript" type="text/javascript">
var win=null;
function NewWindow(mypage,myname,w,h,scroll,pos){
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=0;TopPosition=20}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
win=window.open(mypage,myname,settings);}
// -->
</script>
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
    <meta http-equiv="refresh" content="15">
</head>

<body>
<cfquery name="new_sessions" datasource="#datasource#">
Select * from chat_sessions where session_new = '1'
</cfquery>

<cfif #new_sessions.recordcount# EQ "0">
<h3>Checking for New Click-to-Chat Sessions...</h3>
<form>
<input type="submit" name="Refresh" value="Refresh User List" onClick="javascript:history.go(0);">
</form>
<cfelseif #new_sessions.recordcount# NEQ "0">
<form>
<h3>Users Currently Waiting::</h3><BR>

<!---<ul>
<cfloop list="#Application.AdminUserList#" index="UserName" delimiters="#chr(9)#">
  <li>#UserName#</li>
</cfloop>

</ul>--->
<cfloop query="new_sessions" startrow="1" endrow="#new_sessions.recordcount#">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
   <script type="text/javascript" src="js/jquery.gritter.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$.extend($.gritter.options, { 
			fade_in_speed: 'medium', // how fast notifications fade in (string or int)
			fade_out_speed: 2000 // how fast the notices fade out
			//time: 6000 // hang on the screen for...
		});					   
							   
		$.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'New Click-to-Chat Request By <cfoutput>#new_sessions.chat_user#</cfoutput>',
				// (string | mandatory) the text inside the notification
				text: 'To Chat with <cfoutput>#new_sessions.chat_user#</cfoutput> <a href="##" onclick="NewWindow(\'http://#datasource#now.com/modules/chat/support/admin_index.cfm?admin=<cfoutput>#cookie.admin_user_fullname#</cfoutput>\',\'Chatting_With_<cfoutput>#new_sessions.chat_user#</cfoutput>\',\'675\',\'675\',\'no\',\'center\');" style="font-weight:bold; color:#fff;" class="gritter-close">Click Here</a>',
				// Stickeh!
				sticky: true,
				
				// (function | optional) function called before it closes
				before_close: function(e){
					//alert("Closing the Chat Notification");
				<!---<cfset Application.AdminUserList = ListDeleteAt(Application.AdminUserList, ListFindNoCase(Application.AdminUserList, UserName, "#chr(9)#"), "#chr(9)#")>--->
				//Sends Request to script to clear the session by setting it to '0'
				$.post("clear_session.cfm",{
				chat_user: '<cfoutput>#new_sessions.chat_user#</cfoutput>'});
							
				}
				
	
			
});
	
	});
</script>

</cfloop>

<script language="JavaScript1.2"> 
//Maximizes the Window so the user knows there is a new Chat Request
top.window.moveTo(0,0); 
if (document.all) 
   { top.window.resizeTo(screen.availWidth,screen.availHeight); } 
else if 
   (document.layers || document.getElementById) 
   { 
   if 
    (top.window.outerHeight < screen.availHeight || top.window.outerWidth < 
screen.availWidth)
     { top.window.outerHeight = top.screen.availHeight; 
       top.window.outerWidth = top.screen.availWidth; } 
   } 
   top.window.focus()
</script>
<input type="submit" name="Refresh" value="Refresh User List" onClick="javascript:history.go(0);">
</form>

</cfif>


</body>
</html>
