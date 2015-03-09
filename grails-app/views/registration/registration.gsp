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
    <asset:javascript src="application.js"></asset:javascript>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/registration.css">

    <title>Registration for Link Sharing</title>
    <script>
        $(document).ready(function(){

            $("#Registration").validate({
                rules:{
                    fname:"required",
                    lname:"required"
                },
                message:{
                    fname:"Please Enter First Name"
                }
                /*submitHandler:function()
                {
                    alert()
                }*/
            });
        });
    </script>
</head>
<body>
<header class="Header">
    <h1>Sign Up for Link Sharing</h1>
</header>
<h1 style="text-align:right;width:75%;margin-top:1%;color:darkgreen;font-size:250%;border:0px solid #000000;">Its Time To Share The Thing</h1>
<g:link controller="login" action="login" class="SignIn">Sign in</g:link>
<g:form controller="registration" action="addUser" enctype="multipart/form-data" id="Registration">
    <table align="center" class="Table">
        <%--<caption>Registration</caption>--%>
        <tr>
            <td>First Name</td>
            <td>Last Name</td>
        </tr>
        <tr>
            <td><input type="text" name="fName" class="Text" placeholder="Enter The First Name"></td>
            <td><input type="text" name="lName" class="Text" placeholder="Enter The Last Name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td>User Name</td>

        </tr>
        <tr>

            <td><g:textField name="email" class="Text" placeholder="Enter E-Mail Address"></g:textField></td>
            <td><g:textField type="text" name="uName" class="Text" placeholder="Choose User Name"></g:textField></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>Confirm Password</td>
        </tr>
        <tr>
            <td><g:passwordField name="passwd" class="Text" placeholder="Enter Password"></g:passwordField></td>
            <td><g:passwordField name="confirmPassword" class="Text" placeholder="Re-Type Password"></g:passwordField></td>
        </tr>
        <tr>
            <td colspan="2">Upload Photo</td>
        </tr>
        <tr>
            <td colspan="2"><input type="file" name="photo" class="File"></td>
        </tr>
        <tr>

            <td colspan="2" align="right"><g:submitButton action="addUser" name="Submit" class="Button"></g:submitButton>&nbsp;<input type="reset" value="Reset" class="Button" > </td>
        </tr>
    </table>
</g:form>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us </a> </span>
</footer>
</body>
</html>
