*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
*** Variables ***
${Browser}      Chrome
${URL}      https://rental9.infotiv.net/
${USER}     robert.friman@iths.se
${PW}       123456
${WRONGPW}  234567
${EXPECTED_RESULT}      You are signed in as Robert
${EXPECTED_LOGIN}        Wrong e-mail or password
${EXPECTED_NO_CAR}        You have no bookings
${CARD_NUMBER}      1234567890123456
${WRONGCARDNUMBER}  124
${CARD_NAME}        Karl Banan
${CVC}      123
${MONTH}    5
${YEAR}     6
*** Test Cases ***
testing to sign in
        Given i am logged in    ${USER}    ${PW}


testing the date selection
        Given i am logged in    ${USER}    ${PW}
        then i chose date



testing to book a car
        Given i am logged in    ${USER}    ${PW}
        then i chose date
        and then i book a car

testing booking a car
        [Tags]  VG_test
        Given i am logged in    ${USER}    ${PW}
        then i chose date
        and then i book a car
        then the car is booked

testing signing in with wrong password
        given i try to log in   ${USER}    ${WRONGPW}

testing the unbook car feature

        Given i am logged in    ${USER}    ${PW}
        then i go to my page
        then there is no car booked

testing wrong card number

        Given i am logged in    ${USER}    ${PW}
        then i chose date
        and then i chose car


*** Keywords ***

Given i am logged in
        [Documentation]     test login
        [Tags]   login
        [Arguments]    ${username}    ${password}
        Open Browser     ${URL}     ${browser}
        Input Text    //*[@id="email"]      ${USER}
        Input Password    //*[@id="password"]    ${PW}
        Click Button    //*[@id="login"]
        ${ACTUAL_RESULT}=    Get Text    //*[@id="welcomePhrase"]
        Log     Actual:${ACTUAL_RESULT}
        Should Be Equal    ${ACTUAL_RESULT}   ${EXPECTED_RESULT}

then i chose date
        [Documentation]     Chose date for booking car
        [Tags]      date
        ${TODAYS_DATE}=    Get Current Date    result_format=%Y-%m-%d
        ${FUTURE_DATE}=    Add Time To Date    ${TODAYS_DATE}    4 days     result_format=%Y-%m-%d
        ${EXPECTED_DATE}=   Set Variable     Selected trip dates: ${TODAYS_DATE} – ${FUTURE_DATE}
        Input Text    //*[@id="start"]    ${TODAYS_DATE}
        Input Text    //*[@id="end"]    ${FUTURE_DATE}
        Click Button    //*[@id="continue"]
        ${ACTUAL_DATE}=    Get Text    //*[@id="showQuestion"]/label
        Log     Actual:${ACTUAL_DATE}
        Should Be Equal    ${ACTUAL_DATE}   ${EXPECTED_DATE}

and then i book a car
       [Documentation]      book the car
       [Tags]      booking
       Click Button  //*[@id="bookQ7pass5"]
       Input Text    //*[@id="cardNum"]    ${CARD_NUMBER}
       Input Text    //*[@id="fullName"]    ${CARD_NAME}
       Select From List By Index    //*[@id="confirmSelection"]/form/select[1]      ${MONTH}
       Select From List By Index    //*[@id="confirmSelection"]/form/select[2]      ${YEAR}
       Input Text    //*[@id="cvc"]     ${CVC}
       Click Button    //*[@id="confirm"]

then the car is booked
        [Documentation]    check if the car is booked
        [Tags]     booking
        ${ACTUAL_BOOKING}=    Get Text    //*[@id="questionTextSmall"]
        ${TODAYS_DATE}=    Get Current Date    result_format=%Y-%m-%d
        ${EXPECTEDBOOKINGCONFIRM}=    Set Variable    A Audi Q7 is now ready for pickup ${TODAYS_DATE}
        Log To Console      expected:${EXPECTEDBOOKINGCONFIRM}
        Log     Actual:${ACTUAL_BOOKING}
        Should Be Equal    ${ACTUAL_BOOKING}   ${EXPECTEDBOOKINGCONFIRM}

given i try to log in
        [Documentation]     Login with wrong password negative test
        [Tags]      login
        [Arguments]    ${username}    ${password}
        Open Browser     ${URL}     ${BROWSER}
        Input Text    //*[@id="email"]      ${USER}
        Input Password    //*[@id="password"]    ${WRONGPW}
        Click Button    //*[@id="login"]
        ${ACTUAL_RESULT}=    Get Text    //*[@id="signInError"]
        Log     Actual:${ACTUAL_RESULT}
        Should Be Equal    ${ACTUAL_RESULT}   ${EXPECTED_LOGIN}
        
then i go to my page
        [Documentation]     go to my page
        [Tags]      orientation
        Click Button    //*[@id="mypage"]
        Wait Until Page Contains    My bookings

then there is no car booked
        [Documentation]     testing the unbook feature on my page
        [Tags]      unbook
        ${BUTTON_ELEMENTS}=    Get WebElements    //button[starts-with(@id, 'unBook')]
        ${LENGTH}=    Get Length    ${BUTTON_ELEMENTS}
        Log    Found ${LENGTH} elements with IDs starting with "unBook"
    FOR    ${INDEX}    IN RANGE    ${LENGTH}
        Click Element    //button[starts-with(@id, 'unBook')]
        Handle Alert    accept
        Click Button    //*[@id="mypage"]
    END
        ${ACTUAL_RESULT}=    Get Text    //*[@id="historyText"]
        Should Be Equal    ${ACTUAL_RESULT}    ${EXPECTED_NO_CAR}

and then i chose car
        [Documentation]  testing using wrong cardnumber negative test
        [Tags]  booking
        Click Button    //*[@id="bookQ7pass5"]
        Input Text    //*[@id="cardNum"]    ${WRONGCARDNUMBER}
        Input Text    //*[@id="fullName"]    ${CARD NAME}
        Select From List By Index    //*[@id="confirmSelection"]/form/select[1]      ${MONTH}
        Select From List By Index    //*[@id="confirmSelection"]/form/select[2]      ${YEAR}
        Input Text    //*[@id="cvc"]     ${CVC}
        Click Button    //*[@id="confirm"]
        Page Should Contain Button    //*[@id="confirm"]


