package linksharing
enum Seriousness{
    SERIOUS('Serious'),
    VERY_SERIOUS('Very Serious'),
    CASUAL('Casual')

    String id
    Seriousness(String id) {
        this.id = id
    }
}