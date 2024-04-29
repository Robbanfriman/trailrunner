*** Settings ***
Documentation   resource file for Landing Page page
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
Resource    masterResourceFile.robot    



*** Keywords ***

Given I am at the Landing Page
    [Documentation]    Navigates to landing page and waits for the title to be visible
    [Tags]
    Sleep    1
    Scroll Element Into View    ${Home}
    Click Element    ${Home}
    Wait Until Element Is Visible    ${landingPageTitle}
  

