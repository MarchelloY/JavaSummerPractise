<#import "paths/common.ftl" as c>

<@c.page>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Название комнаты</th>
            <th scope="col">Дата создания</th>
            <th scope="col">Создатель комнаты</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list rooms as room>
        <tr>
            <th scope="row">${room.id}</th>
            <td>${room.name}</td>
            <td>${room.date}</td>
            <td>${room.author}</td>
            <td><a href="/rooms/${room.id}" class="btn btn-outline-primary" role="button" aria-pressed="true">Играть</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</@c.page>