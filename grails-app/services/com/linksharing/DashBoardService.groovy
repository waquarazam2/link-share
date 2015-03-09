package com.linksharing

import grails.transaction.Transactional

@Transactional
class DashBoardService {

    def getInboxItem(long userid) {
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
            }
        }
        readings=readings-[[]]
        //readings=readings.reverse()
        readings=readings.sum()

        List <InboxDTO>inboxDTOList=new ArrayList<InboxDTO>()
        readings.each{reading->

            inboxDTOList.add(new InboxDTO(readingItem: reading ,resource:reading.resource,user: reading.user,document: reading.resource instanceof DocumentResource))
        }
        return inboxDTOList
    }
    def getPostOnTopic(long topicid,long userid)
    {
        Topic topic=Topic.get(topicid)
        def resources=Resource.withCriteria{
            eq('topic',topic)
            order('dateCreated',"desc")
            maxResults(10)
        }
        List<PostOnTopicDTO> postOnTopicDTOList=new ArrayList<PostOnTopicDTO>()

        resources.each {resource->
            ReadingItem readingItem=ReadingItem.findByResourceAndUser(resource,User.get(userid))
            postOnTopicDTOList.add(new PostOnTopicDTO(subscriptionStatus:readingItem?.user==User.get(userid)?true:false , user: resource.createdBy,resource: resource,document: resource instanceof DocumentResource,readingItem: readingItem))
        }

        return postOnTopicDTOList
    }
    def getDashBoradSubscriptionInfo(long userid)
    {
        User user=User.get(userid)
        def subscriptions=Subscription.createCriteria().list([sort:'id',order:'desc',max:'20']){
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
        Map dashBoardUserInfo=[name:user.getName(),username:user.userName,totalTopic:totalTopic,totalSubscription:totalSubscription]
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
}
