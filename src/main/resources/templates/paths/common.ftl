<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>BlackJack</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
        <style type="text/css">
            * {margin: 0; padding: 0;}
            html, body {height: 100%;}
            .wrapper {display: flex; flex-direction: column; height: 100%;}
            .content {flex: 1 0 auto;}
            .footer {flex: 0 0 auto;}
            .form-log {width: 100%; max-width: 600px; padding: 15px; margin: auto;}
        </style>
        <script language="javascript">
            //Иницилизация куков если они еще не были определены!!!
            if($.cookie('theme') == null){$.cookie('theme', 'dark')}
            $(function(){
                //Изменение куков на выбранную тему и мгновенная подгрузка
                $('.switchTheme').click(function(){
                    $.cookie('theme', $(this).attr('id'));
                    $('.theme').each(function(){
                        if($.cookie('theme') === "secondary") {
                            $(this).addClass('bg-secondary').removeClass('bg-dark');
                        }
                        if($.cookie('theme') === "dark") {
                            $(this).addClass('bg-dark').removeClass('bg-secondary');
                        }
                    });
                });
                //Подгрузка нужной темы из куков при запуске страницы
                $('.theme').each(function(){
                    if($.cookie('theme') === "secondary" && !$(this).hasClass("bg-secondary")) {
                        $(this).addClass('bg-secondary');
                    }
                    if($.cookie('theme') === "dark" && !$(this).hasClass("bg-dark")) {
                        $(this).addClass('bg-dark');
                    }
                });
            });
        </script>
    </head>
    <body>
    <!--Navbar-->
    <div class="wrapper">
    <#include "navbar.ftl">
    <!--Content-->
        <div class="content">
            <div class="container shadow pb-4 pt-3 bg-light" style="height: 100%;">
                <#nested>
            </div>
        </div>
        <div class="footer theme">
            <div class="text-center text-light">© 2019 Marchello</div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>