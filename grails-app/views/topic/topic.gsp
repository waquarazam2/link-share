<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 21/2/15
  Time: 10:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <asset:javascript src="application.js"></asset:javascript>
    <meta name="layout" content="master_page">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <title>Add New Topic</title>
    <script>
        $(document).ready(
            function() {

             }
        );
    </script>
</head>

<body>

    <g:form controller="topic" action="addTopic">
        <table class="TopicTable" align="left">
          %{--  <caption>Add New Topic</caption>--}%
            <tr>
                <td>Topic Name</td><td><g:textArea name="name" class="Text"></g:textArea></td>
            </tr>
            <tr>
                <td>Visibility</td><td><g:select name="visib" from="['Select','PUBLIC','PRIVATE']" class="Text"></g:select></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <g:submitButton name="Add" class="Button"></g:submitButton>
                    <input type="reset" value="Reset" class="Button">
                </td>
            <tr>
        </table>
    </g:form>
    <div class="RecentTopic">
        <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;Me...!</legend>
            <table>
                <g:render template="myTopicList" collection="${myTopicListDTO}" var="myTopic">
                </g:render>
            </table>

        </fieldset>
        <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;Recently Added Topic...!</legend>
            <table>
                <g:render template="otherTopicList" collection="${otherTopicListDTO}" var="otherTopic">
                </g:render>
            </table>

        </fieldset>
    </div>

</body>
</html>