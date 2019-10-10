<#import "paths/common.ftl" as c>

<@c.page>
    <div style="text-align: center;" class="form-log bg-white shadow-sm mb-4">
        <h3 class="text-primary">Создание комнаты: </h3>
    </div>

    <form action="/create" method="post" class="form-log form-inline bg-white shadow-sm">
        <div class="form-group w-75">
            <label for="createLul"></label>
            <input type="text" class="form-control w-100" id="createLul" placeholder="Введите название комнаты*" name="name" aria-describedby="helpBlock">
            <small id="helpBlock" class="form-text text-muted">Ваша комната автоматически появится в списке всех комнат.</small>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group w-25 pl-3">
            <button type="submit" class="btn btn-primary btn-block">Создать</button>
        </div>
    </form>
</@c.page>