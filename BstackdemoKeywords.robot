*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open bstack website
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
Login to bstackwebside with given credentials
    [Arguments]    ${locator_signin}    ${locator_username_input}    ${locator_password_input}    ${locator_login}    ${username}    ${password}
    Click Link    ${locator_signin}
    Wait Until Element Is Visible    ${locator_username_input}
    Input Text    ${locator_username_input}    ${username}
    Press Key    ${locator_username_input}    \\13    # press Enter
    Input Text    ${locator_password_input}    ${password}
    Press Key    ${locator_password_input}    \\13
    Click Button    ${locator_login}

Select an item and add to chart
    [Arguments]    ${shelf}    ${item_to_buy}
    Wait Until Element Is Visible    ${shelf}
    ${xpath_buy_item} =    Catenate    
    ...    xpath=//p[@class="shelf-item__title" and text()='${item_to_buy}']
    ...    /following-sibling::div[@class="shelf-item__buy-btn"]
    Click Element    ${xpath_buy_item}

Select items from list and add them to chart
    [Arguments]    ${shelf}    ${wanted_items}
    FOR    ${item}    IN    @{wanted_items}
        Select an item and add to chart    ${shelf}    ${item}
    END

Go to checkout and add buyer information
    [Arguments]    ${locator_checkout}    ${locator_checkout_form}    ${locator_buyer}    ${locator_checkout_continue}    ${buyer}
    Wait Until Element Is Visible    ${locator_checkout}
    Click Element    ${locator_checkout}
    Wait Until Element Is Visible    ${locator_checkout_form}
    Input Text    ${locator_buyer}[0]    ${buyer}[0]
    Input Text    ${locator_buyer}[1]    ${buyer}[1]
    Input Text    ${locator_buyer}[2]    ${buyer}[2]
    Input Text    ${locator_buyer}[3]    ${buyer}[3]
    Input Text    ${locator_buyer}[4]    ${buyer}[4]
    Click Button    ${locator_checkout_continue}
    
Download receipt to downloads folder
    [Arguments]    ${locator_pdf}    ${locator_continue_shopping}    ${locator_logout}
    Wait Until Element Is Visible    ${locator_pdf}
    Click Link    ${locator_pdf}
    Click Button    ${locator_continue_shopping}
    Wait Until Element Is Visible    ${locator_logout}

Logout and close browser
    [Arguments]    ${locator_logout}
    Click Element    ${locator_logout}
    Close Browser
