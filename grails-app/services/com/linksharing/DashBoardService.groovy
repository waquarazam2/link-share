package com.linksharing

import grails.transaction.Transactional

@Transactional
class DashBoardService {

    def inboxSize=0
    def postOnTopicSize=0
    int getTotalSubscription(long userID)
    {
        return Subscription.countByUser(User.get(userID))
    }
    def getInboxItem(long userid,int offset=0) {
        int offsetPlus=10
        User user=User.get(userid)
        def sub=Subscription.withCriteria{
            projections{
                property('topic')
            }
            eq('user',user)
        }

        def resources=sub.collect{topic->
            Resource.withCriteria{
                eq('topic',topic)
            }

        }
        resources=resources.sum()
        def readings=resources.collect{resource->
            ReadingItem.withCriteria{
                eq('resource',resource)
                eq('isRead',false)
                eq('user',user)
                order('id','desc')
            }
        }
        readings=readings-[[]]
        readings=readings?.reverse()
        readings=readings.sum()




        List <InboxDTO>inboxDTOList=new ArrayList<InboxDTO>()
        readings.each{reading->

            inboxDTOList.add(new InboxDTO(readingItem: reading ,resource:reading.resource,user: reading.user,document: reading.resource instanceof DocumentResource))
        }
        inboxSize=inboxDTOList.size()
        if(offset+5>inboxDTOList.size())
        {
            offsetPlus=inboxDTOList.size()%5
        }
        if(inboxSize>10)
        {
            inboxDTOList=inboxDTOList.subList(offset,offset+offsetPlus)

        }

        return inboxDTOList
    }

    def getTotalInboxItem()
    {
        return inboxSize
    }
    def getDashBoradSubscriptionInfo(long userid,int offset=0)
    {
        User user=User.get(userid)
        def subscriptions=Subscription.createCriteria().list([offset:offset,sort:'id',order:'desc',max:5]){
            eq('user',user)
        }
        int totalSubscription
        int totalPost
        boolean owner
        List <DashBoardSubscriptionDTO>dashBoardSubscriptionDTOList=new ArrayList<DashBoardSubscriptionDTO>()
        subscriptions.each{subscription->
            totalSubscription=Subscription.countByTopic(subscription.topic)
            totalPost=Resource.countByTopic(subscription.topic)
            owner=subscription.topic.createdBy==user
            dashBoardSubscriptionDTOList.add(new DashBoardSubscriptionDTO(seriousness:subscription.seriousness , topic:subscription.topic,totalSubscription: totalSubscription,totalPost: totalPost,owner: owner ))
        }
        return dashBoardSubscriptionDTOList
    }

    def getDashBoardUserInfo(long userid)
    {
        User user=User.get(userid)
        int totalTopic= Topic.countByCreatedBy(user)
        int totalSubscription=Subscription.countByUser(user)
        Map dashBoardUserInfo=[name:user.getName(),photoPath:user.photo,username:user.userName,totalTopic:totalTopic,totalSubscription:totalSubscription]
        return dashBoardUserInfo
    }
    boolean markAsRead(long readingid)
    {
        ReadingItem readingItem= ReadingItem.get(readingid)
        readingItem.isRead=true
        if(readingItem.save(flush: true))
        {
            return true
        }
        return false
    }
    boolean deleteTopic(long topicid)
    {
        Topic topic=Topic.get(topicid)
        def resources=Resource.withCriteria {
            eq('topic',topic )
        }
        def readingItems
        resources.each {resource->
            readingItems=ReadingItem.withCriteria {
                eq('resource',resource)
            }
            readingItems.each {readingItem->
                readingItem.delete(flush: true)
            }
            resource.delete(flush: true)
        }
        Subscription.findByTopic(topic).delete(flush: true)
        topic.delete(flush: true)
        return true
    }
    def edit(long topicID,String topicName)
    {
        Topic topic=Topic.get(topicID)
        topic.name=topicName
        if(topic.save(flush: true))
        {
            return true
        }
        return false
    }
}
