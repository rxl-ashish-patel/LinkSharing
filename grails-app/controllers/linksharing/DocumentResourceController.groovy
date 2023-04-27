package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class DocumentResourceController {

    DocumentResourceService documentResourceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond documentResourceService.list(params), model:[documentResourceCount: documentResourceService.count()]
    }

    def show(Long id) {
        respond documentResourceService.get(id)
    }

    def create() {
        respond new DocumentResource(params)
    }

    def save(DocumentResource documentResource) {
        if (documentResource == null) {
            notFound()
            return
        }

        try {
            documentResourceService.save(documentResource)
        } catch (ValidationException e) {
            respond documentResource.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResource.id])
                redirect documentResource
            }
            '*' { respond documentResource, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond documentResourceService.get(id)
    }

    def update(DocumentResource documentResource) {
        if (documentResource == null) {
            notFound()
            return
        }

        try {
            documentResourceService.save(documentResource)
        } catch (ValidationException e) {
            respond documentResource.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResource.id])
                redirect documentResource
            }
            '*'{ respond documentResource, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        documentResourceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
