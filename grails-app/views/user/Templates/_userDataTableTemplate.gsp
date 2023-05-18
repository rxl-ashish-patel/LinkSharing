<table id="example" class="table table-striped display" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>Id</th>
        <th>Username</th>
        <th>Email</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Active</th>
        <th>Manage</th>
    </tr>
    </thead>
    <tbody >
    <g:each var="user" in="${users}">
        <g:render template="/user/Templates/userTableRow" model="[user:user]"/>
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