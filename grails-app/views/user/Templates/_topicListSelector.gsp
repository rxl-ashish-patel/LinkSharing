<select class="form-select" name="topic" aria-label="Default select example">
    <option selected>Topics</option>
    <g:each var="topic" in="${topics}">
        <option value="${topic.id}">${topic.name}</option>
    </g:each>
</select>