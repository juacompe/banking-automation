*** Settings ***
Library  Collections
Library  String
Library  CSVLib
Resource  keywords.robot

*** Keywords ***
Transfer To List
    [Arguments]  ${from}  ${csv_file_name}
    @{list}=  Read CSV File To List  ${csv_file_name}
    :FOR    ${row}    IN    @{list[1:]}
    \    Transfer To 3rd Party Account And Go Back To Home  ${from}  ${row[0]}  ${row[1]}  ${row[2]}

Transfer To 3rd Party Account And Go Back To Home
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Transfer To 3rd Party Account  ${from}  ${to}  ${amount}  ${desc}
    Confirm Transfer  ${desc}
    Go Back To Home Page

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
    Wait Until Page Contains Element  css:#divAccountFromSelection #divFundFrom_${from}  timeout=2m

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
    Wait Until Page Contains  ยืนยันการโอนเงิน  timeout=5m
    Set Focus To Element  txtTOP

Confirm Transfer
    [Arguments]  ${desc}
    Wait Until Page Contains  สำเร็จ  timeout=2m
    Capture Page Screenshot  out/${desc}.png

Read CSV File To List
    [Arguments]  ${csv_file_name}
    ${list}=  Create List
    @{rows}=  Read CSV As Single List  ${csv_file_name}
    :FOR    ${row}    IN    @{rows}
    \    ${words}=  Split String  ${row}  ,
    \    ${words}=  Remove Quotes From List Of String  ${words}
    \    Append To List  ${list}  ${words}
    [Return]  ${list}

Remove Quotes From List Of String
    [Arguments]  ${words}
    ${list}=  Create List
    :FOR  ${word}  IN  @{words}
    \    ${word_without_quotes}=  Remove String  ${word}  "
    \    Append To List  ${list}  ${word_without_quotes}
    [Return]  ${list}
