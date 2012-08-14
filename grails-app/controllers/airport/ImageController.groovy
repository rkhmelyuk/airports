package airport

class ImageController {

    def getImage() {
        renderImage("")
    }

    def getThumbImage() {
        renderImage("t_")
    }

    def getMidImage() {
        renderImage("m_")
    }

    private def renderImage(String type) {
        def image = AirportImage.get(params.id)
        if (!image) {
            response.sendError 404
            return
        }
        def imagePath = grailsApplication.config.image_store_direction + "/" + type + image.name;
        def content = new FileInputStream(imagePath)
        response.outputStream << content
        response.flushBuffer()
        content.close()
    }
}

