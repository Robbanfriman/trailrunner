*** Settings ***
Library     SeleniumLibrary
Resource    integrationResources.robot


*** Variables ***
#    ***Suite Setup***
#${Browser}     chrome
${Browser}     headlesschrome
${URL}      https://teamgardanetgame-development.azurewebsites.net/
${BROWSER_OPTIONS}    add_argument("--headless"); 

#    ***LogIn***
${ADMIN}    kund@iths.se
${ADMINPASSWORD}    GardaNetGame123!
${CustomerEmail}    a@a.se
${CustomerPassword}    Asd123!
${LoggedIn}     True
${LoggedOut}    False

#    ***NavBar***
${NavBarLogotype}    //img[@id='navlogo']
${dropDownMenu}    //a[@id='dropdownMenuButton']
${LogOutOption}    //button[@id='logouttab']
${ManageEventOption}    //a[@id='manageeventtab']
${ManageAdminAccountOption}    //a[@id='manageaccounttab']
${LogInTab}    //a[@id='logintab'] 
${RegisterTab}    //a[@id='registertab']
${Home}    //a[@id='hometab']
${eventTab}    //a[@id='eventtab']

#    ***Landing Page***
${landingPageTitle}    //button[@id='landingpagetitle']
${RightClickCarousel}    //span[@id='carouselnexticon']
${LeftClickCarousel}    //span[@id='carouselprevicon']
${LandingPageImage}    




#    ***Login Page***
${LoginEmailField}    //input[@id='inputemail']
${LoginPasswordField}    //input[@id='inputpassword']
${LogInSubmitButton}     //button[@id='loginsubmitbutton']

#    ***EventOverviewFunctions***
${EXPECTED_EVENT_TEXT}
${EXPECTED_EVENT_NUMBER}    6
${eventList}

#    ***EventOverviewPage***
${eventOverviewTitle}                            #DoesNotExist!!


${NewestEventSeeMoreButton}    //*[@id="cardbutton.1"]
${eventTitleText}    Event                              #placeholder id for event page



#    ---ManageEventPage---
#*** Event form Xpaths***
${EventChoiceForm}     //*[@id="EventChoiceDropdown"]
${eventNameForm}    //*[@id="Name"]
${eventDateForm}    //*[@id="Date"]
${eventLocationForm}    //*[@id="Location"]
${eventDescriptionForm}     //*[@id="description"]
${eventTypeForm}    //*[@id="eventType"]
${eventAgeRestrictionForm}      //*[@id="AgeRestriction"]
${eventImageUrlForm}     //*[@id="eventImageUrl"]
${eventBackgroundImageForm}     //*[@id="backgroundImageUrl"]
${eventDurationForm}     //*[@id="duration"]
${eventCapacityFrom}     //*[@id="capacity"]
${eventPriceForm}     //*[@id="price"]
${eventTypeForm}    id=EventTypeSelector
#*** Event form Variables***
${eventName}    Fredags lan i Gårda
${eventDate}    0020240511
${eventFalseDate}   87745685
${eventLocation}    Jacy'z
${eventDescription}     Goa gubbar i Gårds är välkomna för en trevlig spelkväll
${eventType}
${eventAgeRestriction}      16
${eventImageUrl}     https://sv.wikipedia.org/wiki/LAN-party#/media/Fil:Winter_2004_DreamHack_LAN_Party.jpg
${eventBackgroundImage}     https://cdn.al.to/i/setup/images/prod/big/product-new-big,,2017/10/pr_2017_10_3_8_6_51_252_00.jpg
${eventDuration}     4
${eventCapacity}     25
${eventPrice}     250
${eventType}    269a8100-4eff-4f52-8a00-217e4148eff9
#***Event buttons***
${submitEvent}   //*[@id="submiteventbutton"]
${deleteEvent}  //*[@id="deleteeventbutton"]
${buyEvent}     //*[@id="buy_event"]
${eventInfoButton}      //*[@id="cardbutton.1"]

