package com.linksharing

class LinkResourceController {

    def linkResourceService
    def link_resource() 
    {
    }
    def add_link_resource(LinkResourceCO linkResourceCO)
    {
        User user=User.get(session["id"])
        Topic topic=Topic.findByIdAndName(session["id"],linkResourceCO.topic)

        linkResourceService.addLinkResource(linkResourceCO,user,topic)

        render "link Has been Added"

    }
}
