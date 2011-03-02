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