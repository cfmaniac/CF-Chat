<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
	color: #000;
}
body {
	background-image: url(../../../templates/grissim/assets/header/chat_mitch.png);
	margin-left: 10px;
	margin-top: 0px;
	margin-right: 10px;
	margin-bottom: 0px;
	background-repeat: no-repeat;
}
#apDiv1 {
	position:absolute;
	width:183px;
	height:109px;
	z-index:1;
	left: 1px;
	top: 144px;
}
#apDiv2 {
	position:absolute;
	width:284px;
	height:83px;
	z-index:2;
	left: 185px;
	top: 185px;
}
#apDiv3 {
	position:absolute;
	width:259px;
	height:115px;
	z-index:3;
	left: 213px;
	top: 270px;
}
-->
</style>
<form name="send_transcript" action="logout.cfm" method="post">
<div id="apDiv1"><!---\\This is the #datasource# now Click Button Graphical//---></div>
<div id="apDiv2"><!---\\Question Form//--->
<b>Thank You For Chatting with Mitch Grissim and Associates!</b>
<br>
Would you like to recieve a Transcript of this chat session? If so, just enter your email address below.
<input type="hidden" name="chat_text" value="<cfoutput>#Application.MessageLog#</cfoutput>">
<input type="hidden" name="username" value="<cfoutput>#session.myusername#</cfoutput>">
<input type="text" name="email"><br><Br>
</div>
<div id="apDiv3"><br /><br /><button name="mailout" onclick="document.send_transcript.submit();">Send Transcript or End Session Completly</button></div>

</form>
<!---<cfdump var="#application#" expand="no" label="Chat Application Vars">
<br>
<cfdump var="#session#" expand="no" label="Chat Session Vars">
<br>--->

