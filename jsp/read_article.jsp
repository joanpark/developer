<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> <!-- 인코딩설정 -->

    <title></title>
    <link rel="stylesheet" href="../public/css/management.css" type="text/css">
    	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="public/js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="../public/JungLib.js" type="text/javascript"></script>
    <script src="../mustache.js" type="text/javascript"></script>

    <script id="template" type="x-tmp-mustache">
    {{#articleList}}
    <div>
    제목: {{title}} <br>
    썸네일: {{thumbnail}} <br>
    </div>
	<div>
		<button class="button_article_detail" onclick="viewArticleDetail({{id}});">자세히 보기</button>
	</div>
    <hr>
    {{/articleList}}
    </script>

    <script type="text/javascript">

    var ajax = new JLIB.Ajax();

    function test()
    {

        ajax.send("../article?list=0", function(data){
            console.log(data);

            var tempData = {
                "articleList" : data.articleList
            };

            var template = $('#template').html();
            Mustache.parse(template);   // optional, speeds up future uses
            var rendered = Mustache.render(template, tempData);
            $('#target').html(rendered);

        });
    }

    function viewArticleDetail(article_id)
    {
        window.location.href = "read_article_detail.jsp?article_id=" + article_id;
    }

    </script>
</head>
<body onload="test();">


<div style="-webkit-margin-start: 167px; vertical-align: middle">
    <section>
        <h3>아티클 조회</h3>
        <div id="target">

        </div>
    </section>

</div>






</body>
</html>