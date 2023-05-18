<table id="inboxItemsTable" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>Inbox:</th>
        <th>search</th>
    </tr>

    </thead>
    <tbody >
    <g:each var="readingItem" in="${user.readingItems.findAll { it.isRead == false }}">
        <tr id="${readingItem.id}">
            <td>
                <g:render template="/user/Templates/inboxTemplate" model="[resourc:readingItem.resource,user:user,isSuscribed:true]"/>
            </td>
            <td >
                <div>
                    <p>${readingItem.resource.topic.name}</p>
                    <p>${readingItem.resource.createdBy.firstName}</p>
                    <p>${readingItem.resource.createdBy.username}</p>
                    <p>${readingItem.resource.description}</p>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>