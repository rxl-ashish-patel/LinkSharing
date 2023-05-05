<div class="modal fade" id="sendInvite" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Send Invitation</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name" class="col-form-label me-5">Email: </label>
                        <input type="text" class="form-control " id="recipient-name">
                    </div>

                    <div class="mb-3 d-flex justify-content-between">
                        <label for="message-text" class="col-form-label me-5">Topic:</label>
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Open this select menu</option>
                            <option value="P">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-primary">Invite </button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>