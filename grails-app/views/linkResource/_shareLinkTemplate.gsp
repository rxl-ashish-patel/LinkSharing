<div class="modal fade" id="shareLink" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Share Document</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:uploadForm controller="linkResource" action="create" >
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name" class="col-form-label me-5">Link: </label>
                        <input type="text" class="form-control " name="url" id="recipient-name">
                    </div>
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name" class="col-form-label me-5">Description: </label>
                        <input type="textarea" class="form-control" name="description" id="recipient-name">
                    </div>
                    <div class="mb-3 d-flex justify-content-between">
                        <g:hiddenField name="createdBy" value="${user.id}"/>
                        <label for="message-text" class="col-form-label me-5">Topic:</label>
                        <select class="form-select" name="topic" aria-label="Default select example">
                            <option selected>Topics</option>
                            <g:each var="topic" in="${topics}">
                                <option value="${topic.id}">${topic.name}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <g:actionSubmit   class="btn btn-primary"   value="submit" action="create">
                            Register
                        </g:actionSubmit>
                        %{--                        <button type="button" class="btn btn-primary">Invite </button>--}%
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </g:uploadForm>
            </div>

        </div>
    </div>
</div>