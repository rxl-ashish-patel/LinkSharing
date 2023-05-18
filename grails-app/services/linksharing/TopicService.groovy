package linksharing

import grails.gorm.services.Service
import org.hibernate.Criteria

class TopicService{
    List<Topic> recentShare(Long count){
        Topics.list(offset:0,max:count,sort:'dateCreated',order:'desc')
    }
    Topic createTopic(Map m,Long id){
        println m
        def topic= new Topic(m)
        topic.createdBy=User.get(id);
        topic.save(flush:true)
        return topic
    }
    def get(Long id){
        return Topic.get(id)
    }


    Topic save(Topic topic){
        topic.save(flush:true)
        return topic
    }
    def delete(Long id){
//        println 'inside delete topic service'
        Topic.get(id).delete(flush: true)
    }
    def update(Map params){
            def topic=get(Integer.parseInt(params.topic))
            if(params?.visibility)
                topic.visibility=params.visibility
            if(params?.name)
                topic.name=params.name
            save(topic)
    }

    def trendingTopics(){
        return Topic.createCriteria().list{


                resources {
                    projections {
                        count('topic', 'topicCount')
                    }
                    groupProperty('topic')
                }

                order('topicCount','desc')




        }.collect { it[1] }
    }
    def subscriptionsByLatestPost(User currentUser){

        return Topic.createCriteria().listDistinct{
            createAlias "resources", "r", Criteria.LEFT_JOIN
            subscriptions{
                eq('user',currentUser)
            }

            order(org.hibernate.criterion.Order.desc('r.dateCreated').nulls(org.hibernate.NullPrecedence.LAST))
            groupProperty('topic')

            order('r.dateCreated','desc')
        }

    }

//
}