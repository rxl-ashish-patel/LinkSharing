package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ResourceRatingController {

    ResourceRatingService resourceRatingService
    UserService userService
    TopicService topicService

//    static allowedMethods = [createUpdate: "POST", update: "PUT", delete: "DELETE"]


    def showPost(){
        println(params)
        if(session?.currentUser!=null)
            render view:'post',model:[resourc:Resource.get(params.resource),user:userService.getUser(session?.currentUser?.id),trendingTopics:topicService.trendingTopics()]
        else
            render view:'post',model:[resourc:Resource.get(params.resource),user:null]
    }

    def createUpdate() {
        println(params)
        def rating=resourceRatingService.createUpdateRating(params)
        if(rating.hasErrors()){
            flash.params=['message':"unable to rate",code:'danger']
            render view:'post',model: [resourc:rating.resource,user:session?.currentUser,errors:rating.errors.allErrors]
            return
        }
        else{
            flash.params=['message':"rating added successfully",code:'success']
            render view:'_starRatingTemplate',model: [resourc:rating.resource,user:session?.currentUser]
            return
        }

    }

    def save(ResourceRating resourceRating) {
        if (resourceRating == null) {
            notFound()
            return
        }

        try {
            resourceRatingService.save(resourceRating)
        } catch (ValidationException e) {
            respond resourceRating.errors, view:'create'
            return
        }

    }

    def edit(Long id) {
        respond resourceRatingService.get(id)
    }

    def update(ResourceRating resourceRating) {
        if (resourceRating == null) {
            notFound()
            return
        }

        try {
            resourceRatingService.save(resourceRating)
        } catch (ValidationException e) {
            respond resourceRating.errors, view:'edit'
            return
        }

    }



}
