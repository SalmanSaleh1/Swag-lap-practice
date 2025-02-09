# Swag Labs Mobile App Automation Testing

This project automates the testing of the Swag Labs mobile application using **Robot Framework** with **Appium**.

## 📌 Project Structure
```
Swag-lap-testing-Practice/
├── configs/
│   ├── AppiumConfig.robot    # Appium server & desired capabilities
│   ├── keywords.robot        # Commonly used keywords
├── tests/
│   ├── test_login.robot      # Test cases for login and order flow
├── reports/                  # Test reports will be saved here
├── .venv/                     # Python virtual environment (if used)
├── README.md                 # Project documentation
```

## ⚙️ Setup & Installation

### 1️⃣ Prerequisites
- Install **Python** (>=3.7)
- Install **Java JDK** (for Appium)
- Install **Appium Server**
- Install **Android SDK**

### 2️⃣ Install Dependencies
Activate the virtual environment and install required libraries:
```sh
python -m venv .venv
source .venv/bin/activate  # macOS/Linux
.venv\Scripts\activate     # Windows
pip install robotframework-appiumlibrary
```

## 🚀 Running the Tests

### Run all tests:
```sh
robot -d reports tests/
```

### Run a specific test case:
```sh
robot -d reports --test "FULL TRACK OF ORDER" tests/test_login.robot
```

### Run with Python:
```sh
python -m robot -d reports tests/test_login.robot
```

## 📄 Test Case Descriptions

### `test_login.robot`
| Test Case | Description |
|-----------|------------|
| **Login to Swag Labs** | Opens the app and logs in |
| **Add Item to Cart** | Adds an item from the products page |
| **Click Item** | Clicks an item to view details |
| **Add Item From Details Page** | Scrolls and adds an item from the details page |
| **Add Item and Checkout** | Adds an item, proceeds to checkout, and fills in details |
| **Full Track of Order** | End-to-end test from login to order completion |

## 📊 Test Reports
After execution, reports are generated in the `reports/` folder:
- `output.xml`: Execution details
- `log.html`: Detailed log with screenshots (if enabled)
- `report.html`: Summary of test execution

## 🛠 Troubleshooting
### "No module named 'robot'"
Make sure Robot Framework is installed in your virtual environment:
```sh
pip install robotframework
```

### "Keyword Not Found"
Ensure the `keywords.robot` file is correctly imported in `test_login.robot`:
```robot
Resource    ../configs/keywords.robot
```

### "Appium Server Not Running"
Start the Appium server before running tests:
```sh
appium
```

### "Element Not Found"
- Verify that the correct XPath or locator is used.
- Add `Sleep` statements to wait for elements to load.

---
## ✨ Contribution
Feel free to contribute by adding new test cases or improving existing ones!

---
**Author:** Salman Alkhalifah 🚀

