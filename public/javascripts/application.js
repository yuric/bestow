// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showlayer(layer)
{
	var myLayer = document.getElementById(layer).style.display;
	if(myLayer=="none")
	{
		document.getElementById(layer).style.display="block";
	} 
	else 
	{ 
		document.getElementById(layer).style.display="none";
	}
}
//<![CDATA[
function ShowHideWithAnimation(layer)
{
	$(layer).animate({"height": "toggle"}, { duration: 1000 });
	
}
//]]>
function ShowHideSimpleAlert(layer)
{
	var myLayer = document.getElementById(layer).style.display;
	
	if(myLayer=="none")
	{
		document.getElementById(layer).style.display="block";
	} 
	else 
	{ 
		document.getElementById(layer).style.display="none";
	}
	
}

// ******* Toogle animation Start
var timerlen = 5;
var slideAniLen = 250;

var timerID = new Array();
var startTime = new Array();
var obj = new Array();
var endHeight = new Array();
var moving = new Array();
var dir = new Array();

function slidedown(objname){
        if(moving[objname])
                return;

        if(document.getElementById(objname).style.display != "none")
                return; // cannot slide down something that is already visible

        moving[objname] = true;
        dir[objname] = "down";
        startslide(objname);
}

function slideup(objname){
        if(moving[objname])
                return;

        if(document.getElementById(objname).style.display == "none")
                return; // cannot slide up something that is already hidden

        moving[objname] = true;
        dir[objname] = "up";
        startslide(objname);
}

function startslide(objname){
        obj[objname] = document.getElementById(objname);

        endHeight[objname] = parseInt(obj[objname].style.height);
        startTime[objname] = (new Date()).getTime();

        if(dir[objname] == "down"){
                obj[objname].style.height = "1px";
        }

        obj[objname].style.display = "block";

        timerID[objname] = setInterval('slidetick(\'' + objname + '\');',timerlen);
}

function slidetick(objname){
        var elapsed = (new Date()).getTime() - startTime[objname];

        if (elapsed > slideAniLen)
                endSlide(objname)
        else {
                var d =Math.round(elapsed / slideAniLen * endHeight[objname]);
                if(dir[objname] == "up")
                        d = endHeight[objname] - d;

                obj[objname].style.height = d + "px";
        }

        return;
}

function endSlide(objname){
        clearInterval(timerID[objname]);

        if(dir[objname] == "up")
                obj[objname].style.display = "none";

        obj[objname].style.height = endHeight[objname] + "px";

        delete(moving[objname]);
        delete(timerID[objname]);
        delete(startTime[objname]);
        delete(endHeight[objname]);
        delete(obj[objname]);
        delete(dir[objname]);

        return;
}
function toggleSlide(objname){
  if(document.getElementById(objname).style.display == "none"){
    // div is hidden, so let's slide down
    slidedown(objname);
  }else{
    // div is not hidden, so slide up
    slideup(objname);
  }
}

//******** Toggle animation END