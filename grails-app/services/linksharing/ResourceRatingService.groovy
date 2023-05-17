package linksharing


class ResourceRatingService {

    def createUpdateRating(Map params){
        println "resourceUId "+params.resourceId
        println "score "+params.score
        def resource=Resource.get(params.resourceId)
        def user=User.get(params.userId)
        def rating=ResourceRating.findByUserAndResource(user,resource)?:new ResourceRating(user:user,resource:resource)
        rating.score=Integer.parseInt(params.score)
        rating.save(flush:true)
        return rating
    }

    def delete(Long id){
        ResourceRating.get(id).delete(flush:true)
    }
    def get(Long id){
        return ResourceRating.get(id)
    }
    def save(ResourceRating resourceRating){
        resourceRating.save(flush:true)
    }

}
