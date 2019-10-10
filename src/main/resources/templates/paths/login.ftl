<#assign known = Session.SPRING_SECURITY_CONTEXT??>

<#if known>
    <#assign user = Session.SPRING_SECURITY_CONTEXT.authentication.principal>
</#if>

<#macro login path isRegistrationForm>
    <form action="${path}" method="post" class="form-log bg-white shadow-sm">
        <div class="form-group">
            <label for="usernameLul">Имя пользователя: </label>
            <input type="text" class="form-control" id="usernameLul" placeholder="Введите имя пользователя*" name="username"/>
        </div>
        <#if isRegistrationForm>
        <div class="form-group">
            <label for="nameLul">Имя: </label>
            <input type="text" class="form-control" id="nameLul" placeholder="Введите имя*" name="name"/>
        </div>
        <div class="form-group">
            <label for="surnameLul">Фамилия: </label>
            <input type="text" class="form-control" id="surnameLul" placeholder="Введите фамилию*" name="surname"/>
        </div>
        </#if>
        <div class="form-group">
            <label for="passwordLul">Пароль: </label>
            <input type="password" class="form-control" id="passwordLul" placeholder="Введите пароль" name="password"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegistrationForm>
            <div class="form-group">
                <a href="/registration" class="ForgetPwd">Нету аккаунта? Нажмите сюда, чтобы создать</a>
            </div>
        </#if>
        <button type="submit" class="btn btn-primary">Подтвердить</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if user??>
            <button class="btn btn-outline-light ml-3" type="submit" role="button">Выйти</button>
        <#else>
            <button class="btn btn-outline-light ml-3" type="submit" role="button">Войти</button>
        </#if>
    </form>
</#macro>