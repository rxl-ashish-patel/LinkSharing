<table id="example" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>Id</th>
        <th>Topicname</th>
        <th>CreatedBy</th>
        <th>DateCreated</th>
        <th>LastUpdated</th>
        <th>Posts</th>
    </tr>
    </thead>
    <tbody >
    <g:each var="topic" in="${topics}">
        <tr id="${topic.id}">
            <td>${topic.id}</td>
            <td>${topic.name}</td>
            <td>${topic.createdBy.firstName}</td>
            <td>${topic.dateCreated}</td>
            <td>${topic.lastUpdated}</td>
            <td>${topic.resources.size()}</td>

        </tr>
    </g:each>

    </tbody>
</table>
<script>
    $(document).ready(function (){
        $("#example").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 20,

        })
    })
</script>