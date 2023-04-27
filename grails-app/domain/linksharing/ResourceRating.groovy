package linksharing

class ResourceRating {
    Resource resource
    User user
    Integer score
    static constraints = {
        resource nullable:false
        user nullable: false
        score defaultValue: 0
    }
}
