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

# For validation items
${validate_Home_page}    xpath=//android.widget.TextView[@text="PRODUCTS"]
${validate_add_item}    xpath=//android.view.ViewGroup[@content-desc="test-REMOVE"]
${valisate_item_added_in_cart}    xpath=//android.widget.TextView[@text="Sauce Labs Backpack"]
${validate_checkout_page}    xpath=//android.widget.TextView[@text="CHECKOUT: INFORMATION"]

# Filters
${Change_Items_icons}    //android.view.ViewGroup[@content-desc="test-Toggle"]/android.widget.ImageView
${Filters}    //android.view.ViewGroup[@content-desc="test-Modal Selector Button"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${Order_Items_from_A_To_Z}    //android.widget.TextView[@text="Name (Z to A)"]