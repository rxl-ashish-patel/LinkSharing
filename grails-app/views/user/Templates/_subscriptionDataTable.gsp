<table id="SubscriptionsTable" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>
            <div class="d-flex justify-content-sm-between"><h6>Subscriptions:</h6>
                <a href="">View All</a>
            </div>
        </th>
    </tr>
    </thead>
    <tbody >
    <g:each var="topic" in="${subscriptionsByLatestPost}">
        <tr><td>
            <g:render template="/user/Templates/subscriptionsTemplate" model="[topic:topic,user:user]"/>
        </td></tr>
    </g:each>
    </tbody>
</table>