*** Settings ***
Library     SeleniumLibrary

Resource    eventResources.robot   
Resource    landingPageResources.robot    
Resource    adminPageResources.robot    
Resource    integrationResources.robot
Resource    VariableLibrary.robot



*** Keywords ***
Open Chrome browser
    [Documentation]
    [Tags]
    Open Browser    ${URL}    ${Browser}    #${BROWSER_OPTIONS}
    Maximize Browser Window
    Set Selenium Speed    1
    
Log in 
    [Documentation]     Test to sign in, uses arguments so it can be used for both admin and costumers
    [Tags]
    [Arguments]    ${username}    ${password}
    Sleep    1
    Scroll Element Into View    ${LogInTab}
    Click Element    ${LogInTab}
    Wait Until Page Contains Element    ${LoginEmailField}    timeout=10s
    Input Text          ${LoginEmailField}    ${username}
    Input Password    ${LoginPasswordField}    ${password}
    Scroll Element Into View    ${LogInSubmitButton}
    Click button    ${LogInSubmitButton}

Log out
    [Documentation]    Test to sign out
    [Tags]
        Scroll Element Into View    ${dropDownMenu}
        Sleep    1
        Wait Until Element Is Visible    ${dropDownMenu}
        Wait Until Element Is Enabled    ${dropDownMenu}

        Click Element    ${dropDownMenu}
        Click Element    ${LogOutOption}
        
Close browser
    Close All Browsers


Verify logged in status
    [Documentation]     Checks if user is logged in
    [Tags]      VerifyLoggedIn  
    ${LoggedIn}=    Set Variable If    (Element should be visible    ${LogInTab},    True),    (Element should be visible    ${dropDownMenu},    False)    
    RETURN    ${LoggedIn}


I assure I am Logged In as Customer
    [Documentation]     Log in if user is not already
    [Tags]      VerifyLoggedIn
    sleep    1

    ${LoginStatus}=     Run Keyword And Return Status     Verify logged in status
    Run Keyword If      ${LoginStatus} == ${LoggedOut}    Log in    ${CustomerEmail}    ${CustomerPassword}
    

I assure I am Logged In as Admin
    [Documentation]     Log in if user is not already
    [Tags]      VerifyLoggedIn


    ${LoginStatus}=     Run Keyword And Return Status     Verify logged in status
    Run Keyword If      ${LoginStatus} == ${LoggedOut}    Log in    ${ADMIN}    ${ADMINPASSWORD}

I Assure I Am Logged Out
    [Documentation]     Makes sure I am logged out
    [Tags]      Logout    
    ${LoginStatus}=     Run Keyword And Return Status    Verify logged in status
    Run Keyword If      ${LoginStatus} == ${LoggedOut}    Log Out
         
Verify that I am now logged out
    [Documentation]     Makes sure I am logged out
    [Tags]      Logout   
    Element Should Be Visible    ${LogInTab}


Verify admin is logged in
    [Documentation]     Makes sure I am logged out
    [Tags]      Logout
    Element Should Be Visible    ${dropDownMenu}
