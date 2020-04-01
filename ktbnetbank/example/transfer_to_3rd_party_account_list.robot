*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../login.robot
Resource  ../transfer.robot

*** Variables ***
${FROM}             1XXXXXXXX4
${CSV_LIST}         ${CURDIR}/list.csv

*** Test Cases ***
Transfer To My List
    Login
    Transfer To List  ${FROM}  ${CSV_LIST}
