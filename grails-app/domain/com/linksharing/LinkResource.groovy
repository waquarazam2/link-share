package com.linksharing

class LinkResource extends Resource {
    String url
    static constraints = {
        url size: 1..200,url: true
    }
    static belongsTo = [
            Resource
    ]
    LinkResource(LinkResourceCO linkResourceCO,User user,Topic topic)
    {
        description=linkResourceCO.description
        createdBy=user
        this.topic=topic
        this.url=linkResourceCO.url
    }
}
