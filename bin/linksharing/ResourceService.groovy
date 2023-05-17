package linksharing

import grails.gorm.services.Service

class ResourceService{
    def recentShare(int count){
        return Resource.createCriteria().list {
            topic{
                eq( 'visibility',linksharing.Visibility.PUBLIC)
            }
            maxResults(count)
            order('dateCreated' ,'desc')
        }
    }
    def topPosts(int count){
        return Resource.createCriteria().list {
            topic {
                eq('visibility', linksharing.Visibility.PUBLIC)
            }

            ratings {
                projections {
                    avg('score', 'avgRating')
                }
                groupProperty('resource')
            }
            order('avgRating', 'desc')
            maxResults(count)

        }
    }
    def trendingTopics(){
        return Resource.createCriteria().list{
            topic{
                count('resource','resCount')
                groupProperty('resources')
            }

        }
    }
    def create(Map params){
        def multipartFile = params.filepath
        def extension = multipartFile.getOriginalFilename().tokenize('.')[-1]
        def bytes = multipartFile.getBytes()
        def url = "grails-app/assets/document/${UUID.randomUUID()}.${extension}"
        def newFile = new File("${url}")
        newFile.createNewFile()
        newFile.append(bytes)
        params.filepath = url
        return new DocumentResource(params)
    }
}