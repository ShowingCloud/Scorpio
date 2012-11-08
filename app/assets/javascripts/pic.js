$(window).load(function() {
	$('.flexslider').flexslider();
});

var isDOM = (document.getElementById ? true : false);
var isIE4 = ((document.all && !isDOM) ? true : false);
var isNS4 = (document.layers ? true : false);
function getRef(id) {
        if (isDOM) return document.getElementById(id);
        if (isIE4) return document.all[id];
        if (isNS4) return document.layers[id];
}
var isNS = navigator.appName == "Netscape";
function moveRightEdge() {
        var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;
        if (isNS4) {
                yMenuFrom   = divMenu.top;
                yMenuTo     = windows.pageYOffset + 90;   
        } else if (isDOM) {
                yMenuFrom   = parseInt (divMenu.style.top, 10);
                yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) + 90; 
        }
        timeoutNextCheck = 500;
        if (yMenuFrom != yMenuTo) {
                yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 10);
                if (yMenuTo < yMenuFrom)
                        yOffset = -yOffset;
                if (isNS4)
                        divMenu.top += yOffset;
                else if (isDOM)
                        divMenu.style.top = parseInt (divMenu.style.top, 10) + yOffset+"px";
                        timeoutNextCheck = 10;
        }
        setTimeout ("moveRightEdge()", timeoutNextCheck);
}

if (isNS4) {
        var divMenu = document["divMenu"];
        divMenu.top = top.pageYOffset + 110;
        divMenu.visibility = "visible";
        moveRightEdge();
} else if (isDOM) { 
        var divMenu = getRef('divMenu');
        divMenu.style.top = (isNS ? window.pageYOffset : document.documentElement.scrollTop) + 110+"px";
        divMenu.style.visibility = "visible";
        moveRightEdge();
}

//var cc=document.getElementById("divMenu");
//divMenu.style.marginLeft=document.body.offsetWidth-divMenu.offsetWidth-40+"px";
//divMenu.style.marginTop=document.body.clientHeight-divMenu.clientHeight-120+"px";

