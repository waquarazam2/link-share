package com.linksharing

class DocumentResourceController {

    def documentResourceService
    def document()
    {

    }
    def add_document_resource(DocumentResourceCO documentResourceCO)
    {
        User user=User.get(session["id"])
        Topic topic=Topic.findByIdAndName(session["id"],documentResourceCO.topic)
        documentResourceService.addDocumentResource(documentResourceCO,user,topic)
        render "Document Has been Uploaded"

    }

}
