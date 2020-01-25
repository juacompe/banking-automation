*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
Resource  ../login.robot
Resource  ../transfer.robot

*** Test Cases ***
จ่ายค่ากระเป๋าหลุยส์
    Login