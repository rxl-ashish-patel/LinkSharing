<table id="topPosts" class="table table-striped display my-1 border rounded" style="width:100%">
    <thead>
    <tr class="bg-secondary">
        <th>
            <div class="d-flex justify-content-sm-between">
                <h6>Top Posts:</h6>
            </div>
        </th>
    </tr>
    </thead>
    <tbody >
    <g:each var="post" in="${topPosts.collect { it[1] }}">
        <tr><td>
            <g:render template="/user/Templates/postTemplate" model="[post:post]"/>
        </td></tr>
    </g:each>
    </tbody>
</table>
<script>
    $(document).ready(function (){
    })
</script>