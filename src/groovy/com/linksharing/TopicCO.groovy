package com.linksharing

import grails.validation.Validateable
import com.linksharing.Topic
/**
 * Created by amir on 24/2/15.
 */
@Validateable
class TopicCO {

    String name
    String visib
    Visibility visibility
    boolean addTopic(TopicCO topicCO,User user)
    {
        Topic topic=new Topic(topicCO)
        user.addToTopics(topic)
        if(user.save(flush:true))
        {
            return true
        }
        return false
    }
}