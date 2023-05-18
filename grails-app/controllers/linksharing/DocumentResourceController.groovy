package linksharing

import grails.validation.ValidationException

class DocumentResourceController {

    DocumentResourceService documentResourceService
    ResourceService resourceService
    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def show(Long id) {
        respond documentResourceService.get(id)
    }

    def create() {
        def documentResource=resourceService.create(params)
        println params
        if(documentResource.hasErrors()){
            flash.params=['message':"documentResource not added ",code:'danger']
            render view: 'shareDocumentTemplate', model:[topics: userService.getUser(session.currentUser.id).subscribes*.topic, user:userService.getUser(session.currentUser.id), errors:documentResource.errors.allErrors]
            return
        }
        else {
            redirect controller: 'readingItem', action: 'addPostToSubscriberReadingItems', params: [topic: params.topic, user: params.createdBy, resource: documentResource.id]
            return
        }
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
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        documentResourceService.delete(id)
    }

}
