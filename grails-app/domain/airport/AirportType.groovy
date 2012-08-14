package airport

enum AirportType {

    HELIPORT(1, "Heliport"),
    SMALL_AIRPORT(2, "Small airport"),
    SEAPLANE_BASE(3, "Seaplane base");

    final int id
    final String code

    AirportType(int id, String code) {
        this.id = id
        this.code = code
    }

    public static AirportType findById(int id) {
        for (AirportType airportType : AirportType.values()) {
            if (id == airportType.id) {
                return airportType
            }
        }
    }


}
