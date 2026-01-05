
var Overlay = ({

    init: function(){

        this.initDivVideoOverlay();

        this.movie = $('#test_video');

        this.movie.bind('timeupdate', this.schedule_check);
        this.schedule_setup();
        this.ratio_correct=true;
        $(window).resize(function() {
            Overlay.rearrangeItems();
        });
    },

    initDivVideoOverlay : function() {
        var div_video_overlays = document.getElementById("video_overlays");
        div_video_overlays.innerHTML = "";

        var newDiv = document.createElement("div");
        newDiv.id = "div_vtext_input";
        newDiv.style.position = "absolute";
        newDiv.style.zIndex= 2000;
        newDiv.style.background = "transparent";
        newDiv.innerHTML =  '<input class="cloud_input_box" id="input_vtext" type="text" style="width:' + GLOBAL.inputWidth +
            'px; height:' +  GLOBAL.inputHeight +
            'px; background: transparent; border: none;" maxlength="' + GLOBAL.maxInputText + '"/>';

        div_video_overlays.appendChild(newDiv);
    },

    schedule_setup: function(){
        Overlay.height_std = Overlay.movie.height();
        Overlay.width_std = Overlay.movie.width();
        Overlay.ratio_std = Overlay.movie.width()/Overlay.movie.height();
        
        var box= $("#video_overlays");
        // create elements
        for (var i=0; i<VideoMain.items.length; i++) {
            var t = $("<div class=\"overlay_item\" id=\"item_"+i+"\">"+VideoMain.items[i][2]+"</div>");
            t.hide();
            box.prepend(t);
        }
        this.rearrangeItems();
    },

    appendOverlayItem: function(itemIndex){
        var box= $("#video_overlays");
        var t = $("<div class=\"overlay_item\" id=\"item_"+itemIndex+"\">"+VideoMain.items[itemIndex][2]+"</div>");
        t.hide();
        box.prepend(t);

        this.rearrangeItems();
    },
    
    schedule_check: function() { 
        // check if anything need to be done
        for (var i=0; i<VideoMain.items.length; i++) {
            if(!VideoMain.display_overlays) {
                $('#item_'+i).hide();
            } else if (VideoMain.items[i][0] > Overlay.movie. prop('currentTime')) {
                $('#item_'+i).hide();
            } else if(VideoMain.items[i][0] <= Overlay.movie.prop('currentTime') && VideoMain.items[i][1] > Overlay.movie.prop('currentTime')) {
                if(!$('#item_'+i).is(":visible") ) {
                    $('#item_'+i).fadeIn('slow');
                }
            } else {
                if($('#item_'+i).is(":visible") ) {
                    $('#item_'+i).fadeOut('slow');
                }
            }
        }
    },

    movie_error: function(event) {
        alert("Error: Couldn't load movie!");
    },

    rearrangeItems: function() {
        var box= $("#video_overlays");
        
        // 동영상 영역의 위치
        //var off_x = Overlay.movie.offset().left;
        //var off_y = Overlay.movie.offset().top;
        
        var videoContainer = $("#video-container");
        var off_x = videoContainer.offset().left;        
        var off_y = videoContainer.offset().top;

        // 오버레이 텍스트가 화면 밖으로 나가는 것을 제한
        // 1. 먼저, 비디오영역의 사이즈 알아오기
        // video-container가 640x402(순수 비디오영역은 640x360 맞다 이거 원본비디오 파일에서 가져온 값이다)
        // 로 되어 있는데, 이 값이 어디서 결정되는지 모르겠다.
        // 아마 원본 비디오 파일에 의한 것일 수 도 있으니 살펴보자.

        var itemX = 0;
        var itemY = 0;
        var videoWidth = Overlay.movie.width();
        var videoHeight = Overlay.movie.height();
        var textWidth = 0;
        var textHeight = 0;
        
        var clientX = 0;
        var clientY = 0;
        
        var t;
        var t_element;

        for (var i=0; i<VideoMain.items.length; i++) {
            
        	t = $('#item_'+i);
            t_element =  document.getElementById("item_"+i);
        	
            clientX = VideoMain.items[i][3] * videoWidth;
            clientY = VideoMain.items[i][4] * videoHeight;
        	
        	// jQuery outerWidth, outerHeight : padding과 margin을 포함한 영역 크기를 계산        	
            textWidth = t.outerWidth();
            textHeight = t.outerHeight();        	

            itemX = Math.round(parseInt(clientX));
            itemY = Math.round(parseInt(clientY));

            // 2. 제한          
            if( itemX + textWidth > videoWidth )	// 오른쪽 영역 제한
            {
                itemX -= ((itemX + textWidth ) - videoWidth);
            }
            else if( itemX < 0  )	// 왼쪽 영역 제한
            {
                itemX = 0;
            }

            if( itemY + textHeight > videoHeight )	// 아래 영역 제한
            {
                itemY =  videoHeight - textHeight;
            }

            itemY = Math.max(0, itemY); // 위 영역 제한


            //t.css('left', itemX);
            //t.css('top', itemY);

            t_element.style.left = "" + itemX + "px";
            t_element.style.top = "" + itemY + "px";
        }

    }
});