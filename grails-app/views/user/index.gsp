<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index'],javascript:['searchPageHandler']]"/>

<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate" model="[icons: [],user:null]"/>
</div>
<g:if test="${flash?.params}">
    <div id="message" class="alert alert-${flash.params.code}  bg-${flash.params.code} alert-dismissible fade show"
         role="alert">
        ${flash.params.message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>
<div>
    <div id="validationError">
        <g:hasErrors bean="${this.user}">
            <ul class="errors alert alert-danger " role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
    </div>
    %{--    <g:eachError var="error" in="${errors}">--}%
    %{--        <div class="alert alert-danger">${error}</div>--}%
    %{--    </g:eachError>--}%
</div>

<div class="container-fluid p-4">

    <div class="row">
        <div class="container col-sm-7">
            <table id="recentShares" class="table table-striped display my-1 border rounded" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>
                        Recent Shares:
                    </th>
                </tr>
                </thead>
                <tbody>
                <g:each var="recentShare" in="${recentShares}">
                    <tr><td>
                        <g:render template="Templates/postTemplate" model="[post: recentShare]"/>
                    </td></tr>
                </g:each>
                </tbody>
            </table>

            <table id="topPosts" class="table table-striped display my-1 border rounded" style="width:100%">
%{--                                <thead>--}%
%{--                                <tr class="bg-secondary">--}%
%{--                                    <th>--}%
%{--                                        <div class="d-flex justify-content-sm-between">--}%
%{--                                            <h6>Top Posts:</h6>--}%
%{--                                        </div>--}%
%{--                                    </th>--}%
%{--                                </tr>--}%
%{--                                </thead>--}%
                <tbody >
                     <g:each var="post" in="${topPosts.collect { it[1] }}">
                         <tr><td>
                         <g:render template="Templates/postTemplate" model="[post:post]"/>
                         </td></tr>
                     </g:each>
                </tbody>
            </table>

        </div>

        <div class="container col-sm-5">
            <g:render template="Templates/loginTemplate"/>
            <g:render template="Templates/registerTemplate"/>

        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {

        setTimeout(function () {
            $("#message").hide();
            $("#validationError").hide();
        }, 2000);
        setTimeout(function () {
            $("#validationError").hide();
        }, 5000);

        $("#topPosts").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })
        $("#recentShares").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })
    })
</g:javascript>

</body>

</html>