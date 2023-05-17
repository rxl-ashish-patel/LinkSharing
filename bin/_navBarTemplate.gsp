<nav class="navbar navbar-light bg-light justify-content-between">
    <a class="navbar-brand" style="padding-left: 20px;color:blue;cursor: pointer;">Navbar</a>

    <div class="d-flex flex-row-reverse">
        <div class="p-1">
            <g:each in="${icons}" var="icon">
                <g:if test="${icon == 'down'}">
                    <div class="dropstart d-inline-flex">
                        ${user.firstName}
                        <a data-bs-toggle="dropdown" aria-expanded="false"><img
                                src="${resource(dir: "images", file: "${icon}.svg")}"/></a>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${createLink(controller:'user',action:'profileUpdate',params:[userId:user.id])}" target="_blank">profile</a></li>
                            <g:if test="${user.admin==true}" >
                                <li><a class="dropdown-item" href="${createLink(controller:'user',action:'userTableForAdmin',params:[userTypes:"all"])}" target="_blank">Users</a></li>
                                <li><a class="dropdown-item" href="${createLink(controller:'user',action:'userTableForAdmin')}" target="_blank">Topics</a></li>
                                <li><a class="dropdown-item" href="#">Posts</a></li>
                            </g:if>
                            <li><a class="dropdown-item" href="/user/logout">Logout</a></li>

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
            <div class="NavBar d-inline-flex">
                <input class="form-control " style="width: 100px;height: 30px" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success rounded" style="height: 30px" type="submit">Search</button>
            </div>
        </form>

    </div>
</nav>