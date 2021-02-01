*** Settings ***
Library  SeleniumLibrary
Library  keywords.py

Test Setup      Prepare test envirnment
Test Teardown   Cleanup test environment
*** Variables ***
${Browser}  Chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

${ValidRegisterPassword}=  Test1234@!               #The valid password to register a new user for the test cases
${ValidRegisterName}=  Firstname Lastname           #Valid name to register a new user for the test cases
${ValidRegisterTelephone}=  680000000               #The valid telephone to register a new user for the test cases
*** Keywords ***
Prepare test envirnment
    Open Browser  ${URL}  ${Browser}

Cleanup test environment
    Close Browser
*** Test Cases ***

Reg user with valid date
    goto registration form
    registration new user  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}

Registration with empty fields
    goto registration form
    next and check reg on invalid

Registration with spaces in fields
    goto registration form
    registration user with only spaces in field
    next and check reg on invalid

Registration with spaces and date in fields
    goto registration form
    registration user with spaces and valid data in field  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}

Enter correct data with registration, then exit and return to the page
    goto registration form
    check if registration fields are saved  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}
    next and check reg on invalid



