*** Settings ***
Library     SeleniumLibrary     #importing selenium library
#Library     BuiltIn

*** Variables ***
${Browser}  Chrome          #setting up browser to chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

*** Keywords ***
Prepare test envirnment
    Open Browser  ${URL}  ${Browser}

Cleanup test environment
    Close Browser

Go to login form
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет

Сlick and check for incorrectness login
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!

Go to registration form
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация

Сlick and check for incorrectness registration
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Element Should Contain  css=tr:nth-child(1) > td.simplecheckout-customer-right > span  Ошибка в адресе электронной почты
    Element Should Contain  css=tr:nth-child(2) > td.simplecheckout-customer-right > span  В пароле должно быть от 4 до 20 символов!
    Element Should Contain  css=tr:nth-child(3) > td.simplecheckout-customer-right > span  Имя должно быть от 1 до 30 символов
    Element Should Contain  css=tr:nth-child(4) > td.simplecheckout-customer-right > span  Телефон должен быть в формате +38(0xx)xxx-xx-xx

