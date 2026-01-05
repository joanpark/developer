<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> <!-- 인코딩설정 -->

    <title></title>
    <link rel="stylesheet" href="../public/css/management.css" type="text/css">
    	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="public/js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="../public/JungLib.js" type="text/javascript"></script>

<script type="text/javascript">

var ajax = new JLIB.Ajax();

function makeTabInfoData(type, textAreaValue)
{
    var temp = {
      "type" : type,
      "description" : { "value" : textAreaValue},
      "image" : ""
    };

    return temp;
}

function makeTabInfoDataList()
{
    var ta_info = document.getElementById("ta_info");
    var ta_compose = document.getElementById("ta_compose");
    var ta_illust = document.getElementById("ta_illust");
    var ta_mv = document.getElementById("ta_mv");
    var ta_lyrics = document.getElementById("ta_lyrics");

    var tempList = [];

    if( ta_info.value && ta_info.value.trim() ) tempList.push( makeTabInfoData("info", ta_info.value) );
    if( ta_compose.value && ta_compose.value.trim() ) tempList.push( makeTabInfoData("compose", ta_compose.value) );
    if( ta_illust.value && ta_illust.value.trim() ) tempList.push( makeTabInfoData("illust", ta_illust.value) );
    if( ta_mv.value && ta_mv.value.trim() ) tempList.push( makeTabInfoData("mv", ta_mv.value) );
    if( ta_lyrics.value && ta_lyrics.value.trim() ) tempList.push( makeTabInfoData("lyrics", ta_lyrics.value) );

    return tempList;
}

function submitArticle()
{
    var ta_title = document.getElementById("ta_title");
    var ta_thumbnail = document.getElementById("ta_thumbnail");
    var ta_movie = document.getElementById("ta_movie");



    var articleData = {
        "title" : ta_title.value,
        "thumbnail" : ta_thumbnail.value,
        "movie" : ta_movie.value,
        "tabInfoList" : makeTabInfoDataList()
    };

    var param = {
            "write" : "1",
            "json" : articleData
    };

    ajax.sendPost("../article", param, function(data){
        console.log(data);
    });

}

function uploadArticleRecursively(batchData, i)
    {
        if( batchData.length <= i) return;

        var param = {
        "write" : "1",
        "json" : batchData[i]
        };

        ajax.sendPost("../article", param, function(data){
            console.log(data);
            i++;
            uploadArticleRecursively(batchData, i);
        });
    }

