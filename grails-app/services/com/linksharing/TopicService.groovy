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
    def unSubscribe(Topic topic,User user)
    {
        Subscription subscription=Subscription.findByTopicAndUser(topic,user)
        subscription.delete(flush: true)

    }

    def getTopic(long topicId)
    {
        Topic top=Topic.get(topicId)
        Map topic=[topicName:top.name,visibility:top.visibility,createdBy:top.createdBy.userName]
        return topic
    }
    def userTotalSubscription(long id)
    {
        Topic topic=Topic.get(id)
        List totalSubscription=Subscription.createCriteria().list{
            projections{
                count()
            }
            eq('topic',topic)
        }
        return totalSubscription[0]
    }
    def totalPost(long topicid)
    {
        Topic topic=Topic.get(topicid)
        List totalPost=Resource.createCriteria().list{
            projections{
                count()
            }
            eq('topic',topic)
        }
        return totalPost[0]
    }
    def getUserTopic(long id)
    {
        List <ShowTopicDTO>showTopicDTOList=new ArrayList<ShowTopicDTO>()
        Topic topic=Topic.get(id)

        def subscriptions=Subscription.createCriteria().list(max:10){
            projections{
                groupProperty('user')
            }
            eq('topic',topic)
        }
        subscriptions.each {user->

            showTopicDTOList.add(new ShowTopicDTO(user:user,subscription: getUserSubscription(user),topic: getUserTopic(user)))
        }
        return showTopicDTOList
    }
    int getUserSubscription(User user)
    {
        int count=Subscription.countByUser(user)
        return count
    }
    int getUserTopic(User user)
    {
        int count=Topic.countByCreatedBy(user)
        return count
    }
    boolean getSubscribeStatus(long topicid,long userid)
    {
        Subscription.findByTopicAndUser(Topic.get(topicid),User.get(userid))
    }
    def getMyTopicList(User user)
    {
        List <SubscriptionDTO>subscriptionDTOMyList=new ArrayList<SubscriptionDTO>()
        def topic=Topic.withCriteria{
            eq('createdBy',User.get(user.id))
        }
        topic.each {Topic top ->
            subscriptionDTOMyList.add(new SubscriptionDTO(topic:top,subscriptionStatus: getSubscribeStatus(top.id,user.id)))
        }
        return subscriptionDTOMyList
    }
    def getOtherTopicList(User user)
    {
        List <SubscriptionDTO>subscriptionDTOOtherList=new ArrayList<SubscriptionDTO>()
        def topic=Topic.withCriteria{
            ne('createdBy',User.get(user.id))
            eq('visibility',Visibility.PUBLIC)
        }
        topic.each {Topic top ->
            subscriptionDTOOtherList.add(new SubscriptionDTO(topic:top,subscriptionStatus: getSubscribeStatus(top.id,user.id)))
        }

        return subscriptionDTOOtherList
    }
}
