package linksharing


class ResourceRatingService {

    def create(Map params,User user){
        def resource=Resource.get(params.resource)
        def rating=new ResourceRating(params)
        rating.user=user
        rating.resource=resource
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
