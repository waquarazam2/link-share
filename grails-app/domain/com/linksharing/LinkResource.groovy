package com.linksharing

class LinkResource extends Resource {
    String url
    static constraints = {
        url size: 1..200,url: true
    }
    static belongsTo = [
            Resource
    ]
}
