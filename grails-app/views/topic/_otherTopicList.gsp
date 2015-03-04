<tr>
    <td>
        <g:link id="${otherTopic.topic.id}" action="view"><span>${otherTopic.topic.name}</span><span style="padding-left:1%;color:#555;font-size: 65%;font-weight: bold;">(${otherTopic.topic.visibility})</span>
        </g:link>
    </td>
    <td>
        <g:if test="${otherTopic.subscriptionStatus}">
            <g:link id="${otherTopic.topic.id}" action="unSubscribeTopic" class="SignIn" style="color:white">UnSubscribe</g:link>
        </g:if>
        <g:else>
            <g:link id="${otherTopic.topic.id}" action="subscribeTopic" class="SignIn" style="color:white">Subscribe</g:link>
        </g:else>
    </td>
</tr>
