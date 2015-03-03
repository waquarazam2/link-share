package com.linksharing
class TopicController {

    TopicService topicService
    def topic()
    {
        if(!session["id"])
        {
            redirect( action: 'login' ,controller: 'login')
        }
        def myTopicList=topicService.getMyTopicList(User.get(session["id"]))
        def otherTopicList =topicService.getOtherTopicList(User.get(session["id"]))
        render(view: '/topic/topic',model:[myTopicList:myTopicList,otherTopicList:otherTopicList])
    }
    def index()
    {
        Topic topic =Topic.get(params.id)
        render topic.name+ "\n"+topic.visibility
    }
    def addTopic(TopicCO topicCO)
    {

        int id=session["id"]
        User user=User.get(id)
        topicService.addTopic(topicCO,user)
        redirect action: 'topic'
    }

    def view()
    {
        Long userTotalSubscription= topicService.userTotalSubscription(Long.parseLong(params.id))
        Long totalPost= topicService.totalPost(Long.parseLong(params.id))
        Map topicMap= topicService.getTopic(Long.parseLong(params.id))
        def showTopicDTOList=topicService.getUserTopic(Long.parseLong(params.id))
        boolean subscriptionStatus=topicService.getSubscribeStatus(Long.parseLong(params.id),session["id"])
        render(view:'/topic/view',model: [subscriptionStatus:subscriptionStatus,userTotalSubscription:userTotalSubscription,totalPost:totalPost,topicMap:topicMap,showTopicDTOList:showTopicDTOList])
    }

    def subscribeTopic()
    {
        long topicid=Long.parseLong(params.id)
        int id=session["id"]
        User user=User.get(id)
        Topic topic=Topic.get(topicid)
        topicService.subscribe(topic,user)
      //redirect(action: 'view' ,params: params.id)
        render "Topic has Been Subscribe"
    }
    def unSubscribeTopic()
    {

        long topicid=Long.parseLong(params.id)
        int id=session["id"]
        User user=User.get(id)
        Topic topic=Topic.get(topicid)
        if(topic.createdBy==user)
            render "<h1 style='color:red'>Sorry, You are the Owner of this Topic You Can't  unsubscribe This</h1?"
        else
        {
            topicService.unSubscribe(topic,user)
            render "'${topic.name}' Has Been Unsubscribed"
        }

    }

}
