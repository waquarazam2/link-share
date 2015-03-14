
<div style="float: left;width: 100%;">
    <div class="TotalSubscription" style="border-bottom: 0px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);width:40%;">
        <g:each in="${userDTOList}" var="user">
            <div class="PostImage" style="float:left;margin-right: 2%">
                <g:img uri="${user.user.photo}" width="90px"></g:img>
            </div>
            <div style="margin-top:2%;">
                ${user.user.name}
            </div>
            <div style="color:gray;font-size: 90%">
                @${user.user.userName}
            </div>
            <div style="margin-top:1%;font-size: 90%;">
                <div style="float:left;width:20%;border:0px solid black">
                    ${user.user.email}<br>
                    <span style="font-size: 85%;">
                        <g:formatDate date="${user.user.dateCreated}" format="dd-MMM yyyy"></g:formatDate>
                    </span>
                </div>
                <div style="float:right;width:45%;">
                    <g:if test="${user.user.active}">
                        <a  href="javascript:void(0)" id="/linksharing/user/block/?id=${user.user.id}" %{--controller="user" action="block" id="${user.id}"--}% %{--params="[active:'true']"--}% class="SignIn User">block</a>
                    </g:if>
                    <g:else>
                        <a  href="javascript:void(0)" id="/linksharing/user/block/?id=${user.user.id}" %{--controller="user" action="block" id="${user.id}"--}% %{--params="[active:'true']"--}% class="SignIn User">unblock</a>
                    </g:else>
                    <g:link class="SignIn">profile</g:link>
                </div>
            </div>
            <br><br><br>
        </g:each>
        <div class="Paginate">
            <util:remotePaginate max="5"  update="UserList" action="moreUserList" total="${totalUser}"></util:remotePaginate>
        </div>
        %{--<div>
            <g:if test="${Integer.parseInt(params.id)&&userDTOList.size()}">
                <g:link controller="user" action="userlist" id="${Integer.parseInt(params.id)-5}" style="color:white;float: left" class="SignIn">Previous</g:link>
            </g:if>
            <g:if test="${userDTOList.size()==5}">
                <g:link controller="user" action="userlist" id="${Integer.parseInt(params.id)+5}" style="color:white;" class="SignIn">Next>></g:link>
            </g:if>
        </div>--}%
    </div>
</div>