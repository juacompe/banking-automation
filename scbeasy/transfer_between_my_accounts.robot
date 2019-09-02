*** Keywords ***
Transfer To My Account
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Go To Transfer To My Account Page
    Choose The Account To Transfer From  ${from}
    Choose The Account The Money Is Going To  ${to}
    Input Amount  ${amount}
    Input Descripton  ${desc}
    Click Next

Go To Transfer To My Account Page
    Click Transfer Link
    Click Transfer To My Account

Click Transfer To My Account
    Click Link  ctl15_BetweenMyAccount_LinkButton

Go To Transfer History Between My Account
    Click Link Transfer History
    Click Link Between My Account

Click Link Between My Account
    Click Link  DataProcess_ctl00_OWN_LinkButton

Latest History Between My Account Should Be
    [Arguments]  ${label}  ${amount}
    ${number}=  transfer_between_my_accounts.Extract Account Number Out Of Label  ${label}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) tr td:nth-child(3)  ${number}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) tr td:nth-child(4)  ${amount}.00

Extract Account Number Out Of Label
    [Arguments]  ${label}
    ${type}  ${number}=  Split String  ${label}  -
    ${number}=  Strip String  ${number}
    [Return]  ${number}
