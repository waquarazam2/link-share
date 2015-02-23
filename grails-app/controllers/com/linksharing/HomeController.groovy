package com.linksharing

class HomeController {

    def home()
    {
        if(!session["id"])
            redirect(controller: 'login', action: 'login')
    }
    def openHomePage()
    {
        redirect(action: 'home')
    }
}
