*** Settings ***
Library  SeleniumLibrary
Suite Setup  Set Selenium Timeout  5 min
Suite Teardown  Close All Browsers
Resource  ../login.robot
Resource  ../transfer.robot
Resource  ../transfer_to_another_bank_accounts.robot

*** Variables ***
${FROM ACCOUNT LABEL}   เงินเดือน - XXXX009999
${TO ACCOUNT LABEL}     แม่ค้าออนไลน์ - 9202222222 - TMB BANK PUBLIC COMPANY  LIMITED
${AMOUNT}               2000
${DESCRIPTION}          เอฟปลอกไอโฟน

*** Test Cases ***
Saving For My Annual Tax
    Login To SCB Easy
    Transfer To Another Bank Account  ${FROM ACCOUNT LABEL}  ${TO ACCOUNT LABEL}  ${AMOUNT}  ${DESCRIPTION}
    Wait For User To Confirm Transfer With OTP
    Go To Transfer History To Another Bank Account
    Latest History To Another Bank Account Should Be  ${TO ACCOUNT LABEL}  ${AMOUNT}
