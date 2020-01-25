*** Settings ***
Library  String
Resource  keywords.robot

*** Keywords ***
Transfer To 3rd Party Account
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Go To Transfer To 3rd Party Account Page
    Wait For User To Choose The Account From  ${from}
    Choose Input Account Number
    Input The Account The Money Is Going To  ${to}
    Input Amount  ${amount}
    Input Descripton  ${desc}
    Click Next

Go To Transfer To 3rd Party Account Page
    Wait Until Element Is Enabled               css:#favoriteServiceIcon div:nth-child(4)
    Wait For UI Block
    Click Link                                  css:#favoriteServiceIcon div:nth-child(4) a
    Wait Until Element Is Enabled               divAccountFromSelection

Choose Input Account Number
    Wait For UI Block
    Click Element  css:#transferToAccountTypeSelector div:nth-child(2)

Wait For User To Choose The Account From
    [Arguments]  ${from}
    Wait For UI Block
    Wait Until Page Contains Element  css:#divAccountFromSelection #divFundFrom_1620244454  2m

Input The Account The Money Is Going To
    [Arguments]  ${to}
    Input Text  txtFromAccount  ${to}

Input Amount
    [Arguments]  ${amount}
    Input Text  txtAmount  ${amount}

Input Descripton
    [Arguments]  ${desc}
    Input Text  txtNote  ${desc}

Click Next
    Click Link  lnkThirdPartyNextStep
    Wait Until Page Contains  ยืนยันการโอนเงิน
    Set Focus To Element  txtTOP

Confirm Transfer
    [Arguments]  ${desc}
    Wait Until Page Contains  สำเร็จ  5m
    Capture Page Screenshot  ${desc}