package linksharing

class ReadingItem {
    Resource resource
    User user
    Boolean isRead
    static constraints = {
        resource nullable:false
        user nullable: false
        isRead defaultValue: false
    }
}
