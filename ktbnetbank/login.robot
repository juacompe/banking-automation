*** Settings ***
Resource  variables.robot
Resource  secret.robot
Resource  keywords.robot

*** Keywords ***
Login
    Open Browser  ${KTBNETBANK_URL}  gc
    Input Text  userId    ${USERNAME}
    Input Text  password  ${PASSWORD}
    Set Focus To Element  id_ImageCode
    Wait Until Page Contains  ยินดีต้อนรับ  timeout=2m
    Wait For Loading
