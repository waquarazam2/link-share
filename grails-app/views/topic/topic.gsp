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
    <meta name="layout" content="master_page">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <title>Add New Topic</title>
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
                <g:each in="${myTopicList}" var="myTopic">
                    <tr>
                        <td>
                            <g:link id="${myTopic.topic.id}" controller="topic" action="view"><span>${myTopic.topic.name}</span>&nbsp;<span style="padding-left:1%;color:#555;font-size:65%;font-weight: bold;%">(${myTopic.topic.visibility})</span>
                            </g:link>
                        </td>

                    </tr>
                </g:each>
            </table>

        </fieldset>
        <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;Recently Added Topic...!</legend>
            <table>
                <g:each in="${otherTopicList}" var="otherTopic">
                    <tr>
                        <td>
                            <g:link id="${otherTopic.topic.id}" action="view"><span>${otherTopic.topic.name}</span><span style="padding-left:1%;color:#555;font-size: 65%;font-weight: bold;">(${otherTopic.topic.visibility})</span>
                            </g:link>
                        </td>
                        <td>
                            <g:if test="${otherTopic.subscriptionStatus}">
                                 <g:link id="${otherTopic.topic.id}" action="unSubscribeTopic">UnSubscribe</g:link>
                            </g:if>
                            <g:else>
                                <g:link id="${otherTopic.topic.id}" action="subscribeTopic">Subscribe</g:link>
                            </g:else>
                        </td>
                    </tr>

                </g:each>
            </table>

        </fieldset>
    </div>

</body>
</html>