*** Settings ***
Resource    BstackdemoVariables.robot
Resource    BstackdemoKeywords.robot

*** Test Cases ***
Buy phones
    [Documentation]    Buy phones is a test case for buying one or more phone products from bstackdemo.com.
    [Tags]    Buy phones ${item01}, ${item02}, ${item03}.
    [Setup]
    Open website
    Login
    Select an item and add to chart    ${item01}
    Select an item and add to chart    ${item02}
    Select an item and add to chart    ${item03}
    Checkout    ${buyer}
    Download receipt
    [Teardown]    Logout

# TestCase 01
#     Open Browser To Sign In