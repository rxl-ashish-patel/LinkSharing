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
    def topPosts(){
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

        }
    }
//    def trendingTopics(){
//        return Resource.createCriteria().list{
//            topic{
//                count('resource','resCount')
//                groupProperty('resources')
//            }
//
//        }
//    }
    def saveDocument(def multipartFile){
        if(multipartFile.getOriginalFilename()!='' ) {
            def extension = multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes = multipartFile.getBytes()
            def url = "/assets/${UUID.randomUUID()}.${extension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            return url
        }
        else
            return ""
    }
    def create(Map params){
        def resource
        if(params?.filepath!=null) {
            params.filepath=saveDocument(params.filepath)
            resource=new DocumentResource(params)
        }
        else
            resource=new LinkResource(params)
        resource.save(flush:true)
        return resource
    }

    def searchData(Map params){
        def user=User.get(params.userId)
        println params.payload.class
        if(user?.admin){
            if(params.payload==''){
                return Topic.list()
            }
            else{
                return Resource.createCriteria().list{
                    createAlias('topic','t')
                    or{
                        ilike('t.name', "%${params.payload}%")
                        ilike("description", "%${params.payload}%")
                    }
                }
            }
        }
        else{
            if (params?.payload != '') {
                return Resource.createCriteria().list {
                    createAlias('topic', 't')
                    or {
                        eq 't.visibility', linksharing.Visibility.PUBLIC
                        eq 't.createdBy', user
                    }
                    or {
                        ilike("t.name", "%${params.payload}%")
                        ilike("description", "%${params.payload}%")
                    }
                }
            }
            else{
                return null
            }
        }
    }
}