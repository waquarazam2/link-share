%{--<g:each in="${inboxDTOList}" var="inboxDTO">--}%

    <g:if test="${!resource}">
        ${response.sendRedirect('/linksharing/dashboard/dashboard')}
    </g:if>
    <g:else>
        <div style="width: 50%;float: left" id="ViewPost${resource.id}">
            <div class="InboxImage" style="float: left">
                <g:img dir="images" file="profile.png" width="64px"></g:img>
            </div>
            <div class="InboxMain">
                <div class="InboxHeader">
                    <div>
                        <div  style="float: left">&nbsp;&nbsp;<span style="color:gray;font-size: 90%;">${resource.createdBy.name}</span></div>
                        <div  style="float: right"><g:link controller="topic" action="view" id="${resource.topic.id}" class="SignIn">${resource.topic.name}</g:link> </div>
                    </div>
                </div>
                <div class="InboxMain" style="clear: right">
                    <div>
                        <g:if test="${resource.createdBy==com.linksharing.User.get(session["id"])}">
                            <div  style="float: left;">&nbsp;&nbsp;<span style="color:gray;font-size: 90%;">Created By: You</span></div>
                        </g:if>
                        <g:else>
                            <div  style="float: left;">&nbsp;&nbsp;<span style="color:gray;font-size: 90%;">Created By: @${resource.createdBy.userName}</span></div>
                        </g:else>
                        <div  style="text-align:right;width:50%;float:right">
                            <span style="font-size: 90%;margin-right: 4%;color: rgba(117, 33, 46, 0.98)"><g:formatDate date="${resource.dateCreated}" format="dd-MMM-yyyy hh:mm a"></g:formatDate></span>

                            <g:if test="${resourceRating?.score}">
                                <%
                                    int score=resourceRating.score
                                    int i
                                    for(i=1;i<=score;i++)
                                    {
                                %>
                                <img src="/linksharing/images/star1.jpeg" width="5%">
                                <%
                                    }
                                %>
                                <%
                                    for(i=1;i<=5-score;i++)
                                    {
                                %>
                                <img src="/linksharing/images/star1.jpeg" width="5%" style="opacity: 0.3">
                                <%
                                    }
                                %>

                            </g:if>
                            <g:else>
                                <a href="javascript:void(0)">
                                    <input type="hidden" value="${resource.id}" id="resource">
                                    <img src="/linksharing/images/star1.jpeg" width="5%" id='1' alt="${resource.id}" class="Rating"><img src="/linksharing/images/star1.jpeg" width="5%" id="2" class="Rating"><img src="/linksharing/images/star1.jpeg" width="5%" id="3" class="Rating"><img src="/linksharing/images/star1.jpeg" width="5%" id="4" class="Rating"><img src="/linksharing/images/star1.jpeg" width="5%" id="5" class="Rating">
                                </a>
                            </g:else>

                        </div>
                        <br><br>

                    </div>
                    <div style="clear: both">
                        <span id="Description${resource.id}">${resource.description}</span>
                       <g:form controller="post" action="editPost" id="${resource.id}">
                           <input type="hidden" value="${resource.id}" name="ResourceID">
                           <textarea name = "description" id="DescriptionText${resource.id}" class="DescriptionText" style="width: 100%;height: 100px">${resource.description}</textarea>
                            <g:submitButton name="Save" class="Button Save" id="Save${resource.id}"></g:submitButton>
                           <input type="button" value="Cancel" class="Button CancelPost" id="Cancel${resource.id}">
                       </g:form>

                    </div>
                </div>

            </div>
            <div  style="clear: both;margin-top: 25%">
                <div style="float: left;width: 12%">
                    <a href=""> <g:img dir="images" file="facebook.png" width="20px"></g:img></a>
                    <a href=""><g:img dir="images" file="twitter.png" width="20px"></g:img></a>
                    <a href=""><g:img dir="images" file="google-plus.png" width="20px"></g:img></a>
                </div>
                <div style="float: right;width: 80%">
                    <g:if test="${resource instanceof com.linksharing.DocumentResource}">
                        <g:link url="${resource.filePath}" class="SignIn">Download</g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                    </g:if>
                    <a href="" class="SignIn">View Full Site</a >&nbsp;&nbsp;
                    <g:if test="${resource.createdBy==com.linksharing.User.get(session["id"])}">
                        <a href='javascript:void(0)' id="${resource.id}"  class="SignIn Delete">Delete</a> &nbsp;&nbsp; &nbsp;&nbsp;
                        <a href="javascript:void(0)" id="${resource.id}" class="SignIn EditPost">Edit</a>
                    </g:if>
                </div>
            </div>
        </div>


    %{--
    </g:each>--}%

    </g:else>
