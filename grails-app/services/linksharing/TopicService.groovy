package linksharing

import grails.gorm.services.Service

class TopicService{
    List<Topic> recentShare(Long count){
        Topics.list(offset:0,max:count,sort:'dateCreated',order:'desc')
    }
    Topic createTopic(Map m,Long id){
        def topic= new Topic(m)
        topic.createdBy=User.get(id);
        print id
        return topic
    }
}