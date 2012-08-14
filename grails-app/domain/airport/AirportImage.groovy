package airport

class AirportImage {

    Airport airport
    String name

    static constraints = {
        airport(nullable: false)
        name(nullable: false, blank: false)
    }
}
