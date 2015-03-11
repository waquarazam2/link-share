package com.linksharing

class PostController {

    PostService postService
    def post()
    {

    }
    def viewPost()
    {

    }
    def setRating()
    {
        long resourceId=Long.parseLong(params.id)
        long userId=session["id"]
        int score=Integer.parseInt(params.score)
        if(postService.setRatingOnResource(resourceId,userId,score))
        {
            render "success"
        }
        else
        {
            render "failed"
        }
    }
    def deletePost()
    {
        long resourceId=Long.parseLong(params.id)

        if(postService.delete(resourceId))
        {
            render "success"
        }
        else
        {
            render "failed"
        }

    }
    def editPost()
    {
        long resourceID=Long.parseLong(params.ResourceID)
        String description=params.description
        if(postService.edit(resourceID,description))
        {
            redirect(controller: 'post', action: 'post',id: params.id)
        }
        else
        {
            render "<h2>Sorry, Please Try Again</h2>"
        }
    }
}
