<div class="modal fade" id="createTopic" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Create Topic</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form onsubmit="createTopic('${user.id}')">
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name " class="col-form-label me-5">Topic: </label>
                        <input type="text" class="form-control" name="name"  id="topic">
                    </div>
%{--                    <g:hiddenField name="createdBy" value="${session.currentUser}" />--}%
                    <div class="mb-3 d-flex justify-content-between">
                        <label for="message-text" class="col-form-label me-5">Visibility:</label>
                        <select class="form-select rounded" name="visibility" aria-label="Default select example">
                            <option selected value="PUBLIC">Public</option>
                            <option value="PRIVATE">Private</option>
                        </select>
                    </div>
                    <div class="modal-footer">

                        <button type="submit" class="btn btn-primary">Save </button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>