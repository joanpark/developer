function upload_discuss()
{
    var taDiscuss = document.getElementById("ta_discuss");
    /*alert(taDiscuss .value);
     taDiscuss.value = "";*/

    var params = "write=0" +  "&content=" + taDiscuss.value;
    params += "&articleId=" + g_articleMgr.currentArticle.id;

    $.ajax({
        url: "../discuss",
        data: params,
        async: false,
        cache: false,
        dataType: "json"
    }).complete(function(){
            refresh_discussList();
        });

}

function refresh_discussList()
{
    var params = "list=0";
    params += "&articleId=" + g_articleMgr.currentArticle.id;

    $.ajax({
        url: "../discuss",
        data: params,
        async: false,
        cache: false,
        dataType: "json"
    }).complete(function(result){


            var tempReply = {
                userName : "홍길동",
                profileImg : "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIj48L3JlY3Q+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+",
                content : "호호호"
            };

            var tempDiscuss = {
                userName : "고길동",
                profileImg : "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIj48L3JlY3Q+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+",
                content : "ㅋㅋㅋ",
                replyList : [tempReply, tempReply]
            };


            var tempDiscussion = {
                userProfileImg : "",
                discussList: JSON.parse( result.responseText )
            };

            var discussionTemplate = $("#discussion-temp").html();
            $(".watch-discussion").html(_.template(discussionTemplate,{item:tempDiscussion}));




        });
}


function playVideo()
{
    var video = document.getElementById("test_video");
    video.play();

    var playButton = document.getElementById("play-pause");
    playButton.className = "btn_pause";
}


var ArticleManager = function(){
    //var url = "http://localhost:8888/article";
    //var url = "http://jungien-app.appspot.com/article";
    var url = "article";

    var currentArticle = {};

    var getArticles = function(page){
        var template = $("#video-item-temp").html();
        
        $.ajax({
          //url: "/data/articleList.json",
          url: url,
          data: "list=" + page,
          async: false,
          cache: false,
          dataType: "json"
        })
          .done(function( html ) {

            $("#videoList").html(_.template(template,{items:html}));

          });
    };
    
    var getArticle = function(opts, cb){
        var articleTemplate = $("#article-temp").html();
        var discussionTemplate = $("#discussion-temp").html();

        var scope = this;

        $.ajax({
          //url: "/data/article.json",
         url: url,
          data: "read=" + opts.article,
          cache: false,
          dataType: "json"
        })
          .done(function( html ) {
            var data = html;
            if(data != undefined){

                scope.currentArticle = data;

                $(".watch-content").html(_.template(articleTemplate,{item:data}));

                /*
                var tempReply = {
                    userName : "홍길동",
                    profileImg : "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIj48L3JlY3Q+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+",
                    content : "호호호"
                };

                var tempDiscuss = {
                    userName : "고길동",
                    profileImg : "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIj48L3JlY3Q+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+",
                    content : "ㅋㅋㅋ",
                    replyList : [tempReply, tempReply]
                };
                var tempDiscussion = {
                    userProfileImg : "",
                    discussList: [tempDiscuss,tempDiscuss,tempDiscuss,tempDiscuss]
                };

                $(".watch-discussion").html(_.template(discussionTemplate,{item:tempDiscussion}));
                */

                if( cb != undefined )
                    cb();

            }else{
                $(".watch-content").html(" 아티클이 없습니다. ");
                $(".watch-content").html(" ");
            }
          });
    };

    var load = function(cb){

        this.getArticles(1);

        var videoItem = $("#videoList div.video-item:eq(0) a");
        var articleId = videoItem.data("article");
        this.getArticle({article:articleId}, cb);

        var scope = this;

        $("#videoList").on("click", "div.video-item a", function(e){
            var articleId = $(this).data("article");
            scope.getArticle({article:articleId}, function(){

                VideoMain.init(scope.currentArticle.movie, true);

                refresh_discussList();

                playVideo();
            });
        });

    };

    return {
        getArticles:getArticles,
        getArticle:getArticle,
        load:load,
        currentArticle:currentArticle
        };
};