function submitArticle_Batch()
{
    var batchData = [
        {
        "title" : "[Hatsune Miku Anime PV] Viva Happy ビバハピ feat_ 初音ミク_1",
        "thumbnail" : "movies/01_viva_happy.png",
        "movie" : "movies/01_viva_happy.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "[SeeU] Alone (Original)_1",
        "thumbnail" : "movies/02_alone.png",
        "movie" : "movies/02_alone.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "[SeeU_Fan MV] 시간을 멈추는 아이 by irene_1",
        "thumbnail" : "movies/03_seeu_fan_mv_stop_time.png",
        "movie" : "movies/03_seeu_fan_mv_stop_time.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "[시유(SeeU)오리지널(Original)] 꿈의 비(夢之雨) - Dr_Yun(윤박사) [Vocaloid]_1",
        "thumbnail" : "movies/04_rain_in_dream.png",
        "movie" : "movies/04_rain_in_dream.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "AMAZING CGI VFX Trailer HD Underland The Last Surfacer Directed by Gonzalo Gutierrez_1",
        "thumbnail" : "movies/05_Underland_The_Last_Surfacer.png",
        "movie" : "movies/05_Underland_The_Last_Surfacer.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI 3D Animated MoGraph HD D AD Awards Title Sequence - by The Mill_1",
        "thumbnail" : "movies/06_MoGraph_by_The_Mill.png",
        "movie" : "movies/06_MoGraph_by_The_Mill.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI 3D Animated Short HD Pincee d'Amour by ESMA_1",
        "thumbnail" : "movies/07_Pincee_d_Amour.png",
        "movie" : "movies/07_Pincee_d_Amour.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI VFX Breakdown HD Itau Criancas - by Jonathan Post_1",
        "thumbnail" : "movies/08_Breakdown_Itau_Criancas.png",
        "movie" : "movies/08_Breakdown_Itau_Criancas.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI VFX Close-Up HD Edge of Tomorrow - by Prime Focus World_1",
        "thumbnail" : "movies/09_Edge_of_Tomorrow.png",
        "movie" : "movies/09_Edge_of_Tomorrow.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI VFX Short Spot HD The Training - by Psyop_1",
        "thumbnail" : "movies/10_The_Training.png",
        "movie" : "movies/10_The_Training.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "CGI VFX Spot 1080p HD Odyssey by - Digital District_1",
        "thumbnail" : "movies/11_Odyssey.png",
        "movie" : "movies/11_Odyssey.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "livetune - Tell Your World - teaser-_1",
        "thumbnail" : "movies/12_Tell_Your_World.png",
        "movie" : "movies/12_Tell_Your_World.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "SeeU - I=Fantasy ( PV )_1",
        "thumbnail" : "movies/13_I_Fantasy.png",
        "movie" : "movies/13_I_Fantasy.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "SeeU Original - 딸기(Strawberry) Full version_1",
        "thumbnail" : "movies/14_Strawberry.png",
        "movie" : "movies/14_Strawberry.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "VOCALOID2 Hatsune Miku - FlyOut [HD MP3]_1",
        "thumbnail" : "movies/15_FlyOut.png",
        "movie" : "movies/15_FlyOut.mp4",
        "tabInfoList" : []
        },
        {
        "title" : "강남스타일 fandub by SeeU (gangnam style ver_ SeeU)_1",
        "thumbnail" : "movies/16_gangnam_style_ver_SeeU.png",
        "movie" : "movies/16_gangnam_style_ver_SeeU.mp4",
        "tabInfoList" : []
        }
    ];

    uploadArticleRecursively(batchData, 0);

}

function submitArticleFullInfo()
{

}

function openThumbnailBrowser()
{

}

    </script>
</head>
<body>


<div style="-webkit-margin-start: 167px; vertical-align: middle">
    <section>
        <h3>아티클 기본 정보</h3>
        <div>

                <div>
                    <div>제목</div>
                    <div><textarea id="ta_title" rows="1" cols="60"></textarea></div>
                </div>

                <div>
                    <table>
                    <tr>
                        <td>썸네일
                        </td>
                        <td><textarea id="ta_thumbnail" rows="1" cols="30"></textarea>
                        </td>
                        <td> <input type="button" value="불러오기" onclick="openThumbnailBrowser();"></button>
                        </td>
                    </tr>
                    </table>
                </div>

                <div>
                <table>
                    <tr>
                        <td>동영상 파일
                        </td>
                        <td><textarea id="ta_movie" rows="1" cols="30"></textarea>
                        </td>
                        <td> <input type="button" value="불러오기" onclick="openThumbnailBrowser();"></button>
                        </td>
                    </tr>
                </table>
                </div>
        </div>
    </section>
    <section>
        <h3>탭 정보</h3>
        <div>


                <div>
                    <div>정보</div>
                    <div><textarea id="ta_info" rows="5" cols="60"></textarea></div>
                </div>

                <div>
                <div>작곡</div>
                <div><textarea id="ta_compose" rows="5" cols="60"></textarea></div>
                </div>

                <div>
                <div>일러스트</div>
                <div><textarea id="ta_illust" rows="5" cols="60"></textarea></div>
                </div>

                <div>
                <div>M/V</div>
                <div><textarea id="ta_mv" rows="5" cols="60"></textarea></div>
                </div>

                <div>
                <div>작사</div>
                <div><textarea id="ta_lyrics" rows="5" cols="60"></textarea></div>
                </div>


                <input type="button" value="제출" onclick="submitArticle();"></button>

                <input type="button" value="일괄 올리기" onclick="submitArticle_Batch();"></button>
        </div>
    </section>


</div>






</body>
</html>