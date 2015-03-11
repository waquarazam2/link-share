<%--
  Created by IntelliJ IDEA.
  User: mohd
  Date: 13/2/15
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <meta name="layout" content="master_page">%{--Import master page--}%

    <title>Home Page of Link Sharing</title>
</head>
<body>

    <div class="RecentPost">
        <fieldset>
            <legend>Recent Post</legend>
            <g:render template="/home/home_post" collection="${resources}" var="resource" />
        </fieldset>
        <div style="text-align: right">
            <g:link class="SignIn" style="color:white">View All</g:link>
        </div>
    </div>

    %{--Top Post--}%
   <div style="border:0px solid lightgray;float:right;width:50%;" class="TopPost">
       <fieldset>
           <legend>Top Post</legend>
           <g:render template="topPost" collection="${topPost}" var="resource"></g:render>
       </fieldset>
        <div style="text-align: right">
            <g:link class="SignIn" style="color:white">View All</g:link>
        </div>
   </div>
</body>
</html>
