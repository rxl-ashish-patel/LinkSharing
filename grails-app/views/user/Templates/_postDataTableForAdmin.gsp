<table id="example" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>ResourceId</th>
        <th>Description</th>
        <th>Topic</th>
        <th>CreatedBy</th>

        <th>DateCreated</th>

    </tr>
    </thead>
    <tbody >
    <g:each var="post" in="${posts}">
        <tr id="${post.id}">
            <td>${post.id}</td>
            <td>${post.description}</td>
            <td>${post.topic.name}</td>
            <td>${post.createdBy.firstName}</td>
            <td>${post.dateCreated}</td>

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