package com.linksharing

import grails.transaction.Transactional

@Transactional
class HomeService {

    def getRecentPost()
    {
        def resources= Resource.createCriteria().list(max:2,offset:0,sort:'id',order:'desc'){
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
}
