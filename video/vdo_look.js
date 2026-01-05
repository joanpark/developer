
var VideoLook = ({

	initCustomVideoPlayer : function(reset) {
        var overlay = $("#video_overlays");

        // Video
        var video = document.getElementById("test_video");
        video.pause();

        // Buttons
        var playButton = document.getElementById("play-pause");
        playButton.className = "btn_play";
        var fullScreenButton = document.getElementById("full-screen");
        var tButton = document.getElementById("cloud_on_off");

        // Sliders
        var seekBar = document.getElementById("seek-bar");

        if( reset ) return;

        // Event listener for the play/pause button
        playButton.addEventListener("click", function() {
            if (video.paused == true) {
                // Play the video
                video.play();

                playButton.className = "btn_pause";
            } else {
                // Pause the video
                video.pause();

                playButton.className = "btn_play";
            }
        });       
        
        // Event listener for the seek bar
        seekBar.addEventListener("change", function() {
            // Calculate the new time
            var time = video.duration * (seekBar.value / 100);

            // Update the video time
            video.currentTime = time;
        });
        
        // Pause the video when the seek handle is being dragged
        seekBar.addEventListener("mousedown", function() {
            video.pause();
        });

        // Play the video when the seek handle is dropped
        seekBar.addEventListener("mouseup", function() {
            video.play();
        });


        // Event listener for the full-screen button
        fullScreenButton.addEventListener("click", function() {
            if (video.requestFullscreen) {
                video.requestFullscreen();
            } else if (video.mozRequestFullScreen) {
                video.mozRequestFullScreen(); // Firefox
            } else if (video.webkitRequestFullscreen) {
                video.webkitRequestFullscreen(); // Chrome and Safari
            }
        });

        // Event listener for the T button
        tButton.addEventListener("click", function(){
            if( GLOBAL.cloudTurnOn == true )
            {
                GLOBAL.cloudTurnOn = false;
                tButton.className = "btn_t_off"
                overlay.hide();
            }
            else
            {
                GLOBAL.cloudTurnOn = true;
                tButton.className = "btn_t_on"
                overlay.show();
            }
        });

        // Update the seek bar as the video plays
        video.addEventListener("timeupdate", function() {
            // Calculate the slider value
            var value = (100 / video.duration) * video.currentTime;

            // Update the slider value
            seekBar.value = value;
        });        
        
	},
	
	
    initCustomVideoPlayer_Old : function() {

        var overlay = $("#video_overlays");

        // Video
        var video = document.getElementById("test_video");

        // Buttons
        var playButton = document.getElementById("play-pause");
        //var muteButton = document.getElementById("mute");
        var fullScreenButton = document.getElementById("full-screen");
        var tButton = document.getElementById("cloud_on_off");

        // Sliders
        var seekBar = document.getElementById("seek-bar");
       // var volumeBar = document.getElementById("volume-bar");


        // Event listener for the play/pause button
        playButton.addEventListener("click", function() {
            if (video.paused == true) {
                // Play the video
                video.play();

                // Update the button text to 'Pause'
                //playButton.innerHTML = "Pause";
                playButton.className = "btn_pause";
            } else {
                // Pause the video
                video.pause();

                // Update the button text to 'Play'
                //playButton.innerHTML = "Play";
                playButton.className = "btn_play";
            }
        });


        // Event listener for the mute button
        /*
        muteButton.addEventListener("click", function() {
            if (video.muted == false) {
                // Mute the video
                video.muted = true;

                // Update the button text
                //muteButton.innerHTML = "Unmute";
                muteButton.className = "btn_mute";
            } else {
                // Unmute the video
                video.muted = false;

                // Update the button text
                //muteButton.innerHTML = "Mute";
                muteButton.className = "btn_sound";
            }
        });                  */


        // Event listener for the full-screen button
        fullScreenButton.addEventListener("click", function() {
            if (video.requestFullscreen) {
                video.requestFullscreen();
            } else if (video.mozRequestFullScreen) {
                video.mozRequestFullScreen(); // Firefox
            } else if (video.webkitRequestFullscreen) {
                video.webkitRequestFullscreen(); // Chrome and Safari
            }
        });


        // Event listener for the seek bar
        seekBar.addEventListener("change", function() {
            // Calculate the new time
            var time = video.duration * (seekBar.value / 100);

            // Update the video time
            video.currentTime = time;
        });


        // Update the seek bar as the video plays
        video.addEventListener("timeupdate", function() {
            // Calculate the slider value
            var value = (100 / video.duration) * video.currentTime;

            // Update the slider value
            seekBar.value = value;
        });

        // Pause the video when the seek handle is being dragged
        seekBar.addEventListener("mousedown", function() {
            video.pause();
        });

        // Play the video when the seek handle is dropped
        seekBar.addEventListener("mouseup", function() {
            video.play();
        });

        // Event listener for the volume bar
        /*
        volumeBar.addEventListener("change", function() {
            // Update the video volume
            video.volume = volumeBar.value;
        });*/

        // Event listener for the T button
        tButton.addEventListener("click", function(){
            if( GLOBAL.cloudTurnOn == true )
            {
                GLOBAL.cloudTurnOn = false;
                tButton.className = "btn_t_off"
                overlay.hide();
            }
            else
            {
                GLOBAL.cloudTurnOn = true;
                tButton.className = "btn_t_on"
                overlay.show();
            }
        });
    }
});