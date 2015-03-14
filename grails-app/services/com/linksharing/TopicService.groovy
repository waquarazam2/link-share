package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def postOnTopicSize
    def totalUserOfTopic
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

        def resources=Resource.withCriteria{
            eq('topic',topic)
        }
        resources.each{resource->
            ReadingItem readingItem=new ReadingItem()
            readingItem.user=user
            readingItem.isRead=false
            resource.addToReadingItems(readingItem)
            resource.save(flush:true)
        }

    }
    def changeSeriousNess(long userid,long topicid,Seriousness seriousness)
    {
        User user=User.get(userid)
        Topic topic=Topic.get(topicid)
        Subscription subscription=Subscription.findByUserAndTopic(user,topic)
        subscription.seriousness=seriousness
        if(subscription.save(flush: true))
        {
            return  true
        }
        return false

    }
    def unSubscribe(Topic topic,User user)
    {
        Subscription subscription=Subscription.findByTopicAndUser(topic,user)

        subscription.delete(flush: true)

    }

    def getTopic(long topicid)
    {
        Topic top=Topic.get(topicid)
        Subscription subscription=Subscription.findByTopic(top)

        Map topic=[photoPath:top.createdBy.photo,seriousness:subscription.seriousness,topicId:top.id,topicName:top.name,visibility:top.visibility,createdBy:top.createdBy.userName]
        return topic
    }
    def userTotalSubscription(long topicid)
    {
        Topic topic=Topic.get(topicid)
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
    def getUserTopic(long topicid,int offset=0)
    {
        List <ShowTopicDTO>showTopicDTOList=new ArrayList<ShowTopicDTO>()
        Topic topic=Topic.get(topicid)

        def subscriptions=Subscription.createCriteria().list(order:'desc',sort:'id',max:5,offset:offset){
            projections{
                groupProperty('user')
            }
            eq('topic',topic)
        }
        subscriptions.each {user->

            showTopicDTOList.add(new ShowTopicDTO(user:user,subscription: getUserSubscription(user),topic: getUserTopic(user)))
        }
        totalUserOfTopic=Subscription.countByTopic(topic)
        return showTopicDTOList
    }
    def getTotalUserOfTopic()
    {
        return totalUserOfTopic
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
            order('dateCreated','desc')
        }
        topic.each {Topic top ->
            subscriptionDTOOtherList.add(new SubscriptionDTO(topic:top,subscriptionStatus: getSubscribeStatus(top.id,user.id)))
        }

        return subscriptionDTOOtherList
    }
    def getPostOnTopic(long topicid,long userid,int offset=0)
    {
        Topic topic=Topic.get(topicid)
        def resources=Resource.withCriteria{
            eq('topic',topic)
            order('dateCreated',"desc")
            maxResults(10)
            firstResult(offset)
        }
        postOnTopicSize=Resource.countByTopic(topic)
        List<PostOnTopicDTO> postOnTopicDTOList=new ArrayList<PostOnTopicDTO>()

        resources.each {resource->
            ReadingItem readingItem=ReadingItem.findByResourceAndUser(resource,User.get(userid))
            postOnTopicDTOList.add(new PostOnTopicDTO(subscriptionStatus:readingItem?.user==User.get(userid)?true:false , user: resource.createdBy,resource: resource,document: resource instanceof DocumentResource,readingItem: readingItem))
        }

        return postOnTopicDTOList
    }
    def getTotalPostOnTopic()
    {
        return postOnTopicSize
    }

}
