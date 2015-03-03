package com.linksharing

class LinkResourceController {

    def linkResourceService
    def link_resource() 
    {
    }
    def addLinkResource(LinkResourceCO linkResourceCO)
    {
        User user=User.get(session["id"])
        Topic topic=Topic.findByCreatedByAndName(user,linkResourceCO.topic)

        linkResourceService.addLinkResource(linkResourceCO,user,topic)

        render "link Has been Added"

    }
}
