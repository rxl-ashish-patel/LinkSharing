package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ResourceRatingController {

    ResourceRatingService resourceRatingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond resourceRatingService.list(params), model:[resourceRatingCount: resourceRatingService.count()]
    }

    def show(Long id) {
        respond resourceRatingService.get(id)
    }

    def create() {
        respond new ResourceRating(params)
    }

    def save(ResourceRating resourceRating) {
        if (resourceRating == null) {
            notFound()
            return
        }

        try {
            resourceRatingService.save(resourceRating)
        } catch (ValidationException e) {
            respond resourceRating.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'resourceRating.label', default: 'ResourceRating'), resourceRating.id])
                redirect resourceRating
            }
            '*' { respond resourceRating, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond resourceRatingService.get(id)
    }

    def update(ResourceRating resourceRating) {
        if (resourceRating == null) {
            notFound()
            return
        }

        try {
            resourceRatingService.save(resourceRating)
        } catch (ValidationException e) {
            respond resourceRating.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'resourceRating.label', default: 'ResourceRating'), resourceRating.id])
                redirect resourceRating
            }
            '*'{ respond resourceRating, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        resourceRatingService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'resourceRating.label', default: 'ResourceRating'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceRating.label', default: 'ResourceRating'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
