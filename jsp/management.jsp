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

    function select_button(selected_button)
    {
        var btn_write = document.getElementById("btn_write");
        var btn_read = document.getElementById("btn_read");

        btn_write.className = "";
        btn_read.className = "";

        selected_button.className = "selected_button";
    }

    function click_btn_write(event)
    {
        select_button(event.currentTarget);

        var iframe_main = document.getElementById("iframe_main");
        iframe_main.src = "write_article.jsp";

    }

    function click_btn_read()
    {
        select_button(event.currentTarget);

        var iframe_main = document.getElementById("iframe_main");
        iframe_main.src = "read_article.jsp";
    }


    </script>
</head>
<body>

<div style="position: absolute; left: 20px; top:0px; width: 160px; z-index: 3">
  <h3> VOISS <br> Management<br> System</h3>

  <br>


    <button id="btn_read" onclick="click_btn_read();">글 조회</button>
    
    <br>
    <br>
    <button id="btn_write" onclick="click_btn_write(event);">글 쓰기</button>

    <br>
    <br>
    <button id="btn_settings">설정</button>

</div>

<div style="position: absolute; bottom:0px; left: 0px; top: 0px; right: 0px">
<iframe id="iframe_main" src="read_article.jsp" style="border: none; height: 100%; width: 100%; display: block">
</iframe>
</div>

</body>
</html>