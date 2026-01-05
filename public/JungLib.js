/**
 * Created with JetBrains WebStorm.
 * User: 정현
 * Date: 14. 4. 13
 * Time: 오후 9:49
 * To change this template use File | Settings | File Templates.
 */



var JLIB = {};

JLIB.BaseObject = function()
{
    this.temp = "this is base object";
    this.temp2 = "xxx";
}

JLIB.Ajax = function(){
    JLIB.BaseObject();

    this.tempVar = "this is ajax object";
    this.temp2 = "xxxxxxxxx";

    this.ajaxReq = new XMLHttpRequest();
}

JLIB.Ajax.prototype = new JLIB.BaseObject();
JLIB.Ajax.prototype.constructor = JLIB.BaseObject;

JLIB.Ajax.prototype._sendCommon = function(post, reqUrl, callback, postParam){
    
	var scope = this;

    this.ajaxReq.onreadystatechange = function(){
        // on json loaded
        if( scope.ajaxReq.readyState == 4 )  {
            if (scope.ajaxReq.status == 200 || window.location.href.indexOf("http") == -1) {
                console.log("XMLHttpRequest: " + scope.ajaxReq.responseText);

                var data = null;
                if( scope.ajaxReq.responseText != null && scope.ajaxReq.responseText.length > 0 )
                {
                    data = JSON.parse(scope.ajaxReq.responseText);
                    console.log("dataReceived: " + data);
                }

                callback(data);
            }
            else{
                console.log("XMLHttpRequest error, ajax status: " + scope.ajaxReq.status);
            }
        }
    };	
	
	if( post == false ){
	    this.ajaxReq.open("GET", reqUrl, true);
	    if (this.ajaxReq.overrideMimeType) this.ajaxReq.overrideMimeType("application/json");
	    this.ajaxReq.send(null);
	}
	else{
	    this.ajaxReq.open("POST", reqUrl, true);
	    if (this.ajaxReq.overrideMimeType) this.ajaxReq.overrideMimeType("application/json");
	    
	    var sendParam = "";
	    // post param	       
	    var i = 0;
	    var valueStr = "";
	    var paramCount = Object.keys(postParam).length;
	    for( var key in postParam ){
	    	sendParam += key + "=";
	    	
	    	valueStr = postParam[key]
	    	if( key === "json" )
	    		valueStr = JSON.stringify(valueStr);
	    		
	    	sendParam += valueStr;
	    	
	    	if( i < paramCount - 1 )
	    		sendParam += "&";
	    	
	    	i++;
	    }	    	
	    
	    this.ajaxReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    
	    this.ajaxReq.send(sendParam);		
	}
}

JLIB.Ajax.prototype.sendPost = function(reqUrl, postParam, callback){
	this._sendCommon(true, reqUrl, callback, postParam);
}

JLIB.Ajax.prototype.send = function(reqUrl, callback){
	this._sendCommon(false, reqUrl, callback, null);
}

////////////////////////////////
// JLIB Util object
///////////////////////////////;
JLIB.Util = function(){
    JLIB.BaseObject();

}

JLIB.Util.prototype = new JLIB.BaseObject();
JLIB.Util.prototype.constructor = JLIB.BaseObject;

JLIB.Util.prototype.isMobile = function(){
    if( navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/) )
    {
        return true;
    }
    else if( navigator.userAgent.match(/(Windows|Macintosh|Mac)/) )
    {
        return false;
    }

    return false;
}