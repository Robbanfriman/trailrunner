*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot    


*** Keywords ***

Given that I am at the Home Page
    [Documentation]    Navigates to the homepage and waits until landing page title is visible
    [Tags]
    Wait Until Page Contains Element    ${NavBarLogotype}
    Click Element    ${Home}
    Wait Until Page Contains Element    ${landingPageTitle}

When I press the logotype in the top left corner
    [Documentation]
    [Tags]
    Wait Until Element Is Visible    ${NavBarLogotype}
    Click Element    ${NavBarLogotype}

Then I will be redirected to the home page
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${landingPageTitle}

When I click LogInTab
    [Documentation]
    [Tags]
    Click Element    ${LogInTab}

Then the login page should be shown
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${LoginEmailField}


When I click on the Event tab
    [Documentation]    clicks on the event tab
    [Tags]
    Click Element    ${eventTab}
    Wait Until Page Contains     ${eventTitleText}

Then I am redirected to the event overview
    [Documentation]    Verifies that the event overview is visible
    [Tags]
    Wait Until Page Contains     ${eventTitleText}  

And I can see active events
    [Documentation]    Verifies that the active events are visible
    [Tags]
    
    Wait Until Page Contains     ${eventTitleText}  #use list method here instead



