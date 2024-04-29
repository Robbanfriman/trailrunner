*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
Suite Setup    Open Chrome browser


*** Test Cases ***

Test - signing in as Admin
    [Documentation]
    Set Selenium Speed    0.3
    I assure I am Logged In as Admin
    Verify admin is logged in
    Log out
   

Test - signing out 
    [Documentation]
    Set Selenium Speed    0.3 
    I assure I am Logged In as Customer
    I Assure I Am Logged Out
    Verify that I am now logged out
    I assure I am Logged In as Admin
    I Assure I Am Logged Out
    Verify that I am now logged out
    Close browser
    