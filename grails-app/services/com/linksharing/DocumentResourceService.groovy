package com.linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.mail.Multipart

@Transactional
class DocumentResourceService
{

    def addDocumentResource(DocumentResourceCO documentResourceCO,User user,Topic topic,String filePath,MultipartFile inFile)
    {


        Resource resource=new DocumentResource(documentResourceCO,user,topic,filePath)
        inFile.transferTo(new File(filePath))
        resource.save(flush: true)
    }
}
