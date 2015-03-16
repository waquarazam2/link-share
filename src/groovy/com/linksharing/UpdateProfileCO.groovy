package com.linksharing

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile


/**
 * Created by amir on 16/3/15.
 */
@Validateable
class UpdateProfileCO {
    String fName
    String lName
    MultipartFile photo
    String uName
    static constraints={
        uName validator: {val,obj ->
            return User.findByUserName(val)?true:false
        }
    }
}
