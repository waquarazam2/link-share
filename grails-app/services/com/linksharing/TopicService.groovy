package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def addTopic(TopicCO topicCO,User user)
    {
        if(topicCO.visib.equals('PUBLIC'))
        {
            topicCO.visibility=Visibility.PUBLIC
        }
        else if(topicCO.visib.equals('PRIVATE'))
        {
            topicCO.visibility=Visibility.PRIVATE
        }
        Topic topic=new Topic(topicCO)
        user.addToTopics(topic)
        user.save(flush: true)
        subscribe(topic,user)
    }
    def subscribe(Topic topic,User user)
    {
        Subscription subscription=new Subscription()
        subscription.seriousness=Seriousness.SERIOUS
        subscription.user=user
        subscription.topic=topic
        subscription.save(flush: true)
    }
}
