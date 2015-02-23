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
    <link rel="stylesheet" type="text/css" href="/linksharing/css/home.css">
    <meta name="layout" content="master_page">%{--Import master page--}%

    <title>Home Page of Link Sharing</title>
</head>
<body>
    <g:render template="/layouts/MyTemplate" model='[name: "Amir"]'/>
    <h1 align="center">Hello This is Layout Demo</h1>
    <h1><date:dateFormate  formate='dd-MMM-yyyy'/></h1>
</body>
</html>
