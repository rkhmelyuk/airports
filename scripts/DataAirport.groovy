import airport.Airport
import airport.AirportType
import au.com.bytecode.opencsv.CSVReader

CSVReader reader = new CSVReader(new FileReader("data/airports.csv"));
String[] nextLine
int numberRecord
reader.readNext();
while ((nextLine = reader.readNext()) != null) {
    def airport = new Airport()
    String scheduledServiceVariable = nextLine[11]
    String typeVariable = nextLine[2]

    if (nextLine[0] == "") {
        airport.code = numberRecord
    } else {
        airport.code = nextLine[0]
    }

    airport.ident = nextLine[1]
    if (typeVariable == '"heliport"') {
        airport.type = AirportType.findById(0)
    } else if (typeVariable == '"small_airport"') {
        airport.type = AirportType.findById(1)
    } else {
        airport.type = AirportType.findById(2)
    }
    airport.name = nextLine[3]
    if (nextLine[4] == "") {
        airport.latitude = 0
    }
    else {
        airport.latitude = Double.parseDouble(nextLine[4])
    }
    if (nextLine[5] == "") {
        airport.longitude = 0
    }
    else {
        airport.longitude = Double.parseDouble(nextLine[5])
    }
    if (nextLine[6] == "") {
        airport.elevation = 0
    }
    else {
        airport.elevation = Double.parseDouble(nextLine[6])
    }
    airport.region = nextLine[9]
    airport.addressCountry = nextLine[8]
    airport.addressCity = nextLine[10]
    if (scheduledServiceVariable.equalsIgnoreCase("no") || scheduledServiceVariable == "") {
        airport.scheduledService = false
    } else if (scheduledServiceVariable.equalsIgnoreCase("yes")) {
        airport.scheduledService = true
    }
    airport.gpsCode = nextLine[12]
    airport.iataCode = nextLine[13]
    airport.localCode = nextLine[14]
    airport.wikipediaLink = nextLine[16]
    airport.keywords = nextLine[17]
    airport.addressLine1 = ""
    airport.addressLine2 = ""
    airport.addressPostalCode = ""
    airport.phone = ""
    airport.fax = ""
    airport.webSite = ""

    if (!airport.save()) {
        airport.errors.allErrors.each {error ->
            println "An error occured with event1: ${error}"
        }
    } else {
        println "Record event1 made $numberRecord"
        numberRecord++
    }

}
