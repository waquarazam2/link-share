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
    <style>
        .Header
        {
            width: 100%;
            padding:1%  0px;
            color:white;
            background-color:rgba(117, 33, 46, 0.98);
        }
        .Header H1
        {
            padding-left: 1%;
            text-align: center;
        }
        .Menu
        {
            float: left;

        }
        .Menu,.Nav
        {
            width:48%;
            list-style-type: none;
            border:0px solid #000000;
            font-size: 88%;
            margin-top: 2px;
            margin-left: -2%;

        }

        .Nav
        {
            float: right;
            text-align: right;

        }
        .SignIn
        {
            float:right;

            margin-left: 1%;
            border: 1px solid gray;
            padding:4px 5px ;
            background-color: rgba(117, 33, 46, 0.98);
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .SignIn:hover
        {
            color:lightgray;
        }
        .Menu .MenuLi
        {
            display: inline-block;
            border:0px solid black;
            margin-left:-.6%;

        }

        .Menu .MenuLi a
        {
            padding-top: -1%;
            color:gray;
            text-decoration: none;
            border-right: 1px solid lightgray;
            padding: 10px 10px;
            display: block;
        }
        .Menu .MenuLi:hover,.Menu .MenuLi a:hover
        {
            background-color:rgba(117, 33, 46, 0.98);
            color:white;
        }
        .Text
        {
            border: 1px solid lightgray;
            padding: 5px 0px;

        }
        .Button
        {

            text-align: center;
            border:1px solid #AAA;
            padding:4px 0px;

        }
        .Button:hover
        {
            color:white;
            background-color: rgba(117, 33, 46, 0.98);;
        }
        .Footer
        {
            width: 100%;
            color:white;
            background-color: rgba(117, 33, 46, 0.98);;
            padding: 2px 0px;
            margin-top: 17%;
            font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 90%;
            font-weight:bold;
        }
        .Footer a
        {
            color:white;
            float: right;
            padding-righ*t: 5px;
            text-decoration: none;

        }
    </style>
    <script type="text/javascript">
        function openRegistration()
        {
            window.location.href="registration.jsp"
        }
    </script>
    <title>Registration for Link Sharing</title>
</head>
<body>
<header class="Header">
    <h1>Link Sharing</h1>
</header>
<div>
    <ul class="Menu">
        <li class="MenuLi"><a href="">Create New Topic</a></li>
        <li class="MenuLi"><a href="">Show Subscription</a></li>
        <li class="MenuLi"><a href="">Top Post</a></li>
        <li class="MenuLi"><a href="">Recent Post</a></li>
    </ul>
</div>
<div class="Nav">

    <a href="" ><img src="images/send.png" width="5%" style="margin-bottom:-1.7%;padding:0px 3px"></a>
    <a href="" ><img src="images/document.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></a>
    <a href="" ><img src="images/attachment1.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></a>
    <input type="text" class="Text" placeholder="Search The Post"><input type="submit" class="Button" value="Go!">
    <a href="" ><img src="images/user.png" width="4.5%" style="margin-bottom:-1.2%;padding:0px 3px"></a>
    <a href="login.jsp"  class="SignIn">Sign in</a>
</div>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us &nbsp;&nbsp;</a> </span>
</footer>
</body>
</html>
