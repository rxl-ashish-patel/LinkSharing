package linksharing

import grails.gorm.services.Service

class ResourceService{
    def recentShare(int count){
        return Resource.createCriteria().list {
            topic{
                eq( 'visibility',Visibility.PUBLIC)
            }
            maxResults(count)
            order('dateCreated' ,'desc')
        }
    }
}