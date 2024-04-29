*** Settings ***
Documentation   resource file for event page
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
Library    XML


Resource    masterResourceFile.robot



*** Keywords ***

Given that I am at the event overview
    [Documentation]
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${eventTab}
    Click Element    ${eventTab}
    Wait Until Page Contains Element    ${NewestEventSeeMoreButton}

Given that I am at the event manager
    [Documentation]
    [Tags]

    Sleep    1
    Scroll Element Into View    ${dropDownMenu}
    Click Element    ${dropDownMenu}
    Wait Until Page Contains Element    ${ManageEventOption}
    Sleep    1
    Click Element    ${ManageEventOption}
   # Element Should Be Visible     ${eventHeader}

    Wait Until Page Contains Element       ${eventNameForm}     timeout=10
    

When I click on an event
    [Documentation]
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${eventInfoButton}
    Click Element    ${eventInfoButton}


Then I am redirected to the event information page
    [Documentation]
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${buyEvent}

When I count the events
    [Documentation]
    [Tags]
    ${actual_event_elements} =    Get WebElements    xpath=//*[starts-with(@id, 'cardbutton.')]
    ${element_count} =    Get Length    ${actual_event_elements}
    Log    Found ${element_count} elements with ID starting with 'cardd'
    ${EXPECTED_EVENT_NUMBER} =    Set Variable    5  # Set expected number of events
    Convert To Integer    ${EXPECTED_EVENT_NUMBER}    # Ensure expected number is an integer
    Should Be Equal As Numbers    ${element_count}    ${EXPECTED_EVENT_NUMBER}
    # Log text of each element (optional)
    FOR    ${element}    IN    @{actual_event_elements}
        Log    ${element.text}
    END


Then every active event from the DB should be visible
    [Documentation]
    [Tags]
    Element Should Be Visible    ${eventList}

When I check the date, time and location
    [Documentation]
    [Tags]
    Page Should Contain    Gårda
    Page Should Contain    05/11/2024 00:00:00

Then I can see the date, time and location
    [Documentation]
    [Tags]
    # TODO: implement keyword "i see the time and place".
    Fail    Not Implemented
        

When I add new event
    Wait Until Page Contains Element    ${eventNameForm}
    Input Text    ${eventNameForm}    ${eventName}
    Input Text    ${eventDateForm}    ${eventDate}
    Input Text    ${eventLocationForm}    ${eventLocation}
    Input Text    ${eventDescriptionForm}    ${eventDescription}
    Select From List by Value    id=EventTypeSelector    269a8100-4eff-4f52-8a00-217e4148eff9


    Input Text    ${eventAgeRestrictionForm}    ${eventAgeRestriction}
    #Input Text    ${eventImageUrlForm}    ${eventImageUrl}
    Input Text    ${eventBackgroundImageForm}    ${eventBackgroundImage}
    Input Text    ${eventDurationForm}    ${eventDuration}
    Input Text    ${eventCapacityFrom}    ${eventCapacity}
    Input Text    ${eventPriceForm}    ${eventPrice}
    Wait Until Element Is Enabled    ${submitEvent}  timeout=50

    Scroll Element Into View    ${submitEvent}
    
    Click Element    ${submitEvent}
    Sleep    1
#Then event is added

when i remove an event
    Wait Until Page Contains Element    ${EventChoiceForm}

    Select From List By Label    ${EventChoiceForm}     Fredags lan i Gårda
    Sleep    1
    Scroll Element Into View    ${deleteEvent}
    Click Element    ${deleteEvent}

when i change an event an event
    Wait Until Page Contains Element    ${EventChoiceForm}
    Select From List By Label    ${EventChoiceForm}     Fredags lan i Gårda
    Input Text    ${eventLocationForm}    ändring
    Sleep    1
    Scroll Element Into View    ${submitEvent}
    click element   ${submitEvent}

Then I check if added event is created
    Sleep    1
    Scroll Element Into View    ${eventTab}
    Wait Until Element Is Visible    ${eventTab}
    Wait Until Element Is Enabled    ${eventTab}
    Click Element    ${eventTab}
    Page Should Contain    Fredags lan i Gårda

