*** Variables ***
${bstackdemo_url}    https://bstackdemo.com/    # This is the base URL.

# locators to sign in
${locator_bstack_link_to_signin}    signin    # Locator to link for signing in.
${locator_bstack_username}    react-select-2-input    # Locator to username input field.
${locator_bstack_password}    react-select-3-input    # Locator to password input field.
${locator_bstack_login_button}    login-btn    # Locator to login button

# locators to buy items
${locator_bstack_shelf} =    css:div.shelf-container    # Locator to shelf of items. We use it to provide page is loaded.

# locators to checkout
${locator_bstack_checkout_button} =    xpath=//div[@class="buy-btn" and text()="Checkout"]    # Locator to checkout button.
${locator_bstack_checkout_form} =    css:.checkout-form    # Locator to checkout form.
@{locator_bstack_buyer} =    firstNameInput    lastNameInput    addressLine1Input    provinceInput    postCodeInput    # List locator to buyer information.
${locator_bstack_checkout_continue} =    checkout-shipping-continue    # Locator to continue to download receipt.

# locators to download receipt
${locator_bstack_pdf} =    downloadpdf    	# Locator to download pdf.
${locator_bstack_continue_shopping} =    Continue Shopping »    # Locator to continue shopping.
${locator_bstack_logout} =    logout    # Locator to logout.
