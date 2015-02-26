package com.linksharing

import grails.transaction.Transactional

@Transactional
class DocumentResourceService {

    def addDocumentResource(DocumentResourceCO documentResourceCO,User user,Topic topic)
    {
        Resource resource=new DocumentResource(documentResourceCO,user,topic)

        resource.save(flush: true)
    }
}
