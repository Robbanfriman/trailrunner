*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
#Test Teardown   Run Keywords
Suite Setup    Open Chrome browser



*** Test Cases ***

# ***Event Overview Page***

Test - Adding a new event
    Set Selenium Speed    1
    Given I am at the Landing Page
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event manager
    When I add new event
    Log out
    #Then event is added

Test - Remove an event
    Set Selenium Speed      0.3
    Wait Until Element Is Visible    ${LogInTab}
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event manager
    When I add new event
    Then I check if added event is created
    Given that I am at the event manager
    when i remove an event
    Log out
Test - change an event
    Set Selenium Speed      0.3
    Wait Until Element Is Visible    ${LogInTab}
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event manager
    When I add new event
    Then I check if added event is created
    Given that I am at the event manager
    when i change an event an event
    when i remove an event
    Log out


Test - How many events are shown
    [Documentation]
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${LogInTab}
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event overview
    When I count the events
    Log out
    #Then every active event from the DB should be visible




Test - event information page redirection
    [Documentation]
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${LogInTab}
    Given that I am at the event overview
    When I click on an event
    Then I am redirected to the event information page


Test - verify date and location
    [Documentation]
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${LogInTab}
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event overview
    When I check the date, time and location
    Log out
  #  Then I can see the date, time and location

False Test - Enter wrong date in form
    Set Selenium Speed    1
    Given I am at the Landing Page
    Wait Until Element Is Visible    ${LogInTab}
    Log in    ${ADMIN}    ${ADMINPASSWORD}
    Given that I am at the event manager
    Input Text    ${eventDateForm}    ${eventFalseDate}
    Page Should Contain    The DateTimeVariable field must be a date.

# ***Event Page***









