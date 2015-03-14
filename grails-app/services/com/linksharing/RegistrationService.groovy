package com.linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class RegistrationService {

    boolean registration(RegistrationCO registrationCO,MultipartFile photo,String filePath)
    {
        User user=new User(registrationCO,'/linksharing/profilePic/'+photo.getOriginalFilename())
        filePath=filePath+'/'+photo.getOriginalFilename()
        photo.transferTo(new File(filePath))
        if(user.save(flush: true))
        {
            return true
        }
        return false
    }
}
