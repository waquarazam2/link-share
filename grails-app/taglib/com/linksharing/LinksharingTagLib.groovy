package com.linksharing

class LinksharingTagLib {

    static defaultEncodeAs = [taglib: 'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    TopicService topicService
    DashBoardService dashBoardService
    UserService userService
    PostService postService
    def myTopicList={attr,body->
        def myTopicListDTO=topicService.getMyTopicList(User.get(session["id"]))
        out<<render(template:'/topic/myTopicList' , model:[myTopicListDTO:myTopicListDTO])
    }

    def otherTopicList= { attr, body ->
        def otherTopicListDTO = topicService.getOtherTopicList(User.get(session["id"]))
        out << render(template: '/topic/otherTopicList', model: [otherTopicList: otherTopicListDTO])
    }
    def inbox={attr,body->
        def inboxDTOList=dashBoardService.getInboxItem(session["id"])
        out<<render(template: '/dashboard/inbox', model:[inboxDTOList:inboxDTOList])
    }
    def subscription={attr,body->
        def dashBoardSubscription=dashBoardService.getDashBoradSubscriptionInfo(session["id"])
        out<<render(template: '/dashboard/dashboardSubscription',model:[dashBoardSubscriptionList:dashBoardSubscription])
    }
    def userDetail={attr,body->
        def dashBoardUserInfo=dashBoardService.getDashBoardUserInfo(session["id"])
        out<<render(template:'/dashboard/dashboardUserDetail',model: [dashBoardUserInfo:dashBoardUserInfo])
    }
    def topicDetail={attr,body->
        def showTopicDTOList=topicService.getUserTopic(Long.parseLong(params.id))
        out<<render(template: '/topic/topicuser',model: [showTopicDTOList:showTopicDTOList])
    }
    def postOnTopic={attr,body->
        List<PostOnTopicDTO> postOnTopicDTOList=dashBoardService.getPostOnTopic(Long.parseLong(params.id),session["id"])
        out<<render(template: '/topic/postOnTopic',model:[postOnTopicDTOList:postOnTopicDTOList])
    }
    def user={attr,body->
        List <UserDTO> userDTOList=userService.getUserInfo()
        out<<render(template: '/user/user',model: [userDTOList:userDTOList])
    }
    def post= { attr, body ->
        def resource = postService.getViewPost(Long.parseLong(params.id))
        def resourceRating = postService.getResourceRatingStatus(Long.parseLong(params.id), session["id"])
        out << render(template: '/post/viewPost', model: [resource: resource, resourceRating: resourceRating])
    }
}
