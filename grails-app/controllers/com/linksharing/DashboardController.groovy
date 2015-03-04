package com.linksharing

class DashboardController {

    def dashBoardService
    def dashboard()
    {

        def inboxDTOList=dashBoardService.getInboxItem(session["id"])
        def dashBoardUserInfo=dashBoardService.getDashBoardUserInfo(session["id"])
        def dashBoradSubscriptionList=dashBoardService.getDashBoradSubscriptionInfo(session["id"])

        render(view: '/dashboard/dashboard',model: [dashBoardUserInfo:dashBoardUserInfo, inboxDTO:inboxDTOList,dashBoardSubscription:dashBoradSubscriptionList])
    }

    def markasread()
    {
        long readingid=Long.parseLong(params.id)
        if(dashBoardService.markAsRead(readingid))
            redirect(action: 'dashboard')
        else
        {
            render "Sorry Some Error Occure"
        }
    }
    def deleteTopic()
    {

        if(dashBoardService.deleteTopic(Long.parseLong(params.id)))
        {
            render "Topic has Been Deleted"
        }
        else
        {
            render "Sorry Please Try Again"
        }
    }
}
