package com.linksharing

import grails.transaction.Transactional

@Transactional
class LinkResourceService {

    def addLinkResource(LinkResourceCO linkResourceCO,User user,Topic topic)
    {

        Resource resource=new LinkResource(linkResourceCO,user,topic)
        resource.save(flush: true,failOnError: true)
        /*ReadingItem readingItem=new ReadingItem()
        readingItem.isRead=false
        readingItem.user=user
        resource.addToReadingItems(readingItem)*/
        resource.save(flush: true)
        addReadingItemToSubscribeUser(topic,resource)
    }
    def addReadingItemToSubscribeUser(Topic topic,Resource resource)
    {
        def subscriptions=Subscription.withCriteria {
            eq('topic',topic)
        }

        subscriptions.each {subscription->
            ReadingItem readingItem=new ReadingItem()
            readingItem.isRead=false
            readingItem.user=subscription.user
            resource.addToReadingItems(readingItem)
            resource.save(flush: true,failOnError: true)
        }
    }
}
