*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../login.robot
Resource  ../transfer.robot

*** Variables ***
${FROM ACCOUNT LABEL}   เงินเดือน - XXXX009999
${TO ACCOUNT LABEL}     Savings - 0787333333 - นางสาว สมศรี ร่ำรวย
${AMOUNT}               20000
${DESCRIPTION}          ค่ากระเป๋าหลุยส์

*** Test Cases ***
จ่ายค่ากระเป๋าหลุยส์
    Login
    Transfer To 3rd Party Account  ${FROM ACCOUNT LABEL}  ${TO ACCOUNT LABEL}  ${AMOUNT}  ${DESCRIPTION}