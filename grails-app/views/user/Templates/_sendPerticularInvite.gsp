<div class="modal fade" id="sendPerticularInvite${topic.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Send Invitation</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="sendInvite" controller="user">
                    <div class="mb-3 d-flex ">
                        <label for="recipient-name" class="col-form-label me-5">Email: </label>
                        <input type="text" class="form-control " name="email" id="recipient-name">
                    </div>

                    <div class="mb-3 d-flex justify-content-between">
                        <label for="message-text" class="col-form-label me-5">Topic:</label>
                        <select class="form-select" name="topic" aria-label="Default select example">
                            <option selected default value=${topic.id}>${topic.name} </option>

                        </select>
                    </div>
                    <div class="modal-footer">
                        <g:actionSubmit   class="btn btn-primary"   value="submit" action="sendInvite">
                            Invite
                        </g:actionSubmit>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </g:form>
            %{--                <form onsubmit="sendInviteHandler()">--}%
            %{--                    <div class="mb-3 d-flex ">--}%
            %{--                        <label for="recipient-name" class="col-form-label me-5">Email: </label>--}%
            %{--                        <input type="text" class="form-control " name="email" id="recipient-name">--}%
            %{--                    </div>--}%

            %{--                    <div class="mb-3 d-flex justify-content-between">--}%
            %{--                        <label for="message-text" class="col-form-label me-5">Topic:</label>--}%
            %{--                        <select class="form-select" name="topic" aria-label="Default select example">--}%
            %{--                            <option selected>Topics</option>--}%
            %{--                            <g:each var="topic" in="${topics}">--}%
            %{--                                <option value=${topic.id}>${topic.name}</option>--}%
            %{--                            </g:each>--}%
            %{--                        </select>--}%
            %{--                    </div>--}%
            %{--                    <div class="modal-footer">--}%
            %{--                        <button  class="btn btn-primary"  type="submit" value="submit" action="create">--}%
            %{--                            Invite--}%
            %{--                        </button>--}%
            %{--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>--}%
            %{--                    </div>--}%
            %{--                </form>--}%
            </div>

        </div>
    </div>
</div>