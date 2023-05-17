<table id="${heading}" class="table table-striped display border rounded" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>${heading}</th>
    </tr>
    </thead>
    <tbody >
    <g:each var="topic" in="${topics}">

        <tr>
            <td>
            <div class="card p-1 bg-success bg-opacity-50">
                            <div class="card-block d-flex justify-content-sm-between">
                                <div class="d-inline-flex col-sm-5">
                                      <h5>${topic.name}</h5>
                                </div>
                                <div class="d-inline-flex col-sm-7">
                                    <p class="col-sm-6">subscriptions</p>
                                    <p class="col-sm-6">posts</p>
                                </div>
                            </div>

                            <div class="card-block d-flex ">
                                <div class="col-sm-5">
                                <g:if test="${currentUser in topic.subscriptions*.user}">
                                  <g:select id="${topic.id +'-'+ currentUser.id}" name="seriousness" class="updateSeriousness" from="${linksharing.Seriousness.values()}" value="${topic.subscriptions.find{it.user==currentUser}.seriousness}"/>
                                    <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                                </g:if>
                                </div>
                                <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}" target="_blank"
                                   class="card-link col-sm-4">${(topic.subscriptions).size()}</a>
                                <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: topic.createdBy.id])}" target="_blank"
                                   class="card-link col-sm-3">${topic.resources.size()}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>
<g:javascript>


</g:javascript>