*** Keywords ***
Transfer To Another Bank Account
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Go To Transfer To Another Bank Account Page
    transfer_to_another_bank_accounts.Choose The Account To Transfer From  ${from}
    transfer_to_another_bank_accounts.Choose The Account The Money Is Going To  ${to}
    transfer_to_another_bank_accounts.Input Amount  ${amount}
    transfer_to_another_bank_accounts.Input Descripton  ${desc}
    Click Next
    Send OTP

Send OTP
    Click Element  nxt

Wait For User To Confirm Transfer With OTP
    Wait Until Page Contains  Transfer has been made according to the following details.

Choose The Account To Transfer From
    [Arguments]  ${account label}
    Select From List By Label  ctl00$DataProcess$CustSendAccount_DropDownList  ${account label}
    
Choose The Account The Money Is Going To
    [Arguments]  ${account label}
    Select From List By Label  ctl00$DataProcess$CustReceiveAccountOtherBank_DropDownList  ${account label}

Input Amount
    [Arguments]  ${amount}
    Input Text  ctl00$DataProcess$CustAmount_TextBox  ${amount}

Input Descripton
    [Arguments]  ${desc}
    Input Text  ctl00$DataProcess$CustDesc_TextBox  ${desc}

Go To Transfer To Another Bank Account Page
    Click Transfer Link
    Click Transfer To Another Bank Account

Click Transfer To Another Bank Account
    Click Link  ctl15_AnotherBankAccount_LinkButton

Go To Transfer History To Another Bank Account
    Click Link Transfer History
    Click Link To Another Bank Account

Click Link To Another Bank Account
    Click Link  DataProcess_ctl00_FTA_LinkButton

Latest History To Another Bank Account Should Be
    [Arguments]  ${label}  ${amount}
    ${number}=  Extract Account Number Out Of Label  ${label}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) tr td:nth-child(3)  ${number}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) tr td:nth-child(4)  ${amount}.00
