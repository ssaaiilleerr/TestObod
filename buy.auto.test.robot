*** Settings ***
Library  SeleniumLibrary
Library  keywords.py

Test Setup      Prepare test envirnment
Test Teardown   Cleanup test environment
*** Variables ***
${Browser}  Chrome
${URL}  http://obod.com.ua/velomagazin-hmelnickiy.html

*** Keywords ***
Prepare test envirnment
    Open Browser  ${URL}  ${Browser}
#    Set selenium Speed  0.4

Cleanup test environment
    Close Browser
*** Test Cases ***

add product to cart
    go to shop bicycle parts_page
    buy first place on shop
    go to cart page with product

add two different product to cart
    go to shop bicycle parts page
    buy first place on shop
    go to shop accessories page
    buy first place on shop
    go to cart page with product
    check on two position in cart

add one more product to cart like first
    go to shop bicycle parts page
    buy first place on shop
    go to cart page with product
    add product like first

removing items from the cart
    go to shop bicycle parts page
    buy first place on shop
    go to shop accessories page
    buy first place on shop
    go to cart page with product
    check on two position in cart
#    delete first place in cart
