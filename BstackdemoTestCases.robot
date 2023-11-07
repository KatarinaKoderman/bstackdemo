*** Settings ***
Resource    BstackdemoVariables.robot
Resource    BstackdemoKeywords.robot

*** Test Cases ***
Buy phones
    [Documentation]    Buy phones is a test case for buying one or more phone products from bstackdemo.com.
    # [Tags]    Buy phones ${item01}, ${item02}, ${item03}.
    [Tags]    Buy phones from list ${list_of_wanted_items}.
    [Setup]
    Given Open website
    And Login
    When Select items from list and add them to chart    ${list_of_wanted_items} 
    And Go to checkout    ${buyer}
    Then Download receipt
    [Teardown]    And Logout