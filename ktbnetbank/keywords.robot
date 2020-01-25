*** Keywords ***
Wait For Loading
    Wait Until Element Is Not Visible  ModalLoading

Wait For UI Block
    ${present}=  Run Keyword And Return Status  Page Should Contain Element  div.blockUI
    Run Keyword If  ${present}  Wait Until Page Does Not Contain Element  div.blockUI

Go Back To Home Page
    Click Link  home