package com.linksharing

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

/**
 * Created by amir on 25/2/15.
 */
@Validateable
class RegistrationCO
{
    String fName
    String lName
    String email
    String uName
    String passwd
    String confirmPassword
    MultipartFile photo
   // byte[] photo
    static constraints={
        passwd validator: {val,registrationCO->
                return val.equals(registrationCO.confirmPassword)
        }
    }

}
