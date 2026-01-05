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

        <title>Ken Park</title>

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
        <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
        <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
        </ul>
        </div><!--/.nav-collapse -->
        </div>
        </nav>



        <!-- 컨테이너 -->
        <div class="container">




        <div class="selective-layout">

        </div>

        <hr>
        <footer>
        <p>&copy; Ken Park 2015</p>
        </footer>
        </div>
        <!-- /컨테이-->

        <script type="text/template" id="layout-desktop">
        <!-- 데스크탑 레이아웃 -->
        <div class="row">
        <!-- 왼쪽 컬럼 -->
        <div class="col-xs-8">

        <div class="row">
        <div class="col-xs-12">

        </div>
        </div>
        </div>
        <!-- /왼쪽 컬럼 -->

        <!-- 오른쪽 컬럼 -->
        <div class="col-xs-4">

        </div>
        <!-- /오른쪽 컬럼 -->

        </div>
        <!-- /데스크탑 레이아웃 -->
        </script>

        <script type="text/template" id="layout-mobile">
        <!-- 모바 레이아웃 -->
        <div class="row">
        <!-- 왼쪽 컬럼 -->
        <div class="col-xs-8">

        <div class="row">
        <div class="col-xs-12">

        </div>
        </div>
        </div>
        <!-- /왼쪽 컬럼 -->

        <!-- 오른쪽 컬럼 -->
        <div class="col-xs-4">

        </div>
        <!-- /오른쪽 컬럼 -->

        </div>
        <!-- /모일바일 레이아웃 -->
        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="public/js/vendor/bootstrap.min.js"></script>
        <script type="text/javascript">

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

        }
        </script>
        </body>

        </html>