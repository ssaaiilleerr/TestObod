*** Settings ***
Library     SeleniumLibrary     #importing selenium library
Library     BuiltIn

*** Variables ***
${Browser}  Chrome          #setting up browser to chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

*** Keywords ***

Login user
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}
    Click Element  css=form >div > button
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Login user.png

Login with blank fields
    Go to login form
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/Login blank.png

Login with blank fields email
    [Arguments]  ${ValidLoginPassword}
    Go to login form
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/Login email blank.png

Login with blank fields password
    [Arguments]  ${ValidLoginEmail}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/Login password blank.png

Login incorect password
    [Arguments]  ${ValidLoginEmail}  ${InValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}
    Input Password  css= input[type=password]:nth-child(5)  ${InValidLoginPassword}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/Login incorect password.png

Login incorect email
    [Arguments]  ${InValidLoginEmail}  ${ValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${InValidLoginEmail}
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/Login incorect email.png

Login line replacement
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginPassword}
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginEmail}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/login line replacement .png

Login system code on email
    [Arguments]  ${ValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  <script>alert</script>
    Input Password  css= input[type=password]:nth-child(5)  ${ValidLoginPassword}
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/login system code on email.png

Login exit and return
    [Arguments]  ${ValidLoginEmail}  ${ValidLoginPassword}
    Go to login form
    Input Text  css=input[type=text]:nth-child(3)  ${ValidLoginEmail}
    Input Password  css=input[type=password]:nth-child(5)  ${ValidLoginPassword}
    Go Back
    Element Should Contain  css=#content > h1  Веломагазин Хмельницкий
    Click Link  css=div.telef > a
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=form > div > div > p  Войти в Личный Кабинет
    Сlick and check for incorrectness login
    Capture Page Screenshot	 scrn/login go back and come back.png
