*** Settings ***
Library  SeleniumLibrary
Suite Setup  Set Selenium Timeout  5 min
Suite Teardown  Close All Browsers
Resource  ../login.robot

*** Test Cases ***
Saving For My Annual Tax
    Login