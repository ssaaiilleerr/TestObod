*** Settings ***
Library  SeleniumLibrary
Library  keywords.py

Test Setup      Prepare test envirnment
Test Teardown   Cleanup test environment
*** Variables ***
${Browser}  Chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

${ValidLoginEmail}=  girukinbox@gmail.com           #User valid login email for test cases
${ValidLoginPassword}=  Test1234                    #User valid login password for test cases
${InValidLoginEmail}=  InValidEmail@gmail.com       #User invalid login email for test cases
${InValidLoginPassword}=  InValidPass               #User invalid login password for test cases
*** Keywords ***
Prepare test envirnment
    Open Browser  ${URL}  ${Browser}

Cleanup test environment
    Close Browser
*** Test Cases ***

Login user
    goto login form
    valid login and check  ${ValidLoginEmail}  ${ValidLoginPassword}

Login with empty fields by user
    goto login form
    next and check log on invalid

Login with empty email field by user
    goto login form
    enter password only  ${ValidLoginPassword}
    next and check log on invalid

Login with an empty password field by the user
    goto login form
    enter email only  ${ValidLoginEmail}
    next and check log on invalid

Login with incorrect password
    goto login form
    enter valid email and invalid password  ${ValidLoginEmail}  ${InValidLoginPassword}
    next and check log on invalid

Login with an incorrect email
    goto login form
    enter invalid email and valid password  ${InValidLoginEmail}  ${ValidLoginPassword}
    next and check log on invalid

Login with line replacement email and password
    goto login form
    replacement email and password  ${ValidLoginEmail}  ${ValidLoginPassword}
    next and check log on invalid

Login with part of the system code on email
    goto login form
    login with system code on email  ${ValidLoginPassword}
    next and check log on invalid

Сheck if data is saved in the field after exiting
    goto login form
    check if login fields are saved  ${ValidLoginEmail}  ${ValidLoginPassword}
    next and check log on invalid
