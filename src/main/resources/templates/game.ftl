<#import "paths/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row">
            <#list 1..7 as x>
                <div class="col-sm">
                    <#if x < sizePC>
                        <#if flag>
                            <img style="width:125px;" src="${cardsPC[x-1].url}" alt="card">
                            <#else>
                            <img style="width:125px;" src="https://i.ibb.co/rMKncpg/back-blue.png" alt="card">
                        </#if>
                    </#if>
                </div>
            </#list>
        </div>
        <#if !flag>
        <div class="row mt-1">
            <div class="col-sm text-right">
                <form action="/rooms/${numRoom}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary mt-4" type="submit">Взять карту!</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="/rooms/${numRoom}/result"  method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary mt-4" type="submit">Закончить!</button>
                </form>
            </div>
        </div>
        </#if>
        <br>
        <div class="text-center">Ваш счет: ${result}<#if flag> | Счет ИИ: ${resultPC}</#if></div>
        <#if winlose == -1></#if>
        <#if winlose == 0><br><div class="text-center text-danger mb-4">ВЫ ПРОИГРАЛИ!</div></#if>
        <#if winlose == 1><br><div class="text-center text-success mb-4">ВЫ ВЫИГРАЛИ!</div></#if>
        <#if winlose == 2><br><div class="text-center text-primary mb-4">НИЧЬЯ!</div></#if>
        <div class="row mt-1">
            <#list 1..7 as y>
                <div class="col-sm">
                    <#if size??>
                        <#if y < size>
                            <img style="width:125px;" src="${cards[y-1].url}" alt="card">
                        </#if>
                    </#if>
                </div>
            </#list>
        </div>
    </div>
</@c.page>