package com.linksharing

import grails.transaction.Transactional

@Transactional
class PostService {

    def getViewPost(long resourceId) {
        Resource resource=Resource.get(resourceId)
        return resource
    }
    def getResourceRatingStatus(long resourceId,long userId)
    {
        ResourceRating resourceRating=ResourceRating.findByUserAndResource(User.get(userId),Resource.get(resourceId))
        return resourceRating
    }
    def setRatingOnResource(long resourceId,long userId,int score)
    {
        ResourceRating resourceRating=new ResourceRating()
        Resource resource=Resource.get(resourceId)
        User user=User.get(userId)

        resourceRating.resource=resource
        resourceRating.user=user
        resourceRating.score=score
        if(resourceRating.save(flush: true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    def delete(long resourceId)
    {
        Resource resource=Resource.get(resourceId)
        def resourceRatings=ResourceRating.withCriteria {
            eq('resource',resource)
        }
        resourceRatings.each {resourceRating->
            resourceRating.delete(flush: true)
        }

        def readingItems=ReadingItem.withCriteria {
            eq('resource',resource)
        }
        readingItems.each {readingItem->
            readingItem.delete(flush: true)
        }

        resource.delete(flush: true)
        return true
    }
    def edit(long resourceID,String description)
    {
        Resource resource=Resource.get(resourceID)
        resource.description=description
        if(resource.save(flush: true))
        {
            return true
        }
        return false

    }
}
