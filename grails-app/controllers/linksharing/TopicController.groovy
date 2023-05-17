package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {

    TopicService topicService
    UserService userService
    SubscriptionService subscriptionService
    ResourceService resourceService

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show( ){
        render view: 'show', model:[topic: Topic.get(params.topic),user:userService.getUser(session?.currentUser?.id),resources:Topic.get(params.topic).resources,isSuscribed:params.isSuscribed]
    }


    def create() {
        save(topicService.createTopic(params,session.currentUser.id))
//        redirect action:'index', controller:'user'
    }

    def save(Topic topic) {
        if (topic == null) {
            notFound()
            return
        }

        try {
            topicService.save(topic)
            redirect controller: 'subscription',action: 'create',params:[topic:topic.id,user:session.currentUser.id,seriousness:Seriousness.VERY_SERIOUS]
        } catch (ValidationException e) {
            respond topic.errors, view:'create'
            return
        }

    }

    def update() {
        println params
        if (params == null) {
            return
        }

        try {
            topicService.update(params)
            render "Success"

        } catch (ValidationException e) {
            respond topic.errors, view:'edit'
            return
        }

    }
    def searchData(){
        print params
          def posts=resourceService.searchData(params)
          println posts
          render view:'searchResultPage',model:[trendingTopics: topicService.trendingTopics(),topPosts: resourceService.topPosts(),searchPost:posts,user:userService.getUser(session?.currentUser?.id)]
    }

    def delete(Long id) {

        topicService.delete(id)

        redirect controller: 'user'
    }
}
