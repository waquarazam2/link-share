package com.linksharing
class TopicController {

    TopicService topicService
    def topic()
    {
        if(!session["id"])
        {
            redirect( action: 'login' ,controller: 'login')
        }
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
        Map topicMap= topicService.getTopic(Long.parseLong(params.id),session["id"])
        boolean subscriptionStatus=topicService.getSubscribeStatus(Long.parseLong(params.id),session["id"])
        render(view:'/topic/view',model: [subscriptionStatus:subscriptionStatus,userTotalSubscription:userTotalSubscription,totalPost:totalPost,topicMap:topicMap])
    }
    def changeSeriousNess()
    {
        long topicid=Long.parseLong(params.id)
        long userid=session["id"]
        String serious=params.seriousNess
        Seriousness seriousness
        if(serious.equals('SERIOUS'))
        {
            seriousness=Seriousness.SERIOUS
        }
        else if(serious.equals('VERY_SERIOUS'))
        {
            seriousness=Seriousness.VERY_SERIOUS
        }
        else if(serious.equals('CASUAL'))
        {
            seriousness=Seriousness.CASUAL
        }
        if(topicService.changeSeriousNess(userid,topicid,seriousness))
        {
            render 'success'
        }
        else
        {
            render 'failed'
        }
    }
    def subscribeTopic()
    {
        long topicid=Long.parseLong(params.id)
        int id=session["id"]
        User user=User.get(id)
        Topic topic=Topic.get(topicid)
        topicService.subscribe(topic,user)
        render 'success'
        //redirect(action: 'view' ,params: params.id)
        //redirect(controller: 'topic' ,action: 'topic')
    }


    def unSubscribeTopicFromDashboard()
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
            redirect(controller: 'dashboard', action:'dashboard' , id:params.id)
        }

    }

    def unSubscribeTopic()
    {

        long topicid=Long.parseLong(params.id)
        int id=session["id"]
        User user=User.get(id)
        Topic topic=Topic.get(topicid)
        if(topic.createdBy==user)
            render "faild"
        else
        {
            topicService.unSubscribe(topic,user)
            render 'success'
           // redirect(controller: 'topic',action: 'topic')
        }

    }

}
