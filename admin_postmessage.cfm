<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
If a new message if posted, put into the application variable so everyone can see it
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfif IsDefined("FORM.new_message") and FORM.new_message IS NOT "">
	<cfset Application.MessageLog	=	Application.MessageLog & "<div id='message'><font color='blue'><b>#session.MyUserName#</b></font> :: #FORM.new_message#</div>" >
</cfif>
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
	  DISPLAY THE FORM THAT ALLOWS NEW MESSAGE TO BE ENTERED
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<html>
<head>
	<title>Post New Message</title>
</head>
<style>
/*Forms CSS*/
body{
	color: #fff;
	font-family:Verdana, Geneva, sans-serif;
	font-size:11px;
}
a {
	color:#FFF;
}
	.forms input:focus, .forms select:focus{
    background-color: #eeeeee;
	color:#10147f;
}
	.forms fieldset {
		margin-top: 20px;
		padding : 15px;
		border: 1px solid #B5B8C8;
		
	}
	
	.forms legend {
		font-size: 12px;
		color: #15428B;
		font-weight: 900;
	}
	.forms label {
		display:block;
		padding-top:5px;
	}
	
	.forms select, .forms textarea {
		display : block;
		margin-bottom: 5px;
		width: 250px;
			color: #555;
			padding: 4px;
			border: 1px solid #B5B8C8;
			font-size: 14px;
			margin-top: 4px;
			border-radius:4px;
		-moz-border-radius: 4px;
	}
	.forms radio{
		display : block;
		margin-bottom: 5px;
		font-size: 14px;
			margin-top: 4px;
			border-radius:4px;
		-moz-border-radius: 4px;
	}
	
	.forms .text-input {
			width: 250px;
			color: #555;
			padding: 4px;
			border: 1px solid #B5B8C8;
			font-size: 14px;
			margin-top: 4px;
			background: #FFF url('/img/form/text-bg.gif') repeat-x;
			border-radius:4px;
		-moz-border-radius: 4px;
		}
		.forms textarea {
			width: 250px;
			height:70px;
			color: #555;
			padding: 4px;
			border: 1px solid #B5B8C8;
			font-size: 14px;
			margin-top: 4px;
		}
	
	.forms span.checkbox, .forms .checkbox {
		display: inline;
	}
	
	.forms .submit {
		background: url('../forms/btn_submit.gif') top left no-repeat;
		width:109px;
		height:31px;
		margin: 10px 0 0 0;
		letter-spacing:100000px;
		border:none;
		text-indent:-9999px;
		overflow:hidden;
		float: left;
		text-decoration: none;
		cursor:pointer;
	}
		.forms .submit:hover {background-position:bottom left;}
</style>
<script type="text/javascript">
function data_copy()
{
document.myform.new_message.value=document.myform.admin_messages.value;
}

</script>
<body>

<form action="admin_postmessage.cfm" method="post" class="forms" name="myform">
<div class="wrapFormLine">
						<label for="myname">Your Message ::&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Predefined Messages::</label>
						<input value=""  class="text-input" type="text" name="new_message" id="new_message" />&nbsp;&nbsp;&nbsp;<select name="admin_messages" onChange="data_copy();" style="display:inline;">
<option>Select a Message to send</option>
<option value="Were you in an accident?">1- Were you in an accident?</option>
<option value="Were you hurt?">2- Were you hurt?</option>
<option value="Tell me what Happened.">3- Tell me what happened.</option>
<option value="Sorry to hear that.">4- Sorry to hear that.</option>
<option value="Was there a Police Report?">5- Was there a Police Report?</option>
<option value="Was the other Driver at Fault? Did they get a ticket from the Police?">6- Was the other Driver at Fault? Did they get a ticket from the Police?</option>
<option value="Did the other Driver have insurance?">7- Did the other Driver have insurance?</option>
<option value="This sounds like something we can help you with.">8- This sounds like something we can help you with.</option>
<option value="I'd like for you to speak with one of our Attorneys.">9- I'd like for you to speak with one of our Attorneys. </option>
<option value="Would you like to come to our office and meet with Mitch?">10- Would you like to come to our office and meet with Mitch?</option>
<option value="Our Office is at 325 Union Avenue, Downtown.">11- Our Office is at 325 Union Aveneue, downtown.</option>
<option Value="If you'd like we can send someone to see you.">12- If you'd like we can send someone to see you.</option>
<option value="Thanks for talking with us.">13- Thanks for talking with us.</option>
</select>
					</div>
                    
                    <div class="wrapFormLine">
                    <input type="submit" name="PostIt" value="Post Message">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="admin_logout.cfm" target="_top">End Session</a> 
                    </div>
                   

</form>
<script>
document.myform.new_message.focus();
</script>
</body>
</html>
