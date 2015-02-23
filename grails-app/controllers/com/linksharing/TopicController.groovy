package com.linksharing

class TopicController {


    def topic()
    {

    }
    def index()
    {
        Topic topic =Topic.get(params.id)
        render topic.name+ "\n"+topic.visibility
    }
    def addTopic()
    {
        String name=params.name
        String visib=params.visibility
        Visibility visibility
        int id=session.getAttribute("id")
        User user=User.get(id)
        if(visib.equals('PUBLIC'))
        {
            visibility=Visibility.PUBLIC
        }
        else if(visib.equals('PRIVATE'))
        {
            visibility=Visibility.PRIVATE
        }
        Topic topic=new Topic()
        topic.name=name
        topic.visibility=visibility
        user.addToTopics(topic)
        user.save(flush: true)
        render view: '/topic/topic'
    }
}
