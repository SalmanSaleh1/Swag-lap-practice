*** Settings ***
# Import the keywords from a separate file for better reusability
Resource    ../Resources/keywords.robot


Test Setup      Open Swag Labs App
Test Teardown   Close Swag Labs App

*** Test Cases ***

# Test case: Verify user can log in successfully
Login to Swag Labs
    Login to Swag Labs
    Validate Showing Items Page  # Ensure login was successful

# Test case: Add an item to the cart from the product list
Add Item To Cart From Items Page
    Login to Swag Labs
    Add Item to Cart
    Validate Add To Cart  # Check that item was successfully added

# Test case: Click on an item to open the details page
Click Item
    Login to Swag Labs
    Click To Add Item  # Select an item

# Test case: Open an item’s details and add it to the cart
Add Item From Page Details
    Login to Swag Labs
    Validate Item Is Found  # Ensure the item is visible
    Click To Add Item
    Scroll Down To Add To Cart  # Scroll if necessary and add item

# Test case: Add an item from the details page and go to the cart
Add Item From Page Details And Go To Cart
    Login to Swag Labs
    Validate Item Is Found
    Click To Add Item
    Scroll Down To Add To Cart
    Click In Cart  # Navigate to the cart
    Validate Item Added In Cart  # Verify the item is present

# Test case: Add an item, go to the cart, then continue shopping
Add Item From Page Details And Go To Cart And ReBack To Shopping
    Login to Swag Labs
    Validate Item Is Found
    Click To Add Item
    Scroll Down To Add To Cart
    Click In Cart
    Validate Item Added In Cart
    Continue Shopping  # Go back to the product list

# Test case: Add an item, go to cart, and fill out checkout info
Add Item From Page Details And Go To Cart And Fill The Checkout Information
    Login to Swag Labs
    Validate Item Is Found
    Click To Add Item
    Scroll Down To Add To Cart
    Click In Cart
    Validate Item Added In Cart
    Checkout  # Proceed to checkout
    Validate Checkout Page Show  # Ensure checkout page is displayed
    Fill Checkout Information  # Enter user details

# Full end-to-end test: Order tracking from login to order completion
FULL TRACK OF ORDER
    Login to Swag Labs
    Validate Showing Items Page  # Confirm user is on the product list
    Validate Item Is Found
    Click To Add Item
    Scroll Down To Add To Cart
    Click In Cart
    Validate Item Added In Cart
    Checkout
    Validate Checkout Page Show
    Fill Checkout Information
    Swap in Information Page and Finish The Order  # Complete the order
    Validate Finish Order  # Verify order success page
