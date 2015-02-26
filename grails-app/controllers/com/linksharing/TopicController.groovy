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
}
