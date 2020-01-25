*** Settings ***
Resource  ../variables.robot
Resource  ../secret.robot

*** Keywords ***
Login To SCB Easy
    Open Browser  ${SCB_EASY_URL}  gc
    Input Text  LOGIN  ${USERNAME}
    Input Text  PASSWD  ${PASSWORD}
    Click Element  lgin
    Wait Until Page Contains  Welcome
