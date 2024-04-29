
*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot

Suite Setup    Open Chrome browser



*** Test Cases ***

Test - Clicking logotype redirects you to start page
    [Documentation]
    Set Selenium Speed    0.3
    Given that I am at the event overview
    When I press the logotype in the top left corner
    Then I will be redirected to the Home page
    

Test - Login tab takes you to login page
    [Documentation]
    Set Selenium Speed    0.3
    Given that I am at the Home Page
    When I click LogInTab
    Then the login page should be shown
    

Test - redirecting navbar
    [Documentation]
    Set Selenium Speed    0.3
    Given that I am at the Home Page
    When I click on the Event tab
    Then I am redirected to the event overview
    And I can see active events
    







