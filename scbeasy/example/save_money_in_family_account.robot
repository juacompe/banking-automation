*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../variables.robot
Resource  ../secret.robot
Resource  ../login.robot

*** Test Cases ***
Save Money In Family Account
    Login To SCB Easy

