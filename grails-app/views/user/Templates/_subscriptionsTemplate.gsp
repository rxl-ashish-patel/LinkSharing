<div class="card p-1 bg-success bg-opacity-10 ">
    <div class="container-fluid">
        <div class="row d-flex align-items-center">
            <div class="col-sm-2 ">
                <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}"
                   target="_blank">
                <img class="card-img-top userImageSmall"
                     src="${resource(dir: 'images', file: "${topic.createdBy.photo?:'user.svg'}")}" alt="Card image cap">
                </a>
            </div>

            <div class="col-sm-1"></div>

            <div class="col-sm-8">
                <div class="card-block d-inline-flex">
                    <a href="${createLink(controller: 'topic', action: 'show', params:[topic: topic.id,isSuscribed:( user in (topic.subscriptions*.user))])}" target="_blank">
                        <h4  id="hs${topic.id}" >
                            ${topic.name}
                        </h4>
                    </a>
                        <form id="ds${topic.id}" style="display: none"   onsubmit="changeTopicName('${topic.id}')">
                            <input type="text" name="name" class="form-control"/>
                            <button type="submit" >save</button>
                            <button type="button" onclick="revertChange('${topic.id}','s')">cancel</button>
                         </form>

                </div>

                <div class="card-block d-flex">
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}"
                       target="_blank" class="col-sm-4">
                        <p >@${topic.createdBy.username}</p>
                    </a>

                    <p class="col-sm-6">subscriptions</p>

                    <p class="col-sm-2">posts</p>
                </div>

                <div class="card-block d-flex">
                    <g:if test="${topic.createdBy!=user}">
                        <a href="${createLink(controller: 'subscription', action: 'delete', params: [topic: topic.id, user: user.id])}"
                           class="card-link col-sm-6">UnSuscribe</a>
                    </g:if>
                    <g:else>
                        <a class="col-sm-6"></a>
                    </g:else>
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}"
                       target="_blank"
                       class="card-link col-sm-3">${topic.subscriptions.size()}</a>
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}"
                       target="_blank" class="card-link col-sm-3">${topic.resources.size()}</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="d-inline-flex justify-content-end">
                <g:select id="${topic.id +'-'+ user.id}" name="seriousness" class="updateSeriousness" from="${linksharing.Seriousness.values()}" value="${topic.subscriptions.find{it.user==user}.seriousness}" />
                <g:if test="${user.admin || topic.createdBy == user}">
                    <g:select id="${topic.id}" class="updateVisibility" name="visibility" from="${linksharing.Visibility.values()}" value="${topic.visibility}"/>
                    <img onclick="showEditTextarea('${topic.id}','s')" src="${resource(dir: "images", file: "edit.svg")}"/>
                    <a class=""
                       href="${createLink(controller: 'topic', action: 'delete', id: topic.id)}"><img
                            src="${resource(dir: "images", file: "delete.svg")}"/></a>
                </g:if>
                <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                   data-bs-whatever="sendInvite"><img
                        src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
            </div>

        </div>
    </div>
</div>
