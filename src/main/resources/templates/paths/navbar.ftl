<#import "login.ftl" as l>

<#assign known = Session.SPRING_SECURITY_CONTEXT??>

<#if known>
    <#assign user = Session.SPRING_SECURITY_CONTEXT.authentication.principal>
</#if>

<nav class="navbar navbar-expand-lg navbar-dark theme">
    <div class="container">
        <a class="navbar-brand" href="/">BlackJack</a>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Главная</a>
                </li>
                <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/create">Создать комнату</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/rooms">Просмотреть комнаты</a>
                </li>
                </#if>
            </ul>
            <ul class="navbar-nav navbar-right">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarTheme" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Тема</a>
                    <div class="dropdown-menu" aria-labelledby="navbarTheme">
                        <a class="dropdown-item switchTheme" id="secondary">Серая</a>
                        <a class="dropdown-item switchTheme" id="dark">Темная</a>
                    </div>
                </li>
                <#if user??>
                <li class="nav-item active">
                    <a class="nav-link" href="/profile">Личный кабинет</a>
                </li>
                </#if>
                <@l.logout/>
            </ul>
        </div>
    </div>
</nav>