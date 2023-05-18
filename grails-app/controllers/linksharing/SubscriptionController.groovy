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

    def privateTopicSubscription(){
        def user = User.findByResetToken(params.token)
        if (!user) {
            flash.params=[message :"Email not found",code:'warning']
            render "Invalid Token"
            return
        }
        def topic=Topic.get(params.topic)
        def previousSubscription=Subscription.findByUserAndTopic(user,topic)
        if(previousSubscription){
            if(session.currentUser.id==user.id){
                flash.params=[message :"allready subscribed",code:'warning']
                redirect controller: 'user'
            }
            else {
                render "All ready Subscribed"
                return
            }
        }
        else {
            def subscription = new Subscription(user: user, topic: topic,seriousness: Seriousness.CASUAL)
            subscription.save(flush:true)
            redirect controller: 'readingItem', action: 'create', params: [topic: params.topic, email: user.email, isRead: false]
        }

    }
    def createOwnTopicSubscription(){
        def subscription=subscriptionService.create(params)
        render " "
        return
    }
    def create() {
        println params
        def subscription=subscriptionService.create(params)
        println('subscription '+subscription)
        println subscription.topic.resources.size()==0
//        def topic=Topic.get(params.topic)
        if(subscription.topic.resources.size()==0) {
            render "Hello"
            return
        }
        else
           redirect controller:'readingItem',action:'create',params:[topic:params.topic,user:params.user,isRead:false]
    }

    def save(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view: 'create'
            return
        }
    }


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

    }

    def delete() {
        if (params.topic == null || params.user==null) {
            notFound()
            return
        }

        subscriptionService.delete(params)
        redirect controller:'readingItem',action:'delete',params:[topic:params.topic,user:params.user]
    }
}
