package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {

    TopicService topicService
    SubscriptionService subscriptionService

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show( ){

        render view: 'show', model:[topic: Topic.get(params.topic),user:User.get(session.currentUser.id),resources:Topic.get(params.topic).resources,isSuscribed:params.isSuscribed]
    }
    def post(){
        render view:'post',model:[resourc:Resource.get(params.resource),user:session.currentUser]
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
//        redirect controller: '/'
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topic.id])
//                redirect topic
//            }
//            '*' { respond topic, [status: CREATED] }
//        }
    }
//
//    def edit(Long id) {
//        respond topicService.get(id)
//    }
//
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'topic.label', default: 'Topic'), topic.id])
                redirect topic
            }
            '*'{ respond topic, [status: OK] }
        }
    }
//
    def delete(Long id) {

        topicService.delete(id)

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), id])
//                redirect action:"index", controller: 'user'
//            }
//            '*'{ render status: NO_CONTENT }
//        }
        redirect controller: 'user'
    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
