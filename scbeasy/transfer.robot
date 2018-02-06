*** Settings ***
Library  String

*** Keywords ***
Transfer To Another SCB Account
    [Arguments]  ${from}  ${to}  ${amount}  ${desc}
    Go To Transfer To Another SCB Account Page
    Choose The Account To Transfer From  ${from}
    Choose The Account The Money Is Going To  ${to}
    Input Amount  ${amount}
    Input Descripton  ${desc}
    Click Next

Go To Transfer To Another SCB Account Page
    Click Transfer Link
    Click Transfer To Another SCB Account

Click Transfer Link
    # Click Element  css=img[src="https://www.scbeasy.com/online/easynet/images/firstpage/transfer-1-en.gif"]
    Click Element  Image4

Click Transfer To Another SCB Account
    Click Link  ctl15_AnotherSCBAccount_LinkButton

Choose The Account To Transfer From
    [Arguments]  ${account label}
    Select From List By Label  ctl00$DataProcess$ddlCustAccFrom  ${account label}

Choose The Account The Money Is Going To
    [Arguments]  ${account label}
    Select From List By Label  ctl00$DataProcess$ddlCustAccTo  ${account label}

Input Amount
    [Arguments]  ${amount}
    Input Text  ctl00$DataProcess$txtCustAmount  ${amount}

Input Descripton
    [Arguments]  ${desc}
    Input Text  ctl00$DataProcess$txtDescription  ${desc}

Click Next
    Click Link  DataProcess_Next_LinkButton
    Wait Until Page Contains  Please review the information below then click "Confirm" to proceed

Confirm Transfer
    Click Link  DataProcess_Confirm_LinkBotton

Go To Transfer History Of Transfering To Another SCB Account
    Click Link Transfer History
    Click Link To Another SCB Account

Click Link Transfer History
    Click Link  ctl15_History_LinkButton

Click Link To Another SCB Account
    Click Link  DataProcess_ctl00_TRD_LinkButton

Latest History Should Be
    [Arguments]  ${label}  ${amount}
    ${number}=  Extract Account Number Out Of Label  ${label}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) td:nth-child(3)  ${number}
    Element Should Contain  css=#DataProcess_GridView1 tr:nth-child(3) td:nth-child(4)  ${amount}.00

Extract Account Number Out Of Label
    [Arguments]  ${label}
    ${type}  ${number}  ${name}=  Split String  ${label}  -
    ${number}=  Strip String  ${number}
    [Return]  ${number}
