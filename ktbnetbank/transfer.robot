*** Settings ***
Library  String

*** Keywords ***
Transfer To 3rd Party Account
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Go To Transfer To 3rd Party Account Page

Go To Transfer To 3rd Party Account Page
    Click Transfer Link

Click Transfer Link
    Wait Until Element Is Enabled       css:#favoriteServiceIcon div:nth-child(4)
    Wait Until Page Does Not Contain    .blockUI
    Click Link                          css:#favoriteServiceIcon div:nth-child(4) a
    Wait Until Element Is Enabled       divAccountFromSelection
