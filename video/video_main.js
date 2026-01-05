/**
 * Created with JetBrains WebStorm.
 * User: 정현
 * Date: 14. 2. 12
 * Time: 오전 7:19
 * To change this template use File | Settings | File Templates.
 * http://www.app-solut.com/blog/2011/03/display-additional-overlay-elements-on-top-of-an-html5-video-element-with-javascript/
 */


function onClickVideoBox(event)
{
    if( g_loggedin == false )
    {
        alert("Sign in, please!")
        return;
    }

    console.log("x: " + event.clientX + ", y: " + event.clientY);

    if( VideoMain.initialized == false )
    {
        var video = document.getElementById('test_video');
        video.play();
        return;
    }

    if( VideoMain.inputFocused )
        VideoMain.completeTextInput();
    else
        VideoMain.openTextInputBox(event);
}



var VideoMain = ({

    items : [],

    display_overlays : true,

    inputFocused : false,

    lastInputInfo : {
        clientX : 0,
        clientY :  0,
        startTime : 0,
        endTime : 0
    },

    initialized : false,

    init : function(movileFileName, reset)
    {
        var scope = this;

        $.ajax({
            url: "../projectvideo",
            data: "articleId=" + g_articleMgr.currentArticle.id,
            async: false,
            cache: false,
            dataType: "json"
        })
            .done(function( result ) {
                scope.items = result;

                var video = document.getElementById("test_video");
                /*
                if (video.hasAttribute("controls")) {
                    video.removeAttribute("controls")
                } else {
                    video.setAttribute("controls","controls")
                }*/

                video.src = movileFileName;

                VideoLook.initCustomVideoPlayer(reset);


                Overlay.init();

                if( reset == false)
                    document.addEventListener('keydown', scope.processKeyDown);
            });

        this.initialized = true;
    },

    saveDataToServer : function(item, callback){

        var params = "data=" + JSON.stringify(item);
        params += "&articleId=" + g_articleMgr.currentArticle.id;

        $.ajax({
            url: "../projectvideo",
            data: params,
            async: false,
            cache: false,
            dataType: "json"
        }).complete(function(){
              callback();
            });
    },

    processKeyDown : function(event){
        if(event.keyCode ==13) {
            console.log('Enter Key was pressed');

            if( VideoMain.inputFocused )
                VideoMain.completeTextInput();
        }
    },



    openTextInputBox : function(event)
    {
        var video = document.getElementById("test_video");
        var input =  document.getElementById("input_vtext");

        $(input).show();
        video.pause();

        // 비밀이 풀림!!
        
        // 눌려진 부분의 좌표 얻어오기
        var videoWidth = Overlay.movie.width();
        var videoHeight = Overlay.movie.height();

        // GLOBAL.clouldInputOffsetX : 동영상영역 왼쪽에 margin 혹은 padding 15픽셀정도있어서 인풋박스 오프셋X 사용

        var videoContainer = $("#video-container");
        var offset = videoContainer.offset();
        var clickX = event.clientX - offset.left + GLOBAL.clouldInputOffsetX;
        var clickY = event.clientY - offset.top;

        // 텍스트인풋 상자의 위치를 세팅
        var divVtextInput =  document.getElementById("div_vtext_input");
        divVtextInput.style.left = "" + clickX + "px";
        divVtextInput.style.top = "" + clickY + "px";

        this.lastInputInfo.clientX = (event.clientX - offset.left + GLOBAL.clouldInputOffsetX) / videoWidth;
        this.lastInputInfo.clientY = (event.clientY - offset.top) / videoHeight;
        this.lastInputInfo.startTime = Overlay.movie.prop('currentTime');
        this.lastInputInfo.endTime = this.lastInputInfo.startTime + 5;

        // 2.
        input.focus();

        this.inputFocused = true;
    },

    completeTextInput : function()
    {
        var video = document.getElementById("test_video");
        var input =  document.getElementById("input_vtext");

        this.inputFocused = false;
        var inputText = input.value;
        var stringLength = inputText.length;
        if( stringLength > GLOBAL.maxInputText )
        {
            var strToReplace = inputText.substr(GLOBAL.maxInputText);
            inputText = inputText.replace(strToReplace, "");
        }

        var itemCount = this.items.length;
        this.items[itemCount] = [this.lastInputInfo.startTime.toString(),	// 0 - start time
            this.lastInputInfo.endTime.toString(),							// 1 - end time
            inputText,														// 2 - text
            (this.lastInputInfo.clientX).toString(),						// 3 - x
            (this.lastInputInfo.clientY).toString()];						// 4 - y

        this.saveDataToServer(this.items[itemCount], function(){
            Overlay.appendOverlayItem(itemCount);
            input.value = "";
            $(input).hide();
            video.play();
        });
    }

});