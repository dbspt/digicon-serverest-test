*** Settings ***
Library    SeleniumLibrary

Test Setup    Open Browser    https://www.google.com    chrome
Test Teardown    Close Browser

*** Test Cases ***
Abrir o Google 1
    Title should be    Google

Abrir o Google 2
    Title should be    Google
   
