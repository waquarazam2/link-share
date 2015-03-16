<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 16/3/15
  Time: 11:36 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="master_page">
    <style type="text/css" rel="stylesheet" href="/linksharing/css/style.css"></style>
    <title></title>
</head>

<body>

<div class="TotalSubscription" style="border: 0px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);float:left;width:45%">
    <ls:userDetail></ls:userDetail>
    <br/><br/>

    <div style="margin-top:3%;width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">Topic</span>
        %{--<span style="float:right;"><a href="javascript:void 0" id="MoreSubscription" style="color:gray;text-decoration: none;font-size: 80%;">See More..!</a></span>--}%
    </div>
    <div id="Topic">
        <ls:profileTopic></ls:profileTopic>
    </div>
    </div>
<div style="float: right;width: 45%">

    <g:form controller="profile" action="updateProfile" enctype="multipart/form-data" id="Registration">
        <table align="center" cellpadding="4">
            <caption style="background-color: rgba(117, 33, 46, 0.98);color:white;border-top-left-radius: 7px;border-top-right-radius: 7px;padding:5px 0px;">Profile</caption>
            <tr>
                <td>First Name*</td>
            </tr>
            <tr>
                <td><input type="text" style="width: 100%"  name="fName" class="Text"></td>
            </tr>
            <tr>
                <td>Last Name*</td>
            </tr>
            <tr>
                <td><input type="text"  style="width: 100%" name="lName" class="Text" ></td>
            </tr>
            <tr>
                <td>User Name*</td>
            </tr>
            <tr>
                <td><g:textField name="uName" style="width: 100%" class="Text" ></g:textField></td>
            </tr>
            <tr>
                <td colspan="2">Upload Photo</td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="Text"></td>
            </tr>
            <tr>
                <td><g:submitButton action="updateProfile" name="Update" class="Button"></g:submitButton>&nbsp;<input type="reset" value="Reset" class="Button" > </td>
            </tr>
        </table>
    </g:form>
    <g:form controller="profile" action="changePassword" enctype="multipart/form-data" id="Registration">
        <table align="center" cellpadding="4">
            <caption style="background-color: rgba(117, 33, 46, 0.98);color:white;border-top-left-radius: 7px;border-top-right-radius: 7px;padding:5px 0px;">Change Password</caption>
            <tr>
                <td>New Password</td>
            </tr>
            <tr>
                <td><g:passwordField name="password" style="width: 100%" class="Text" ></g:passwordField></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
            </tr>
            <tr>
                <td><g:passwordField name="confirmPassword" style="width: 100%" class="Text" ></g:passwordField></td>
            </tr>
            <tr>
                <td><g:submitButton  name="Change" class="Button"></g:submitButton>&nbsp;<input type="reset" value="Reset" class="Button" > </td>
            </tr>
        </table>
    </g:form>

</div>

</body>
</html>