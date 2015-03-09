<table>
    <g:each in="${otherTopicList}" var="otherTopic">
    <tr>
        <td>
            <g:link id="${otherTopic.topic.id}" action="view"><span>${otherTopic.topic.name}</span><span style="padding-left:1%;color:#555;font-size: 65%;font-weight: bold;">(${otherTopic.topic.visibility})</span>
            </g:link>
        </td>
        <td>
            <g:if test="${otherTopic.subscriptionStatus}">
                <a href="javascript:void(0)"  id="${otherTopic.topic.id}" class="SignIn Subscribe" style="color:white">UnSubscribe</a>
            </g:if>
            <g:else>
                <a href="javascript:void(0)"  id="${otherTopic.topic.id}" class="SignIn Subscribe" style="color:white">Subscribe</a>
            </g:else>
        </td>
    </tr>
    </g:each>
</table>
