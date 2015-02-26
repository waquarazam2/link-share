package com.linksharing

import grails.transaction.Transactional

@Transactional
class LinkResourceService {

    def addLinkResource(LinkResourceCO linkResourceCO,User user,Topic topic)
    {

        Resource resource=new LinkResource(linkResourceCO,user,topic)

        resource.save(flush: true)
    }
}
