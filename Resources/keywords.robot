*** Settings ***
# Import the Appium configuration file
Resource    ../Resources/resources.robot
Resource    ../Resources/locators.robot

*** Keywords ***
# Open the Swag Labs mobile application
Open Swag Labs App
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

# Login using provided credentials
Login to Swag Labs
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}

# Close the application
Close Swag Labs App
    Close Application

# Add an item from the main product list
Add Item to Cart
    Wait Until Element Is Visible    ${ITEM_ADD_TO_CART}
    Click Element   ${ITEM_ADD_TO_CART}

# Open the product details page for a specific item
Click To Add Item
    Wait Until Element Is Visible    ${ITEM_Backpack}
    Click Element    ${ITEM_Backpack}

# Scroll down and add item to cart
Scroll Down To Add To Cart
    Swipe    806    1809    783    1076    1000  # Scroll action
    Wait Until Element Is Visible    ${ADD_TO_CART}
    Click Element   ${ADD_TO_CART}

# Open the cart page
Click in Cart
    Wait Until Element Is Visible    ${CART_IMAGE}
    Click Element   ${CART_IMAGE}

# Continue shopping after checking cart
Continue Shopping
    Wait Until Element Is Visible    ${CONTINUE_SHOPPING}
    Click Element    ${CONTINUE_SHOPPING}

# Proceed to checkout page
Checkout
    Wait Until Element Is Visible    ${CHECKOUT}
    Click Element  ${CHECKOUT}

# Fill out checkout details and proceed
Fill Checkout Information
    Wait Until Element Is Visible    ${FIRST_NAME}    
    Input Text      ${FIRST_NAME}    Salman
    Input Text      ${LAST_NAME}    Saleh
    Input Text      ${POSTAL_CODE}    33224
    Click Element    ${CONTINUE}

# Scroll down in checkout page and finish order
Swap in Information Page and Finish The Order
    Swipe    811    1438    829    893    500  # Scroll action
    Wait Until Element Is Visible    ${FINISH_BUTTON}
    Click Element    ${FINISH_BUTTON}

# Ensure the user is on the product list page after login
Validate Showing Items Page
    Wait Until Element Is Visible    ${validate_Home_page}

# Validate that the "Add to Cart" button is working
Validate Add to Cart
    Wait Until Element Is Visible    ${validate_add_item}

# Ensure the selected item is found in the product list
Validate Item is Found
    Wait Until Element Is Visible    ${ITEM_Backpack}

# Check if the item appears in the cart
Validate Item Added in Cart
    Wait Until Element Is Visible    ${valisate_item_added_in_cart}

# Verify that the checkout page is displayed
Validate Checkout Page Show
    Wait Until Element Is Visible    ${validate_checkout_page}

# Confirm the order completion page is displayed correctly
Validate Finish Order
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="CHECKOUT: COMPLETE!"]
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="THANK YOU FOR YOU ORDER"]
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="Your order has been dispatched, and will arrive just as fast as the pony can get there!"]
    Element Should Be Enabled    xpath=//android.widget.ScrollView[@content-desc="test-CHECKOUT: COMPLETE!"]/android.view.ViewGroup/android.widget.ImageView

# Ensure FIlter And Change Items Order
Test The Filter And Change Items Order
    Wait Until Element Is Visible    ${Change_Items_icons}
    Click Element    ${Change_Items_icons}
    Wait Until Element Is Visible    ${Filters}
    Click Element    ${Filters}
    Wait Until Element Is Visible    ${Order_Items_from_A_To_Z}
    Click Element    ${Order_Items_from_A_To_Z}
    