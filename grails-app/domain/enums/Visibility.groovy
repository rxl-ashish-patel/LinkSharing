package linksharing

enum Visibility{
    PUBLIC('public'),
    PRIVATE('private')

    String id
    Visibility(String id) {
        this.id = id
    }
}