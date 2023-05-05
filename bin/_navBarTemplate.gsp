 <nav class="navbar navbar-light bg-light justify-content-between">
        <a class="navbar-brand" style="padding-left: 20px;color:blue;cursor: pointer;">Navbar</a>
        <div class="d-flex flex-row-reverse">
            <div class="p-1">
                <g:each in="${icons}" var="icon" >
                    <g:if test="${icon == 'down'}">
                        <div class="dropstart d-inline-flex">
                            <a data-bs-toggle="dropdown" aria-expanded="false"><img src="${resource(dir:"images",file:"${icon}.svg")}"/></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>

                    </g:if>
                    <g:else>
                        <g:if test="${icon in ['mail','link','topic']}">
                            <a data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="${icon}"><img src="${resource(dir:"images",file:"${icon}.svg")}"/></a>
                        </g:if>
                        <g:else>
                            <a><img src="${resource(dir:"images",file:"${icon}.svg")}"/></a>

                        </g:else>
                    </g:else>

                </g:each>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Message:</label>
                                        <textarea class="form-control" id="message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Send message</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form class="form-inline">
                <div class="NavBar">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0 rounded" type="submit">Search</button>
                </div>
            </form>

        </div>
    </nav>