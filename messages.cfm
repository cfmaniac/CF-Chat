<html>
<head>
	<title>Message Log</title>
	<script>
	window.onload = function() { setTimeout("window.location.href='messages.cfm';", 5000) }; // 5000 = 2 seconds (it's in milliseconds)
	</script>
    <style>
	body {
	margin: 0;
	padding: 25px;
	font: normal small Arial, Helvetica, sans-serif;
	line-height: 1.8em;
	color: #000000;
}
	</style>
    
</head>

<body>

<cfif #Application.MessageLog# EQ "">
<cfset Application.MessageLog = "<div id='message'><font color='blue'><b>#YourSiteName#</b></font> :: Hello, <b>#session.MyUserName#</b>! While we're getting a live operator to chat with you, please tell us a little about your accident and your injuries.</div>">
</cfif>

<cfoutput>
 #Application.MessageLog#
</cfoutput>

<!---<cfdump var="#application#" expand="no">--->
<a name="bottom"></a>
</body>
</html>
