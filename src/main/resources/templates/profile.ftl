<#import "paths/common.ftl" as c>

<#assign user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
         username = user.getUsername()
         name = user.getName()
         surname = user.getSurname()
         date = user.getDate()
>

<@c.page>
    <div style="text-align: center;" class="form-log bg-white shadow-sm mb-4">
        <h3 class="text-primary">Профиль: </h3>
        <div><b>Имя пользователя:</b> ${username}</div>
        <div><b>Имя:</b> ${name}</div>
        <div><b>Фамилия:</b> ${surname}</div>
        <div><b>Дата регистрации:</b> ${date}</div>
    </div>
    <div style="text-align: center;" class="form-log bg-white shadow-sm mb-4">
        <h3 class="text-primary">Статистика: </h3>
        <div><b>Количество побед: ${wins}</b> </div>
        <div><b>Количество поражений: ${loses}</b> </div>
        <div><b>Винрейт: <#if (wins+loses) != 0>${((wins*100)/(wins+loses))?int}<#else>0</#if>%</b> </div>
    </div>
</@c.page>