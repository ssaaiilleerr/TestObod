*** Settings ***
Library     SeleniumLibrary     #importing selenium library
Library     BuiltIn

*** Variables ***
${Browser}  Chrome          #setting up browser to chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

*** Keywords ***

Reg user
    [Arguments]  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}
    Go to registration form
    Input Text  css=#registration_main_email  ${RegisterEmailRandValid}
    Input Password  css= input[type=password]  ${ValidRegisterPassword}
    Input Text  css=#registration_main_firstname  ${ValidRegisterName}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Reg user.png


Reg blank fields
    Go to registration form
    Сlick and check for incorrectness registration
    Capture Page Screenshot	 scrn/Reg blank.png

Reg with spaces
    Go to registration form
    Input Text  css=#registration_main_email  ${Space * 5}
    Input Password  css= input[type=password]  ${Space * 5}
    Input Text  css=#registration_main_firstname  ${Space * 5}
    Press Keys  css=#registration_main_telephone  ${Space * 5}
    Сlick and check for incorrectness registration
    Capture Page Screenshot	 scrn/Reg spaces.png

Reg spaces and valid data
    [Arguments]  ${SpcEmail}  ${SpcPassword}  ${SpcName}  ${ValidRegisterTelephone}
    Go to registration form
    Input Text  css=#registration_main_email  ${SpcEmail}
    Input Password  css= input[type=password]  ${SpcPassword}
    Input Text  css=#registration_main_firstname  ${SpcName}
    #Press Keys  css=#registration_main_telephone  ${SpcTelephone}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Capture Page Screenshot	 scrn/Reg spaces and valid data1.png
    Click Element  css=#simpleregister > div > div > a > span
    Element Should Contain   css=div.column3 > span.zag3  Мой Аккаунт
    Capture Page Screenshot	 scrn/Reg spaces and valid data2.png

Reg exit and return
    [Arguments]  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}
    Go to registration form
    Input Text  css=#registration_main_email  ${RegisterEmailRandValid}
    Input Password  css= input[type=password]  ${ValidRegisterPassword}
    Input Text  css=#registration_main_firstname  ${ValidRegisterName}
    Press Keys  css=#registration_main_telephone  ${ValidRegisterTelephone}
    Go Back
    Element Should Contain  css=#content > span  Регистрация/Вход в 1 клик
    Element Should Contain  css=p:nth-child(1) > b  Регистрация
    Click Link  css=div.left > div > a
    Element Should Contain  css=#content > h1   Быстрая регистрация
    Сlick and check for incorrectness registration
    Capture Page Screenshot  scrn/Reg go back and come back.png
