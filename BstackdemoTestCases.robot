*** Settings ***
Resource    BstackdemoKeywords.robot
Resource    BstackdemoLocatorVariables.robot
Resource    BstackdemoVariables.robot

*** Test Cases ***
Buy phones
    [Documentation]    Buy phones is a test case for buying one or more phone products from bstackdemo.com.
    # [Tags]    Buy phones ${item01}, ${item02}, ${item03}.
    [Tags]    Buy phones from list ${list_of_wanted_items}.
    [Setup]
    Given Open bstack website    ${bstackdemo_url}
    And Login    ${locator_bstack_link_to_signin}    ${locator_bstack_username}    ${locator_bstack_password}    ${locator_bstack_login_button}    ${myusername}    ${mypassword}
    When Select items from list and add them to chart    ${locator_bstack_shelf}    ${list_of_wanted_items} 
    And Go to checkout    ${locator_bstack_checkout_button}    ${locator_bstack_checkout_form}    ${locator_bstack_buyer}    ${locator_bstack_checkout_continue}    ${buyer}
    Then Download receipt    ${locator_bstack_pdf}    ${locator_bstack_continue_shopping}    ${locator_bstack_logout}
    [Teardown]    And Logout    ${locator_bstack_logout}