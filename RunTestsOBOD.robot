*** Settings ***
Resource  support/TestCasesOBOD.robot


Test Setup      Prepare test envirnment
Test Teardown   Cleanup test environment
*** Variables ***
${ValidLoginEmail}=  girukinbox@gmail.com           #User valid login email for test cases
${ValidLoginPassword}=  Test1234                    #User valid login password for test cases
${InValidLoginEmail}=  InValidEmail@gmail.com       #User invalid login email for test cases
${InValidLoginPassword}=  InValidPass               #User invalid login password for test cases


${ValidRegisterPassword}=  Test1234@!               #The valid password to register a new user for the test cases
${ValidRegisterName}=  Firstname Lastname           #Valid name to register a new user for the test cases
${ValidRegisterTelephone}=  680000000               #The valid telephone to register a new user for the test cases
*** Test Cases ***
Obod login valid user                               #Correct email and correct password
    Login user  ${ValidLoginEmail}  ${ValidLoginPassword}

Obod login with fields blank                        #Leave both fields blank
    Login blank

Obod login with fields email blank                  #Leave blank email field with the correct password
    Login email blank  ${ValidLoginPassword}

Obod login with fields password blank               #Leave blank email field with the correct password
    Login password blank  ${ValidLoginEmail}

Obod login with incorect password                   #Enter correct mail and incorect password
    Login incorect password  ${ValidLoginEmail}  ${InValidLoginPassword}

Obod login with incorect email                       #Enter incorrect email, but the corect password
    Login incorect email  ${InValidLoginEmail}  ${ValidLoginPassword}

Obod login with line replacement                    #Enter the correct password in the mail feild, and enter the correct mail in the password field
    login line replacement  ${ValidLoginEmail}  ${ValidLoginPassword}

Obod login with part of the system code on email    #Login with system code in email and correct password
    login system code on email  ${ValidLoginPassword}

Obod login then go out and come back                #Enter correct mail and corect password. Click on the "Go back" button in the browser
    login go back and come back  ${ValidLoginEmail}  ${ValidLoginPassword}

Obod reg user with valid date      #Entering valid data in the registration form
    ${randomInt}=  Evaluate  random.randint(0, 999)
    ${RegisterEmailRandValid}=  Catenate  SEPARATOR=  test-obod-  ${randomInt}  @mailintator.com        #    Create a valid unique email address for registration
    Reg user  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}

Obod reg with fields blank         #Registration with all fields blank
    Reg blank

Obod reg with spaces in fields          #Registration with spaces in the field
    Reg spaces

Obod reg with spaces and date in fields          #Registration with spaces and valid data in the field
    ${randomInt}=  Evaluate  random.randint(0, 999)
    ${RegisterEmailRandValid}=  Catenate  SEPARATOR=  test-obod-  ${randomInt}  @mailintator.com
    ${SpcEmail}=  Catenate  SEPARATOR=  ${Space * 2}  ${RegisterEmailRandValid}  ${Space * 2}
    ${SpcPassword}=  Catenate  SEPARATOR=  ${Space * 2}  ${ValidRegisterPassword}  ${Space * 2}
    ${SpcName}=  Catenate  SEPARATOR=  ${Space * 2}  ${ValidRegisterName}  ${Space * 2}
#    ${SpcTelephone}=  Catenate  SEPARATOR=  ${Space * 2}  ${ValidRegisterTelephone}  ${Space * 2}      #*******
    Reg spaces and valid data  ${SpcEmail}  ${SpcPassword}  ${SpcName}  ${ValidRegisterTelephone}  #${SpcTelephone}

Obod reg go back and come back      #Entering valid data in the registration form go out and come back
    ${randomInt}=  Evaluate  random.randint(0, 999)
    ${RegisterEmailRandValid}=  Catenate  SEPARATOR=  test-obod-  ${randomInt}  @mailintator.com        #    Create a valid unique email address for registration
    Reg go back and come back  ${RegisterEmailRandValid}  ${ValidRegisterPassword}  ${ValidRegisterName}  ${ValidRegisterTelephone}