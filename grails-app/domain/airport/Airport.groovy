package airport

class Airport {

    String ident
    AirportType type
    double latitude
    double longitude
    double elevation
    String region
    boolean scheduledService
    String gpsCode
    String iataCode
    String localCode
    String wikipediaLink
    String keywords
    String code
    String name
    String addressLine1
    String addressLine2
    String addressCity
    String addressCountry
    String addressPostalCode
    String phone
    String fax
    String webSite

    static constraints = {

        ident(maxSize: 50,)
        region(maxSize: 50)
        gpsCode(maxSize: 50)
        iataCode(maxSize: 50)
        localCode(maxSize: 50)
        wikipediaLink(maxSize: 100)
        keywords(maxSize: 50)

        code(size: 1..8, unique: true,blank: false)
        name(maxSize: 200,blank: false)

        addressLine1(maxSize: 50,blank: false)
        addressLine2(maxSize: 50,blank: false)
        addressCity(maxSize: 50,blank: false)
        addressCountry(maxSize: 50,blank: false)
        addressPostalCode(maxSize: 10)

        phone(maxSize: 50,blank: false)
        fax(maxSize: 50,url: true)

        webSite(maxSize: 100,url: true)
        wikipediaLink(maxSize: 100,url: true)
    }

    static transients = ['address', 'fullAddress']

    String getAddress() {
        def address = ""
        if (addressCity) {
            address = addressCity
            if (addressCountry) {
                address = "$address, $addressCountry"
            }
        } else if (addressCountry) {
            address = addressCountry
        }

        return address
    }

    String getFullAddress() {
        def address = ""
        if (addressCity) {
            address = addressCity
            if (addressCountry) {
                address = "$address, $addressCountry"
            }
        } else if (addressCountry) {
            address = addressCountry
        }

        // TODO - add addresses

        return address
    }
}
