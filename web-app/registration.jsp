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
            background-color: darkgreen;
        }
        .Header H1
        {
            padding-left: 1%;

        }
        .SignIn
        {
            float:right;
            margin-top: -6%;
            margin-right: 0%;
            border: 1px solid gray;
            padding:10px 5px ;
            background-color: darkgreen;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .Table
        {

        }
        .Table td
        {
            padding: 1% 2px;
        }
        .Table .Text,.File
        {
            border: 1px solid lightgray;
            padding: 5px 0px;
        }
        .Table .Text:focus,.File:focus
        {
            box-shadow: 0px 0px 5px 0px darkgreen;
        }
        .File
        {
            padding-top: .1%;
            width: 100%;
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
            background-color: darkgreen;
        }
        .Footer
        {
            width: 100%;
            color:white;
            background-color: darkgreen;
            padding: 2px 0px;
            margin-top: 8%;
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

    <title>Registration for Link Sharing</title>
</head>
<body>
<header class="Header">
    <h1>Sign Up for Link Sharing</h1>
</header>
<h1 style="text-align:right;width:75%;margin-top:1%;color:darkgreen;font-size:250%;border:0px solid #000000;">Its Time To Share The Thing</h1>
<a href="login.jsp" class="SignIn">Sign in</a>
<form method="post" action="#">
<table align="center" class="Table">
    <%--<caption>Registration</caption>--%>
    <tr>
        <td>First Name</td>
        <td>Last Name</td>
    </tr>
    <tr>
        <td><input type="text" class="Text" placeholder="Enter The First Name"></td>
        <td><input type="text" class="Text" placeholder="Enter The Last Name"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td>User Name</td>

    </tr>
    <tr>
        <td><input type="text" class="Text" placeholder="Enter E-Mail Address"></td>
        <td><input type="text" class="Text" placeholder="Choose User Name"></td>
    </tr>
    <tr>
        <td>Password</td>
        <td>Confirm Password</td>
    </tr>
    <tr>
        <td><input type="password" class="Text" placeholder="Enter Password"></td>
        <td><input type="password" class="Text" placeholder="Re-Type Password"></td>
    </tr>
    <tr>
        <td colspan="2">Upload Photo</td>
    </tr>
    <tr>
        <td colspan="2"><input type="file" class="File"></td>
    </tr>
    <tr>

        <td colspan="2" align="right"><input type="submit" value="Submit" class="Button">&nbsp;<input type="reset" value="Reset" class="Button" > </td>
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
