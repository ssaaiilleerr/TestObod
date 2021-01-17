*** Settings ***
Library     SeleniumLibrary     #importing selenium library
Library     BuiltIn

*** Variables ***
${Browser}  Chrome          #setting up browser to chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

*** Keywords ***

Prepare test envirnment
    Open Browser  ${URL}  ${Browser}

Cleanup test environment
    Close Browser

Login user          #Input in the login form valid data
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}                   #Input email from file 'RunTestsOBOD.robot'
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}       #Input password from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Login user.png

Login blank         #Leave fields email and password blank
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/Login blank.png

Login email blank           #Leave blank email field with the correct password
    [Arguments]  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}       #Input password from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/Login email blank.png

Login password blank            #Leave blank password field with the correct email
    [Arguments]  ${ValidLoginEmail}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}                   #Input email from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/Login password blank.png

Login incorect password             #Enter correct mail and incorect password.
    [Arguments]  ${ValidLoginEmail}  ${InValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}                       #Input email from file 'RunTestsOBOD.robot'
    Input Password  css= input[type=password]:nth-child(5)  ${InValidLoginPassword}         #Input invalid password from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/Login incorect password.png

Login incorect email            #Enter incorrect mail, but the corect password.
    [Arguments]  ${InValidLoginEmail}  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${InValidLoginEmail}                     #Input invalid email from file 'RunTestsOBOD.robot'
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}           #Input password from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/Login incorect email.png

login line replacement          #Enter the correct password in the mail feild, and enter the correct mail in the password field
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginPassword}                    #Input password on email
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginEmail}              #Input email on password
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/login line replacement .png

login system code on email      #Login with system code in email and correct password
    [Arguments]  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  <script>alert</script>             #Input system code on email
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}       #Input password from file 'RunTestsOBOD.robot'
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/login system code on email.png

login go back and come back                #Enter correct mail and corect password. Click on the "Go back" button in the browser
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}                   #Input email from file 'RunTestsOBOD.robot'
    Input Password  css=input[type=password]:nth-child(5)  ${ValidLoginPassword}       #Input password from file 'RunTestsOBOD.robot'
    Go Back
    Element Should Contain  css=#content > h1  Веломагазин Хмельницкий
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
#    Element Should Not Contain  ${ValidLoginEmail}  css=div > div > input[type=text]:nth-child(3)           #Check if the email field is empty
#    Element Text Should Not Be  ${ValidLoginPassword}  css=div > div > input[type=password]:nth-child(5)    #Check if the password field is empty
    Click Element  css=form >div > button
    Element Should Contain  css=#container > div.warning  Неправильно заполнены поля E-Mail и/или пароль!
    Capture Page Screenshot	 scrn/login go back and come back.png




Reg user            #Entering valid data in the registration form
    [Arguments]  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Input Text  css=#registration_main_email  ${RegisterEmailRandValid}
    Input Password  css= input[type=password]  ${ValidRegisterPassword}
    Input Text  css=#registration_main_firstname  ${ValidRegisterName}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Reg user.png


Reg blank       #Leave all fields blank
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Element Should Contain  css=tr:nth-child(1) > td.simplecheckout-customer-right > span  Ошибка в адресе электронной почты
    Element Should Contain  css=tr:nth-child(2) > td.simplecheckout-customer-right > span  В пароле должно быть от 4 до 20 символов!
    Element Should Contain  css=tr:nth-child(3) > td.simplecheckout-customer-right > span  Имя должно быть от 1 до 30 символов
    Element Should Contain  css=tr:nth-child(4) > td.simplecheckout-customer-right > span  Телефон должен быть в формате +38(0xx)xxx-xx-xx
    Capture Page Screenshot	 scrn/Reg blank.png

Reg spaces      #Login with spaces in the field
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Input Text  css=#registration_main_email  ${Space * 5}
    Input Password  css= input[type=password]  ${Space * 5}
    Input Text  css=#registration_main_firstname  ${Space * 5}
#   Press Keys  css=#registration_main_telephone  680000000
    Press Keys  css=#registration_main_telephone  ${Space * 5}
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain  css=tr:nth-child(1) > td.simplecheckout-customer-right > span  Ошибка в адресе электронной почты
    Element Should Contain  css=tr:nth-child(2) > td.simplecheckout-customer-right > span  В пароле должно быть от 4 до 20 символов!
    Element Should Contain  css=tr:nth-child(3) > td.simplecheckout-customer-right > span  Имя должно быть от 1 до 30 символов
    Element Should Contain  css=tr:nth-child(4) > td.simplecheckout-customer-right > span  Телефон должен быть в формате +38(0xx)xxx-xx-xx
    Capture Page Screenshot	 scrn/Reg spaces.png

Reg spaces and valid data       #Login with spaces and valid data in the field
    [Arguments]  ${SpcEmail}  ${SpcPassword}  ${SpcName}  ${ValidRegisterTelephone}  #${SpcTelephone}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Input Text  css=#registration_main_email  ${SpcEmail}
    Input Password  css= input[type=password]  ${SpcPassword}
    Input Text  css=#registration_main_firstname  ${SpcName}
    #Press Keys  css=#registration_main_telephone  ${SpcTelephone}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Capture Page Screenshot	 scrn/Reg spaces and valid data1.png
    Click Element  css=#simpleregister > div > div > a > span
#    Element Should Contain  css=tr:nth-child(1) > td.simplecheckout-customer-right > span  Ошибка в адресе электронной почты
#    Element Should Contain  css=tr:nth-child(2) > td.simplecheckout-customer-right > span  В пароле должно быть от 4 до 20 символов!
#    Element Should Contain  css=tr:nth-child(3) > td.simplecheckout-customer-right > span  Имя должно быть от 1 до 30 символов
#    Element Should Contain  css=tr:nth-child(4) > td.simplecheckout-customer-right > span  Телефон должен быть в формате +38(0xx)xxx-xx-xx
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Reg spaces and valid data2.png

Reg go back and come back       #Entering valid data in the registration form go out and come back
    [Arguments]  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Element  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Input Text  css=#registration_main_email  ${RegisterEmailRandValid}
    Input Password  css= input[type=password]  ${ValidRegisterPassword}
    Input Text  css=#registration_main_firstname  ${ValidRegisterName}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Go Back
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Link  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain  css=tr:nth-child(1) > td.simplecheckout-customer-right > span  Ошибка в адресе электронной почты
    Element Should Contain  css=tr:nth-child(2) > td.simplecheckout-customer-right > span  В пароле должно быть от 4 до 20 символов!
    Element Should Contain  css=tr:nth-child(3) > td.simplecheckout-customer-right > span  Имя должно быть от 1 до 30 символов
    Element Should Contain  css=tr:nth-child(4) > td.simplecheckout-customer-right > span  Телефон должен быть в формате +38(0xx)xxx-xx-xx
    Capture Page Screenshot  scrn/Reg go back and come back.png
