package com.linksharing

class DocumentResource extends Resource {
    String filePath
    static constraints = {
        filePath size: 1..200,blank: false
    }
    static belongsTo = [
            Resource
    ]
}
