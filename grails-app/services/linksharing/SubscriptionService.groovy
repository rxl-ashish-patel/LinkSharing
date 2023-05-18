package linksharing

import grails.gorm.services.Service
import static org.springframework.http.HttpStatus.*

class SubscriptionService{
    List<Topic> getAllTopicId(def subscriptionList){
        return Subscription.getAll(subscriptionList as List)*.topic
    }
    Subscription create(Map params){

        def topic=Topic.get(params.topic)
        def user=User.get(params.user)
        println user
        println topic
        Subscription subscription=new Subscription(user:user,topic:topic,seriousness: params.seriousness)
        subscription.save(flush:true)
        return subscription

    }
    Subscription save(Subscription subscription){
        subscription.save(flush:true,failOnError:true)
        return subscription
    }
    def delete(Map params){
        Topic topic=Topic.get(params.topic)
        User user=User.get(params.user)
        def subscription=Subscription.findByTopicAndUser(topic,user).delete(flush:true)
        return subscription
    }


    def update(Map params){
        def topic=Topic.get(Integer.parseInt(params.topic))
        def user=User.get(Integer.parseInt(params.user))
        def subscription=Subscription.findByTopicAndUser(topic,user)
        subscription.seriousness=params.seriousness
        save(subscription)
    }
}