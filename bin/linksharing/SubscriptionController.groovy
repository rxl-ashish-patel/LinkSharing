package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SubscriptionController {

    SubscriptionService subscriptionService

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond subscriptionService.list(params), model:[subscriptionCount: subscriptionService.count()]
    }

    def show(Long id) {
        respond subscriptionService.get(id)
    }

    def create() {
        println params
        save(subscriptionService.create(params))
//        render params
        redirect controller:'readingItem',action:'create',params:[topic:params.topic,email:session.currentUser.email,isRead:false]
    }

    def save(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view:'create'
            return
        }

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscription.id])
//                redirect subscription
//            }
//            '*' { respond subscription, [status: CREATED] }
//        }
    }

//    def update(Long id) {
//        render params
////        respond subscriptionService.get(id)
//    }

    def update() {
        if (params == null) {
            notFound()
            return
        }

        try {
            println params
            subscriptionService.update(params)
            render "Success"
        } catch (ValidationException e) {
//            respond subscription.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscription.id])
                redirect subscription
            }
            '*'{ respond subscription, [status: OK] }
        }
    }

    def delete() {
        if (params.topic == null || params.user==null) {
            notFound()
            return
        }

        subscriptionService.delete(params)
        redirect controller:'readingItem',action:'delete',params:[topic:params.topic,email:session.currentUser.email,isRead:false]
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
