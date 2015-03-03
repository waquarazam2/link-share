package com.linksharing

class ApplicationFilters {

    def filters = {
        all(controller:'*',controllerExclude:['login,registration'],action:'*') {
            before = {
               // println params
                log.info(params)
               /* if(!session["id"])
                {
                    println "Session ID "+ session["id"]
                    redirect(controller: 'login',action: 'login')

                }

                println "Session ID "+ session["id"]*/

            }
            after = { Map model ->


            }
            afterView = { Exception e ->

            }
        }
    }
}
