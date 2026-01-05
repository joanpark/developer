<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.jungien.projectVideo.common.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%
	String article_id = request.getParameter("article_id");
   	if( article_id == null || article_id.isEmpty() )
   	{
		ServerUtil.Inst().SendError(response, ServerError.GET_PARAMETER_EMPTY);			
   	}
   	else
   	{                
   		pageContext.setAttribute("article_id", article_id);
    }

%>    
    
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

        <div>
        제목: {{title}} <br>
        썸네일: {{thumbnail}} <br>
        동영상: {{movie}} <br>
        </div>
        <hr>
        {{#tabInfoList}}
        <section>
        <h4>{{type}}</h4>
        {{#description}}
        <div>{{value}}</div>
        {{/description}}
        </section>
        {{/tabInfoList}}

        </script>

        <script type="text/javascript">

        var ajax = new JLIB.Ajax();

        var article_id = -1;

        function on_body_load()
        {
            article_id = ${fn:escapeXml(article_id)};

            ajax.send("../article?read=" + article_id, function(data){
                console.log(data);

                var template = $('#template').html();
                Mustache.parse(template);   // optional, speeds up future uses
                var rendered = Mustache.render(template, data);
                $('#target').html(rendered);

            });
        }

        function deleteCloud()
        {
            ajax.send("../projectvideo?deleteAll=0&articleId=" + article_id, function(data){
                console.log(data);

            });
        }

        function deleteArticle()
        {
            ajax.send("../article?delete=" + article_id, function(data){
                console.log(data);
            });
        }

        function deleteAllArticle()
        {
            ajax.send("../article?deleteAll=0", function(data){
                console.log(data);
            });
        }

        </script>
        </head>
        <body onload="on_body_load();">

        <div style="-webkit-margin-start: 167px; vertical-align: middle">
        <section>
        <h3>아티클 상세보기</h3>
        <div id="target">

        </div>
        <div>
            <button onclick="deleteCloud();">구름 삭제</button>
        </div>
        <div>
            <button onclick="deleteArticle();">글 삭제</button>
        </div>
        <div>
            <button onclick="deleteAllArticle();">모든 글 삭제</button>
        </div>
        </section>

        </div>






        </body>
        </html>