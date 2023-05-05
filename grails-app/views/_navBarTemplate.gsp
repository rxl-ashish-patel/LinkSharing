<nav class="navbar navbar-light bg-light justify-content-between">
    <a class="navbar-brand" style="padding-left: 20px;color:blue;cursor: pointer;">Navbar</a>

    <div class="d-flex flex-row-reverse">
        <div class="p-1">
            <g:each in="${icons}" var="icon">
                <g:if test="${icon == 'down'}">
                    <div class="dropstart d-inline-flex">
                        <a data-bs-toggle="dropdown" aria-expanded="false"><img
                                src="${resource(dir: "images", file: "${icon}.svg")}"/></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </div>

                </g:if>
                <g:else>
                        <a data-bs-toggle="modal" data-bs-target="#${icon}" data-bs-whatever="${icon}"><img
                                src="${resource(dir: "images", file: "${icon}.svg")}"/></a>

                </g:else>

            </g:each>


        </div>
        <form class="form-inline">
            <div class="NavBar">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0 rounded" type="submit">Search</button>
            </div>
        </form>

    </div>
</nav>