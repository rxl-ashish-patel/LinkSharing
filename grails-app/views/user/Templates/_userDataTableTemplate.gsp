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

        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.active}</td>
            <g:if test="${user.admin}">
                <td>No Operation Allowed</td>
            </g:if>
            <g:else>
                <td onclick="userStatusUpdateHandler(${user.id},${!user.active})"><button>${user.active ?'Deactivate':'Activate'}</button></td>
            </g:else>

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