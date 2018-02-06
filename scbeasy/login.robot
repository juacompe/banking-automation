*** Keywords ***
Login To SCB Easy
    Open Browser  ${SCB_EASY_URL}  gc
    Input Text  LOGIN  ${USERNAME}
    Input Text  PASSWD  ${PASSWORD}
