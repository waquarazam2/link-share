package com.linksharing

import grails.transaction.Transactional

@Transactional
class HomeService {

    def totalRecentPost
    def totalTopPost
    def getRecentPost(int offset=0)
    {
        def resources= Resource.createCriteria().list(max:5,offset:offset,sort:'id',order:'desc'){
//
            'topic'{
                eq('visibility',Visibility.PUBLIC)
            }
        }
        totalRecentPost=Resource.withCriteria {
           projections {
                count()
           }
            'topic'{
                eq('visibility',Visibility.PUBLIC)
            }
        }
      //  println "-----------------------"+totalRecentPost[0]
        return resources
    }
    String getTotalRecentPost()
    {
        return totalRecentPost[0].toString()
    }
    def getTopPost(int offset=0)
    {
        int offsetPlus=5
        def resources= ResourceRating.createCriteria().list{
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
        totalTopPost=topPost.size()
        if(offset+5>topPost.size())
        {
            offsetPlus=topPost.size()%5
        }
        if(topPost.size()>5)
        {
            topPost=topPost.subList(offset,offset+offsetPlus)

        }

        return topPost
    }
    def getTotalTopPost()
    {
        return totalTopPost
    }
}
