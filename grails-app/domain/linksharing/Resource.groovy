package linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date lastUpdated

    static constraints = {

    }
    static mapping={
        table "Resources"
    }
}
