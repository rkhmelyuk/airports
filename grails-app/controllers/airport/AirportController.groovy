package airport

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.apache.commons.lang.RandomStringUtils
import org.imgscalr.Scalr

import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class AirportController {

    static final int COUNT_RECORD = 10;

    static scaffold = false

    @Secured("ROLE_ADMIN")
    def index() {
        def page = params.int('page') ?: 1
        String query = params.name?.trim() ?: ''

        int countRecord = Airport.createCriteria().count {
            or {
                like("name", "%${query}%")
                like("iataCode", "%${query}%")
                like("addressCountry", "%${query}%")
            }
        }
        def res = Airport.createCriteria().list {
            or {
                like("name", "%${query}%")
                like("iataCode", "%${query}%")
                like("addressCountry", "%${query}%")
            }
            maxResults COUNT_RECORD
            firstResult((page - 1) * COUNT_RECORD)
        }
        boolean hasNextPage = ((page * COUNT_RECORD) < countRecord);
        [airports: res, page: page, query: query, linkNextIsThere: hasNextPage, countRecord: countRecord]
    }

    @Secured("ROLE_ADMIN")
    def findAirports() {
        render template: "airports", model: index()
    }

    def show() {
        def airport = Airport.get(params.id)
        def airportImages = AirportImage.findAllByAirport(airport)
        boolean userVote = true;

        /*if (user){
            userVote=false;
        }else{
            userVote=true;
        }*/
        [airport: airport, airportImages: airportImages,
                comments: Comment.findAllByAirport(airport), userVote: userVote]
    }


    def comment() {
        def airport = Airport.get(params.airportId)
        if (!airport) {
            response.sendError 404
            return
        }
        def comment = new Comment();
        if (request.method == "POST") {
            comment.airport = airport
            comment.user = principal.username
            comment.message = params.message?.trim()
            comment.date = new Date()
            if (comment.save()) {
                print("Comment save comment.airport")
            }
        }
        [comments: Comment.findAllByAirport(airport)]
    }

    def commentAirports() {
        render template: "comments", model: comment()
    }

    def rating() {
        def airport = Airport.get(params.airportId)
        if (!airport) {
            response.sendError 404
            return
        }
        String sa = principal.username;
        def countChange =
            AirportRating.executeQuery("select count(a.username) from AirportRating a where a.username=:s and a.airport=:airport1 group by a.airport", [s: sa, airport1: airport])
        print(countChange)
        if (!countChange) {

            def rating = AirportRating.findByAirport(airport)
            if (!rating) {
                rating = new AirportRating();
            }

            if (request.method == "POST") {
                rating.airport = airport
                rating.username = principal.username

                if (airport.rating == null) {
                    airport.rating = 0;
                }
                rating.airport = airport

                airport.rating = params.float('rating')

                /*if (rating.countChange == null || rating.countChange == 0) {
                  rating.countChange = 0;
                  rating.rating = (rating.rating + params.float('rating'))
              } else {
                  rating.rating = (rating.rating + params.float('rating')) / (rating.countChange + 1)
              }
              rating.countChange += 1;*/


                if (rating.save()) {
                    print("Airport rating save rating.airport")
                }
            }
        } else {
            print("sss")
            render template: "comments", model: show()
        }
    }


    def saveRating() {
        render template: "rating", model: show()
    }

    @Secured("ROLE_ADMIN")
    def create() {
        def airport = new Airport()
        if (request.method == "POST") {
            airport.ident = params.ident?.trim()
            airport.type = AirportType.findById(params.int('type'))
            airport.latitude = params.double('latitude')
            airport.longitude = params.double('longitude')
            airport.elevation = params.double('elevation')
            airport.region = params.region?.trim()
            if (params.boolean('scheduledService') == null) {
                airport.scheduledService = false
            }
            else {
                airport.scheduledService = true
            }
            airport.gpsCode = params.gpsCode?.trim()
            airport.iataCode = params.iataCode?.trim()
            airport.localCode = params.localCode?.trim()
            airport.wikipediaLink = params.wikipediaLink?.trim()
            airport.keywords = params.keywords?.trim()
            airport.code = params.code?.trim()
            airport.name = params.name?.trim()
            airport.addressLine1 = params.addressLine1?.trim()
            airport.addressLine2 = params.addressLine2?.trim()
            airport.addressCity = params.addressCity?.trim()
            airport.addressCountry = params.addressCountry?.trim()
            airport.addressPostalCode = params.addressPostalCode?.trim()
            airport.phone = params.phone?.trim()
            airport.fax = params.fax?.trim()
            airport.webSite = params.webSite?.trim()

            if (airport.save()) {
                redirect action: 'index', id: airport.id
                return
            }
        }
        [airport: airport]
    }

    @Secured("ROLE_ADMIN")
    def edit() {
        def airport = Airport.get(params.id)
        if (!airport) {
            response.sendError 404
            return
        }
        if (request.method == 'POST') {
            airport.ident = params.ident?.trim()
            airport.type = AirportType.findById(params.int('type'))
            airport.latitude = params.double('latitude');
            airport.longitude = params.double('longitude')
            airport.elevation = params.double('elevation')
            airport.region = params.region?.trim()
            if (params.boolean('scheduledService') == null) {
                airport.scheduledService = false
            }
            else {
                airport.scheduledService = true
            }
            airport.gpsCode = params.gpsCode?.trim()
            airport.iataCode = params.iataCode?.trim()
            airport.localCode = params.localCode?.trim()
            airport.wikipediaLink = params.wikipediaLink?.trim()
            airport.keywords = params.keywords?.trim()
            airport.name = params.name?.trim()
            airport.code = params.code?.trim()
            airport.addressLine1 = params.addressLine1?.trim()
            airport.addressLine2 = params.addressLine2?.trim()
            airport.addressCity = params.addressCity?.trim()
            airport.addressCountry = params.addressCountry?.trim()
            airport.addressPostalCode = params.addressPostalCode?.trim()
            airport.phone = params.phone?.trim()
            airport.fax = params.fax?.trim()
            airport.webSite = params.webSite?.trim()

            if (airport.save()) {
                redirect action: 'index'
                return
            }
        }
        def airportImages = AirportImage.findAllByAirport(airport)
        [airport: airport, airportImages: airportImages]
    }

    @Secured("ROLE_ADMIN")
    def delete() {

        def airport = Airport.get(params.long("id"))
        if (!airport) {
            response.sendError 404
            return
        }
        def airportImages = AirportImage.findAllByAirport(airport)
        def comments = Comment.findAllByAirport(airport)

        for (int i = 0; i < airportImages.size(); i++) {
            airportImages[i].delete();
        }
        for (int i = 0; i < comments.size(); i++) {
            comments[i].delete();
        }
        airport.delete(flush: true)
        response.sendError 204
    }

    @Secured("ROLE_ADMIN")
    def deleteImage() {
        def airportImage = AirportImage.get(params.long("id"))
        if (!airportImage) {
            response.sendError(404)
            return
        }
        airportImage.delete()

        new File(grailsApplication.config.image_store_direction + "/" + airportImage.name).delete()
        new File(grailsApplication.config.image_store_direction + "/m_" + airportImage.name).delete()
        new File(grailsApplication.config.image_store_direction + "/t_" + airportImage.name).delete()

        response.sendError 204
    }

    @Secured("ROLE_ADMIN")
    def saveImage() {
        def id = params.long("id")
        if (!id) {
            response.sendError(404)
            return
        }

        def airport = Airport.get(id)
        if (!airport) {
            response.sendError(403)
            return
        }

        def uploadedImageFile = params.img

        // save original image
        def imageFileName = RandomStringUtils.randomAlphanumeric(10) + "_" + uploadedImageFile.originalFilename
        def imageStoragePath = grailsApplication.config.image_store_direction;
        def imageFilePath = imageStoragePath + "/" + imageFileName

        def imageFile = new File(imageFilePath)
        uploadedImageFile.transferTo(imageFile)

        // save thumbnail and mid size copy of original image
        def imageThumbFilePath = "$imageStoragePath/t_$imageFileName";
        def imageMidFilePath = "$imageStoragePath/m_$imageFileName";
        File imageThumbFile = new File(imageThumbFilePath)
        File imageMidFile = new File(imageMidFilePath)

        def imageIn = ImageIO.read(imageFile);
        BufferedImage scaledImageThumb = Scalr.resize(imageIn, 200, 120);
        ImageIO.write(scaledImageThumb, "jpg", imageThumbFile)
        BufferedImage scaledImageMid = Scalr.resize(imageIn, 600, 340);
        ImageIO.write(scaledImageMid, "jpg", imageMidFile);

        // save airport image to database
        def airportImage = new AirportImage();
        airportImage.airport = airport
        airportImage.name = imageFileName

        if (!airportImage.save(flush: true)) {
            response.sendError 400
        }

        render([id: airportImage.id,
                thumb: createLink(controller: "image", action: "getThumbImage", id: airportImage.id)] as JSON)
    }
}
