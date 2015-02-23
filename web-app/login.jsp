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
            padding:1% 0px;
            color:white;
            background-color:rgba(117, 33, 46, 0.98);
        }
        .Header H1
        {
            padding-left: 1%;

        }

        .Table
        {
            border: 1px solid #CCC;
            box-shadow: 0px 0px 10px 0px gray;

        }
        .Table td
        {
            padding: 2% 20px;
        }
        .Table td a,.Table td a:visited
        {
            text-decoration: none;
            font-size: 90%;
        }
        .Table caption
        {
            background-color: rgba(117, 33, 46, 0.98);
            color:white;
            border-top-left-radius: 7px;
            border-top-right-radius: 7px;
            padding:5px 0px;
        }
        .Table .Text
        {
            border: 1px solid lightgray;
            padding: 5px 0px;
        }
        .Table .Text:focus
        {
            box-shadow: 0px 0px 5px 0px rgba(117, 33, 46, 0.98);
        }

        .Button
        {
            margin-top: 5px;
            text-align: center;
            border:1px solid #AAA;
            padding:5px 5px;
            width:100px;
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
            margin-top: 16%;
            font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 90%;
            font-weight:bold;
        }
        .Footer a
        {
            color:white;
            float: right;
            padding-right: 5px;
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
    <h1>Sign in for Link Sharing</h1>
</header>
<h1 style="text-align:right;width:75%;margin:2% 0px;color:rgba(117, 33, 46, 0.98);;font-size:250%;border:0px solid #000000;">Its Time To Share The Thing</h1>

<form method="post" action="Login">
    <table align="center" class="Table">
        <caption>Login</caption>
        <tr>
            <td>User Name</td>
            <td><input type="text" class="Text" placeholder="User Name"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" class="Text" placeholder="Password"></td>
        </tr>

        <tr>
            <td colspan="2" align="right">
                <input type="submit" value="Login" class="Button">&nbsp;
                <input type="button" value="Sign up" class="Button" onclick="openRegistration()">
            </td>
        </tr>
        <tr>
            <td colspan="2"><a href="">Forgot Password</a> </td>
        </tr>
    </table>
</form>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us </a> </span>
</footer>
</body>
</html>
