package airport

class Comment {

    Airport airport

    String user
    String message
    Date date

    static mapping = {
        version false
        date index: 'id_date'
    }

    static constraints = {
    }
}
