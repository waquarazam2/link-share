package com.linksharing

import grails.transaction.Transactional

@Transactional
class HomeService {

    def getRecentPost()
    {
        def resources= Resource.createCriteria().list(max:5,offset:0,sort:'id',order:'desc'){
//            projections{
//                property('topic')
//                property('createdBy')
//                property('dateCreated' )
//                property('description')
//            }
            'topic'{
                eq('visibility',Visibility.PUBLIC)
            }
        }
        return resources
    }
    def getTopPost()
    {
        def resources= ResourceRating.withCriteria{
            projections{
                groupProperty('resource')
                avg('score')
            }
        }
        resources= resources.sort{resource->
            resource[1]
        }

        resources=resources.reverse()

        List<Resource> topPost=new ArrayList<Resource>()
        resources.each{resource->
            topPost.add(resource[0])
        }

        if(topPost.size()>5)
            topPost=topPost.subList(0,5)
        return topPost
    }
}
