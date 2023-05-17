package linksharing

class ResourceRating {
    Resource resource
    Integer score
    static belongsTo=[user:User,resource:Resource]

    static constraints = {
        resource nullable:false
        user nullable: false
        score defaultValue: 0
    }
    static mapping={
        table "ResourceRatings"
    }
}
