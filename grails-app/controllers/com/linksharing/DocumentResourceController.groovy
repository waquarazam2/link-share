package com.linksharing

import org.springframework.web.multipart.MultipartFile


class DocumentResourceController {

    def documentResourceService
    def document()
    {

    }
    def addDocumentResource(DocumentResourceCO documentResourceCO)
    {
        User user=User.get(session["id"])
        Topic topic=Topic.findByCreatedByAndName(user,documentResourceCO.topic)

        MultipartFile inFile=documentResourceCO.file
        String name=inFile.getOriginalFilename()
        //String ext=name.substring(name.lastIndexOf('.'))
        String filePath=request.getRealPath('/')

        filePath=filePath+'documentFile/'+name

        documentResourceService.addDocumentResource(documentResourceCO,user,topic,filePath,inFile,name)

        render "Document Has been Uploaded"

    }

}
