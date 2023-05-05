<div class="modal fade" id="shareDocument" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Share Document</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name" class="col-form-label">Email: </label>
                        <input type="text" class="form-control " id="recipient-name">
                    </div>
                    <div class="mb-3 d-flex justify-content-between">
                        <label for="message-text" class="col-form-label">Topic:</label>
                        <div class="dropdown " >
                            <button class="btn btn-secondary  ps-xl-5 pe-xl-5 " type="button">
                                <h4>   &nbsp;&nbsp;&nbsp;&nbsp; Topic &nbsp;&nbsp;&nbsp;&nbsp;  </h4>
                            </button>
                            <button type="button" class="btn btn-lg btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropdown</span>
                            </button>

                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>
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