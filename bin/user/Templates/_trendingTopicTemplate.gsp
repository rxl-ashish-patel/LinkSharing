<div class="card p-1 bg-success bg-opacity-50 topic">
    <div class="container-fluid">
        <div class="row d-flex align-items-center">
            <div class="col-sm-2 ">
                <img class="card-img-top userImageSmall"
                     src="${resource(dir: 'images', file: "${topic.createdBy.photo?:'user.svg'}")}" alt="Card image cap">
            </div>

            <div class="col-sm-1"></div>

            <div class="col-sm-8">
                <div class="card-block">
                    <a href="${createLink(controller: 'topic', action: 'show', params: [topic: topic.id,isSuscribed:((topic.subscriptions*.user).find{it==user})])}" target="_blank"><h4
                            class="card-title" id="${topic.id}${user.id}">${topic.name}</h4></a>
                </div>

                <div class="card-block d-flex">
                    <p class="col-sm-4">@${topic.createdBy.username}</p>

                    <p class="col-sm-6">subscriptions</p>

                    <p class="col-sm-2">posts</p>
                </div>

                <div class="card-block d-flex">
                    <g:if test="${user in topic.subscriptions*.user}">
                        <g:if test="${topic.createdBy!=user}">
                            <a href="${createLink(controller: 'subscription', action: 'delete', params: [topic: topic.id, user: user.id])}"
                               class="card-link col-sm-6">UnSuscribe</a>
                        </g:if>
                        <g:else>
                            <a class="col-sm-6"></a>
                        </g:else>

                    </g:if>
                    <g:else>
                        <a href="${createLink(controller: 'subscription', action: 'create', params: [topic: topic.id, user: user.id, seriousness: "VERY_SERIOUS"])}"
                           class="card-link col-sm-6">Suscribe</a>
                    </g:else>
                    <a href="#"
                       class="card-link col-sm-3">${topic.subscriptions.size()}</a>
                    <a href="#" class="card-link col-sm-3">${topic.resources.size()}</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="d-inline-flex justify-content-end">
                <g:if test="${user in topic.subscriptions*.user}">
                    <g:select id="${topic.id +'-'+ user.id}" name="seriousness" class="updateSeriousness" from="${linksharing.Seriousness.values()}" value="${topic.subscriptions.find{it.user==user}.seriousness}" />
                </g:if>
                <g:if test="${user.admin || topic.createdBy == user}">
                    <g:select id="${topic.id}" class="updateVisibility" name="visibility" from="${linksharing.Visibility.values()}" value="${topic.visibility}"/>
                    <button onclick="editButton(${topic.id},${user.id})"><img  src="${resource(dir: "images", file: "edit.svg")}"/></button>
                    <a class=""
                       href="${createLink(controller: 'topic', action: 'delete', id: topic.id)}"><img
                            src="${resource(dir: "images", file: "delete.svg")}"/></a>
                    <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                       data-bs-whatever="sendInvite"><img
                            src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                    <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                       data-bs-whatever="sendInvite"><img
                            src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                </g:if>

            </div>

        </div>
    </div>
</div>