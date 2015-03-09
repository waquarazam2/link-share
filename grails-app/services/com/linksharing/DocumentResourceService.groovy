package com.linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.mail.Multipart

@Transactional
class DocumentResourceService
{

    def addDocumentResource(DocumentResourceCO documentResourceCO,User user,Topic topic,String filePath,MultipartFile inFile)
    {
        Resource resource=new DocumentResource(documentResourceCO,user,topic,filePath)
        inFile.transferTo(new File(filePath))
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
