package com.linksharing

class LinksharingTagLib {

    static defaultEncodeAs = [taglib: 'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    TopicService topicService
    DashBoardService dashBoardService
    UserService userService
    PostService postService
    HomeService homeService
    ProfileService profileService
    def recentPost={attr,body->
        def resources=homeService.getRecentPost()
        String totalRecentPost=homeService.getTotalRecentPost()
        println totalRecentPost+"---------------"
        out<<render(template: '/home/home_post', model: [resources:resources,totalRecentPost:totalRecentPost])
    }
    def topPost={attr,body->
        def resources=homeService.getTopPost()
        def totalTopPost=homeService.getTotalTopPost()
        out<<render(template: '/home/topPost', model: [resources:resources,totalTopPost:totalTopPost])
    }
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
        def inboxSize=dashBoardService.getTotalInboxItem()
        out<<render(template: '/dashboard/inbox', model:[inboxDTOList:inboxDTOList,inboxSize:inboxSize])
    }
    def subscription={attr,body->

        def dashBoardSubscription=dashBoardService.getDashBoradSubscriptionInfo(session["id"])
        int totalSubscription=dashBoardService.getTotalSubscription(session["id"])
        out<<render(template: '/dashboard/dashboardSubscription',model:[dashBoardSubscriptionList:dashBoardSubscription,totalSubscription:totalSubscription])
    }
    def profileTopic={attr,body->
        def userProfileTopicListDTO=profileService.getProfileTopic(session["id"])
        int totalSubscription=profileService.getTotalTopic(session["id"])
        out<<render(template: '/profile/profileTopic',model:[userProfileTopicListDTOList:userProfileTopicListDTO,totalSubscription:totalSubscription])
    }
    def userDetail={attr,body->
        def dashBoardUserInfo=dashBoardService.getDashBoardUserInfo(session["id"])
        out<<render(template:'/dashboard/dashboardUserDetail',model: [dashBoardUserInfo:dashBoardUserInfo])
    }
    def topicDetail={attr,body->
        def showTopicDTOList=topicService.getUserTopic(Long.parseLong(params.id))
        def totalUserOfTopic=topicService.getTotalUserOfTopic()
        out<<render(template: '/topic/topicuser',model: [showTopicDTOList:showTopicDTOList,totalUserOfTopic:totalUserOfTopic])
    }
    def postOnTopic={attr,body->

        List<PostOnTopicDTO> postOnTopicDTOList=topicService.getPostOnTopic(Long.parseLong(params.id),session["id"])
        def postOnTopicSize=topicService.getPostOnTopicSize()
        out<<render(template: '/topic/postOnTopic',model:[postOnTopicDTOList:postOnTopicDTOList,postOnTopicSize:postOnTopicSize])
    }
    def user={attr,body->
        List <UserDTO> userDTOList=userService.getUserInfo()
        def totalUser=userService.totalUser()
        out<<render(template: '/user/user',model: [userDTOList:userDTOList,totalUser:totalUser])
    }
    def post= { attr, body ->
        def resource = postService.getViewPost(Long.parseLong(params.id))
        def resourceRating = postService.getResourceRatingStatus(Long.parseLong(params.id), session["id"])
        out << render(template: '/post/viewPost', model: [resource: resource, resourceRating: resourceRating])
    }
}
