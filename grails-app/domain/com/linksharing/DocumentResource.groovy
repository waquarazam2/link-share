package com.linksharing

class DocumentResource extends Resource {
    String filePath
    static constraints = {
        filePath size: 1..200,blank: false
    }
    static belongsTo = [
            Resource
    ]
    DocumentResource(DocumentResourceCO documentResourceCO,User user,Topic topic,String filePath)
    {
        description=documentResourceCO.description
        createdBy=user
        this.topic=topic
        this.filePath=filePath
    }
}
