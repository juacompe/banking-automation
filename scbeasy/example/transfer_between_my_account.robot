*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../variables.robot
Resource  ../secret.robot
Resource  ../login.robot
Resource  ../transfer.robot
Resource  ../transfer_between_my_accounts.robot

*** Variables ***
${FROM ACCOUNT LABEL}   เงินเดือน - XXXX009999
${TO ACCOUNT LABEL}     เงินเก็บ - XXXX888888
${AMOUNT}               400
${DESCRIPTION}          ออมเงิน 10% ไว้ลงทุน

*** Test Cases ***
Save Money In Family Account
    Login To SCB Easy
    Transfer To My Account  ${FROM ACCOUNT LABEL}  ${TO ACCOUNT LABEL}  ${AMOUNT}  ${DESCRIPTION}
    Confirm Transfer
    Go To Transfer History Between My Account
    Latest History Between My Account Should Be  ${TO ACCOUNT LABEL}  ${AMOUNT}
