*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open website
    Open Browser    https://bstackdemo.com/    chrome
Login
    Click Link    signin
    Wait Until Element Is Visible    id:username
    Input Text    react-select-2-input    demouser
    Press Key    react-select-2-input    \\13    # press Enter
    Input Text    react-select-3-input    testingisfun99
    Press Key    react-select-3-input    \\13
    Click Button    login-btn

Select an item and add to chart
    [Arguments]    ${item_to_buy}
    Wait Until Element Is Visible    css:div.shelf-container
    ${xpath_buy_item} =    Catenate    
    ...    xpath=//p[@class="shelf-item__title" and text()='${item_to_buy}']
    ...    /following-sibling::div[@class="shelf-item__buy-btn"]
    Click Element    ${xpath_buy_item}

Checkout
    [Arguments]    ${buyer}
    Wait Until Element Is Visible    xpath=//div[@class="buy-btn" and text()="Checkout"]
    Click Element    xpath=//div[@class="buy-btn" and text()="Checkout"]
    Wait Until Element Is Visible    css:.checkout-form
    Input Text    firstNameInput    ${buyer}[0]
    Input Text    lastNameInput    ${buyer}[1]
    Input Text    addressLine1Input    ${buyer}[2]
    Input Text    provinceInput    ${buyer}[3]
    Input Text    postCodeInput    ${buyer}[4]
    Click Button    checkout-shipping-continue
    
Download receipt
    Wait Until Element Is Visible    downloadpdf
    Click Link    downloadpdf
    Click Button    Continue Shopping »
    Wait Until Element Is Visible    logout

Logout
    Click Element    logout
    Close Browser
