*** Settings ***
# Import the Appium configuration file
Resource    ../configs/AppiumConfig.robot

*** Variables ***
# User login credentials
${USERNAME}           standard_user
${PASSWORD}           secret_sauce

# Element locators
${USERNAME_FIELD}     xpath=//android.widget.EditText[@content-desc="test-Username"]
${PASSWORD_FIELD}     xpath=//android.widget.EditText[@content-desc="test-Password"]
${LOGIN_BUTTON}       xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]

# Locators for shopping actions
${ITEM_ADD_TO_CART}   xpath=(//android.view.ViewGroup[@content-desc="test-ADD TO CART"])[1]
${ITEM_Backpack}      xpath=//android.widget.TextView[@content-desc="test-Item title" and @text="Sauce Labs Backpack"]
${ADD_TO_CART}        xpath=//android.view.ViewGroup[@content-desc="test-ADD TO CART"]
${CART_IMAGE}         xpath=//android.view.ViewGroup[@content-desc="test-Cart"]/android.view.ViewGroup/android.widget.ImageView
${CONTINUE_SHOPPING}  xpath=//android.view.ViewGroup[@content-desc="test-CONTINUE SHOPPING"]
${CHECKOUT}           xpath=//android.view.ViewGroup[@content-desc="test-CHECKOUT"]

# Checkout form locators
${FIRST_NAME}    xpath=//android.widget.EditText[@content-desc="test-First Name"]
${LAST_NAME}     xpath=//android.widget.EditText[@content-desc="test-Last Name"]
${POSTAL_CODE}   xpath=//android.widget.EditText[@content-desc="test-Zip/Postal Code"]
${CONTINUE}      xpath=//android.view.ViewGroup[@content-desc="test-CONTINUE"]
${FINISH_BUTTON}  xpath=//android.view.ViewGroup[@content-desc="test-FINISH"]

*** Keywords ***
# Open the Swag Labs mobile application
Open Swag Labs App
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    Sleep    1s

# Login using provided credentials
Login to Swag Labs
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}
    Sleep    2s  # Wait to verify login success

# Close the application
Close Swag Labs App
    Sleep    5s
    Close Application

# Add an item from the main product list
Add Item to Cart
    Click Element   ${ITEM_ADD_TO_CART}

# Open the product details page for a specific item
Click To Add Item
    Click Element    ${ITEM_Backpack}

# Scroll down and add item to cart
Scroll Down To Add To Cart
    Sleep    1s
    Swipe    806    1809    783    1076    1000  # Scroll action
    Click Element   ${ADD_TO_CART}
    Sleep    1s

# Open the cart page
Click in Cart
    Click Element   ${CART_IMAGE}
    Sleep    1s

# Continue shopping after checking cart
Continue Shopping
    Click Element    ${CONTINUE_SHOPPING}
    Sleep  1s

# Proceed to checkout page
Checkout
    Click Element  ${CHECKOUT}
    Sleep    1s

# Fill out checkout details and proceed
Fill Checkout Information
    Input Text      ${FIRST_NAME}    Salman
    Input Text      ${LAST_NAME}    Saleh
    Input Text      ${POSTAL_CODE}    33224
    Click Element    ${CONTINUE}

# Scroll down in checkout page and finish order
Swap in Information Page and Finish The Order
    Sleep    1s
    Swipe    811    1438    829    893    500  # Scroll action
    Sleep    1s
    Click Element    ${FINISH_BUTTON}
    Sleep    1s

# Ensure the user is on the product list page after login
Validate Showing Items Page
    Sleep    1s
    Element Should Be Visible    xpath=//android.widget.TextView[@text="PRODUCTS"]

# Validate that the "Add to Cart" button is working
Validate Add to Cart
    Sleep    1s
    Element Should Be Enabled    xpath=//android.view.ViewGroup[@content-desc="test-REMOVE"]

# Ensure the selected item is found in the product list
Validate Item is Found
    Sleep    1s
    Element Should Be Enabled    ${ITEM_Backpack}

# Check if the item appears in the cart
Validate Item Added in Cart
    Sleep    1s
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="Sauce Labs Backpack"]

# Verify that the checkout page is displayed
Validate Checkout Page Show
    Sleep    1s
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="CHECKOUT: INFORMATION"]

# Confirm the order completion page is displayed correctly
Validate Finish Order
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="CHECKOUT: COMPLETE!"]
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="THANK YOU FOR YOU ORDER"]
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="Your order has been dispatched, and will arrive just as fast as the pony can get there!"]
    Element Should Be Enabled    xpath=//android.widget.ScrollView[@content-desc="test-CHECKOUT: COMPLETE!"]/android.view.ViewGroup/android.widget.ImageView
