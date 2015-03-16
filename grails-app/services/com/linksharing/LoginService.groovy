package com.linksharing

import grails.transaction.Transactional

@Transactional
class LoginService {
    def mailService
    def checkEmail(String email)
    {
        User user=User.findByEmail(email)
        if(user)
        {
            mailService.sendMail {
                to email
                subject 'Linksharing password Reset'
                html 'Your Password is ' + '<b><u>'+user.password+'</b></u>'+" <a href='http://localhost:8080/linksharing/login/login?u="+user. userName+"'>"+'Login</a>'
            }
            return true
        }
        else
            return false
    }
}
