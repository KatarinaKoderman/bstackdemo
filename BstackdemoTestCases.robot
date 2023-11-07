*** Settings ***
Resource    BstackdemoVariables.robot
Resource    BstackdemoKeywords.robot

*** Test Cases ***
Buy phones
    [Documentation]    Buy phones is a test case for buying one or more phone products from bstackdemo.com.
    [Tags]    Buy phones ${item01}, ${item02}, ${item03}.
    [Setup]
    Given Open website
    And Login
    When Select an item and add to chart    ${item01}
    And Select an item and add to chart    ${item02}
    And Select an item and add to chart    ${item03}
    Then Go to checkout    ${buyer}
    And Download receipt
    [Teardown]    And Logout

# TestCase 01
#     Open Browser To Sign In