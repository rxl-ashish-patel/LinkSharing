<tr id="${user.id}">
    <td>${user.id}</td>
    <td>${user.username}</td>
    <td>${user.email}</td>
    <td>${user.firstName}</td>
    <td>${user.lastName}</td>
    <td>${user.active?'Yes':'No'}</td>
    <g:if test="${user.admin}">
        <td>No Operation Allowed</td>
    </g:if>
    <g:else>
        <td onclick="userStatusUpdateHandler(${user.id},${!user.active})"><button>${user.active ?'Deactivate':'Activate'}</button></td>
    </g:else>

</tr>