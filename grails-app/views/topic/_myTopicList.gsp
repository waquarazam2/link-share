<table>
    <g:each in="${myTopicListDTO}" var="myTopic">
    <tr>
        <td>

            <a href="/linksharing/topic/view/${myTopic.topic.id}"><span>${myTopic.topic.name}</span>&nbsp;<span style="padding-left:1%;color:#555;font-size:65%;font-weight: bold;%">(${myTopic.topic.visibility})</span>
            </a>
        </td>
    </tr>
    </g:each>
</table>