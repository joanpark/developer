<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<%@ page import="twitter4j.Twitter"  %>
<%@ page import="twitter4j.TwitterException"  %>
<%@ page import="twitter4j.TwitterFactory"  %>
<%@ page import="twitter4j.User" %>

<!DOCTYPE html>
<html> <!--lang="en"-->
  <head>
    <!--<meta charset="utf-8">-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> <!-- 인코딩설정 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- 익스플로러 호환성설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="favicon.ico">

    <title>Voiss Main Page</title>

    <!-- Bootstrap -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">

    <!-- 커스텀 스타일 불러오기 -->
    <link href="public/css/main.css" rel="stylesheet">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body onload="onBodyLoad();">
  
	<!-- 상단 네비게이션 바 -->

    <!--<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Voiss</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>

        </div>
      </div>
    </div>    -->



    <div style="vertical-align: middle; height:30px" class="navbar navbar-inverse navbar-fixed-top" role="navigation">

        <div style="position:relative; left: 20px; min-height:30px">
            <a class="navbar-brand" href="#">Voiss</a>
            <div class="nav navbar-nav" style="float: right; margin: 0px; margin-right: 40px; margin-top: 10px">
                <tag:notloggedin>
                <a href="signin"><img style="margin-top: 3px" src="./public/images/Sign-in-with-Twitter-darker.png"/></a>
                </tag:notloggedin>
                <tag:loggedin>
                <a href="logout">Signout</a>
                </tag:loggedin>

                <a href="#profile" style="padding: 0px;">
                    <%
                                      User user = (User)session.getAttribute("user");
                                      if(null != user)
                                      {
                                        String imgUrl = user.getProfileImageURL();

                                        %> <img width="32em" height="32em" src="<%= imgUrl %>"></img><%
                                      }
                                    %>
                </a>
            </div>

        </div>
    </div>

    <!-- 컨테이너 -->
    <div class="container">

      <div class="selective-layout">

      </div>

      <hr>
      <footer>
        <p>&copy; Voiss Company 2014</p>
      </footer>
    </div>
    <!-- /컨테이-->

    <!-- templates -->
    <script type="text/template" id="layout-desktop">
        <!-- 데스크탑 레이아웃 -->
        <div class="row">
            <!-- 왼쪽 컬럼 -->
            <div class="col-xs-8">

                <div class="row">
                    <div class="col-xs-12">
                        <div id="video_box"> <!--onclick="Overlay.togglePlay();"-->
                            <div id="video_overlays"></div>
                            <div id="video-container">
                                <video id="test_video" width="100%" onclick="onClickVideoBox(event);" webkit-playsinline>             <!--controls="controls"-->
                                    <source src="movies/big_buck_bunny.ogv" type="video/ogg">       <!-- Firefox / Opera -->
                                    <source src="movies/big_buck_bunny.mp4" type="video/mp4">       <!-- WebKit video    -->
                                    <!--<source src="movies/big_buck_bunny.m4v" type="video/mp4">-->
                                </video>
                                <!-- Video Controls -->
                                <!-- <div id="video-controls">
                                    <button type="button" id="play-pause" class="btn_play" ></button>
                                    <input type="range" id="seek-bar" class='' value="0" />
                                    <button type="button" style="width: 29px; height: 23px" id="mute" class="btn_sound"></button>
                                    <input type="range" id="volume-bar" class='' min="0" max="1" step="0.1" value="1" />
                                    <button type="button" id="full-screen" class=''></button>
                                    <button type="button" id="cloud_on_off" class="btn_t_on"></button>
                                </div> -->


                            </div>
                        </div>
                    </div>
                </div>
				<div class="row">
                    <div class="col-xs-12">
                        <div style="width: 100%; vertical-align: middle;">
                            <input type="range" id="seek-bar" class='' value="0" />
                        </div>

                        <table style="width: 100%; background-color: black">
                            <tr>
                                <td width="10%">
                                    <button type="button" id="play-pause" class="btn_play" ></button>
                                </td>
                                <td width="30%" align="right">
                                    <button type="button" id="full-screen" class="" ></button>
                                    <button type="button" id="cloud_on_off" class="btn_t_on" ></button>
                                </td>
                            </tr>
                        </table>
                        <!--
                        <div style="display: inline-block">
						    <button type="button" id="play-pause" class="btn_play" ></button>
                        </div>
						<div style="display: inline-block; width: 85%; vertical-align: middle;">
                            <input type="range" id="seek-bar" class='' value="0" />
                        </div>     -->
                    </div>
				</div>
                <div class="row">

                    <div class="col-xs-12 watch-content">
                        <h2></h2>
                        <p></p>
                        <p><a class="btn btn-default" href="#" role="button"></a></p>
                    </div>
                </div>

                <hr>

                <div class="row">

                    <div class="col-xs-12 watch-discussion">
                        <h2></h2>
                        <p></p>
                        <p><a class="btn btn-default" href="#" role="button"></a></p>
                    </div>
                </div>

            </div>
            <!-- /왼쪽 컬럼 -->

            <!-- 오른쪽 컬럼 -->
            <div class="col-xs-4">
                <div class="video-item-group" id="videoList">
                </div>
            </div>
            <!-- /오른쪽 컬럼 -->

        </div>
        <!-- /데스크탑 레이아웃 -->
    </script>
    <script type="text/template" id="layout-mobile">
        <!-- 모바일 레이아웃 -->
        <div class="row">
            <!-- 윗 열 -->
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-xs-12">
                        <div id="video_box"> <!--onclick="Overlay.togglePlay();"-->
                            <div id="video_overlays"></div>
                            <div id="video-container">
                                <video id="test_video" width="100%" onclick="onClickVideoBox(event);" webkit-playsinline>             <!--controls="controls"-->
                                </video>
                                <!-- Video Controls -->
                                <!--
                                <div id="video-controls">
                                    <button type="button" id="play-pause" class="btn_play" ></button>
                                    <input type="range" id="seek-bar" class='' value="0" />
                                    <button type="button" style="width: 29px; height: 23px" id="mute" class="btn_sound"></button>
                                    <input type="range" id="volume-bar" class='' min="0" max="1" step="0.1" value="1" />
                                    <button type="button" id="full-screen" class=''></button>
                                    <button type="button" id="cloud_on_off" class="btn_t_on"></button>
                                </div>         -->
                            </div>
                        </div>
                    </div>
                </div>
				<div class="row">
                    <div class="col-xs-12">
                        <div style="width: 100%; vertical-align: middle;">
                            <input type="range" id="seek-bar" class='' value="0" />
                        </div>

                        <table style="width: 100%; background-color: black">
                            <tr>
                            <td width="10%">
                            <button type="button" id="play-pause" class="btn_play" ></button>
                            </td>
                            <td width="30%" align="right">
                            <button type="button" id="full-screen" class="" ></button>
                            <button type="button" id="cloud_on_off" class="btn_t_on" ></button>
                            </td>
                            </tr>
                        </table>

                        <!--<div style="display: inline-block;">
						    <button type="button" id="play-pause" class="btn_play" ></button>
                        </div>
                        <div style="display: inline-block; width: 85%; vertical-align: middle;">
						    <input type="range" id="seek-bar" class='' value="0" />
                        </div>-->
					</div>
				</div>
                <div class="row">
                    <div class="col-xs-12 watch-content">
                        <h2></h2>
                        <p></p>
                        <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                    </div>
                </div>

            </div>
            <!-- /윗 열 -->

        </div>
        <hr>
        <div class="row">
            <!-- 아래 열  -->
            <div class="col-xs-12">
                <div class="video-item-group" id="videoList">
                </div>
            </div>
            <!-- /아래 열 -->
        </div>
        <hr>
        <div class="row">

            <div class="col-xs-12 watch-discussion">
            <h2></h2>
            <p></p>
            <p><a class="btn btn-default" href="#" role="button"></a></p>
            </div>
        </div>

        <!-- /모바일 레이아웃 -->
    </script>


    <script type="text/template" id="video-item-temp">
        <@
        _.each(items.articleList,function(item,i){
        @>
        <div class="video-item">
            <a href="#" class="related-video" data-article="<@- item.id @>">
				<span class="thumb-wrap">
					<span class="video-thumb thumb thumb-120">
						<span class="thumb-default">
							<span class="thumb-clip">
								<img alt="" src="<@= item.thumbnail @>"	data-thumb="<@= item.thumbnail @>" width="120">
							</span>
						</span>
					</span>
					<span class="running-time"><@- item.runningTime @></span>
				</span>
                <span class="title" title="<@= item.title @>"> <@= item.title @> </span>
                <span class="stat view-count"><@- item.date @></span>
                <span class="stat view-count">댓글수  <@-item.commentCount @></span>
                <span class="stat view-count">구름수  <@-item.cloudCount @></span>
            </a>
        </div>
        <@
        });
        @>

        <ul class="pagination">
        <li><a href="#">&laquo;</a></li>
        <@
        _.each(items.pageInfoList,function(item,i){
        @>
            <li>
                <@
                    if( items.page != item.pageNum ){
                @>
                    <a onclick="test_test(<@= item.pageNum @>)">
                       <@- item.pageNum @>
                    </a>
                <@
                    }
                    else
                    {
                @>
                    <a style="color: red; font-weight: bold;" onclick="test_test(<@= item.pageNum @>)">
                    <@- item.pageNum @>
                    </a>
                <@
                    }
                @>
            </li>
        <@
        });
        @>
        <li><a href="#">&raquo;</a></li>
        </ul>

    </script>

    <script type="text/template" id="article-temp">
        <h3><@- item.title @></h3>
        <ul class="nav nav-tabs" id="myTab">
            <@
            _.each(item.tabInfoList,function(item,i){
            if (_.isEmpty(item) == false ){ @>
            <li class="<@if (i == 0) print('active') @>"><a href="#<@= item.type @>" data-toggle="tab"> <@- item.type @> </a></li>
            <@ }
            });
            @>
        </ul>

        <div class="tab-content">
            <@
            _.each(item.tabInfoList,function(item,i){

            if (_.isEmpty(item) == false ){ @>
            <div class="tab-pane <@if (i == 0) print('active') @>" id="<@= item.type @>"><@- item.description.value @></div>
            <@ }
            });
            @>
        </div>
    </script>
    <script type="text/template" id="discussion-temp">
        <div class='title'>모든 댓글(<@- item.discussList.length @>개)<br><br></div>
        <tag:loggedin>
        <div width="100%">
            <div>
                <ul>
                    <li>

                    </li>
                    <li>
                        <textarea id="ta_discuss" cols="68" style="width: 100%;"></textarea>
                    </li>
                </ul>
            </div>
            <div><button onclick="upload_discuss();" style="float: right">올리기</button></div>
        </div>
        </tag:loggedin>
        <br>
        <div>
            <ul class="media-list">
                <@
                _.each(item.discussList, function(discuss, i)
                { @>
                    <li class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="<@- discuss.profileImg @>" style="width: 64px; height: 64px;">
                        </a>
                        <div class="media-body">
                            <h5 class="media-heading"><@- discuss.userName @></h5>
                            <p><@- discuss.content @></p>

                            <@
                            _.each(discuss.replyList, function(reply, i)
                            { @>
                                <!-- Nested media object -->
                                <div class="media">
                                <a class="pull-left" href="#">
                                <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="<@- reply.profileImg @>" style="width: 64px; height: 64px;">
                                </a>
                                <div class="media-body">
                                <h5 class="media-heading"><@- reply.userName @></h5>
                                <p><@- reply.content @></p>

                                </div>
                                </div> <@
                            }); @>

                        </div>
                    </li>   <@
                }); @>



            </ul>
        </div>
    </script>



    <!-- /templates -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="public/js/vendor/bootstrap.min.js"></script>
    <script src="public/JungLib.js"></script>
    <script src="public/js/vendor/underscore-min.js"></script>


    <script type="text/javascript">
        _.templateSettings = {
            interpolate: /\<\@\=(.+?)\@\>/gim,
            evaluate: /\<\@([\s\S]+?)\@\>/gim,
            escape: /\<\@\-(.+?)\@\>/gim
        };
    </script>

    <script src="public/js/main.js"></script>



    <!-- BEGIN OF video player -->
    <link rel="stylesheet" href="video/video.css" type="text/css">
    <script src="video/vdo_preprocess.js" type="text/javascript"></script>
    <script src="video/vdo_overlay.js" type="text/javascript"></script>
    <script src="video/vdo_look.js"></script>
    <script src="video/video_main.js"></script>
    <!-- END OF video player -->

    <link href="public/css/media_custom.css" rel="stylesheet">

    <tag:notloggedin>
    <script type="text/javascript">
        var g_loggedin = false;
    </script>
    </tag:notloggedin>
    <tag:loggedin>
    <script type="text/javascript">
        var g_loggedin = true;
    </script>
    </tag:loggedin>

    <script type="text/javascript">

    var g_articleMgr = null;

    function onBodyLoad(){

        var jUtil = new JLIB.Util();

        if( jUtil.isMobile() == false )
        {
            var desktopTemplate = $("#layout-desktop").html();
            $(".selective-layout").html(_.template(desktopTemplate,{}));
        }
        else
        {
            var mobileTemplate = $("#layout-mobile").html();
            $(".selective-layout").html(_.template(mobileTemplate,{}));
        }

        $('#myTab a:last').tab('show');

        // 아티클 리스트를 받아오고, 첫화면에 띄울 첫아티클 디테일정보를 받아온다.
        g_articleMgr = new ArticleManager();
        g_articleMgr.load(
            function(){

            VideoMain.init(g_articleMgr.currentArticle.movie, false);

            refresh_discussList();

        });


    }

    function test_test(page)
    {
        g_articleMgr.getArticles(page);
    }

    </script>


  </body>
</html>