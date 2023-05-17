package linksharing

import grails.gorm.services.Service
import static org.springframework.http.HttpStatus.*

class SubscriptionService{
    List<Topic> getAllTopicId(def subscriptionList){
        return Subscription.getAll(subscriptionList as List)*.topic
    }
    Subscription create(Map params){
        Subscription subscription=new Subscription(params)
        subscription.topic=Topic.get(params.topic)
        subscription.user=User.get(params.user)
        return subscription

    }
    Subscription save(Subscription subscription){
        subscription.save(flush:true,failOnError:true)
        return subscription
    }
    def delete(Map params){
        Topic topic=Topic.get(params.topic)
        User user=User.get(params.user)
        Subscription.findByTopicAndUser(topic,user).delete(flush:true)
    }


    def update(Map params){
        def topic=Topic.get(Integer.parseInt(params.topic))
        def user=User.get(Integer.parseInt(params.user))
        def subscription=Subscription.findByTopicAndUser(topic,user)
        subscription.seriousness=params.seriousness
        save(subscription)
    }
}