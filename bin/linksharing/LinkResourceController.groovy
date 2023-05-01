package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LinkResourceController {

    LinkResourceService linkResourceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond linkResourceService.list(params), model:[linkResourceCount: linkResourceService.count()]
    }

    def show(Long id) {
        respond linkResourceService.get(id)
    }

    def create() {
        respond new LinkResource(params)
    }

    def save(LinkResource linkResource) {
        if (linkResource == null) {
            notFound()
            return
        }

        try {
            linkResourceService.save(linkResource)
        } catch (ValidationException e) {
            respond linkResource.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), linkResource.id])
                redirect linkResource
            }
            '*' { respond linkResource, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond linkResourceService.get(id)
    }

    def update(LinkResource linkResource) {
        if (linkResource == null) {
            notFound()
            return
        }

        try {
            linkResourceService.save(linkResource)
        } catch (ValidationException e) {
            respond linkResource.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), linkResource.id])
                redirect linkResource
            }
            '*'{ respond linkResource, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        linkResourceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
