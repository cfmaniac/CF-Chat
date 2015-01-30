<html>
<head>
<title><cfoutput>#Application.Title#</cfoutput></title>
<cfif session.goodUser eq "Yes">
<style>
  body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 10px;
	margin-bottom: 0px;
	background-repeat: no-repeat;
}
</style>
<cfelse>
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
	color: ##000;
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
</cfif>
</head>

<body>
<cfif session.goodUser eq "Yes">
<!---\\Initiates a new Session//--->
<cfif isdefined('form.MyUsername')>
<cfquery name="new_session" datasource="#datasource#">
insert into chat_sessions (chat_user, session_new) VALUES ('#form.MyUsername#', '1');
</cfquery>
</cfif>
<!---\\End of New Session//--->
<!---\\Shows Chat Area//--->
<table width="675" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
<!-- Shim row, height 1. -->
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="674" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr><!-- row 1 -->
   <td colspan="2"><img name="chat_source_r1_c1" src="images/chat_source_r1_c1.png" width="675" height="72" border="0" id="chat_source_r1_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="72" border="0" alt="" /></td>
  </tr>
  <tr><!-- row 2 -->
   <td><img name="chat_source_r2_c1" src="images/chat_source_r2_c1.png" width="1" height="476" border="0" id="chat_source_r2_c1" alt="" /></td>
   <td background="images/chat_source_r2_c2.png"><iframe src="messages.cfm##bottom" width="674" height="476" frameborder="0" name="main" allowtransparency="yes" scrolling="auto"/></iframe></td>
   <td><img src="images/spacer.gif" width="1" height="476" border="0" alt="" /></td>
  </tr>
  <tr><!-- row 3 -->
   <td rowspan="2" colspan="2" background="images/chat_source_r3_c1.png"><iframe src="postmessage.cfm" width="675" height="127" frameborder="0" name="postmessage" scrolling="no"  /></iframe></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>
  <tr><!-- row 4 -->
   <td><img src="images/spacer.gif" width="1" height="126" border="0" alt="" /></td>
  </tr>

</table>

<!---\\End of the Chat Area//--->
<cfelse>
<!---\\Show Welcome Page//--->
<form name="chatmitch" action="index.cfm" method="post">

<div id="apDiv1"><!---\\This is the #datasource# now Click Button Graphical//---></div>
<div id="apDiv2"><!---\\Question Form//--->
<center>
<cfif IsDefined("UserMessage")>
  #UserMessage#
</cfif>
<br>
<input type="text" name="MyUsername" value="">
</center>
<!---<textarea name="question" style="color:#0a1E4F; font-size:14px; width:284px; height:83px">

</textarea>--->

</div>
<div id="apDiv3"><br /><br /><button type="submit" onClick="document.chatmitch.submit();">Start Your Chat Session Now >></button><br><br>
<!---<a href="#" onClick="top.f_dialogClose();">Close Window</a>---></div>
</form>

</cfif>
</body>
</html>
