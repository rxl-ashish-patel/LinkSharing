<table id="trendingTopicsTable" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>Trending Topics:</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="topic" in="${trendingTopics}">
        <tr><td>
            <g:render template="Templates/trendingTopicTemplate" model="[topic: topic, user: user]"/>
        </td></tr>
    </g:each>
    </tbody>
</table>