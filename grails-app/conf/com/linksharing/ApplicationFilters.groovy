package com.linksharing

class ApplicationFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
               // println params
                log.info(params)
                /*if(!session["id"])
                    redirect(controller: 'login', action: 'login')*/
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
