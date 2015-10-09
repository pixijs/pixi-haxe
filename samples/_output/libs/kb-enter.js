var nn = (document.layers) ? true : false;
var ie = (document.all) ? true : false;

function keyDown(e) {
    var evt = (e) ? e : (window.event) ? window.event : null;
    if (evt) {
        var key = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
        if (key == "13") if (window.keyBoardEnter != null) window.keyBoardEnter();
    }
}

document.onkeydown = keyDown;
if (nn) document.captureEvents(Event.KEYDOWN);