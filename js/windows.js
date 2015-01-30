var N_BASEZINDEX = 0;
var RE_PARAM = /^\s*(\w+)\s*\=\s*(.*)\s*$/;

// this function makes the document numb to the mouse events by placing the transparent layer over it
function f_putScreen (b_show) {

	if (b_show == null && !window.b_screenOn)
		return;

	if (b_show == false) {
		window.b_screenOn = false;
		if (e_screen) e_screen.style.display = 'none';
		return;
	}

	// create the layer if doesn't exist
	if (window.e_screen == null) {
		window.e_screen = document.createElement("div");
		e_screen.innerHTML = "&nbsp;";
		document.body.appendChild(e_screen);

		e_screen.style.position = 'absolute';
		e_screen.id = 'eScreen';
		
		// attach event
		if (document.addEventListener) {
			document.addEventListener('mousemove', f_dragProgress, false);
			window.addEventListener('resize', f_putScreen, false);
			window.addEventListener('scroll', f_putScreen, false);
		}
		if (window.attachEvent) {
			document.attachEvent('onmousemove', f_dragProgress);
			window.attachEvent('onresize', f_putScreen);
			window.attachEvent('onscroll', f_putScreen);
		}
		else {
			document.onmousemove = f_dragProgress;
			window.onresize = f_putScreen;
			window.onscroll = f_putScreen;
		}
	}

	// set properties
	var a_docSize = f_documentSize();
	e_screen.style.left = a_docSize[2] + 'px';
	e_screen.style.top = a_docSize[3] + 'px';
	e_screen.style.width = a_docSize[0] + 'px';
	e_screen.style.height = a_docSize[1] + 'px';
	e_screen.style.zIndex = N_BASEZINDEX + a_windows.length * 2 - 1;
	e_screen.style.display = 'block';
}

// returns the size of the document
function f_documentSize () {

var n_scrollX = 0,
	n_scrollY = 0;

	if (typeof(window.pageYOffset) == 'number') {
		n_scrollX = window.pageXOffset;
		n_scrollY = window.pageYOffset;
	}
	else if (document.body && (document.body.scrollLeft || document.body.scrollTop )) {
		n_scrollX = document.body.scrollLeft;
		n_scrollY = document.body.scrollTop;
	}
	else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
		n_scrollX = document.documentElement.scrollLeft;
		n_scrollY = document.documentElement.scrollTop;
	}

	if (typeof(window.innerWidth) == 'number')
		return [window.innerWidth, window.innerHeight, n_scrollX, n_scrollY];
	if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight))
		return [document.documentElement.clientWidth, document.documentElement.clientHeight, n_scrollX, n_scrollY];
	if (document.body && (document.body.clientWidth || document.body.clientHeight))
		return [document.body.clientWidth, document.body.clientHeight, n_scrollX, n_scrollY];
	return [0, 0];
}

function f_dialogOpen (s_url, s_title, s_features) {
	if (!window.a_windows)
		window.a_windows = [];
		
	// parse parameters
	var a_featuresStrings = s_features.split(',');
	var a_features = [];
	for (var i = 0; i < a_featuresStrings.length; i++)
		if (a_featuresStrings[i].match(RE_PARAM))
			a_features[String(RegExp.$1).toLowerCase()] = RegExp.$2;
	
	// create element for window
	var n_nesting = a_windows.length;

	var e_window = document.createElement("div");
	e_window.style.position = 'absolute';
	var n_width  = a_features.width  ? parseInt(a_features.width)  : 675;
	var n_height = a_features.height ? parseInt(a_features.height) : 675;
	var a_docSize = f_documentSize ();
	e_window.style.left = (a_features.left ? parseInt(a_features.left) : ((a_docSize[0] - n_width)  / 2) + a_docSize[2]) + 'px';
	e_window.style.top  = (a_features.top  ? parseInt(a_features.top)  : ((a_docSize[1] - n_height) / 2) + a_docSize[3]) + 'px';
	e_window.style.zIndex = N_BASEZINDEX + a_windows.length * 2 + 2;
	
	e_window.innerHTML = 
		'<table border="0" cellpadding="0" cellspacing="0" class="dialogWindow"><tr><th onmousedown="f_dragStart(' + n_nesting + ', event)" onmouseup="f_dragEnd()" onmousemove="f_dragProgress(event)" onselectstart="return false" ><span style="float:left"">' +
		(s_title ? s_title : 'Dialog Window') +
		'</span><img src="http://#datasource#now.com/modules/chat/support/images/close_icon.gif" onclick="top.f_dialogCloseSession();" onmousedown="return false;" style="float:right"></th></tr><tr><td><iframe width="' + n_width +
		/*'</span></th></tr><tr><td><iframe width="' + n_width +*/
		'" height="' + n_height +
		'" src="' + s_url + '" name="modal" scrolling="no"></iframe></td></tr></table>';
	document.body.appendChild(e_window);
	a_windows[n_nesting] = e_window;
	
	// put the screen
	//f_putScreen(true);
}

function f_dialogClose () {

	var n_nesting = a_windows.length - 1;
	// destroy element
	if (a_windows[n_nesting].removeNode)
		a_windows[n_nesting].removeNode(true);
	else if (document.body.removeChild)
		document.body.removeChild(a_windows[n_nesting]);
	a_windows[n_nesting] = null;
	a_windows.length = n_nesting;

	// move the screen
	//f_putScreen(n_nesting ? true : false);
}

//Similiar to Above, ecept is also closes the User Session
function f_dialogCloseSession () {
    alert('Closing the Window will End your Chat Session.');
			
	var n_nesting = a_windows.length - 1;
	// destroy element
	if (a_windows[n_nesting].removeNode)
		a_windows[n_nesting].removeNode(true);
	else if (document.body.removeChild)
		document.body.removeChild(a_windows[n_nesting]);
	a_windows[n_nesting] = null;
	a_windows.length = n_nesting;
    clearUser();
	// move the screen
	//f_putScreen(n_nesting ? true : false);
}

function clearUser(){
//Now we post to our script
	$.post("http://#datasource#now.com/modules/chat/support/clear_usersession.cfm",{
				chat_user: '<cfoutput>#session.MyUserName#</cfoutput>'});
	//End Script Posting	
}



// drag'n'drop functions
function f_dragStart (s_name, e_event) {
	if (!e_event && window.event) e_event = window.event;

	// save mouse coordinates
	window.n_mouseX = e_event.clientX;
	window.n_mouseY = e_event.clientY;
	window.e_draggedWindow = window.a_windows[s_name];
	return false;
}
function f_dragProgress (e_event) {
	if (!e_event && window.event) e_event = window.event;
	if (!e_event || window.e_draggedWindow == null) return;

	var n_newMouseX = e_event.clientX;
	var n_newMouseY = e_event.clientY;
	
	window.e_draggedWindow.style.left = (parseInt(window.e_draggedWindow.style.left) - window.n_mouseX + n_newMouseX) + 'px';
	window.e_draggedWindow.style.top  = (parseInt(window.e_draggedWindow.style.top)  - window.n_mouseY + n_newMouseY) + 'px';
	
	window.n_mouseX = n_newMouseX;
	window.n_mouseY = n_newMouseY;
}

function f_dragEnd () {
	window.e_draggedWindow = null;
}
