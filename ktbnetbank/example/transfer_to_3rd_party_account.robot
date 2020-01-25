*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../login.robot
Resource  ../transfer.robot

*** Variables ***
${FROM}             1XXXXXXXX4
${TO}               2XXXXXXXX8
${AMOUNT}           10000
${DESCRIPTION}      ค่ากระเป๋าหลุยส์

*** Test Cases ***
จ่ายค่ากระเป๋าหลุยส์
    Login
    Transfer To 3rd Party Account And Go Back To Home  ${FROM}  ${TO}  ${AMOUNT}  ${DESCRIPTION}